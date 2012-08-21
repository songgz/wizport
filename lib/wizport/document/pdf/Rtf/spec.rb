# encoding: utf-8

# Wizport: A gem for creating reports by specifying columns, groups, styles, etc.
# Copyright 2012 by sgzhe@163.com

module Wizport
  module Rtf
    class Spec
      class << self
        attr_reader :map
      end
      @map = {
          # --- rtf general ----
          :document_rtf => "rtf",
          :document_ver => 1,
          :document_generator => "generator",

          # --- encoding ----
          :encoding_ansi => "ansi",
          :encoding_mac => "mac",
          :encoding_pc => "pc",
          :encoding_pca => "pca",
          :encoding_ansi_code_page => "ansicpg",

          # --- font ----
          :font_table => "fonttbl",
          :default_font => "deff",
          :font => "f",
          :font_kind_nil => "fnil",
          :font_kind_roman => "froman",
          :font_kind_swiss => "fswiss",
          :font_kind_modern => "fmodern",
          :font_kind_script => "fscript",
          :font_kind_decor => "fdecor",
          :font_kind_tech => "ftech",
          :font_kind_bidi => "fbidi",
          :font_charset => "fcharset",
          :font_pitch => "fprq",
          :font_size => "fs",
          :font_down => "dn",
          :font_up => "up",
          :font_subscript => "sub",
          :font_superscript => "super",
          :fontNo_super_sub => "nosupersub",

          :theme_font_lo_major => "flomajor", # these are 'theme' fonts
          :theme_font_hi_major => "fhimajor", # used in new font tables
          :theme_font_db_major => "fdbmajor",
          :theme_font_bi_major => "fbimajor",
          :theme_font_lo_minor => "flominor",
          :theme_font_hi_minor => "fhiminor",
          :theme_font_db_minor => "fdbminor",
          :theme_font_bi_minor => "fbiminor",
          :default_font_size => 24,
          :code_page => "cpg",

          # --- color ----
          :color_table => "colortbl",
          :color_red => "red",
          :color_green => "green",
          :color_blue => "blue",
          :color_foreground => "cf",
          :color_background => "cb",
          :color_background_word => "chcbpat",
          :color_highlight => "highlight",

          # --- header/footer ----
          :header => "header",
          :header_first => "headerf",
          :header_left => "headerl",
          :header_right => "headerr",
          :footer => "footer",
          :footer_first => "footerf",
          :footer_left => "footerl",
          :footer_right => "footerr",
          :footnote => "footnote",

          # --- character ----
          :delimiter => ",",
          :extension_destination => "*",
          :tilde => "~",
          :hyphen => "-",
          :underscore => "_",

          # --- special character ----
          :page => "page",
          :section => "sect",
          :paragraph => "par",
          :line => "line",
          :tabulator => "tab",
          :em_dash => "emdash",
          :en_ash => "endash",
          :em_space => "emspace",
          :en_space => "enspace",
          :qm_space => "qmspace",
          :bulltet => "bullet",
          :left_single_quote => "lquote",
          :right_single_quote => "rquote",
          :left_double_quote => "ldblquote",
          :right_double_quote => "rdblquote",

          # --- format ----
          :plain => "plain",
          :paragraph_defaults => "pard",
          :section_defaults => "sectd",

          :bold => "b",
          :italic => "i",
          :underLine => "ul",
          :underLineNone => "ulnone",
          :strike_through => "strike",
          :hidden => "v",
          :align_left => "ql",
          :align_center => "qc",
          :align_right => "qr",
          :align_justify => "qj",

          :styleSheet => "stylesheet",

          # --- info ----
          :info => "info",
          :info_version => "version",
          :info_revision => "vern",
          :info_number_of_pages => "nofpages",
          :info_number_of_words => "nofwords",
          :info_NumberOfChars => "nofchars",
          :info_Id => "id",
          :info_Title => "title",
          :info_Subject => "subject",
          :info_Author => "author",
          :info_Manager => "manager",
          :info_Company => "company",
          :info_Operator => "operator",
          :info_Category => "category",
          :info_Keywords => "keywords",
          :info_Comment => "comment",
          :info_DocumentComment => "doccomm",
          :info_HyperLinkBase => "hlinkbase",
          :info_CreationTime => "creatim",
          :info_RevisionTime => "revtim",
          :info_PrintTime => "printim",
          :info_BackupTime => "buptim",
          :info_Year => "yr",
          :info_Month => "mo",
          :info_Day => "dy",
          :info_Hour => "hr",
          :info_Minute => "min",
          :info_Second => "sec",
          :info_EditingTimeMinutes => "edmins",

          # --- user properties ----
          :user_Properties => ":user_props",
          :user_PropertyType => "proptype",
          :user_PropertyName => "propname",
          :user_PropertyValue => "staticval",
          :user_PropertyLink => "linkval",

          # this table is from the RTF specification 1.9.1, page 40
          :property_TypeInteger => 3,
          :property_TypeRealNumber => 5,
          :property_TypeDate => 64,
          :property_TypeBoolean => 11,
          :property_TypeText => 30,

          # --- picture ----
          :picture => "pict",
          :picture_Wrapper => "shppict",
          :picture_WrapperAlternative => "nonshppict",
          :picture_FormatEmf => "emfblip",
          :picture_FormatPng => "pngblip",
          :picture_FormatJpg => "jpegblip",
          :picture_FormatPict => "macpict",
          :picture_FormatOs2Metafile => "pmmetafile",
          :picture_FormatWmf => "wmetafile",
          :picture_FormatWinDib => "dibitmap",
          :picture_FormatWinBmp => "wbitmap",
          :picture_Width => "picw",
          :picture_Height => "pich",
          :picture_WidthGoal => "picwgoal",
          :picture_HeightGoal => "pichgoal",
          :picture_WidthScale => "picscalex",
          :picture_HeightScale => "picscaley",

          # --- bullets/numbering ----
          :paragraph_number_text => "pntext",
          :list_number_text => "listtext"

      }
    end
  end
end
