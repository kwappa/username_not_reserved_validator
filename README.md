# UsernameNotReservedValidator

custom validator for ActiveModel.

validates that username is not included in the reserved name list.

e.g:

* index
* home
* top
* ...

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'username_not_reserved_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install username_not_reserved_validator

## Usage

### validation settings

write validation setting on your ActiveModel


```
class User < ActiveRecord::Base
  validates(:name, username_not_reserved: true)
)
```

### options

* `additional_reserved_names` (Array of String / default: `[]`)
 * specify additional reserved names
* `case_insencitve` (Boolean / default: `true`)
 * if set to `false`, comparison is case insencitive
* `message` (Symbol / default: `:invalid`)
 * specify key of error message

## Referenced resources

* http://qiita.com/phimcall/items/4c559b70f70ea7f1953b
* http://bitarts.jp/blog/archives/004363.html
* https://github.com/balexand/email_validator

with tons of thanks :sushi:
