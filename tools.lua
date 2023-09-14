
items = {
    {
        damage = 13,
        hasTag = false,
        label = "Quad Fuel Rod (Depleted Uranium)",
        maxDamage = 0,
        maxSize = 64,
        name = "ic2:nuclear",
        size = 1
    },
    {
        damage = 13,
        hasTag = false,
        label = "Quad Fuel Rod (Depleted Uranium)",
        maxDamage = 0,
        maxSize = 64,
        name = "ic2:nuclear",
        size = 1
    },
    {
        damage = 13,
        hasTag = false,
        label = "Quad Fuel Rod (Depleted Uranium)",
        maxDamage = 0,
        maxSize = 64,
        name = "ic2:nuclear",
        size = 1
    },
    {
        damage = 13,
        hasTag = false,
        label = "Quad Fuel Rod (Depleted Uranium)",
        maxDamage = 0,
        maxSize = 64,
        name = "ic2:nuclear",
        size = 1
    },
    {
        damage = 13,
        hasTag = false,
        label = "Quad Fuel Rod (Depleted MOX)",
        maxDamage = 0,
        maxSize = 64,
        name = "ic2:nuclear",
        size = 1
    },
    {
        damage = 13,
        hasTag = false,
        label = "gt.Quad_ThoriumcellDep.name",
        maxDamage = 0,
        maxSize = 64,
        name = "ic2:nuclear",
        size = 1
    },
    {
        damage = 13,
        hasTag = false,
        label = "Quad Fuel Rod (Depleted Uranium)",
        maxDamage = 0,
        maxSize = 64,
        name = "ic2:nuclear",
        size = 1
    },
    {
        damage = 13,
        hasTag = false,
        label = "Quad Fuel Rod (Depleted MOX)",
        maxDamage = 0,
        maxSize = 64,
        name = "ic2:nuclear",
        size = 1
    },
    {
        damage = 13,
        hasTag = false,
        label = "gt.Quad_ThoriumcellDep.name",
        maxDamage = 0,
        maxSize = 64,
        name = "ic2:nuclear",
        size = 1
    }
}

count = 0

while true do
    for i, v in ipairs(items) do
        --print(i, v.label)

        if v.label == "Quad Fuel Rod (Depleted Uranium)" then
            count = count + 1
        end
    end
    if count == 5 then
        print("reactor fuels empty")
        break
    end
end
