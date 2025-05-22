local RoomFive, super = Class(Map)

function RoomFive:load()
  super.load(self)
end

function RoomFive:onFootstep(chara, num)
  if num == 1 then
    Assets.playSound("step_metal1")
  elseif num == 2 then
    Assets.playSound("step_metal2")
  end
end

return RoomFive