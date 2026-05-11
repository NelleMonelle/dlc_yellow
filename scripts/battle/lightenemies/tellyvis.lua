local TellyVis, super = Class(LightEnemyBattler)

function TellyVis:init()
    super.init(self)

    self.name = "Telly-Vis"
    self:setActor("tellyvis_b")

    self.max_health = 160
    self.health = 160
    self.attack = 12
    self.defense = 12
    self.money = 25
    self.experience = 0
    
    self.dialogue_bubble = "uty_large"
    self.dialogue_offset = {-30, 10}

    self.waves = {
        "tellyvis/reruns"
    }

    self.dialogue = {
        "Don't touch that\ndial! Seriously,\nI'll hurt you.",
        "I live life in\nglorious standard\ndefinition!\nNothing better!",
        "Never take\nadvice from\nVis. He's\na mouthful!",
        "Network TV? Yeah,\nI do the work,\nand they net\nthe profits!"
    }

    self.vis_dialogue = {
        "Ugh, Telly's\nentertainment\nis so...\ntemporary.",
		"Word of advice,\nplease rewind\nyour tapes before\nfeeding me.",
		"Can someone\nplease shut\nMs. Tube-brain\nup?",
		"Just... end it\nall."
    }

    self.low_health_dialogue = {
        "T/Time to;?\nGo on coMmercial\nbreak. ... ."
    }

    self.vis_low_health_dialogue = {
        "*Bzzztt(//\nsz/_-__"
    }

    self.check = "ATK "..self.attack.." DEF "..self.defense.."\n* Can't live with or without\none another."

    self.text = {
        "* Telly-Vis are debating which\nseason of the news is superior.",
        "* Telly pushes Vis' mouth-flap\nback and forth for amusement.\nVis isn't having it.",
        "* Vis reminds Telly what time his\nfavorite show airs but she only\nmakes fun of him.",
        "* The sound of TV static fills\nyour head.",
        "* Telly starts to sing an anime\nopening. Vis begs her to stop.",
        "* You wonder where the mute\nbutton is."
    }

    self.spareable_text = "* Telly-Vis hope you enjoyed the\nprogram."
    self.low_health_text = {
        "* Telly is frantically flipping\nchannels.",
        "* Vis spits out a broken video\ncassette."
    }

    self.low_health = false
    self.switched_channel = false

    self:registerAct("Watch")
    self:registerAct("Nap")
    self:registerAct("Signal")

    --self.gauge_size = {250, 20}

    self.damage_offset = {0, 80}
end

function TellyVis:onAct(battler, name)
    if name == "Check" then
        return "* TELLYVIS -- "..self.check
    elseif name == "Watch" then
        if self.low_health then
            self.dialogue_override = "Th.i>s is- my\nf-f-favorite shoOw/"
            return "* Nothing on."
        else
            if not self.switched_channel then
                local rnd = Utils.pick({1, 2})
                if rnd == 1 then
                    self.dialogue_override = "What are you\nstaring at?"
                    self.vis_dialogue_override = "Nothing worth it,\nthat's for sure."
                else
                    self.dialogue_override = "There's nothing\non yet!"
                    self.vis_dialogue_override = "Because your\nantennas are\ncrooked. Tapes\nwin again."
                end
                return "* While this IS your favorite\nchannel,[wait:5] Telly-Vis don't look\namused."
            else
                self:addMercy(50)
				self.next_face = "dance"
                local rnd = Utils.pick({1, 2})
                if rnd == 1 then
                    self.dialogue_override = "Oh![wait:5] Check\nthis out!"
					self.vis_dialogue_override = "I'll admit,\nthis one\nis good."
                else
                    self.dialogue_override = "Here comes the\nbest part!"
					self.vis_dialogue_override = "Hard disagree."
                end
                return "* Telly finds a show she thinks\nyou'll love."
            end
        end
    elseif name == "Nap" then
        if self.low_health then
            return "* You couldn't sleep if you\nwanted to."
        else
            local rnd = Utils.pick({1, 2})
			self.next_face = "sad"
            if rnd == 1 then
                self.dialogue_override = "Am...[wait:5] Am I\nboring you?"
				self.vis_dialogue_override = "Ha!"
            else
                self.dialogue_override = "Hey,[wait:5] buddy![wait:5]\nI'm still here!"
				self.vis_dialogue_override = "Don't remind\nme."
            end
            return "* You begin to drift off to the\ndismay of Telly.. "
        end
    elseif name == "Signal" then
        if self.low_health then
            self.dialogue_override = "/NeEd s[ome\nMaint/enan-ce . ,,"
            return "* You see if Telly's antennas\nstill function.[wait:5] They do not."
        else
            if not self.switched_channel then
                self:addMercy(50)
                self.switched_channel = true
				self.next_face = "smug"
                local rnd = Utils.pick({1, 2})
                if rnd == 1 then
                    self.dialogue_override = "Just what\nI needed!"
					self.vis_dialogue_override = "Can you detach\nme while you're\nat it?"
                else
                    self.dialogue_override = "Whoa,[wait:5] hey![wait:5]\nI'm picking\nsomething up!"
					self.vis_dialogue_override = "Oh?"
                end
                return "* You help Telly finagle her\nantennas to find some\nprogramming."
            else
                local rnd = Utils.pick({1, 2})
                if rnd == 1 then
                    self.dialogue_override = "They're good\nwhere they are!"
					self.vis_dialogue_override = "Can't say\nthe same."
                else
                    self.dialogue_override = "Hey, don't ruin\nmy electrical\nflow!"
					self.vis_dialogue_override = "She's been\ntrying to get\na signal\nforever."
                end
                return "* You attempt to touch Telly's\nantennas again but she motions\nyou away."
            end
        end
    elseif name == "Standard" then
        if self.low_health then
            self.dialogue_override = "Th.i>s is- my\nf-f-favorite shoOw/"
            return "* Nothing on."
        else
            if not self.switched_channel then
                if battler.chara.id == "susie" then
                    Game.battle:startActCutscene(function(cutscene)
                        cutscene:text("* Hm...", "neutral_side", "susie")
                        cutscene:text("* Maybe a good slap on the side will make them work better!", "smile", "susie")
                        self:addMercy(50)
                        Assets.playSound("damage")
                        self:shake(4)
                        cutscene:wait(0.5)
                    end)
                    self.dialogue_override = "O-ow.[wait:5] Well,[wait:5] at least that helped."
                    self.switched_channel = true
                elseif battler.chara.id == "noelle" then
                    if not self.noelle_acted then
                        self.dialogue_override = "N-no! Don't turn me off!"
                        Game.battle:startActCutscene(function(cutscene)
                            cutscene:text("* Usually when our TV doesn't work...", "frown", "noelle")
                            cutscene:text("* Mom just turns it off and on.", "confused", "noelle")
                        end)
                        self.noelle_acted = true
                        return
                    else
                        return "* Noelle doesn't think she can help Telly-Vis."
                    end
                else
                    local rnd = Utils.pick({1, 2})
                    if rnd == 1 then
                        self.dialogue_override = "What are you\nstaring at?"
						self.vis_dialogue_override = "Nothing worth it,\nthat's for sure."
                    else
                        self.dialogue_override = "There's nothing\non yet!"
						self.vis_dialogue_override = "Because your\nantennas are\ncrooked. Tapes\nwin again."
                    end
                    return "* While this IS "..battler.chara:getName().."'s favorite\nchannel,[wait:5] Telly-Vis don't look\namused."
                end
            else
                self:addMercy(50)
                if battler.chara.id == "susie" then
                    return "* Susie watches the new program and finds it pretty entertaining."
                elseif battler.chara.id == "noelle" then
                    return "* Noelle enjoys the program."
                else
					self.next_face = "dance"
                    local rnd = Utils.pick({1, 2})
                    if rnd == 1 then
                        self.dialogue_override = "Oh![wait:5] Check\nthis out!"
						self.vis_dialogue_override = "I'll admit,\nthis one\nis good."
                    else
                        self.dialogue_override = "Here comes the\nbest part!"
						self.vis_dialogue_override = "Hard disagree."
                    end
                    return "* Telly finds a show she thinks\n"..battler.chara:getName().." will love."
                end
            end
        end
    end

    return super.onAct(self, battler, name)
end

function TellyVis:onDefeat(damage, battler)
    Game.battle.encounter.kill_count = Game.battle.encounter.kill_count + 1

    self.hurt_timer = -1
    local sprite = self:getActiveSprite()
    sprite:stopShake()
    self:toggleOverlay(false)
    self:defeat("KILLED", true)

    Game:setFlag("steamworks_kills", Game:getFlag("steamworks_kills") + 1)
    if Game:getFlag("steamworks_kills") == 20 then
        Game:setFlag("EMPTIED_STEAMWORKS", true)
        MUSIC_PITCHES["steamworks_overworld"] = 0.25
    end

    Game.battle.timer:after(0.8, function()
        self:toggleOverlay(true)
        self.alpha = 0
        Assets.playSound("ut_explosion")
        local explosion = Sprite("battle/lightenemies/robot_destroy_explosion")
        explosion:setPosition(self:getRelativePos(self.width / 2, self.height / 2))
        explosion.layer = LIGHT_BATTLE_LAYERS["above_battlers"]
        explosion:setOrigin(0.5, 0.5)
        explosion:setScale(2, 2)
        Game.battle:addChild(explosion)
        Game.battle.timer:after(1, function()
            explosion:fadeOutAndRemove(1)
        end)
        self:explodeParts()
    end)
end

function TellyVis:explodeParts()
    local function makeSprite(spritepath, x, y)
        local sprite = Sprite(spritepath)
        sprite:setPosition(x or self.x, y or self.y)
        sprite.layer = LIGHT_BATTLE_LAYERS["above_battlers"] + 1
        sprite:setOrigin(0.5, 0.5)
        sprite:setScale(2, 2)
        Game.battle:addChild(sprite)
        sprite.physics.direction = math.rad(Utils.random(360))
        sprite.physics.speed = 7
        sprite.physics.gravity = 0.2
    end
    local relative_pos_x, relative_pos_y = self:getRelativePos(self.width / 2, self.height / 2)
    local path = "battle/lightenemies/tellyvis/explosion_parts/"
    makeSprite(path.."antena", relative_pos_x, relative_pos_y)
    makeSprite(path.."body", relative_pos_x, relative_pos_y)
    makeSprite(path.."hand", relative_pos_x, relative_pos_y)
    makeSprite(path.."leg", relative_pos_x, relative_pos_y)
end

function TellyVis:getEncounterText()
    local has_spareable_text = self.spareable_text and self:canSpare()

    local priority_spareable_text = Game:getConfig("prioritySpareableText")
    if priority_spareable_text and has_spareable_text then
        return self.spareable_text
    end

    if self.low_health_text and self.health <= (self.max_health * self.low_health_percentage) then
        return TableUtils.pick(self.low_health_text)

    elseif self.tired_text and self.tired then
        return self.tired_text

    elseif has_spareable_text then
        return self.spareable_text
    end

    return TableUtils.pick(self.text)
end

function TellyVis:getEnemyDialogue()
	if self.next_face then
		self.actor:setFace(self.next_face)
		self.next_face = nil
	end
    if self.dialogue_override then
        local dialogue = self.dialogue_override
        self.dialogue_override = nil
        return dialogue
    end
    if self.low_health_dialogue and self.health <= (self.max_health * self.low_health_percentage) then
		self.actor:setFace("sad")
        return TableUtils.pick(self.low_health_dialogue)
    end
	local dialogue = TableUtils.pick(self.dialogue)
	-- This is an awful way to do this but fuck it
	if dialogue == "I live life in\nglorious standard\ndefinition!\nNothing better!" then
		self.actor:setFace("smug")
	end
    return dialogue
end

function TellyVis:getVisEnemyDialogue()
    if self.vis_dialogue_override then
        local dialogue = self.vis_dialogue_override
        self.vis_dialogue_override = nil
        return dialogue
    end
    if self.vis_low_health_dialogue and self.health <= (self.max_health * self.low_health_percentage) then
        return TableUtils.pick(self.vis_low_health_dialogue)
    end
	return TableUtils.pick(self.vis_dialogue)
end

function TellyVis:onHurtEnd()
    self:getActiveSprite():stopShake()
    if self.health > 0 or not self.exit_on_defeat then
        self:toggleOverlay(false, true)
    end
    if self.low_health == false and self.health <= (self.max_health * self.low_health_percentage) then
        self.low_health = true
		
		local old_face = self.actor.new_face
        self:setActor("tellyvis_b_hurt")
		self.actor:setFace(old_face)
		self.actor:setOldFace(old_face)
    end
end

return TellyVis