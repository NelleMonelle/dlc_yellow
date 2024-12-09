local RoomThirteen, super = Class(Map)

function RoomThirteen:load()
  super:load(self)
end

function RoomThirteen:onEnter()
  super.onEnter(self)

  if not Game.world.camera.keep_in_bounds then
    Game.world.camera.keep_in_bounds = true
  end
end

return RoomThirteen