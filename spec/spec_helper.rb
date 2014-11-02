require 'rubygems'
require 'rspec'
require 'active_model'

require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'username_not_reserved_validator'

class TestModel
  include ActiveModel::Validations

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end
end

class WithoutValidationUser < TestModel
end

class WithValidationUser < TestModel
  validates :name, username_not_reserved: true
end

class WithCaseInsencitiveValidationUser < TestModel
  validates :name, username_not_reserved: { case_insencitive: false }
end

class WithAdditionalReservedNamesValidationUser < TestModel
  validates :name, username_not_reserved: { additional_reserved_names: %w[additional_reserved_username] }
end
