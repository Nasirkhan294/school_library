class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented the method '#{__method__}'"
  end
end
