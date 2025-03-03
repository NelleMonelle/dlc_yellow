local SteamworksLavaPalette, super = Class(Event)

function SteamworksLavaPalette:init(x, y, width, height)
	super.init(self,x,y,width,height)
	local properties = type(x) == "table" and x.properties or {}
	self.palette_id = properties.id or 1
end

function SteamworksLavaPalette:onAdd(parent)
    super.onAdd(self,parent)
	Game.world.timer:after(1/30, function()
		for _, obj in ipairs(Game.world.children) do
			if obj:includes(Character) then
				obj:addFX(PaletteFX(obj.actor, self.palette_id), "steamworks_pal")
			end
		end
	end)
end

return SteamworksLavaPalette