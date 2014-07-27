module SublimeDSL
module TextMate

  ##
  # Mix-in to define a custom file base name.
  #
  # The includer has a #name method.

  module CustomBaseName


    # Returns #custom_basename if defined, otherwise Tools.filename(name).
    def basename
      custom_basename || Tools.filename(name)
    end

    # Sets #custom_basename to +base+.
    def basename=(base)
      @basename = base
    end

    # Returns the custom base name, or +nil+ if none.
    def custom_basename
      # avoid warning on uninitialized instance variable
      if defined?(@basename)
        @basename
      else
        @basename = nil
      end
    end

    # Returns ", file: '<basename>'" if #basename different from
    # Tools.filename(name). Otherwise sets it to +nil+
    def dsl_file_arg
      if basename != Tools.filename(name)
        ", file: #{custom_basename.to_source}"
      else
        ''
      end
    end

  end

end
end