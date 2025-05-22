local RoomThirtyFive, super = Class(Map)

function RoomThirtyFive:load()
  super.load(self)
  if not Game:getFlag("axis_done") or Game:getFlag("axis_done") and Game:getFlag("axis_dead") then
    Game.world:spawnNPC("axis", 1401, 200, {text = "* ..."})
  end
  if Game.world:getCharacter("axis") then
    if Game:getFlag("axis_dead") then
      Game.world:getCharacter("axis"):setSprite("dead_regular")
    elseif Game:getFlag("axis_hurt") then
      Game.world:getCharacter("axis"):setSprite("damaged_trash_down")
    end
  end
end

function RoomThirtyFive:onEnter()
  super.onEnter(self)

  if not Game:getFlag("axis_hurt") and not Game:getFlag("stw_party_locked_out") then
    Game.world:startCutscene(function(cutscene)
      Game.world:getEvent(2):remove()
      local gate = Game.world:getEvent("stw_35_gate")
      for _,member in ipairs(Game.party) do
        local chara = Game.world:getCharacter(member.id)
        if chara then
          chara:setPosition(2480, 302)
          chara:setFacing("left")
        end
      end
      cutscene:wait(cutscene:walkTo(Game.world.player, 2010, 302, 3.5, "left"))
      local sound = Assets.playSound("rumble")
      gate.sprite.alpha = 1
      gate.sprite:play(1/30, false, function(this)
        sound:stop()
        Assets.playSound("mart_impact_2")
        gate.solid = true
        local darkness = Rectangle(2032, 142, 768, 200)
        darkness.color = {0, 0, 0}
        darkness.layer = WORLD_LAYERS["below_ui"]
        Game.world:addChild(darkness)
        Game.world.camera:shake(8, 2)
      end)
      cutscene:detachFollowers()
      cutscene:wait(cutscene:slideTo(Game.world.player, 1940, 302, 0.1))
      Game.world.player:setFacing("right")
      if cutscene:getCharacter("susie_lw") then
        cutscene:showNametag("Susie")
        cutscene:text("* Hey!", nil, "susie")
        cutscene:text("* What the hell!?", nil, "susie")
        cutscene:text("* Hero![wait:5] Can you hear me!?", nil, "susie")
        cutscene:text("* I'm gonna try to break down this thing!", nil, "susie")
        cutscene:hideNametag()
        cutscene:wait(cutscene:walkTo(Game.world.player, 1900, 302, 0.2, "right"))
        cutscene:wait(0.5)
        Assets.playSound("rudebuster_swing")
        cutscene:wait(0.5)
        Assets.playSound("rudebuster_hit")
        Game.world.camera:shake(1, 6)
        cutscene:wait(2)
        Assets.playSound("rudebuster_swing")
        cutscene:wait(0.5)
        Assets.playSound("rudebuster_hit")
        Game.world.camera:shake(1, 6)
        cutscene:wait(2)
        cutscene:showNametag("Susie")
        cutscene:text("* That's gonna take some time!", nil, "susie")
        cutscene:text("* Try to find something to open this door!", nil, "susie")
        cutscene:hideNametag()
      else
        cutscene:wait(1)
        cutscene:text("* (Seems like you're now by yourself.)")
      end
      Game:setFlag("stw_party_locked_out", true)
    end)
  end
end

return RoomThirtyFive