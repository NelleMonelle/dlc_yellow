local actor, super = HookSystem.hookScript("susie_lw")

function actor:init()
    super.init(self)

    TableUtils.merge(self.offsets, {
        ["wild_east"] = { 0, -4 },
    }, false)
end

return actor