require 'rubygems'
require 'rspec'
require 'active_model'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'username_not_reserved_validator'

class TestUser
  include ActiveModel::Validations

  validates :user, username_not_reserved: true
end
