require './room'
class TrapRoom < Room

  def start
    puts "As soon as you enter the room, sections of the floor immediately drop down, leaving a series of podiums."

    puts "Immediately ahead of you are 3 podiums. The left one is empty, the central one has a chest on it, the right one has a scary looking bear on it. Which podium do you jump to? \nleft\ncenter\nright"
    decision = $stdin.gets.chomp
    if decision.include?('left')
      puts "You jump to the empty podium."

      puts "Ahead of you are another 2 podiums. They both have chests on them. Which do you jump to?\ncenter\nright"
      choice = $stdin.gets.chomp
      if choice.include?('center' || 'centre')
        dead("Unfortunately, this podium is very slippery, and you fall off the other side.")
      elsif choice.include?('right')
        puts "You land elegantly on the podium, and the chest contains 30 gold coins. Not bad."
        @@gold = @@gold + 30
        puts "Another 3 podiums lie ahead, each with a sum on it. Which one do you jump to? (type 1, 2 or 3)\n1: 25+(15/5)=8\n2: 25+(15/5)=28\n3: 25+(15/5)=100"
        number = $stdin.gets.chomp
        if number == ('1' || '3')
          dead("Wrong! The pillar shoots up before you can land, leaving you to fall below.")
        elsif number == '2'
          puts "Correct! You land on the pillar, which rises up to take you outside the dungeon."
          puts "Congratulations! You have successfully escaped the dungeon. You found #{@@gold} gold along the way."
          exit(0)
        else
          dead("That wasn't even an option. Overwhelmed with your own stupidity, you collapse.")
        end
      else
        dead("Your indecision makes you dizzy, and you fall into the chasm below.")
      end

    elsif decision.include?('center' || 'centre')
      dead("Did you really think that wasn't a trap? As soon as you land on the podium, it crumbles and you fall down with it.")
    elsif decision.include?('right')
      dead("No. Just no.")
    else
      dead("Your indecision makes you dizzy, and you fall into the chasm below.")
    end
  end

end
