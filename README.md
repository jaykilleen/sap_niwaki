# SAP Niwaki

:deciduous_tree:

SAP Niwaki is a Domain Specific Language (DSL) for interacting with SAP GUI Scripting using the Ruby Programming Language.

Originally inspired by [How to use SAP GUI Scripting inside Ruby Programming Language][1] by [Stefan Schnell][2] I built my own Ruby program to automate the upload of master data for SAP S4/HANA. These scripts eventually continued to be used by the business for far longer than they should have.

This Ruby DSL for SAP GUI Scripting allows you to to write automation scripts that are very easy to read and write.  SAP Niwaki removes a lot of the need for having to run recorders and inspectors to identify field names and buttons to click.

That is the dream at least :hurtrealbad:

```ruby
if nav.is_on_the_wrong_tcode?
  nav.okgo 'VA01'
  nav.enter "order_type", 'OR'
  nav.press_btn 'Continue'
end
nav.insert "sales_order", "sold_to_party", "10000001"
nav.insert "sales_order", "ship_to_party", "10000001"
nav.insert "sales_order", "material_id",   "40000001"
nav.insert "sales_order", "quantity",       "1"
nav.insert "sales_order", "quantity_unit",  "PC"
nav.press_btn 'Save'
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sap_niwaki'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install sap_niwaki
```

**NOTE**: `sap_niwaki` requires `SAP Logon 750` / `SAP Logon for Windows` version `7500.2.9.1152` installed on the Windows machine that is running the sap_niwaki ruby scripts.

It is possible that this works on other versions but I am scracthing my own itch here and currently have only tested this with the version of `SAP Logon for Windows` that I have available on my machine. I have not tested this using Ruby running on the Windows Subsystem for Linux (WSL) or WSL2. I guess it would not work so I am sticking with a Ruby installation on windows to develop and run these scripts.

## Usage

After including `sap_niwaki` in your `example_file_name.rb` file like:

```ruby
require "sap_niwaki"
```

You can then initialize a session by connecting via the `SAP Logon for Windows` and start sending navigation commands.

```ruby
require "sap_niwaki"

# Initialize an SAP GUI object that represents the SAP Logon for Windows program
gui = SapNiwaki::Gui.new

# Set a navigator for SAP GUI by passing the SAP Logon for Windows session to a 'nav' class
niwaki = SapNiwaki::Nav.new gui
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Read about SAP GUI Scripting API in their docs at `C:\Program Files (x86)\SAP\FrontEnd\SAPgui\SAPguihelp`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sap_niwaki. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SapNiwaki project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/sap_niwaki/blob/master/CODE_OF_CONDUCT.md).

[1]: https://blogs.sap.com/2017/06/11/how-to-use-sap-gui-scripting-inside-ruby-programming-language/
[2]: https://twitter.com/PowerSchnell