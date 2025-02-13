local RoomChemOne, super = Class(Map)

function RoomChemOne:load()
  super:load(self)
end

function RoomChemOne:onEnter()
  if Game:getFlag("got_steamworks_id") then
		Game.world.map:getTileLayer("door_closed").visible = false
  end
end

return RoomChemOne