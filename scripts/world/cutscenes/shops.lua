return {
    saloon = function(cutscene, event)
        Game.world:lightShopTransition("saloon")
    end,
    gunshop = function(cutscene, event)
        Game.world:lightShopTransition("gunshop")
    end,
    vendy = function(cutscene, event)
        Game.world:lightShopTransition("vendy")
    end,
}
