# UsernameNotReservedValidator

[![Build Status](https://travis-ci.org/kwappa/username_not_reserved_validator.png)](https://travis-ci.org/kwappa/username_not_reserved_validator)
[![Coverage Status](https://coveralls.io/repos/kwappa/username_not_reserved_validator/badge.png?branch=master)](https://coveralls.io/r/kwappa/username_not_reserved_validator?branch=master)
[![Code Climate](https://codeclimate.com/github/kwappa/username_not_reserved_validator.png)](https://codeclimate.com/github/kwappa/username_not_reserved_validator)

Custom validator for ActiveModel.

Validates that username is not included in the list of reserved names.

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

Add validation setting on your ActiveModel.

```ruby
class User < ActiveRecord::Base
  validates(:name, username_not_reserved: true)
end
```

### options

* `additional_reserved_names` (Array of String / default: `[]`)
 * specify additional reserved names
* `case_insencitve` (Boolean / default: `true`)
 * if set to `false`, comparison is case sencitive
* `message` (Symbol / default: `:invalid`)
 * specify custom key of error message

e.g.)

```ruby
class User < ActiveRecord::Base
  validates(:name,
            username_not_reserved: {
              additional_reserved_names: %w[foo bar],
              case_insencitve: true,
              message: :reserved_username
            }
           )
end
```

## Referenced resources

* http://qiita.com/phimcall/items/4c559b70f70ea7f1953b
* http://bitarts.jp/blog/archives/004363.html
* https://github.com/balexand/email_validator

With tons of thanks :sushi:
