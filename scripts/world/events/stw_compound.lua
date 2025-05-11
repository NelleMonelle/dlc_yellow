local SteamworksCompound, super = Class(Event)

function SteamworksCompound:init(data)
    super.init(self, data)

	local properties = data.properties or {}
    self.type = properties["type"] or nil
	self.message = "* "
	self.accept = false
	self.x_offset = 0
	self.y_offset = 0
	self.carry_y_offset = 0
	self:setOrigin(0.5, 1)
	if self.type then
		self:setSprite("world/events/steamworks/comp/"..self.type)
		self:setTypeSettings()
	end
	self.solid = false
	self.jump_target_x = nil
	self.jump_target_y = nil
	self.jumping = false
	self.jump_timer = 0
end

function SteamworksCompound:setTypeSettings()
	if self.type == "hydrogen" then
		self.x_offset = 7
		self.y_offset = 5
		self.name = "Hydrogen [H]"
		self.message = "* The lightest and most\nprevalent element in the\nuniverse."
		self.accept = true
	end
	if self.type == "titanium" then
		self.x_offset = 10
		self.y_offset = 4
		self.name = "Titanium [Ti]"
		self.message = "* What all robots will be made\nout of when they overtake the\nworld."
	end
	if self.type == "party_popper" then
		self.x_offset = 9
		self.y_offset = -4
		self.name = "Party Popper"
		self.message = "* The element of surprise."
	end
	if self.type == "ketchup" then
		self.x_offset = 7
		self.y_offset = 5
		self.name = "Ketchup"
		self.message = "* Good for bringing that 'dog\nfrom a 7 to a 10."
	end
	if self.type == "chlorine" then
		self.visible = false
		self.x_offset = 7
		self.y_offset = 5
		self.name = "Chlorine [Cl]"
		self.message = "* Useful for cleaning pools of\nwater. Even hot pools on\nmountaintops."
		self.accept = true
	end
	if self.type == "gold" then
		self.visible = false
		self.x_offset = 9
		self.y_offset = -2
		self.name = "Gold [Au]"
		self.message = "* The \"Au\" means that perhaps in\nan alternate universe, you own\nsome."
	end
	if self.type == "pepper" then
		self.x_offset = 3
		self.y_offset = -11
		self:setHitbox(0,-5,self.width,self.height+10)
		self.carry_y_offset = -11
		self.name = "Parmesan and Red Pepper"
		self.message = "* The third most famous Italian\nduo."
	end
	if self.type == "soda" then
		self.x_offset = 6
		self.y_offset = 6
		self.name = "Soda and Mints"
		self.message = "* The deadliest mixture of them\nall."
	end
	if self.type == "neon" then
		self.x_offset = 5
		self.y_offset = 0
		self.name = "Neon"
		self.message = "* Believed to be but a myth\nuntil recently."
	end
	if self.type == "sodium" then
		self.x_offset = 8
		self.y_offset = -3
		self.name = "Sodium [Na]"
		self.message = "* An essential part of any\nbalanced breakfast."
	end
	if self.type == "rutherfordium" then
		self.visible = false
		self.x_offset = 7
		self.y_offset = 5
		self.name = "Rutherfordium [Rf]"
		self.message = "* Discovered by the prestigious\nDr. Rutherford Oscar himself.\nOr so he claims."
	end
	if self.type == "silver" then
		self.x_offset = 9
		self.y_offset = -2
		self.name = "Silver [Ag]"
		self.message = "* The element of disappointment."
	end
	if self.type == "astatine" then
		self.x_offset = 7
		self.y_offset = 5
		self.name = "Astatine [At]"
		self.message = "* . . . How did you even get\nthis?"
	end
	if self.type == "helium" then
		self.x_offset = 11
		self.y_offset = 20
		self.name = "Helium [He]"
		self.message = "* Makes your voice sound funny."
	end
	if self.type == "mustard" then
		self.x_offset = 7
		self.y_offset = 5
		self.name = "Mustard"
		self.message = "* Best kept in a liquid or solid\nstate of matter."
	end
	self.x = self.x + self.sprite.width
	self.y = self.y + self.sprite.height*2
	self.x = self.x - self.x_offset*2
	self.y = self.y - self.y_offset*2
end

function SteamworksCompound:jumpTo(x, y)
	self.jump_target_x = x
	self.jump_target_y = y
	self.jumping = true
	self.jump_timer = 0
end

function SteamworksCompound:jumpFinished()
    return function() return not self.jumping end
end

function SteamworksCompound:update()
	super.update(self)
	if self.carrying then
		self.x = Game.world.player.x
		local pl_height = Game.world.player.sprite.height * 2
		self.y = Game.world.player.y - pl_height + 9
		if Input.pressed("cancel") and not Game.lock_movement then
			Assets.playSound("uty_cant_select")
			self.x = Game.world.player.x
			self.y = Game.world.player.y + self.y_offset
			self.carrying = false
			self:setLayer(Game.world.player.layer)
			Game:setFlag("chem_carrying_item", false)
		end
	end
	self.sprite.alpha = self.alpha
	if self.jumping then
		local _xd = self.jump_target_x - self.x
		local _yd = self.jump_target_y - self.y
		if _xd == 0 then
			_xd = 1
		end
		self.physics.gravity = 3
		local _hsp = Utils.sign(_xd) * math.sqrt(math.abs(_xd)) / 0.75
		local _time = math.ceil(_xd / _hsp)
		self.physics.speed_x = _xd / _time
		self.physics.speed_y = _yd / _time - self.physics.gravity / 2 * (_time + 1)
		self.jump_timer = self.jump_timer + DTMULT
		if (Utils.round(self.x) == self.jump_target_x and Utils.round(self.y) == self.jump_target_y) or self.jump_timer > 60 then
			self.physics.speed_x = 0
			self.physics.speed_y = 0
			self.x = self.jump_target_x
			self.y = self.jump_target_y
			self.physics.gravity = 0
			self.jumping = false
			self.jump_timer = 0
		end
	end
end

function SteamworksCompound:onInteract(player, dir)
    if not Game:getFlag("chem_carrying_item") then
		Game.world:startCutscene(function(cutscene)
			Assets.playSound("playerjump")
			self.visible = true
			self:setLayer(100)
			local pl_height = Game.world.player.sprite.height * 2
			self:jumpTo(Game.world.player.x, Game.world.player.y - pl_height + 9)
			cutscene:wait(self:jumpFinished())
			self.carrying = true
			Game:setFlag("chem_carrying_item", true)
		end)
		return true
	end
end

return SteamworksCompound