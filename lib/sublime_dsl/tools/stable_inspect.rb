
module SublimeDSL
module Tools

  ##
  # A mix-in redefining #inspect so that it does not depend on #to_s.

  module StableInspect

    # Method not calling #to_s, and producing the standard #inspect output.
    def inspect
      '#<' << self.class.name << ':0x' << '%x' % (object_id << 1)  <<
        instance_variables.map { |v| " #{v}=#{instance_variable_get(v).inspect}" }.join(',') <<
        '>'
    end

  end

end
end
