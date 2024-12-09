local RoomThirtyFive, super = Class(Map)

function RoomThirtyFive:load()
  super:load(self)
  Game.world:spawnNPC("axis", 1401, 200, {text = "* ..."})
  if Game:getFlag("axis_dead") then
    Game.world:getCharacter("axis"):setAnimation("dead_regular")
  elseif Game:getFlag("axis_hurt") then
    Game.world:getCharacter("axis"):setAnimation("damaged_down")
  end
end

return RoomThirtyFive