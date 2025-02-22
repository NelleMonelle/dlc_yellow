local actor, super = Class(Actor, "cerobaboss_p2")

function actor:init()
    super.init(self)

    self.name = "Ceroba"

    self.light_battle_width = 113
    self.light_battle_height = 114

    self.hitbox = {0, 0, 16, 16}

    self.use_light_battler_sprite = true

    self.path = "battle/lightenemies/ceroba"
    self.default = "idle"

    self.voice = "ceroba"

    self.animations = {
        ["lightbattle_hurt"] = {"hurt_phase_2", 1, true},
        ["intro"] = {"animations/intro", 1/11, false},
        ["phase_switch"] = {"animations/phase_switch", 1/11, false},
        ["staff_spin"] = {"animations/staff_spin", 1/11, false},
        ["death"] = {"animations/death", 1/6, false},
    }

    self.offsets = {
        ["hurt_phase_2"] = {-9, 5},
        ["animations/intro"] = {-21, -20},
        ["animations/phase_switch"] = {-23, -28},
        ["animations/staff_spin"] = {-23, -28},
        ["animations/death"] = {-9, 5},
        ["dead"] = {-5, 5},
    }

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/body", 55, 112)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 480
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
			part.stretch = 1
			part.mult = 2
			part.stage = 1
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT
			local anim_time = 120
			local anim_time_half = 60
			if part.stage == 1 then
				part.stretch = part.stretch + ((0.1 / anim_time_half) * part.mult) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch >= 1.1 then
					part.stretch = 1.1
					part.stage = 2
					part.mult = 2
				end
			elseif part.stage == 2 then
				part.stretch = part.stretch - (0.1 / anim_time_half) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch <= 1 then
					part.stretch = 1
					part.stage = 1
					part.mult = 2
				end
			end
			-- NOW PRESENTING THE WORST HACK EVER!!!
			if part.sprite.parent.enemy.overlay_sprite.visible then
				part.stretch = 1
				part.stage = 1
				part.mult = 2
			end
            part.sprite.scale_y = part.stretch
        end
    })
    
    self:addLightBattlerPart("head", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/head", 57.5, 55)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 500
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
			part.stretch = 1
			part.mult = 2
			part.stage = 1
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT
			local anim_time = 120
			local anim_time_half = 60
			if part.stage == 1 then
				part.stretch = part.stretch - ((0.1 / anim_time_half) * part.mult) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch <= 0.9 then
					part.stretch = 0.9
					part.stage = 2
					part.mult = 2
				end
			elseif part.stage == 2 then
				part.stretch = part.stretch + (0.1 / anim_time_half) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch >= 1 then
					part.stretch = 1
					part.stage = 1
					part.mult = 2
				end
			end
			if part.sprite.parent.enemy.overlay_sprite.visible then
				part.stretch = 1
				part.stage = 1
				part.mult = 2
			end
            part.sprite.y = 55 * part.stretch
        end
    })
	
    self:addLightBattlerPart("ponytail", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/ponytail", 45, 63)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 460
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
			part.stretch = 1
			part.mult = 2
			part.stage = 1
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT
			local anim_time = 120
			local anim_time_half = 60
			if part.stage == 1 then
				part.stretch = part.stretch - ((0.1 / anim_time_half) * part.mult) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch <= 0.9 then
					part.stretch = 0.9
					part.stage = 2
					part.mult = 2
				end
			elseif part.stage == 2 then
				part.stretch = part.stretch + (0.1 / anim_time_half) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch >= 1 then
					part.stretch = 1
					part.stage = 1
					part.mult = 2
				end
			end
			if part.sprite.parent.enemy.overlay_sprite.visible then
				part.stretch = 1
				part.stage = 1
				part.mult = 2
			end
            part.sprite.y = 63 * part.stretch
        end
    })

    self:addLightBattlerPart("hand_right", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/hand_right", 71, 79)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 490
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
			part.stretch = 1
			part.mult = 2
			part.stage = 1
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT
			local anim_time = 120
			local anim_time_half = 60
			if part.stage == 1 then
				part.stretch = part.stretch - ((0.1 / anim_time_half) * part.mult) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch <= 0.9 then
					part.stretch = 0.9
					part.stage = 2
					part.mult = 2
				end
			elseif part.stage == 2 then
				part.stretch = part.stretch + (0.1 / anim_time_half) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch >= 1 then
					part.stretch = 1
					part.stage = 1
					part.mult = 2
				end
			end
			if part.sprite.parent.enemy.overlay_sprite.visible then
				part.stretch = 1
				part.stage = 1
				part.mult = 2
			end
            part.sprite.y = 79 * part.stretch
        end
    })

    self:addLightBattlerPart("hand_left", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/hand_left", 33.5, 80)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 470
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
			part.stretch = 1
			part.mult = 2
			part.stage = 1
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT
			local anim_time = 120
			local anim_time_half = 60
			if part.stage == 1 then
				part.stretch = part.stretch - ((0.1 / anim_time_half) * part.mult) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch <= 0.9 then
					part.stretch = 0.9
					part.stage = 2
					part.mult = 2
				end
			elseif part.stage == 2 then
				part.stretch = part.stretch + (0.1 / anim_time_half) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch >= 1 then
					part.stretch = 1
					part.stage = 1
					part.mult = 2
				end
			end
			if part.sprite.parent.enemy.overlay_sprite.visible then
				part.stretch = 1
				part.stage = 1
				part.mult = 2
			end
            part.sprite.y = 80 * part.stretch
        end
    })

    self:addLightBattlerPart("staff", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/staff_red", 48, 112)
            sprite:setOrigin(0.5, 1)
            sprite:setColor(215/255, 166/255, 166/255)
            sprite.layer = 450
            return sprite
        end,
        ["init"] = function(part)
            part.timer = 0
			part.stretch = 1
			part.mult = 2
			part.stage = 1
        end,
        ["update"] = function(part)
            part.timer = part.timer + DTMULT
			local anim_time = 120
			local anim_time_half = 60
			if part.stage == 1 then
				part.stretch = part.stretch - ((0.1 / anim_time_half) * part.mult) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch <= 0.9 then
					part.stretch = 0.9
					part.stage = 2
					part.mult = 2
				end
			elseif part.stage == 2 then
				part.stretch = part.stretch + (0.1 / anim_time_half) * DTMULT
				part.mult = part.mult - (2 / anim_time_half) * DTMULT
				if part.stretch >= 1 then
					part.stretch = 1
					part.stage = 1
					part.mult = 2
				end
			end
			if part.sprite.parent.enemy.overlay_sprite.visible then
				part.stretch = 1
				part.stage = 1
				part.mult = 2
			end
            part.sprite.y = 112 * part.stretch
        end
    })
end

return actor