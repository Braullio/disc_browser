# frozen_string_literal: true

# Alter class String
class String
  def to_array
    tr('[] "', '').split(',').map(&:to_s)
  end
end
