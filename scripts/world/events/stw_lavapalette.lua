local SteamworksLavaPalette, super = Class(Event)

function SteamworksLavaPalette:init(x, y, width, height)
	super.init(self,x,y,width,height)
	self.pal_shader = love.graphics.newShader( -- load the shader
	[[
	extern vec4 base_palette[16];
	extern vec4 live_palette[16];

	vec4 effect(vec4 color, Image image, vec2 uvs, vec2 screen_coords) {
		vec4 pixel = Texel(image, uvs);
		for(int i = 0; i < 16; ++i){
			vec4 color = base_palette[i];
			if(all(lessThan(abs(pixel - color), vec4(0.001))))
				return live_palette[i];
		}
		return pixel;
	}
	]] )
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