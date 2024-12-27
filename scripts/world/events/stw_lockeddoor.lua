local SteamworksLockedDoor, super = Class(Event)

function SteamworksLockedDoor:init(data)
    super.init(self, data.center_x, data.center_y, data.width, data.height)
end

function SteamworksLockedDoor:onInteract(chara, dir)
    Assets.playSound("locked_door")
    return true
end

return SteamworksLockedDoor