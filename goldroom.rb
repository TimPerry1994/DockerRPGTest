class GoldRoom < Room

  def choose_room
    puts "There are 3 doors to choose from. Which way do you go? \nnorth\nsouth\neast"
    id = $stdin.gets.chomp
    if id.include?("north")
      change_room($bear_room)
    elsif id.include?("south")
      change_room($water_room)
    elsif id.include?("east")
      change_room($start_room)
    else
      dead("Your mind is overcome with the overwhelming task of these simple instructions. Unable to cope, your body shuts down completely.")
    end
  end

  def start
    puts "You find yourself in a room filled with gold. Do you take any? (y/n)"
    decision = $stdin.gets.chomp
    if decision.include?("y")
      puts "How many gold pieces do you take?"
      gold = $stdin.gets.chomp.to_i
      @@gold = @@gold + gold
      if gold < 0
        puts "You put some gold onto the pile. How thoughtful."
        self.choose_room
      elsif gold == 0
        dead("Your indecision causes your head to turn to mush.")
      elsif gold > 0 && gold <= 50
        puts "You take #{gold} gold pieces. Nice!"
        self.choose_room
      elsif gold > 50
        dead("You take #{gold} gold pieces. As you leave the pile, you notice it was on a pressure plate. Your greed causes it to rise, and the room fills with spiders. You are scared to death.")
      else
        dead("Your mind is overcome with the overwhelming task of these simple instructions. Unable to cope, your body shuts down completely.")
      end
    elsif decision.include?("n")
      puts "You choose to ignore the massive pile of gold. How boring."
      self.choose_room
    else
      dead("Your mind is overcome with the overwhelming task of these simple instructions. Unable to cope, your body shuts down completely.")
    end
  end
end
