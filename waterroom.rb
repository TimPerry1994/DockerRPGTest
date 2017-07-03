require './room'
class WaterRoom < Room


  def choose_room
    puts "You have enough time to spare to choose a door to go through. There are 3 doors to choose from. Which way do you go?\nnorth\neast\nwest"
    id = $stdin.gets.chomp
    if id.include?("north")
      change_room($start_room)
    elsif id.include?("west")
      change_room($gold_room)
    elsif id.include?("east")
      change_room($trap_room)
    else
      dead("Your mind is overcome with the overwhelming task of these simple instructions. Unable to cope, your body shuts down completely.")
    end
  end

    def start

      i=0
      puts "As soon as you enter the room, water starts pouring in. Around the room, you see small piles of gold."
      while i < 150

        if i >= 100
          dead("You got too greedy, and the gold weighs you down as the water rises.")
        else
          puts "Do you take a pile of gold?"
          decision = $stdin.gets.chomp

          if decision.include?('y')
            puts "You grab 15 gold pieces. The water level is getting higher."
            i = i + 25
            i += 1
            @@gold = @@gold + 15
          elsif decision.include?('n')
            puts "You quit while you're ahead."
            choose_room
            break
          else
            puts "Your indecision sends you into a coma. The water doesn't stop rising, and you never wake up."
          end

        end
      end
    end

end
