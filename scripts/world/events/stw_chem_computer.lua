local SteamworksChemComputer, super = Class(Event)

function SteamworksChemComputer:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)

    self:setSprite("world/maps/steamworks/small_objects/chem_05_computer")
    self:setOrigin(0.5, 0.5)
	self:setHitbox(24,22,300,166)
	self.font = Assets.getFont("chem")
    self.last_font = Assets.getFont("main")
	self.message = "[AWAITING INPUT]\n"
	self.message_sub = ""
	self.cursor = "_"
	self.message_timer = 0
	self.message_skip = false
    Game.world.timer:after(1/30, function ()
        self.layer = 0.3
    end)
    self.cursor_timer = Game.world.timer:every(1, function ()
        if self.cursor == "_" then
			self.cursor = ""
		else
			self.cursor = "_"
		end
    end)
	self.interact_message = Game:getFlag("chem_did_puzzle", false)
	self.mixing_scene = Game:getFlag("chem_did_puzzle", false)
	self.compound_count = 0
end

function SteamworksChemComputer:setMessage(msg, skip)
	self.message = msg
	self.message_sub = ""
	self.message_timer = 0
	self.message_skip = skip or false
end

function SteamworksChemComputer:addMessage(msg, skip)
	self.message = self.message..msg
	self.message_skip = skip or false
end

function SteamworksChemComputer:onInteract(player, dir)
	if self.interact_message == false then
		self:setMessage("...\nWaiting for correct\ncompounds to complete\nmixture . . .")
		self.interact_message = true
	end
end

function SteamworksChemComputer:update()
	super.update(self)

	for _,compound in ipairs(self.world:getEvents("stw_compound")) do
		if Utils.dist(self.x+60, self.y+150, compound.x + 110, compound.y + 128) < 60 then
			if compound.carrying and not self.mixing_scene then
				self.mixing_scene = true
				Game.world:startCutscene(function(cutscene)
					Assets.playSound("playerjump")
					compound.carrying = false
					Game:setFlag("chem_carrying_item", false)
					compound:setLayer(100)
					compound:jumpTo(165*2, 148*2)
					cutscene:wait(compound:jumpFinished())
					Assets.playSound("mart_impact_2")
					compound.graphics.fade = 0.05
					compound.graphics.fade_to = 0
					cutscene:wait(function() return compound.alpha <= 0 end)
					self:setMessage("Reading. . .")
					cutscene:wait(1)
					self:setMessage(compound.name, true)
					cutscene:wait(1)
					self:addMessage("\nVerdict: ", true)
					cutscene:wait(0.5)
					if compound.accept then
						self.compound_count = self.compound_count + 1
						self:addMessage("Accepted.", true)
					else
						self:addMessage("Declined.", true)
					end
					cutscene:wait(1)
					cutscene:text("[color:green]"..compound.message)
					compound:remove()
					if self.compound_count > 1 then
						self:setMessage(". . .Booting process.", true)
						cutscene:wait(2)
						self:addMessage("\nBoot complete.\nMixing initialized.", true)
						cutscene:wait(1.5)
						Game.world.music:fade(0, 10/30)
						local minigame = Game.world:spawnObject(MixingMinigame(), WORLD_LAYERS["ui"])
						minigame.alpha = 0
						cutscene.world.timer:tween(10/30, minigame, {alpha = 1})
						cutscene:wait(1/30)
						minigame.active_fake = true

						cutscene:wait(function() return minigame.done end)
						minigame:fadeOutAndRemove(10/30)
						minigame.mus:fade(0, 1)
						cutscene:wait(1)
						minigame.mus:remove()
						Game.world.music:fade(1, 1)
						Game:setFlag("chem_did_puzzle", true)
						self:setMessage("Mixing process\ncomplete. Enjoy your\ndeadly acid :)", true)
						cutscene:wait(1.5)
						local acid = Game.world.map:getEvent("stw_acid")
						acid.active = true
						acid.sprite:fadeToSpeed(1, 0.1)
						Assets.playSound("success")
						self.interact_message = true
					else
						if self.compound_count == 1 then
							self:setMessage("Status:\nCompound 1: PRESENT\nCompound 2: MISSING")
						else
							self:setMessage("...\nWaiting for correct\ncompounds to complete\nmixture . . .")
						end
						self.interact_message = true
						self.mixing_scene = false
					end
				end)
			end
		end
	end

	if self.message_timer < self.message:len() then
		if Input.pressed("cancel") and self.message_skip then
			self.message_timer = self.message:len()
		end
		self.message_timer = self.message_timer + DTMULT
		if math.floor(self.message_timer) % 1 == 0 then
			Assets.playSound("voice/default")
		end
		self.cursor = "_"
		if self.cursor_timer then
			Game.world.timer:cancel(self.cursor_timer)
			self.cursor_timer = nil
		end
		self.message_sub = Utils.sub(self.message, 0, math.floor(self.message_timer))
	else
		if not self.cursor_timer then
			self.cursor_timer = Game.world.timer:every(1, function ()
				if self.cursor == "_" then
					self.cursor = ""
				else
					self.cursor = "_"
				end
			end)
		end
		self.message_sub = self.message
	end
end

function SteamworksChemComputer:draw()
	super.draw(self)
    Draw.setColor(0,1,0,1)
    love.graphics.setFont(self.font)
    love.graphics.print(self.message_sub..self.cursor, 130, 28)
    love.graphics.setFont(self.last_font)
end

return SteamworksChemComputer