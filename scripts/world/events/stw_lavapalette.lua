local SteamworksLavaPalette, super = Class(Event)

function SteamworksLavaPalette:init(x, y, width, height)
	super.init(self,x,y,width,height)
	self.pal_shader = Assets.newShader("palette")
	self.characters = {}
end

function SteamworksLavaPalette:onAdd(parent)
    super.onAdd(self,parent)
	Game.world.timer:after(1/30, function()
		for _, obj in ipairs(Game.world.children) do
			if obj:includes(Character) then
				local base_pal = {}
				local live_pal = {}
				pal_spr = Assets.getTextureData(obj.actor.path.."/palette")
				if pal_spr then
					print("found palette")
					local r,g,b,a = {}
					for x = 1, pal_spr:getWidth() do
						r,g,b,a = pal_spr:getPixel(x - 1, 0)
						table.insert(base_pal, {r,g,b,a})
						r,g,b,a = pal_spr:getPixel(x - 1, 1)
						table.insert(live_pal, {r,g,b,a})
					end
					obj:addFX(SteamworksPaletteFX(self.pal_shader, base_pal, live_pal), "steamworks_pal")
				end
			end
		end
	end)
end

return SteamworksLavaPalette