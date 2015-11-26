class UsernameNotReservedValidator < ActiveModel::EachValidator
  require 'username_not_reserved_validator/reserved_names'

  @@default_options = { case_insensitive: true }

  def self.default_options
    @@default_options
  end

  def validate_each(record, attribute, value)
    options = @@default_options.merge(self.options)

    # patch for historical typo
    if options.key?(:case_insencitive)
      options[:case_insensitive] = options[:case_insencitive]
    end

    additional_reserved_names = options[:additional_reserved_names] || []
    words = ReservedNames.list + additional_reserved_names
    words += words.map(&:pluralize)

    if options[:case_insensitive]
      words.map!(&:downcase)
      username = value.downcase
    else
      username = value
    end

    if words.include?(username)
      record.errors.add(attribute, (options[:message] || :invalid))
    end
  end
end
