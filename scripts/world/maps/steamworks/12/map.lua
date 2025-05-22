local RoomTwelve, super = Class(Map)

function RoomTwelve:load()
  super.load(self)

  if not Game:getFlag("axis_second_met") then
    Game.world:spawnNPC("axis", 321, 280)
    Game.world:getCharacter("axis").alpha = 0
  end
end

function RoomTwelve:onFootstep(chara, num)
  if num == 1 then
    Assets.playSound("step_metal1")
  elseif num == 2 then
    Assets.playSound("step_metal2")
  end
end

return RoomTwelve