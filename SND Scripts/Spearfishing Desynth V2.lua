--[[
    
    **************************
    *  Spearfishing Desynth  * 
    **************************

    **********************
    * Version  |  6.2.0  *
    **********************

    -> 6.2.0  : Update script formatting, added Vnavmesh as a future option, but atm something in the guppy area isnt'... working? Seems like the navmesh is broken in that area.
                Going to leave it in the script for now, but disable it
    -> 6.1.0  : Added ability to insert own custom loop! As well as had the Earthbreak Aethersand run by default

    ***************
    * Description *
    ***************

    Description: Spearfishing Auto Desynth
    The script allows you to have it running a visland route (while spearfishing) and when you get to a certain inventory amount it will pause for you and proceed to desynth all your collectables.

    *********************
    *  Required Plugins *
    *********************


    Plugins that are used are:
    -> Visland 
    -> Vnavmesh (Optional, but if you're doing the navmesh version of it... obviously need it)
    -> Something Need Doing [Expanded Edition] : https://puni.sh/api/repository/croizat
]]

--[[ 

    **************
    *  Settings  *
    **************
    ]]

    Repair_Amount = 50
    selfrepair = true 
    -- When do you want to repair your own gear?
    -- Default is 50, cap is 99
    -- if you would like to not repair your own gear, set this to false as well

    routename = "Insert the name of your visland route here!"
    -- If you want to input your own route from visland, put it below here. It will take priority
    -- over the default one that is included in this LUA script

    earthbreak_aethersand = "H4sIAAAAAAAACu2VTU/cMBCG/wryOYz8Mf7KDRWQ9kBbqkpbinpwWZeN2sRVYkBotf+94yRbVIHUAycWbh5nMhk/ft/Jhr0PbWQ1Owl9Xn/vY/h5cBTzOvZD6FasYstw/zs1XR5YfblhH9PQ5CZ1rN6wL6yWyoHXwlXsgtWH2oBTqGzFvlJkLKBGVFsKUxcXx6zmFfsUVs0N1ZJAwVm6jW3sMqtFxRZdjn24yssmrz+UbIXI+b/7c685xrbprg/uAj0aqMlhne52edQd1f8Rfg3x4eWxZfrISZvyrpVFju28PBoz5uD8Jg55XpfCy9Dkh4olOk39u9StZhJ82vzctPGM8vi2esRJaA+I1okJlHFglRVWj6SMLJFD8zQp9X9ST1N6CVycKGdXExarQWhtJ/3YIibuxLPkI/dEPkqCcUUuIyYFxihuRkyapOTR4hum4jIBSpidyUgjikvpRk4oaFBxLl6fx7wHQxbDvx5Tzkg5zWiNILi19lnqEfthMq9AojE7TgocyqKlwslzMCike+NENyQ80ECSNH9GmyFoZSRhK6CsB+0d3/tf2bftH0ShbN45CQAA"
    -- Route name above, it's in base64 (which in simple terms, means that the route is already in this LUA script)
    -- This makes it to where you won't need to import the script to visland, and run it solely from this
    -- Location for this is: Upper La Noscea | Camp Bronzelake 

    slots_remaining = 5
    -- How many slots do you want open before it starts to desynth?
    -- Default | 5

    routetype = "visland" 
    -- visland is if you have custom routes setup in the script 
    -- vnavmesh is only (atm) for Earthbreak Aethersand 
    -- Options : visland | vnavmesh 

    username = ""
    -- this is just moreso for me to either: 
        -- debug/test values that normally isn't the norm in the script 
        -- preferences of mine that I use VS what I have defaulted
        -- you don't HAVE to put anything here, you can just ignore it if you want

    ScriptDebug = false

--[[

    ************
    *  Script  *
    *   Start  *
    ************

]]

-- Personal values that I have for either testing, or that I personally use
    if username == "Ice" then 
        Repair_Amount = 99 
        selfrepair = true 
        slots_remaining = 5 
        routetype = "vnavmesh"
        ScriptDebug = true 
    end 

    if routetype == "vnavmesh" then 
        yield("/e Hmm.... it seems like you missed the note about the navmesh not working atm. Going to switch to visland instead <se.6>")
        routetype = "visland"
    end

-- vnamvesh table 
    -- Earthbreak AetherSand 
        local X = 0
        local Y = 0
        local Z = 0
        local Fishing_Start = 0
        earthbreak_table = 
        {
            {206.92573547363,-48.802886962891,-57.099945068359, 'Teeming Waters'},
        }

-- Functions 
    function RepairCheck()
        if NeedsRepair(Repair_Amount) and selfrepair == true then
            if ScriptDebug == true then 
                yield("/e [Debug] Repair Amount has been reached, start the self repair action")
            end
            yield("/generalaction repair")
            yield("/waitaddon Repair")
            yield("/pcall Repair true 0")
            yield("/wait 0.1")
            if IsAddonVisible("SelectYesno") then
                yield("/pcall SelectYesno true 0")
                yield("/wait 0.1")
            end
            while GetCharacterCondition(39) do 
                yield("/wait 1") 
            end
            yield("/wait 1")
            yield("/pcall Repair true -1")
            if ScriptDebug == true then 
                yield("/e [Debug] Repair function has been completed")
            end
        end 
    end 
    w
    function VislandFishing()
        if Fishing_Start == 0 then -- Starts the route/resumes it if you had it paused in visland
            if ScriptDebug == true then 
                yield("/e [Debug] Started the Visland route for the first time, setting up the pathing you want to use")
            end
            yield("/visland exectemp "..earthbreak_aethersand)
            yield("/visland exec "..routename)
            yield("/visland resume")
            yield("/wait 1")
            Fishing_Start = Fishing_Start + 1
            if ScriptDebug == true then 
                yield("/e [Debug] Visland Routes has been configured")
            end
        end
    end 

    function VNavFishing()
        if ScriptDebug == true then 
            yield("/e [Debug] [VNavFishing] Getting ready to move to the next waypoint, mounting first")
        end
        while GetDistanceToPoint(X, Y, Z) > 3 do
            if GetCharacterCondition(4) == false then 
                CanadianMounty()
            end
            if PathIsRunning() == false then 
                if ScriptDebug == true then 
                    yield("/e [Debug] [VNavFishing] No path was detected to be running, waiting for path to be found")
                end
                PathfindAndMoveTo(X, Y, Z, false)
                while PathfindInProgress() == true do
                    yield("/wait 0.1")
                end 
                if ScriptDebug == true then 
                    yield("/e [Debug] [VNavFishing] Pathfind complete")
                end
            end
            yield("/wait 0.1")
        end
        if ScriptDebug == true then 
            yield("/e [Debug] [VNavFishing] Distance has been reached")
        end
    end

    function VnavGathering() 
        if ScriptDebug == true then 
            yield("/e [Debug] [VnavGathering] Clearing Target to make sure nothing is selected")
        end
        ClearTarget()
        if GetTargetName() == "" then 
            yield("/target "..NodeTarget)
        end 
        yield("/vnavmesh flytarget")
        if ScriptDebug == true then 
            yield("/e [Debug] [VnavGathering] Target Aquired, moving to "..NodeTarget)
        end
        while GetDistanceToTarget() > 2 do 
            yield("/wait 0.1")
        end 
        if ScriptDebug == true then 
            yield("/e [Debug] [VnavGathering] Distance to target has been reached")
        end
        while GetCharacterCondition(6, false) do 
            yield("/wait 0.1")
            yield("/interact")
        end 
        if ScriptDebug == true then 
            yield("/e [Debug] [VnavGathering] Gathering at the node now")
        end
        PathStop()
    end 

    function CanadianMounty()
        while GetCharacterCondition(4, false) do
            repeat 
                yield("/wait 0.1")
                yield('/gaction "mount roulette"')
            until GetCharacterCondition(27, true)
            repeat 
                yield("/wait 0.1")
            until GetCharacterCondition(4, true)
        end
        yield("/wait 0.5")
    end

    function GPGain() 
        if GetCharacterCondition(6) then
            if GetStatusStackCount(2778) >= 3 then
                yield("/ac \"Thaliak's Favor\"")
            end
        end 
    end

    function GatheringCheck() 
        if routetype == "visland" then 
            while GetInventoryFreeSlotCount() >= slots_remaining do 
                yield("/wait 1") 
                GPGain() 
            end
            yield("/echo Inventory has reached "..i_count)
            yield("/echo Time to Desynth")
            while GetCharacterCondition(6) do
                yield("/visland pause")
                yield("/wait 5")
            end
        elseif routetype == "vnavmesh" then 
            while GetCharacterCondition(6) do 
                yield("/wait 1")
            end
            if ScriptDebug == true then 
                yield("/e [Debug] [GatheringCheck] Gathering at the node has concluded")
            end
        end
    end

    function DesynthTime()
        while (not GetCharacterCondition(6)) and not (GetCharacterCondition(39)) do
            yield("/visland pause")
            yield("/wait 1")
            while GetCharacterCondition(27) do
                yield("/wait 1")
            end
            if GetCharacterCondition(4) then
                yield("/ac dismount")
                yield("/wait 3")
            end
            yield("/wait 0.5")
            while (not GetCharacterCondition(6)) and (not GetCharacterCondition(39)) do
                if IsAddonVisible("PurifyResult") then
                    yield("/pcall PurifyResult true 0")
                    yield("/wait 4")
                    yield("/echo Desynth all items in a row")
                elseif (not IsAddonVisible("PurifyResult")) and IsAddonVisible("PurifyItemSelector") then
                    yield("/pcall PurifyItemSelector true 12 0")
                    yield("/wait 4")
                    yield("/echo Selecting first item")
                elseif (not IsAddonVisible("PurifyItemSelector")) and (not GetCharacterCondition(4)) then
                    yield('/ac "Aetherial Reduction"')
                    yield("/wait 0.5")
                    yield("/echo Opening Desynth Menu")
                elseif IsAddonVisible("PurifyItemSelector") and GetCharacterCondition(4) then
                    yield("/pcall PurifyItemSelector True -1")
                    yield("/wait 0.5")
                    yield("/echo Desynth window was open while on mount")
                elseif GetCharacterCondition(4) then
                    yield("/ac dismount")
                    yield("/wait 3")
                    yield("/echo Dismount Test")
                end
            end
        end 
        if ScriptDebug == true then 
            yield("/e [Debug] [DesynthTime] Desynth has been successfully done on the first item")
        end
    end 

    function DesynthAll()
        while GetCharacterCondition(39) do
            yield("/wait 3")
        end 
        if GetCharacterCondition(39, false) then
            yield("/pcall PurifyAutoDialog True -2")
            yield("/pcall PurifyItemSelector True -1")
            if routetype == "visland" then 
                yield("/visland resume")
            end 
        end
        if ScriptDebug == true then 
            yield("/e [Debug] [DesynthAll] All items have been successfully desynth'd, continue-ing? routing")
        end
    end

-- Script itself
    while routetype == "visland" do 
        RepairCheck()
        VislandFishing()
        GatheringCheck()
        DesynthTime()
        DesynthAll()
    end 

    while routetype == "vnavmesh" do 
		for i=1, #earthbreak_table do
		    if GetCharacterCondition(45, false) then 
                X = earthbreak_table[i][1]
                Y = earthbreak_table[i][2]
                Z = earthbreak_table[i][3]
                NodeTarget = earthbreak_table[i][4]
                VNavFishing() 
                VnavGathering()
                GatheringCheck()
                RepairCheck()
                if GetInventoryFreeSlotCount() <= slots_remaining then 
                    DesynthTime()
                    DesynthAll() 
                end 
            end 
		end
    end
