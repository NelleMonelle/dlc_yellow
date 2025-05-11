local SteamworksMetalSounds, super = Class(Event)

function SteamworksMetalSounds:init(data)
	super.init(self, data)
	self.sound_chance = 800
	self.sound_last = nil
	self.timer = 0
end

function SteamworksMetalSounds:update()
	super.update(self)
	if love.math.random(self.sound_chance) == 1 then
		local sound = Utils.pick({"steamworks_metal_1","steamworks_metal_2","steamworks_metal_3"}, function(snd)
			return snd ~= self.sound_last
		end)
		Assets.playSound(sound, 0.05, 0.45)
		self.last_sound = sound
		self.sound_chance = 800
	end
	if self.sound_chance > 350 and self.timer %	1 == 0 then
		self.sound_chance = self.sound_chance - 1
	end
	self.timer = self.timer + DTMULT
end

return SteamworksMetalSounds