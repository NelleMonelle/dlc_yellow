local SteamworksSteamPipe, super = Class(Event)

function SteamworksSteamPipe:init(data)
    super.init(self, data)

	local properties = data.properties or {}
	self.type = properties["type"] or 1
	local sprite = "world/events/steamworks/steam/pipe1"
	self.steam_chance = 60
	self.can_steam = true
	self.anim_speed = 2/30
	self.steam_sfx = "pinkgoo_steam"
	self.steam_sfx_frame = 5
	self.steam_sfx_played = false
	self.steam_sfx_vol = 1
	self.steam_sfx_minpitch = 0.6
	self.steam_sfx_maxpitch = 0.8
	if self.type == 2 then
		sprite = "world/events/steamworks/steam/pipe2"
		self.steam_chance = 120
	end
	if self.type == 3 then
		sprite = "world/events/steamworks/steam/darkpipe"
		self.steam_chance = 120
		self.steam_sfx_frame = 3
		self.anim_speed = 4/30
	end
	if self.type == 4 then
		sprite = "world/events/steamworks/steam/04_pipe"
		self:setOriginExact(40, 148)
		self.steam_chance = 180
		self.steam_sfx_frame = 5
		self.steam_sfx_vol = 0.5
		self.steam_sfx_minpitch = 0.8
		self.steam_sfx_maxpitch = 1
		self.anim_speed = 4/30
	end
	if self.type == 5 then
		sprite = "world/events/steamworks/steam/04_pipe_side"
		self:setOriginExact(0, 38)
		self.steam_chance = 180
		self.steam_sfx_frame = 4
		self.steam_sfx_vol = 0.5
		self.steam_sfx_minpitch = 0.8
		self.steam_sfx_maxpitch = 1
		self.anim_speed = 4/30
	end
    self:setSprite(sprite)
	if self.type ~= 4 and self.type ~= 5 then
		self:setOrigin(0.5, 1)
	end
end

function SteamworksSteamPipe:update()
	super.update(self)
	if love.math.random(self.steam_chance) == 1 and self.can_steam then
		self.sprite:play(self.anim_speed, false, function()
			self.sprite:setFrame(1)
			self.can_steam = true
		end)
		self.steam_sfx_played = false
		self.can_steam = false
	end
	if self.sprite.frame >= self.steam_sfx_frame and not self.steam_sfx_played and self.steam_sfx ~= nil then
        Assets.playSound(self.steam_sfx, self.steam_sfx_vol, Utils.random(self.steam_sfx_minpitch, self.steam_sfx_maxpitch))
		self.steam_sfx_played = true
	end
end

return SteamworksSteamPipe