
module SublimeDSL
module Tools

  ##
  # A class with a minimal set of methods, used for DSL readers
  # that heavily rely on #method_missing.

  class BlankSlate < Object

    # Methods kept:
    # - public/protected from BasicObject, except operators
    # - private from BasicObject
    # - a few Object/Kernel methods

    KEPT_METHODS = %w(
      __id__
      __send__
      equal?
      instance_eval
      instance_exec

      initialize
      method_missing
      singleton_method_added
      singleton_method_removed
      singleton_method_undefined

      __callee__
      __method__
      caller
      define_singleton_method
      method
      object_id
      p
      puts
      raise
      singleton_methods
      warn
    ).map(&:to_sym)

    (instance_methods + private_instance_methods - KEPT_METHODS).each do |m|
      undef_method m
    end

  end

end
end
