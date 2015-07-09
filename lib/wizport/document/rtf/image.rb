# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Image < Element
      JPEG_SOF_BLOCKS = [0xC0, 0xC1, 0xC2, 0xC3, 0xC5, 0xC6, 0xC7, 0xC9, 0xCA, 0xCB, 0xCD, 0xCE, 0xCF]
      PIC_TYPE = {png: :pngblip, jpg: :jpegblip, bmp: :pngblip, gif: :pngblip}

      def initialize(rtf, file)
        super(rtf)
        begin
          @io = IO.binread(file)
        rescue  Exception => e
          STDERR.puts "** error parsing #{file}: #{e.inspect}"
          return
        end
        @width, @height = self.size
        group do
          cmd '*'
          cmd 'shppict'
          group do
            cmd :pict
            cmd PIC_TYPE[@type]
            cmd :picscalex, 99
            cmd :picscaley, 99
            cmd :picw, @width
            cmd :pich, @height
            write "\n"
            @io.each_byte do |b|
              hex_str = b.to_s(16)
              hex_str.insert(0,'0') if hex_str.length == 1
              write hex_str
            end
            write "\n"
          end
        end

      end

      def type
        png = Regexp.new("\x89PNG".force_encoding("binary"))
        jpg = Regexp.new("\xff\xd8\xff\xe0\x00\x10JFIF".force_encoding("binary"))
        jpg2 = Regexp.new("\xff\xd8\xff\xe1(.*){2}Exif".force_encoding("binary"))

        @type = case @io
          when /^GIF8/
            :gif
          when /^#{png}/
            :png
          when /^#{jpg}/
            :jpg
          when /^#{jpg2}/
            :jpg
          when /^BM/
            :bmp
          else
            :unknown
        end
      end

      def size
        case self.type
          when :gif
            @io[6..10].unpack('SS')
          when :png
            @io[16..24].unpack('NN')
          when :bmp
            d = @io[14..28]
            d.unpack('C')[0] == 40 ? d[4..-1].unpack('LL') : d[4..8].unpack('SS')
          when :jpg
            d = StringIO.new(@io)
            section_marker = 0xff # Section marker.
            d.seek(2) # Skip the first two bytes of JPEG identifier.
            loop do
              marker, code, length = d.read(4).unpack('CCn')
              fail "JPEG marker not found!" if marker != section_marker
              if JPEG_SOF_BLOCKS.include?(code)
                #@bits, @height, @width, @channels = d.read(6).unpack("CnnC")
                return d.read(6).unpack('CnnC')[1..2].reverse
              end
              d.seek(length - 2, IO::SEEK_CUR)
            end
        end
      end
    end
  end
end

