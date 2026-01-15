local Jandroid, super = Class(LightEnemyBattler)

function Jandroid:init()
    super.init(self)

    self.name = "Jandroid"
    self:setActor("jandroid_b")

    self.max_health = 150
    self.health = 150
    self.attack = 11
    self.defense = 7
    self.money = 18
    self.experience = 0

    self.dialogue_bubble = "uty_2"
    self.dialogue_offset = {-30, 10}

    self.waves = {
        "basic"
    }

    self.dialogue = {
        "Gee, you're too\nClean! Let's\nstaIN thaT VEsT!!",
        "Nothin' like the\nsmell of RuSted\nmeTal in the\nMorning!!",
        "I will NeVER take\nout the TrASH!\nYOU CAN'T MAKE\nME!!!",
        "Scrub-a-dub-dub!\nSewage in the\ntub!!!",
        "Want a sip of\nmy Mop Water?\nIt's FReshly MaDe!!"
    }

    self.dialogue_with_jandroid = {
        "*Hum-DEE-DUM\ndE-DUMM!!",
        "*ToGther we\nare Strong!!!",
        "HA Heh!!\nBet I am DIRTIER\nthan YOU!!",
        "It iS time\nto Meet Our\nMops!!"
    }

    self.dialogue_with_goosic = {
        "YEAH yeAH!!\npuMP IT UP!!!!",
        "goNNA woRK so\nMucH HARDER!!!"
    }

    self.low_health_dialogue = {
        "//Cleaaaaan - _",
        "LLLet's\n;-:_\nWassh up"
    }

    self.check = "ATK "..self.attack.." DEF "..self.defense.."\n* \"Hygiene\" is not in their\nvocabulary."

    self.text = {
        "* Jandroid wrings out their\nmop... over their head.",
        "* Jandroid tries to whistle to\nthe music.",
        "* Smells like poor choices.",
        "* Jandroid tosses garbage this\nway and that."
    }

    self.spareable_text = "* Jandroid finds you too\nhygienic."
    self.low_health_text = {
        "* Jandroid doesn't seem to know\nwhat they're doing anymore.",
        "* You hear metallic and\nelectrical noises as Jandroid\ntwitches."
    }

    self.low_health = false

    self:registerAct("Question")
    self:registerAct("Clean")
    self:registerAct("Analyze")
    self:registerMarcyAct("Roll")

    --self.gauge_size = {250, 20}

    self.damage_offset = {0, 80}
end

function Jandroid:getDamageVoice()
    return "hurt_robot"
end

function Jandroid:onAct(battler, name)
    if name == "Check" then
        return "* JANDROID -- "..self.check
    elseif name == "Question" then
        if self.low_health then
            self.dialogue_override = "W//what\nwas_That? /("
            return "* You ask Jandroid how they're\nstill functioning."
        else
            local rnd = Utils.pick({1, 2})
            if rnd == 1 then
                self.dialogue_override = "To rid the\nUnderground of\nSOAP!!!"
            else
                self.dialogue_override = "To cle//a--I\nmean help all\nGerms conquer\nthe land!!"
            end
            return "* You ask Jandroid what their\nprimary directive is."
        end
    elseif name == "Clean" then
        if self.low_health then
            self.dialogue_override = "St_amwrrks\nNeed_/ scruBbed\n0"
            return "* Cleaning Jandroid wouldn't\ndo any good at this point."
        else
            self.wave_override = "jandroid/garbage_cans"
            local rnd = Utils.pick({1, 2})
            if rnd == 1 then
                self.dialogue_override = "NO YOU!!"
            else
                self.dialogue_override = "You are RUDE!\nTake THIS!!"
            end
            return "* You offer to give Jandroid\na scrub. They seem offended."
        end
    elseif name == "Analyze" then
        if self.low_health then
            self.dialogue_override = "AaAAaoo/aa/.\nBzzt.\"<<<"
            return "* You look Jandroid over and\nnotice many missing screws."
        else
            local rnd = Utils.pick({1, 2})
            if rnd == 1 then
                self.dialogue_override = "I can't beLIEVE\nyou Would propose\nsuch a Thing!"
            else
                self.dialogue_override = "Don't comE\nANY cLosER!!"
            end
            return "* You look Jandroid over and\ntell them they need a shower."
        end
    elseif name == "Roll" then
		if self.dirtied_marcy then
			return {
				"* Marcy rolls around in the dirtiness...",
				"* But Jandroid's guard is already lowered!"
			}
		else
			self.defense = self.defense - 2
			self.dirtied_marcy = true
			return {
				"* Marcy rolls around in the dirtiness...",
				"* Jandroid sees this and lowers its guard a little."
			}
		end
    elseif name == "Standard" then
        if self.low_health then
            self.dialogue_override = "St_amwrrks\nNeed_/ scruBbed\n0"
            return "* Cleaning Jandroid wouldn't\ndo any good at this point."
        else
            if battler.chara.id == "susie" then
                if not self.susie_acted then
                    Game.battle:startActCutscene(function(cutscene)
                        cutscene:text("* (Man,[wait:5] they look hella dirty...)", "nervous_side", "susie")
                        cutscene:text("* What's that look for?[wait:5] I'm not touching them.", "annoyed", "susie")
                    end)
                    self.susie_acted = true
			    	return
                else
                    return "* Susie refuses to touch Jandroid."
                end
            elseif battler.chara.id == "noelle" then
                self.wave_override = "jandroid/garbage_cans"
                if not self.noelle_acted then
                    Game.battle:startActCutscene(function(cutscene)
                        cutscene:text("* Oh,[wait:5] you look so dirty...", "what_smile", "noelle")
                        cutscene:text("* Mind if I clean you a bit?", "confused_surprise", "noelle")
                    end)
                    self.noelle_acted = true
			    	return
                else
                    return "* Noelle already cleaned Jandroid."
                end
            elseif battler.chara.id == "dess" then
                self.dialogue_override = "HaHA! FuN!"
                self:addMercy(50)
				if not self.dess_acted then
                    Game.battle:startActCutscene(function(cutscene)
                        cutscene:text("* Dess starts to throw the trash back at Jandroid.")
                        cutscene:text("* They seem to like that.")
                        cutscene:text("* The hell do you mean they're happy about it?", "neutral", "dess")
                    end)
                    self.dess_acted = true
			    	return
                else
                    return "* Dess continues to throw the trash back at Jandroid."
                end
			elseif battler.chara.id == "jamm" then
                Game.battle:startActCutscene(function(cutscene)
                    cutscene:text("* Jamm slings the trash away...")
                    cutscene:text("* Jandroid doesn't seem to like that.")
                end)
				return
            else
                self.wave_override = "jandroid/garbage_cans"
                local rnd = Utils.pick({1, 2})
                if rnd == 1 then
                    self.dialogue_override = "NO YOU!!"
                else
                    self.dialogue_override = "You are RUDE!\nTake THIS!!"
                end
                return "* "..battler.chara:getName().." offers to give Jandroid\na scrub. They seem offended."
            end
        end
    end

    return super.onAct(self, battler, name)
end

function Jandroid:onDefeat(damage, battler)
    Game.battle.encounter.jandroid_kill_reaction = true
    Game.battle.encounter.kill_count = Game.battle.encounter.kill_count + 1

    self.hurt_timer = -1
    local sprite = self:getActiveSprite()
    sprite:stopShake()
    sprite:setAnimation("lightbattle_spared")
    self:defeat("KILLED", true)

    Game:setFlag("steamworks_kills", Game:getFlag("steamworks_kills") + 1)
    if Game:getFlag("steamworks_kills") == 20 then
        Game:setFlag("EMPTIED_STEAMWORKS", true)
        MUSIC_PITCHES["steamworks_overworld"] = 0.25
    elseif Game:getFlag("steamworks_kills") > 13 and Game:getFlag("steamworks_kills") < 20 and #Game.battle.enemies > 0 then
        Game.battle.timer:after(1, function()
            local enemies_left = 20 - Game:getFlag("steamworks_kills")
            local mus_pitch = 1
            if enemies_left > 0 then
                mus_pitch = (enemies_left / 7)
            end
            Game.battle.music:setPitch(mus_pitch)
        end)
    elseif Game:getFlag("steamworks_kills") == 13 and #Game.battle.enemies > 0 then
        Game.battle.music:stop()
        Game.battle.timer:after(1, function()
            Game.battle.music:play("genobattle_yellow")
        end)
    end

    Game.battle.timer:after(0.8, function()
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

function Jandroid:explodeParts()
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
    local path = "battle/lightenemies/jandroid/explosion_parts/"
    makeSprite(path.."body_bottom", relative_pos_x, relative_pos_y)
    makeSprite(path.."body_top", relative_pos_x, relative_pos_y)
    makeSprite(path.."broom", relative_pos_x, relative_pos_y)
    makeSprite(path.."hand", relative_pos_x, relative_pos_y)
    makeSprite(path.."head", relative_pos_x, relative_pos_y)
    makeSprite(path.."headphones", relative_pos_x, relative_pos_y)
end

function Jandroid:getEncounterText()
    local has_spareable_text = self.spareable_text and self:canSpare()

    if Game.battle.encounter.jandroid_kill_reaction then
        Game.battle.encounter.jandroid_kill_reaction = false
        return "* The Jandroid begins mopping\nthe wreckage."

    elseif Game.battle.encounter.goosic_kill_reaction then
        Game.battle.encounter.goosic_kill_reaction = false
        return "* Jandroid will never forgive\nyou as long as you walk the\nearth."

    elseif self.low_health_text and self.health <= (self.max_health * self.low_health_percentage) then
        return Utils.pick(self.low_health_text)

    elseif self.tired_text and self.tired then
        return self.tired_text

    elseif has_spareable_text then
        return self.spareable_text
    end

    return Utils.pick(self.text)
end

function Jandroid:getEnemyDialogue()
    if Game.battle.encounter.jandroid_kill_reaction then
        return Utils.pick({"WHOA\ntherE!!", "HahA!!\nCool Trick!!"})
    end
    if Game.battle.encounter.goosic_kill_reaction then
        return "wow\nSerIOUSLY!?!?!?."
    end
    if self.dialogue_override then
        local dialogue = self.dialogue_override
        self.dialogue_override = nil
        return dialogue
    end
    if self.low_health_dialogue and self.health <= (self.max_health * self.low_health_percentage) then
        return Utils.pick(self.low_health_dialogue)
    end
    if Game.battle.encounter.id == "jandroid_duo" and Game.battle.encounter.kill_count < 1 then
        return Utils.pick(self.dialogue_with_jandroid)
    end
    if Game.battle:getEnemyBattler("goosic") then
        return Utils.pick(self.dialogue_with_goosic)
    end

    return Utils.pick(self.dialogue)
end

function Jandroid:onHurtEnd()
    self:getActiveSprite():stopShake()
    if self.health > 0 or not self.exit_on_defeat then
        self:toggleOverlay(false, true)
    end
    if self.low_health == false and self.health <= (self.max_health * self.low_health_percentage) then
        self.low_health = true
        self:setActor("jandroid_b_hurt")
    end
end

return Jandroid