$LOAD_PATH << '.'
require 'room'
require 'startroom'
require 'bearroom'
require 'goldroom'
require 'waterroom'
require 'traproom'
class Runner
  $room = Room.new
  $start_room = StartRoom.new
  $bear_room = BearRoom.new
  $gold_room = GoldRoom.new
  $water_room = WaterRoom.new
  $trap_room = TrapRoom.new

  $start_room.choose_room

end
