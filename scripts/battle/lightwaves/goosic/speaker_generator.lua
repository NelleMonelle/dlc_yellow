local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
	
    self:setArenaSize(140, 128)
	self.pan_amt = 0
	self.pan_lerp = 0
	self.is_panning = false
	
	self.note_x = 0
	self.note_timer = 0
	self.note_offset = 0
	self.note_dir = 1
	self.spawn_notes = false
    self.time = 7
end

function Basic:onStart()
	Game.battle.music:setVolume(0)
	Game.battle.encounter.left_music_src:seek(Game.battle.music:tell())
	Game.battle.encounter.right_music_src:seek(Game.battle.music:tell())
	Game.battle.encounter.left_music_src:setVolume(1)
	Game.battle.encounter.right_music_src:setVolume(1)
	local arena = Game.battle.arena
	self.left_speaker = self:spawnSprite("battle/bullets/goosic/speakers", arena.left-80, arena.bottom-6, 8999)
	self.left_speaker:setOrigin(0.5, 67/71)
	self.left_speaker:setScale(-1, 1)
	self.left_speaker.alpha = 0.5
	self.right_speaker = self:spawnSprite("battle/bullets/goosic/speakers", arena.right+80, arena.bottom-6, 8999)
	self.right_speaker:setOrigin(0.5, 67/71)
	self.right_speaker:setScale(1, 1)
	self.right_speaker.alpha = 0.5
	self.timer:script(function(wait)
		wait(15/30)
		while true do
			self.pan_amt = Utils.pick({-1, 1})
			if self.pan_amt == -1 then
				self.note_x = 290
				self.left_speaker:play(3/30)
			else
				self.note_x = 340
				self.right_speaker:play(3/30)
			end
			wait(15/30)
			self.spawn_notes = true
			wait(2)
			self.pan_amt = 0
			self.left_speaker:stop()
			self.right_speaker:stop()
			self.spawn_notes = false
			wait(1)
		end
	end)
end

function Basic:update()
	super.update(self)
	
	if self.pan_amt == -1 then
		self.left_speaker.alpha = Utils.lerp(self.left_speaker.alpha, 1, 0.2*DTMULT)
		self.right_speaker.alpha = Utils.lerp(self.right_speaker.alpha, 0.5, 0.2*DTMULT)
	elseif self.pan_amt == 1 then
		self.left_speaker.alpha = Utils.lerp(self.left_speaker.alpha, 0.5, 0.2*DTMULT)
		self.right_speaker.alpha = Utils.lerp(self.right_speaker.alpha, 1, 0.2*DTMULT)
	else
		self.left_speaker.alpha = Utils.lerp(self.left_speaker.alpha, 0.5, 0.2*DTMULT)
		self.right_speaker.alpha = Utils.lerp(self.right_speaker.alpha, 0.5, 0.2*DTMULT)
	end
	
	if self.spawn_notes then
		if self.note_timer > 0 then
			self.note_timer = self.note_timer - DTMULT
		else
			local arena = Game.battle.arena
			self:spawnBulletTo(Game.battle.mask, "goosic/speaker_note", self.note_x + self.note_offset, arena.bottom+10)
			self.note_timer = 2
			self.note_offset = self.note_offset + 20 * self.note_dir
			if self.note_offset >= 40 or self.note_offset <= -40 then
				self.note_dir = -self.note_dir
				self.note_offset = self.note_offset + (20 * self.note_dir * 2)
			end
		end
	end
	
	self.pan_lerp = Utils.lerp(self.pan_lerp, self.pan_amt, 0.1*DTMULT)
	Game.battle.encounter.left_music_src:setVolume(Utils.clamp(1-self.pan_lerp, 0, 1))
	Game.battle.encounter.right_music_src:setVolume(Utils.clamp(1+self.pan_lerp, 0, 1))
end

return Basic