module DuckRecord #:nodoc:
  # = Active Record \Serialization
  module Serialization
    extend ActiveSupport::Concern
    include ActiveModel::Serializers::JSON

    included do
      self.include_root_in_json = false
    end

    def serializable_hash(options = nil)
      options = options.try(:dup) || {}

      options[:except] = Array(options[:except]).map(&:to_s)
      options[:include] = Array(_reflections.keys).map(&:to_s)

      super(options)
    end
  end
end
