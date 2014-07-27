# encoding: utf-8

module Enumerable

  # Returns a hash <tt>{ key => element }</tt>, where +key+ is the
  # value returned by the block when passed +element+.
  #
  # Raises an exception if two elements return the same key.
  #
  # Examples:
  #   %w(a bb ccc).keyed_by(&:length)  #=>  {1 => 'a', 2 => 'bb', 3 => 'ccc'}
  #   %w(a bb cc).keyed_by(&:length)   #=>  RuntimeError "duplicate key: 2"

  def keyed_by
    h = {}
    each do |element|
      key = yield(element)
      h.key?(key) and raise "duplicate key: #{key.inspect}"
      h[key] = element
    end
    h
  end

end
