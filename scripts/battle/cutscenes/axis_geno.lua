return {
    death = function(cutscene, battler, enemy)
        Game.battle.music:stop()
        local axis = Game.battle:getEnemyBattler("axis_g")
        axis:getActiveSprite():setSprite("nocharge_melancholy")
        cutscene:wait(1)
        --axis:toggleOverlay(false)
        local speech = {
            "BzZT-Z// z. ._ .",
            ". . . W-wW-",
            "-WHA_T HAS H/APPENeD\nTO M..E?",
            "[color:FF00FF]D-D-DAMAGE CRITICAL_",
            "[color:FF00FF]Se-EK R/ePAI'RS IM\nEDIATELY_",
            "I S_EE .  . .",
            "[color:FF00FF]CALLInG MR. ChUJIN_",
            "CREaTOR. .. ?",
            "[color:FF00FF]CALLInG MR. ChUJIN_",
            "CRE_TO R, I NEED\nASSIST//ANCE_",
            "[color:FF00FF]CALLInG MR. Ch , . _",
            "[color:FF00FF]/CrEAt.. ,..",
            "[color:FF00FF]CAL-L , , i n g _",
            "CRe. ...",
            ".",
            "creator."
        }
        cutscene:battlerText(axis, speech)

        Assets.playSound("vaporized")
        axis:defeat("KILLED", true)
        Game:setFlag("axis_dead", true)
        cutscene:after(function()
            Game.battle:setState("VICTORY")
        end, true)
    end,
    fight_end = function(cutscene, battler, enemy)
        local axis = Game.battle:getEnemyBattler("axis_g")
        cutscene:wait(1)
        local speech = {
            "HoW L0NG ARE wE\nGOInG TO DO\nTHIS?",
            "My SHIELD iS\nIMPERVI0US TO\nYOuR W3APONS."
        }
        local speech2 = {
            "tRY 4LL Y0U\nWaNT BUTt...",
            "YoU CANnOT\nBR3aK IT."
        }
        cutscene:battlerText(axis, speech)

        local slash = Sprite("effects/lightattack/strike")
        local relative_pos_x, relative_pos_y = axis:getRelativePos(axis.width / 2, axis.height / 2)
        slash:setPosition(relative_pos_x, relative_pos_y)
        slash.layer = BATTLE_LAYERS["above_ui"] + 5
        slash.color = {1, 105/255, 105/255}
        slash:setOrigin(0.5, 0.5)
        axis.parent:addChild(slash)
        Assets.playSound("laz_c")
        slash:play(1/6, false, function(this)
            Assets.stopAndPlaySound("trash_can_hit")
            axis:getActiveSprite():setSprite("geno_lid_block")
            this:remove()
        end)

        cutscene:wait(2)

        axis:setAnimation("idle_shield")
        cutscene:battlerText(axis, speech2)

        Game.battle.music:fade(0, 0.5)
        Game.battle.encounter.bg:fadeOutAndRemove(0.5)
        cutscene:wait(2)
        cutscene:choicer({"[image:world/npcs/flowey/icon, 0, 0, 2, 2]"})
        cutscene:text("* (You call for help...)")

        Game.battle.encounter:addEnemy("flowey", 140, 240)
        local flowey = Game.battle:getEnemyBattler("flowey")
        flowey.animation_state=true
        flowey:setAnimation("riseanim2")
        cutscene:wait(2)
        flowey.animation_state=false
        cutscene:battlerText(flowey, "Howdy.")
        flowey:setSprite("plainside")
        cutscene:battlerText(flowey, "[speed:0.1]...")
        flowey:setSprite("plain")
        cutscene:battlerText(flowey, "[speed:0.1]...")
        cutscene:battlerText(flowey, "You want me to help you,[wait:5] right?")
        flowey:setSprite("plainside")
        cutscene:battlerText(flowey, "Sorry buddy,[wait:5]\nwith that one you're on your own.")
        flowey:setSprite("plain")
        cutscene:wait(1)
        cutscene:choicer({"Proceed"})
        cutscene:wait(0.5)
        cutscene:battlerText(flowey, "What?")
        cutscene:wait(1)
        cutscene:choicer({"Proceed"})
        cutscene:wait(0.5)
        flowey:setSprite("snarky")
        cutscene:battlerText(flowey, "You want me to\ndo this anyway,[wait:5] don't you?")
        cutscene:wait(1)
        cutscene:choicer({"Proceed"})
        cutscene:wait(0.5)
        flowey:setSprite("pissed")
        cutscene:battlerText(flowey, "Oh,[wait:5] you know what,[wait:5] fine!")

        local vine = Sprite("world/cutscenes/flowey_vine")
        vine:setPosition(relative_pos_x, relative_pos_y)
        vine.layer = BATTLE_LAYERS["above_ui"] + 5
        vine:setOrigin(0.5, 0.5)
        vine:setScale(3, 3)
        axis.parent:addChild(vine)
        Assets.playSound("spearrise")
        vine:play(1/10, false, function(this)
            this:fadeOutAndRemove(0.5)
        end)
        cutscene:wait(0.1)
        Assets.stopAndPlaySound("ut_explosion")
        local shards = {}
        local shard1 = Sprite("battle/lightenemies/axis/trashlid_pieces_1")
        table.insert(shards, shard1)
        local shard2 = Sprite("battle/lightenemies/axis/trashlid_pieces_2")
        table.insert(shards, shard2)
        local shard3 = Sprite("battle/lightenemies/axis/trashlid_pieces_3")
        table.insert(shards, shard3)
        local shard4 = Sprite("battle/lightenemies/axis/trashlid_pieces_4")
        table.insert(shards, shard4)
        local shard5 = Sprite("battle/lightenemies/axis/trashlid_pieces_5")
        table.insert(shards, shard5)
        local shard6 = Sprite("battle/lightenemies/axis/trashlid_pieces_6")
        table.insert(shards, shard6)
        local shard7 = Sprite("battle/lightenemies/axis/trashlid_pieces_7")
        table.insert(shards, shard7)
        local shard8 = Sprite("battle/lightenemies/axis/trashlid_pieces_8")
        table.insert(shards, shard8)
        local shard9 = Sprite("battle/lightenemies/axis/trashlid_pieces_9")
        table.insert(shards, shard9)
        for _,shard in ipairs(shards) do
            shard:setPosition(relative_pos_x, relative_pos_y)
            shard.layer = axis.layer + 1
            shard:setOrigin(0.5, 0.5)
            axis.parent:addChild(shard)
            shard.physics.direction = math.rad(Utils.random(360))
            shard.physics.speed = 7
            shard.physics.gravity = 0.2
        end
        axis:setAnimation("idle")

        cutscene:wait(2)

        cutscene:battlerText(axis, "OH N0.")
        flowey:setSprite("snarky")
        cutscene:battlerText(flowey, "Happy now?")
        flowey.animation_state=true
        flowey:setAnimation("sinkanim2")
        cutscene:wait(1)
        flowey:defeat("SPARED", false)
        flowey:remove()

        Game.battle.encounter:addEnemy("ceroba_geno", -300, 240)
        local ceroba = Game.battle:getEnemyBattler("ceroba_geno")
        ceroba.color = {1, 1, 1}
        ceroba:toggleOverlay(true)
        ceroba:getActiveSprite():setSprite("block_1")

        local slash = Sprite("effects/lightattack/strike")
        slash:setPosition(relative_pos_x, relative_pos_y)
        slash.layer = BATTLE_LAYERS["above_ui"] + 5
        slash.color = {1, 105/255, 105/255}
        slash:setOrigin(0.5, 0.5)
        axis.parent:addChild(slash)
        Assets.playSound("laz_c")
        slash:play(1/4, false, function(this)
            Assets.stopAndPlaySound("damage")
            ceroba:shake()
            ceroba:getActiveSprite():setSprite("block_2")
            this:remove()
        end)

        cutscene:wait(0.1)

        ceroba:slideTo(axis.x - 60, axis.y, 1/2)

        cutscene:wait(6)

        cutscene:after(function()
            Game.battle:setState("TRANSITIONOUT")
        end, true)
    end,
    tired = function(cutscene, battler, enemy)
        local axis = Game.battle:getEnemyBattler("axis_g")
        Game.battle.music:stop()
        local speech = {
            "OK.",
            "OK. .. .",
            "LET M3 CATCH\nmY STEAM.",
            ". . .",
            "I THINK. .",
            "IT is TIME\nFOR A BrEAK..\n. . ."
        }
        cutscene:battlerText(axis, speech)

        axis:setSprite("nocharge_melancholy")

        local lid = Sprite("battle/lightenemies/axis/lid")
        local relative_pos_x, relative_pos_y = axis:getRelativePos(axis.width / 2, axis.height / 2)
        lid:setPosition(relative_pos_x, relative_pos_y)
        lid.layer = BATTLE_LAYERS["above_ui"] + 5
        lid:setOrigin(0.5, 0.5)
        lid:setScale(2, 2)
        axis.parent:addChild(lid)
        lid.physics.direction = math.rad(Utils.random(360))
        lid.physics.speed = 7
        lid.physics.gravity = 0.2
        Assets.playSound("swoosh")
        lid:fadeOutAndRemove(1)

        axis.defense = -999
        axis.tired = true
        axis:addMercy(100)
        axis:removeAct("Toughen")
        axis:removeAct("Taunt")
        axis:removeAct("Push")

        Game.battle:setState("TURNDONE")
        cutscene:wait(0.2)
        cutscene:after(function()
            Game.battle:setState("ACTIONSELECT")
        end, true)
    end
}