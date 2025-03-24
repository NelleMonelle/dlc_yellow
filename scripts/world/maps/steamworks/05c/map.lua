local RoomFiveC, super = Class(Map)

function RoomFiveC:load()
  super:load(self)
end

function RoomFiveC:onFootstep(chara, num)
  if num == 1 then
    Assets.playSound("step_metal1")
  elseif num == 2 then
    Assets.playSound("step_metal2")
  end
end

return RoomFiveC