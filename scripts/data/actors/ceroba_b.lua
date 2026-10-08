local actor, super = Class(Actor, "ceroba_b")

function actor:init()
    super.init(self)

    self.name = "Ceroba"

    self.light_battle_width = 226
    self.light_battle_height = 208

    self.hitbox = {0, 0, 16, 16}

    self.use_light_battler_sprite = true

    self.path = "battle/lightenemies/ceroba"
    self.default = "intro_1"

    self.voice = "ceroba"

    self.animations = {
        ["lightbattle_hurt"] = {"hurt", 1, true},
        ["lightbattle_hurt_phase_2"] = {"hurt_phase_2", 1, true},
        ["lightbattle_spared"] = {"hurt", 1, true},

        ["staff_spin"] = {"phase_switch", (1/30)/0.33, false, nil, frames={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18}},

        ["intro"] = {"intro", (1/30)/(1/3), false},
        ["phase_switch"] = {"phase_switch", (1/30)/(1/3), false},
        ["death"] = {"murder_death", (1/30)/0.25, false}
    }

    self.offsets = {
        ["hurt"] = {-2, -6},
        ["hurt_phase_2"] = {-2, -6},
        ["intro"] = {-26, -56},
        ["murder_death"] = {-2, -6},
        ["phase_switch"] = {-30, -72},
    }

    -- for easier placement
    local body_x = 126
    local body_y = 202

    self.anim_loop_time = 30 * 4 --room_speed * 4
    self.anim_stretch_current = 1
    self.anim_stretch_max = 1.1
    self.anim_stage = 1
    self.anim_inc_multiplier = 2
    self.anim_inc_multiplier_max = 2
    self.anim_head_offset = body_y - (body_y - 122) --y - obj_ceroba_head.y
    self.anim_hand_left_offset = body_y - (body_y - 116) --y - obj_ceroba_hand_left.y
    self.anim_hand_right_offset = body_y - (body_y - 123) --y - obj_ceroba_hand_right.y
    self.anim_staff_offset = body_y - (body_y - 99) --y - obj_ceroba_staff.y
    self.anim_ponytail_offset = (body_y - 122) - (body_y - 177) --obj_ceroba_head.y - obj_ceroba_ponytail.y
    self.starting_point_x = body_x
    self.starting_point_y = body_y

    -- config
    self.do_red_tint = false
    self.phase = 1
    self.hurt = false

    self:addLightBattlerPart("staff", {
        ["create_sprite"] = function()
            local sprite
            if self.hurt then
                sprite = Sprite(self.path.."/staff_phase_2_hurt", body_x - 14, body_y - 99)
            elseif self.phase == 2 then
                sprite = Sprite(self.path.."/staff_phase_2", body_x - 14, body_y - 99)
            else
                sprite = Sprite(self.path.."/staff", body_x - 14, body_y - 99)
            end
            if self.hurt then
                sprite:setOriginExact(112, 88)
            else
                sprite:setOriginExact(114, 105)
            end
            sprite.layer = -3
            if self.do_red_tint then sprite.color = {215/255, 166/255, 166/255} end
            return sprite
        end
    })

    self:addLightBattlerPart("ponytail", {
        ["create_sprite"] = function()
            local sprite
            if self.hurt then
                sprite = Sprite(self.path.."/ponytail_hurt", body_x + 5, body_y - 177)
                sprite:setOriginExact(85, 31)
            else
                sprite = Sprite(self.path.."/ponytail", body_x + 5, body_y - 177)
                sprite:setOriginExact(83, 25)
            end
            sprite.layer = -2
            if self.do_red_tint then sprite.color = {215/255, 166/255, 166/255} end
            return sprite
        end
    })

    self:addLightBattlerPart("hand_left", {
        ["create_sprite"] = function()
            local sprite
            if self.hurt then
                sprite = Sprite(self.path.."/hand_left_hurt", body_x - 18, body_y - 116)
                sprite:setOriginExact(54, 0)
            else
                sprite = Sprite(self.path.."/hand_left", body_x - 18, body_y - 116)
                sprite:setOriginExact(50, 0)
            end
            sprite.layer = -1
            if self.do_red_tint then sprite.color = {215/255, 166/255, 166/255} end
            return sprite
        end
    })

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite
            if self.hurt then
                sprite = Sprite(self.path.."/body_hurt", body_x, body_y)
            else
                sprite = Sprite(self.path.."/body", body_x, body_y)
            end
            sprite:setOriginExact(78, 128)
            sprite.layer = 0
            if self.do_red_tint then sprite.color = {215/255, 166/255, 166/255} end
            return sprite
        end
    })

    self:addLightBattlerPart("hand_right", {
        ["create_sprite"] = function()
            local sprite
            if self.hurt then
                sprite = Sprite(self.path.."/hand_right_hurt", body_x + 28, body_y - 123)
                sprite:setOriginExact(22, 9)
            else
                sprite = Sprite(self.path.."/hand_right", body_x + 28, body_y - 123)
                sprite:setOriginExact(24, 9)
            end
            sprite.layer = 1
            if self.do_red_tint then sprite.color = {215/255, 166/255, 166/255} end
            return sprite
        end
    })

    self:addLightBattlerPart("head", {
        ["create_sprite"] = function()
            local sprite
            if self.hurt then
                sprite = Sprite(self.path.."/head_hurt", body_x + 3, body_y - 122)
                sprite:setOriginExact(29, 62)
            else
                sprite = Sprite(self.path.."/head", body_x + 3, body_y - 122)
                sprite:setOriginExact(29, 64)
            end
            sprite.layer = 2
            if self.do_red_tint then sprite.color = {215/255, 166/255, 166/255} end
            return sprite
        end
    })
end

function actor:onBattleUpdate(battler)
    local staff = self:getLightBattlerPart("staff")
    local ponytail = self:getLightBattlerPart("ponytail")
    local hand_left = self:getLightBattlerPart("hand_left")
    local hand_right = self:getLightBattlerPart("hand_right")
    local head = self:getLightBattlerPart("head")
    local body = self:getLightBattlerPart("body")

    local anim_loop_time_half = self.anim_loop_time / 2
    local anim_inc_current = (self.anim_stretch_max - 1) / anim_loop_time_half * self.anim_inc_multiplier
    if self.anim_stage == 1 then
        self.anim_stretch_current = self.anim_stretch_current + anim_inc_current * DTMULT
        self.anim_inc_multiplier = self.anim_inc_multiplier - (self.anim_inc_multiplier_max / anim_loop_time_half) * DTMULT
        if self.anim_stretch_current >= self.anim_stretch_max then
            self.anim_stretch_current = self.anim_stretch_max
            self.anim_stage = 2
            self.anim_inc_multiplier = self.anim_inc_multiplier_max
        end
    elseif self.anim_stage == 2 then
        self.anim_stretch_current = self.anim_stretch_current - ((self.anim_stretch_max - 1) / anim_loop_time_half) * DTMULT
        self.anim_inc_multiplier = self.anim_inc_multiplier - (self.anim_inc_multiplier_max / anim_loop_time_half) * DTMULT
        if self.anim_stretch_current <= 1 then
            self.anim_stretch_current = 1
            self.anim_stage = 1
            self.anim_inc_multiplier = self.anim_inc_multiplier_max
        end
    end
    body.sprite.scale_y = self.anim_stretch_current
    head.sprite.y = body.sprite.y - self.anim_head_offset * body.sprite.scale_y
    hand_right.sprite.y = body.sprite.y - self.anim_hand_right_offset * body.sprite.scale_y
    hand_left.sprite.y = body.sprite.y - self.anim_hand_left_offset * body.sprite.scale_y
    staff.sprite.y = body.sprite.y - self.anim_staff_offset * body.sprite.scale_y
    ponytail.sprite.y = head.sprite.y - self.anim_ponytail_offset
end

function actor:getAnimation(anim)
    if anim == "lightbattle_hurt" and (self.phase == 2 or self.hurt) then
        return self.animations["lightbattle_hurt_phase_2"]
    else
        return super.getAnimation(self, anim)
    end
end

function actor:onTextSound()
    Assets.stopAndPlaySound("voice/ceroba")
    return true
end

return actor