[Integer, Float].each do |numerical|
  numerical.class_eval do
    alias_method :__multiply__, :*
    private :__multiply__

    def * n
      return n * self if n.is_a? VectorSpace::Vector
      __multiply__ n
    end
  end
end
