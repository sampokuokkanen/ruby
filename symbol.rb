class Symbol
  # call-seq:
  #   to_s -> string
  #
  # Returns a string representation of +self+ (not including the leading colon):
  #
  #   :foo.to_s # => "foo"
  #
  # Related: Symbol#inspect, Symbol#name.
  def to_s
    Primitive.attr! :leaf
    Primitive.cexpr! 'rb_sym_to_s(self)'
  end

  alias id2name to_s

  # call-seq:
  #   name -> string
  #
  # Returns a frozen string representation of +self+ (not including the leading colon):
  #
  #   :foo.name         # => "foo"
  #   :foo.name.frozen? # => true
  #
  # Related: Symbol#to_s, Symbol#inspect.
  def name
    Primitive.attr! :leaf
    Primitive.cexpr! 'rb_sym2str(self)'
  end

  # call-seq:
  #   length -> integer
  #
  # Equivalent to <tt>self.to_s.length</tt>; see String#length.
  def length
    Primitive.attr! :leaf
    Primitive.cexpr! 'rb_str_length(rb_sym2str(self))'
  end

  alias size length

  # call-seq:
  #   to_sym -> self
  #
  # Returns +self+.
  #
  # Related: String#to_sym.
  def to_sym
    self
  end

  alias intern to_sym
end
