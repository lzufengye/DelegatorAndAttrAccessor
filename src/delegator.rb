module Delegator
  def delegate(*params)
    target = params.pop
    unless target.is_a?(Hash) && to = target[:to]
      raise ArgumentError, "Delegation needs a target. Supply an options hash with a :to key as the last argument"
    end
    while !params.empty?
      method_name = params.pop
      define_method("#{method_name}") do
        to.send(method_name)
      end
    end
  end
end