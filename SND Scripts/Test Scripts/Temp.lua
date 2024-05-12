local aetherWorlds = {
    "Adamantoise",
    "Cactuar",
    "Faerie",
    "Gilgamesh",
    "Jenova",
    "Midgardsormr",
    "Sargatanas",
    "Siren",
    "Balmung",
    "Brynhildr",
    "Coeurl",
    "Diabolos",
    "Goblin",
    "Malboro",
    "Mateus",
    "Zalera",
    "Behemoth",
    "Excalibur",
    "Exodus",
    "Famfrit",
    "Hyperion",
    "Lamia",
    "Leviathan",
    "Ultros",
    "Halicarnassus",
    "Maduin",
    "Marilith",
    "Seraph"
}
local towns = {"Limsa", "New Gridania", "Ul'dah"}

function ZoneTransition()
    repeat 
        yield("/wait 0.5")
    until not IsPlayerAvailable()
    yield("/wait 0.5") -- Add a small delay
    repeat 
        yield("/wait 0.5")
    until IsPlayerAvailable()
end

function TargetedInteract(target)
    yield("/target " .. target)
    yield("/lockon")
    yield("/wait 0.1")
    yield("/automove")
    yield("/wait 0.1")
end

function LiSwap()
    for _, world in ipairs(aetherWorlds) do
        local command = "/li " .. world
        yield(command)
        yield("/wait 30")
    end
    repeat
        yield("/wait .5")
    until IsPlayerAvailable()
    yield("/wait 3")
end

function TpSwap()
    for _, town in ipairs(towns) do
        local command = "/tp " .. town
        yield(command)
        repeat
            yield("/wait .5")
        until IsPlayerAvailable()
        yield("/wait 3")
    end
end

function WalkTo(x, y, z)
    PathfindAndMoveTo(x, y, z, false)
    while (PathIsRunning() or PathfindInProgress()) do
        yield("/wait 0.5")
    end
end

if GetCharacterCondition(1) then
    --WalkTo(-84, 18, -5)
    yield("/wait 0.1")
    yield("/e tested")
    yield("/wait 0.1")

    while not IsInZone(130) do
        TargetedInteract("Aetheryte")
        TpSwap()
    end

    LiSwap()
else
    yield("/tp Limsa")
    ZoneTransition()
    --WalkTo(-84, 18, -5)
    yield("/wait 0.1")
    yield("/e tested")
    yield("/wait 0.1")

    while not IsInZone(130) do
        TargetedInteract("Aetheryte")
        TpSwap()
    end

    LiSwap()
end