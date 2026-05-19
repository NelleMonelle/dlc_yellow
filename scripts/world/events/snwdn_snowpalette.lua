local SnowdinSnowPalette, super = Class(Event)

function SnowdinSnowPalette:init(x, y, width, height)
	super.init(self,x,y,width,height)
	local properties = type(x) == "table" and x.properties or {}
	self.palette_id = properties.id or 2
end

function SnowdinSnowPalette:onAdd(parent)
    super.onAdd(self,parent)
	Game.world.timer:after(1/30, function()
		for _, chara in ipairs(Game.stage:getObjects(Character)) do
			if Game:getFlag("SHINY")[chara.party] == true then
				chara:addFX(PaletteFX(chara.actor:getSpritePath().."/area_palette_shiny", self.palette_id, nil, 2), "area_pal")
			else
				chara:addFX(PaletteFX(chara.actor:getSpritePath().."/area_palette", self.palette_id), "area_pal")
			end
		end
	end)
end

return SnowdinSnowPalette