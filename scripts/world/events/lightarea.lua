local LightArea, super = Class(Event)

function LightArea:init(data)
	super.init(self, data)

	local properties = data.properties or {}
    self.target_amount = properties["amount"] or 0.3
	self.start_amount = self.target_amount
	
    Game.world.timer:after(1/30, function ()
        self.start_amount = 0
    end)
end

function LightArea:onEnter(chara)
    local id = self:getUniqueID().."_light"
    local mask = chara:addFX(LightMaskFX(), id)
	mask.amount = self.start_amount
    self.world.timer:tween(6/30, mask, {amount = self.target_amount})
end

function LightArea:onExit(chara)
    local id = self:getUniqueID().."_light"
    local mask = chara:getFX(id)
    if mask then
        self.world.timer:tween(6/30, mask, {amount = 0}, "linear", function()
            chara:removeFX(mask)
        end)
    end
end

return LightArea