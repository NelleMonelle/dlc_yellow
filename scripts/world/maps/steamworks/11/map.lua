local RoomEleven, super = Class(Map)

function RoomEleven:load()
  super.load(self)
end

function RoomEleven:onFootstep(chara, num)
  if num == 1 then
    Assets.playSound("step_metal1")
  elseif num == 2 then
    Assets.playSound("step_metal2")
  end
end

return RoomEleven