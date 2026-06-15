local CerobaBattleBackground, super = Class(Object)

function CerobaBattleBackground:init()
    super.init(self, 0, 0)
    self:setLayer(LIGHT_BATTLE_LAYERS["background"])

    self.diamond_width = 60
    self.diamond_width_current = 0
    self.diamond_height = 140
    self.diamond_x = {
        [0] = 640 - self.diamond_width - 20,
        [1] = 0 + self.diamond_width + 20
    }
    self.diamond_y = 120
    self.diamond_y_original = 115
    self.diamond_y_shift = 30
    self.diamond_sin_deg = 0
    self.diamond_alpha = 1
	self.part_timer = 0
	local color_part = {228/255, 69/255, 101/255}
	self.part_embersys = GMParticleSystem()
	self.part_embersys:setLayer(self.layer - 0.1)
	Game.battle:addChild(self.part_embersys)
	self.part_ember_em = self.part_embersys:initEmitter()
	self.part_embersys:createEmitter(self.part_ember_em)
	self.part_ember_small = self.part_embersys:initType()
	self.part_embersys:partTypeSprite(self.part_ember_small, Assets.getTexture("ui/lightbattle/backgrounds/ceroba_background_particle_small"), false, false, false)
	self.part_embersys:partTypeSize(self.part_ember_small, 2, 2, 0, 0)
	self.part_embersys:partTypeColorOne(self.part_ember_small, color_part)
	self.part_embersys:partTypeAlphaTwo(self.part_ember_small, 1, 0)
	self.part_embersys:partTypeSpeed(self.part_ember_small, 0.8, 1.1, 0, 0)
	self.part_embersys:partTypeDirection(self.part_ember_small, math.rad(-75), math.rad(-105), 0, 0)
	self.part_embersys:partTypeLife(self.part_ember_small, 300, 300)
	self.part_embersys:partTypeBlend(self.part_ember_small, false)
	self.part_embersys:createType(self.part_ember_small)
	self.part_ember_medium = self.part_embersys:initType()
	self.part_embersys:partTypeSprite(self.part_ember_medium, Assets.getTexture("ui/lightbattle/backgrounds/ceroba_background_particle_medium"), false, false, false)
	self.part_embersys:partTypeSize(self.part_ember_medium, 2, 2, 0, 0)
	self.part_embersys:partTypeColorOne(self.part_ember_medium, color_part)
	self.part_embersys:partTypeAlphaTwo(self.part_ember_medium, 1, 0)
	self.part_embersys:partTypeSpeed(self.part_ember_medium, 0.6, 0.9, 0, 0)
	self.part_embersys:partTypeDirection(self.part_ember_medium, math.rad(-75), math.rad(-105), 0, 0)
	self.part_embersys:partTypeLife(self.part_ember_medium, 325, 325)
	self.part_embersys:partTypeBlend(self.part_ember_medium, false)
	self.part_embersys:createType(self.part_ember_medium)
	self.part_ember_large = self.part_embersys:initType()
	self.part_embersys:partTypeSprite(self.part_ember_large, Assets.getTexture("ui/lightbattle/backgrounds/spr_ceroba_background_particle_large"), false, false, false)
	self.part_embersys:partTypeSize(self.part_ember_large, 2, 2, 0, 0)
	self.part_embersys:partTypeColorOne(self.part_ember_large, color_part)
	self.part_embersys:partTypeAlphaTwo(self.part_ember_large, 1, 0)
	self.part_embersys:partTypeSpeed(self.part_ember_large, 0.4, 0.7, 0, 0)
	self.part_embersys:partTypeDirection(self.part_ember_large, math.rad(-75), math.rad(-105), 0, 0)
	self.part_embersys:partTypeLife(self.part_ember_large, 350, 350)
	self.part_embersys:partTypeBlend(self.part_ember_large, false)
	self.part_embersys:createType(self.part_ember_large)
	self.part_embersys:emitterRegion(self.part_ember_em, 0, SCREEN_WIDTH, 0, 250, "rectangle", "linear")
	self.part_embersys:emitterBurst(self.part_ember_em, self.part_ember_small, 3)
	self.part_embersys:emitterBurst(self.part_ember_em, self.part_ember_medium, 2)
	self.part_embersys:emitterBurst(self.part_ember_em, self.part_ember_large, 1)
	self.part_embersys:emitterRegion(self.part_ember_em, 0, SCREEN_WIDTH, 250, 250, "line", "linear")
end

function CerobaBattleBackground:update()
	self.part_timer = self.part_timer + DTMULT
	if self.part_timer >= 1 then
		self.part_embersys:emitterBurst(self.part_ember_em, self.part_ember_small, -25)
		self.part_embersys:emitterBurst(self.part_ember_em, self.part_ember_medium, -45)
		self.part_embersys:emitterBurst(self.part_ember_em, self.part_ember_large, -125)
		self.part_timer = 0
	end
    if (self.diamond_width_current == self.diamond_width) then
        self.diamond_width_current = 0
    end
    self.diamond_width_current = self.diamond_width_current + 0.5 * DTMULT
    if Game.battle:getEnemyBattler("ceroba_geno") then
        local breath_percentage = (Game.battle:getEnemyBattler("ceroba_geno").actor.anim_stretch_current - 1) / (Game.battle:getEnemyBattler("ceroba_geno").actor.anim_stretch_max - 1)
        self.diamond_alpha = 0.35 + breath_percentage * 0.65
    end
    self.diamond_sin_deg = self.diamond_sin_deg + DTMULT
    if (self.diamond_sin_deg >= 360) then
        self.diamond_sin_deg = self.diamond_sin_deg - 360
    end
    self.diamond_y = self.diamond_y_original + math.sin(math.rad(self.diamond_sin_deg)) * self.diamond_y_shift

    super.update(self)
end

function CerobaBattleBackground:draw()
    love.graphics.setColor(73/255, 24/255, 31/255, 1)
    love.graphics.rectangle("fill", 0, 230, 640, 336 - 230)
    love.graphics.setColor(157/255, 23/255, 50/255, 1)
    love.graphics.rectangle("fill", 0, 242, 640, 330 - 242)
    love.graphics.setColor(216/255, 31/255, 68/255, 1)
    love.graphics.rectangle("fill", 0, 268, 640, 324 - 268)
    love.graphics.setColor(228/255, 69/255, 101/255, 1)
    love.graphics.rectangle("fill", 0, 310, 640, 324 - 310)

    love.graphics.setColor(216/255, 31/255, 68/255, 1)
    for i = 0, 1 do
        local diamond_x_left = self.diamond_x[i] - self.diamond_width - self.diamond_width_current / 3
        local diamond_x_right = self.diamond_x[i] + self.diamond_width + self.diamond_width_current / 3
        if (self.diamond_width_current > (self.diamond_width / 2)) then
            diamond_x_left = self.diamond_x[i] - self.diamond_width - (self.diamond_width / 3 - self.diamond_width_current / 3)
            diamond_x_right = self.diamond_x[i] + self.diamond_width + (self.diamond_width / 3 - self.diamond_width_current / 3)
        end
        love.graphics.setLineWidth(1)
        love.graphics.line(diamond_x_left, self.diamond_y, self.diamond_x[i], (self.diamond_y - self.diamond_height / 2), diamond_x_right, self.diamond_y, self.diamond_x[i], (self.diamond_y + self.diamond_height / 2), diamond_x_left, self.diamond_y)
        local vertical_line_1_x = self.diamond_x[i] - self.diamond_width + self.diamond_width_current
        love.graphics.line(self.diamond_x[i], (self.diamond_y - self.diamond_height / 2), vertical_line_1_x, self.diamond_y, self.diamond_x[i], (self.diamond_y + self.diamond_height / 2))
        local vertical_line_2_x = self.diamond_x[i] + self.diamond_width_current
        love.graphics.line(self.diamond_x[i], (self.diamond_y - self.diamond_height / 2), vertical_line_2_x, self.diamond_y, self.diamond_x[i], (self.diamond_y + self.diamond_height / 2))
        love.graphics.line(diamond_x_left, self.diamond_y, vertical_line_1_x, self.diamond_y, vertical_line_2_x, self.diamond_y, diamond_x_right, self.diamond_y)
        love.graphics.line(diamond_x_left, self.diamond_y, vertical_line_1_x, self.diamond_y, vertical_line_2_x, self.diamond_y, diamond_x_right, self.diamond_y)
    end

    super.draw(self)
end

return CerobaBattleBackground