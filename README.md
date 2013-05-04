# Wizport

Wizport Abstract Interface. Creates text, html, pdf and rtf output, based on a common framework.

## Features

* One interface, multiple outputs
* You have two interfaces:
* Generic, based on adding objects to a Wizport::Report object
* Fine tuning, directly operating on Wizport::Rtf::Document Wizport::Html::Document and Wizport::Rtf::Document interface

## Installation

Add this line to your application's Gemfile:

    gem 'wizport'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wizport

## Usage

* Generate a report in HTML format:
```ruby
 html = Wizport::Html::Document.new do
     text "报表",'text-align' => :center
     table [[1,2,3]] do
      add_row [4,{content:'ss',colspan:2}]
     end
   end
 html.save('c:\h.html')
```

* Generate a report in RTF format:
```ruby
 rtf = Wizport::Rtf::Document.new do
    text "学生综合素质评价", :align => :center, 'font-size' => 48
    page_break
    text "ss"
    table [[{content:'e',rowspan:4},{content:'4',rowspan:4},1,{content:'1',colspan:2}],
      [{content:'4',rowspan:3,colspan:2},8],[11]], column_widths:{1=>100,2 => 100,3 => 50,4 => 50,5 => 50} do
        add_row [1]
      end
 end
 rtf.save('c:/r.rtf')
 ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
