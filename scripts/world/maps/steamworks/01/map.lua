local RoomOne, super = Class(Map)

function RoomOne:load()
  super:load(self)
end

function RoomOne:onEnter()
    for _,chara in ipairs(Game.world.stage:getObjects(Character)) do
        if not chara.no_shadow and not chara:getFX("shadow") then
            local mask = chara:addFX(ColorMaskFX(), "shadow")
			mask.color = {0,0,0}
			mask.amount = 0.5
		end
    end
end

function RoomOne:onExit()
    for _,chara in ipairs(Game.world.stage:getObjects(Character)) do
        if chara:getFX("shadow") then
			local id = "shadow"
			local mask = chara:getFX(id)
            chara:removeFX(mask)
		end
    end
end

function RoomOne:onFootstep(chara, num)
  if num == 1 then
    Assets.playSound("step_metal1")
  elseif num == 2 then
    Assets.playSound("step_metal2")
  end
end

return RoomOne