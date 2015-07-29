module AttrAccessor
  def my_attr_accessor(*params)
    params.each do |param|
      define_method("#{param}") do
        instance_variable_get("@#{param}")
      end
      define_method("#{param}=") do |value|
        instance_variable_set("@#{param}", value)
      end
    end
  end
end