local RoomTen, super = Class(Map)

function RoomTen:load()
  super:load(self)
end

function RoomTen:init(world, data)
  super:init(self, world, data)
  if Game:getFlag("axis_chase_inprogress")==true then
    self.music = "undertale_yellow/axis_chase"
  end
end

function RoomTen:onFootstep(chara, num)
  if num == 1 then
    Assets.playSound("step_metal1", 2)
  elseif num == 2 then
    Assets.playSound("step_metal2", 2)
  end
end

return RoomTen