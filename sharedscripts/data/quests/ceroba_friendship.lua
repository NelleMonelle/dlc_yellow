---@class MyQuest : Quest
local MyQuest, super = Class(Quest, "ceroba_friendship")

function MyQuest:init()
    super.init(self)
    self.name = "A Mysterious Fox"
    self.description = "Ceroba."
    self.progress_max = 0
end

return MyQuest
