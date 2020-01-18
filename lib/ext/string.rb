class String
  def to_array
    self.tr('[] "', '').split(',').map(&:to_s)
  end
end