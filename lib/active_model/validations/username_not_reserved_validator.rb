module ActiveModel::Validations
  class UsernameNotReservedValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      validator = ::UsernameNotReservedValidator::Validator.new(value, self.options)
      unless validator.valid?
        record.errors.add(attribute, :reserved_username)
      end
    end
  end
end
