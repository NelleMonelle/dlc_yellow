local SteamworksLockedDoor, super = Class(Event)

function SteamworksLockedDoor:init(data)
    super.init(self, data)
end

function SteamworksLockedDoor:onInteract(chara, dir)
    Assets.playSound("locked_door")
    return true
end

return SteamworksLockedDoor