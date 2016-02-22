module UsernameNotReservedValidator
  class Validator
    DEFAULT_OPTIONS = { case_insensitive: true }

    def initialize(username, options = {})
      @username = username
      @options = DEFAULT_OPTIONS.merge(options)

      # patch for historical typo
      if @options.key?(:case_insencitive)
        @options[:case_insensitive] = @options[:case_insencitive]
      end
    end

    def valid?
      additional_reserved_names = @options[:additional_reserved_names] || []
      words = ReservedNames.list + additional_reserved_names
      words += words.map(&:pluralize)

      if @options[:case_insensitive]
        words.map!(&:downcase)
        username = @username.downcase
      else
        username = @username
      end

      words.include?(username).!
    end
  end
end
