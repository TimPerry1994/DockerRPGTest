$LOAD_PATH << '.'
class Room

  @@gold = 0
  @islocked = false

  def lock_door
    @islocked = true
  end

  def get_lock
    return @islocked
  end

  def change_room(room)
    if room.get_lock == true
      dead ("The door is locked. As you lack the intelligence to simply try another door, your determination leads you to repeatedly headbutt the door, with predictable results.")
    else
      self.lock_door
      puts "The door locks behind you."
      room.start
    end
  end

  def dead(why)
    puts "#{why} \nYou have died. gg, no re."
    exit(0)
  end

end
