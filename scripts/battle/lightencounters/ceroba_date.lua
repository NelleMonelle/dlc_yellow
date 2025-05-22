local Ceroba, super = Class(LightEncounter)

function Ceroba:init()
    super.init(self)

    self.music = false

    self:addEnemy("ceroba")

    self.background = false

end

function Ceroba:setBattleState()
    Game.battle:setState("ENEMYDIALOGUE")
	Game.battle:startCutscene(function(cutscene)
        local ceroba = Game.battle:getEnemyBattler("ceroba")
        cutscene:wait(1)
		Game.battle.music:play("date")
		cutscene:text("[voice:battle]         DATING[wait:30]  STAR-", nil, nil, {skip=false, auto=true})
		Game.battle.music:pause()
		ceroba:setSprite("angry")
		cutscene:battlerText(ceroba, "Excuse me?[wait:5] That's not\na date.")
		cutscene:text("[voice:battle]         HANGOUT...[wait:30]  START?[wait:30]", nil, nil, {skip=false, auto=true})
		Game.battle.music:resume()
		ceroba:setSprite("calm")
		cutscene:battlerText(ceroba, "Much appreciated.")
		cutscene:wait(2)
		ceroba:setSprite("lookright")
		cutscene:wait(2)
		ceroba:setSprite("lookleft")
		cutscene:wait(2)
		ceroba:setSprite("calm")
		cutscene:battlerText(ceroba, "So...")
		cutscene:battlerText(ceroba, "Anything you want to know about me?")
		local choice = cutscene:choicer({"Your\nhouse", "Your\nfamily"})
		cutscene:battlerText(ceroba, "...")
        cutscene:after(function()
            Game.battle:setState("TRANSITIONOUT")
        end, true)
    end)
end

function Ceroba:getVictoryMoney(money)
	return 0
end

return Ceroba