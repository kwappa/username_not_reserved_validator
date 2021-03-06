module ActiveModel::Validations
  class UsernameNotReservedValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      validator = ::UsernameNotReservedValidator::Validator.new(value, self.options)
      unless validator.valid?
        record.errors.add(attribute, (options[:message] || :invalid))
      end
    end
  end
end
