local Toilet, super = Class(Event)

function Toilet:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

	self.solid = true
    self:setOrigin(0.5, 0.5)
    self:setSprite("world/events/toilet")
end

function Toilet:onInteract(player, dir)
	Game.world:startCutscene(function(cutscene)
		cutscene:text("* (For some reason,[wait:5] there's a giant toilet blocking the path.)")
		if cutscene:getCharacter("ceroba") then
			cutscene:text("* wth", "wat", "ceroba")
		end
	end)
	return true
end

return Toilet