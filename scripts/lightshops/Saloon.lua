local Saloon, super = Class(LightShop, "saloon")

function Saloon:init()
    super.init(self)

    self.shop_music = nil
    self.encounter_text = "* It's empty in here."
    self.shop_text = "* It's empty in here."
    self.leaving_text = "* You decide to leave."
    -- Shown when you're in the BUY menu
    self.buy_menu_text = "You see some items."
    -- Shown when you're about to buy something.
    self.buy_confirmation_text = "Take it?"
    -- Shown when you refuse to buy something
    self.buy_refuse_text = "You didn't."
    -- Shown when you buy something
    self.buy_text = "You took\nthe item."
    -- Shown when you buy something and it goes in your storage
    self.buy_storage_text = "You took\nthe item."
    -- Shown when you don't have enough money to buy something
    self.buy_too_expensive_text = "Impossible."
    -- Shown when you don't have enough space to buy something.
    self.buy_no_space_text = "You didn't\nhad the\nspace."
    -- Shown when you're about to sell something.
    self.sell_confirmation_text = "Sell %s for %s ?"
    -- Shown when you have nothing in a storage
    self.sell_no_storage_text = "* Nothing in there."
    -- Shown when you enter the talk menu.
    self.talk_text = "..."
    -- If has a string/table of strings, it will prevent selling and will start a dialogue
    self.sell_no_selling_text = "* Nobody to sell to."

    self.menu_options = {
        {"Take",	"BUYMENU"		},
        {"Steal?",	"STEALING"		},
        {"Read",	"READNOTE"		},
        {"Exit",	"LEAVE"			}
    }

    self:registerItem("uty_items/icewater", { stock=3, price=0})
    self:registerItem("uty_items/adult_soda", {description = "Heals ???", dont_show_change = true, stock=2, price=0})
	self:registerItem("uty_items/root_beer", {stock=2, price=0})
    self:registerItem("uty_items/feisty_slider", {stock=1, price=0})

    self.background = "ui/shop/wild_east_saloon"
end

function Saloon:onStateChange(old,new)
    super.onStateChange(self,old,new)
    if new == "STEALING" then
        self:startDialogue({
		    "* The counter is empty."
	    })
    elseif new == "READNOTE" then
        self:startDialogue({
		    "* Hey hey there!",
		    "* This place is moving to the surface.",
		    "* Feel free to take whatever you\nneed from leftovers."
	    })
    end
end

return Saloon