local TellyVis, super = Class(LightEncounter)

function TellyVis:init()
    super.init(self)

    self.text = "* Telly-Vis tunes in!"

    if Game:getFlag("steamworks_kills") >= 13 then
        local enemies_left = 20 - Game:getFlag("steamworks_kills")
        local mus_pitch = 1
        if enemies_left > 0 then
            mus_pitch = (enemies_left / 7)
        end
        MUSIC_PITCHES["genobattle_yellow"] = mus_pitch
        self.music = "genobattle_yellow"
    else
        self.music = "heatwave_approaching"
    end

    self:addEnemy("tellyvis", 316, 228)

    self.can_flee = false

    self.kill_count = 0
end

function TellyVis:onStateChange(old,new)
	super.onStateChange(self,old,new)
	if new == "ENEMYDIALOGUE" then
		for _,enemy in ipairs(Game.battle:getActiveEnemies()) do
			if enemy.name == "Telly-Vis" then
				local dialogue = enemy:getVisEnemyDialogue()
				if dialogue then
					local x, y = enemy.sprite:getRelativePos(0, enemy.actor:getHeight()/2, Game.battle)
					x, y = x - enemy.dialogue_offset[1], y + enemy.dialogue_offset[2] + 40
					local bubble = SpeechBubble(dialogue, x, y, {no_sound_overlap = true, style = "uty_large", right=false})
					Game.battle:addChild(bubble)
					bubble:setCallback(function()
						bubble:remove()
					end)
					table.insert(Game.battle.enemy_dialogue, bubble)
				end
			end
        end
	end
end

function TellyVis:createBackground()
    if self.background then
        local background = Sprite("ui/lightbattle/backgrounds/standard", 0, 0, SCREEN_HEIGHT, SCREEN_WIDTH)
        background:setColor({238 / 255, 71 / 255, 122 / 255, 1})
        background:setParallax(0, 0)
        background.layer = LIGHT_BATTLE_LAYERS["background"]
        background.debug_select = false
        return Game.battle:addChild(background)
    end
end

return TellyVis