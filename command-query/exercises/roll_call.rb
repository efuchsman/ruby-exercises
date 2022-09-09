class RollCall < Array
  attr_reader :roll_array
  def initialize
    @roll_array = []

  end

  def longest_name
  previous_name_length = 0
  longest_name = nil

    if self.length == 0
      nil
    else
      self.each do |name|
        if name.length > previous_name_length
          previous_name_length = name.length
          longest_name = name
        end
      end
      longest_name
    end
  end
end
