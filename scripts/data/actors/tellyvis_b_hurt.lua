local actor, super = Class(Actor, "tellyvis_b_hurt")

function actor:init()
    super.init(self)

    self.name = "Telly-Vis"

    self.width = 120
    self.height = 109

    self.use_light_battler_sprite = true

    self.hitbox = {0, 25, 19, 14}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "battle/lightenemies/tellyvis"
    self.default = ""

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["lightbattle_hurt"] = {"hurt", 1/8, false},
        ["lightbattle_spared"] = {"body", 1/8, false},
    }

    self.offsets = {
        ["hurt"]  = {0, 0},
        ["spared"]  = {0, 0},
    }

	self.old_face = "normal"
	self.new_face = self.old_face

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/body_low_hp", 60, 109)
            sprite:setOrigin(0.5, 1)
            sprite.layer = 400
            return sprite
        end
    })

    self:addLightBattlerPart("face", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/faces/"..self.new_face, 60, 109)
            sprite:setOrigin(0.5, 1)
            sprite.layer = 410
            sprite:play(0.5/5)
            return sprite
        end,
		["update"] = function(part)
			if self.new_face ~= self.old_face then
				part.sprite:setSprite(self.path.."/faces/switch")
				part.sprite:play(0.5/5)
				Game.battle.timer:after(10/30, function()
					part.sprite:setSprite(self.path.."/faces/"..self.new_face)
					if self.new_face == "dance" then
						part.sprite:play(1/10)
					else
						part.sprite:play(0.5/5)
					end
				end)
				self.old_face = self.new_face
			end
        end
    })

end

function actor:setFace(face)
	self.new_face = face
end

function actor:setOldFace(face)
	self.old_face = face
end

return actor