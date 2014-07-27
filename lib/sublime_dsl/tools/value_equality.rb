
module SublimeDSL
module Tools

  ##
  # A mix-in allowing to compare objects based on value rather than identity.
  #
  # It redefines #eql?, #hash and #== based on a #value_id method, and
  # provides a default implementation for #value_id.

  module ValueEquality

    # Returns true if the class of +other+ is the same or a subclass of +self.class+,
    # and #value_id are the same using "==".

    def eql?(other)
      other.is_a?(self.class) && other.value_id == self.value_id
    end

    alias == eql?

    # Returns #hash for #value_id.

    def hash
      value_id.hash
    end

    # Default value identity: array of instance variable values.

    def value_id
      instance_variables.map { |v| instance_variable_get(v) }
    end

  end

end
end