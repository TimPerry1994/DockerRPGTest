require './room'
class StartRoom < Room

  def start
    self.choose_room
  end

  def choose_room
    puts "You are in an empty room with 4 doors. Which one do you take? (enter in lower case)\nnorth\nsouth\neast\nwest"
    id = $stdin.gets.chomp
    if id.include?("north")
      self.change_room($bear_room)
    elsif id.include?("west")
      self.change_room($gold_room)
    elsif id.include?("south")
      self.change_room($water_room)
    elsif id.include?("east")
      self.change_room($trap_room)
    else
      dead("Your mind is overcome with the overwhelming task of these simple instructions. Unable to cope, your body shuts down completely.")
    end
  end
end
