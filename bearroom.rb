require './room'
class BearRoom < Room

  @bear_moved = false

  def move_bear
    @bear_moved = true
  end

  def choose_room
    puts "There are 4 doors to choose from. Which way do you go? \nnorth\nsouth\neast\nwest"
    id = $stdin.gets.chomp
    if id.include?("north")
      puts "Congratulations! You have successfully escaped the dungeon. You found #{@@gold} gold along the way."
    elsif id.include?("south")
      change_room($start_room)
    elsif id.include?("east")
      if @bear_moved == true
        dead("After going to all the effort to move the bear, you walk straight back into him. After an ambitious attempt to knock it out, the bear swipes at your face.")
      else
        change_room($trap_room)
      end
    elsif id.include?("west")
      change_room($gold_room)
    else
      dead("Your mind is overcome with the overwhelming task of these simple instructions. Unable to cope, your body shuts down completely.")
    end
  end

  def start
    puts "You enter a room that is completely empty, save for a stick by the door you came in by, and a bear in the middle of the room. What do you do?"
    decision = $stdin.gets.chomp
    if decision.include?('poke') || decision.include?('jab') || decision.include?('prod') || decision.include?('center') || decision.include?('poke')
      dead("Against your better judgement, you decide to poke the bear with the stick. The bear is not happy, and takes a swing at you. He doesn't miss.")
    elsif decision.include?('fight') || decision.include?('attack') || decision.include?('punch') || decision.include?('kick') || decision.include?('karate') || decision.include?('kill')
      dead("You think that you could take this bear in a fight, and ready yourself to attack. You were wrong.")
    elsif decision.include?('sneak') || decision.include?('stealth') || decision.include?('creep') || decision.include?('quiet') || decision.include?('light')
      puts "You decide to sneak around the bear. Somehow you succeed."
      choose_room
    elsif decision.include?('throw') || decision.include?('lob') || decision.include?('hurl') || decision.include?('chuck') || decision.include?('stick') || decision.include?('distract') || decision.include?('lure')
      puts "You throw the stick towards the east side of the room. The bear moves to check it out, and reveals some gold it was sitting on. You gain 25 gold pieces"
      @@gold = @@gold + 25
      move_bear
      choose_room
    else
      dead("Whatever you typed, I didn't anticipate it, so let's say the bear walks up and eats you, ok?")
    end
  end
end
