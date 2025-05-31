local MusTest, super = Class(LightShop,  "mustest")

function MusTest:init()
    super.init(self)

    self.shop_music = "gunshop"

    self.shopkeeper:setActor("vendy")
    --self.shopkeeper.sprite:setPosition(-24, 12)
    --self.shopkeeper.slide = true

    self.background = "ui/shop/vendy"
end

return MusTest