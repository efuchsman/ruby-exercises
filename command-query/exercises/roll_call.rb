class RollCall < Array

  def longest_name
  previuous_name = 0
  longest_name = nil

    if self.length == 0
      nil
    else
      self.each do |name|
        if name.length > previuous_name
          previous_name = name.length
          longest_name = name
        end
      end
      longest_name
    end
  end
end
