--[[

  ****************************************
  * Alexander - The Burden of the Father * 
  *            Normal Farm               *
  ****************************************

  ***********
  * Version *
  *  3.3.5  *
  ***********

  -> 3.3.5: Visland is fixed! (Hopefully) and also have support for Navmesh as well, just select which one you would like in the settings. (Default is Visland)
            Will say (Hopefully) becuase ran it for ~7 hours last night while I was asleep and SEEMS like it's not crashing the FPS. SO. *-claps-* 
  -> 3.3.4: Switched over to PURELY Navmesh on this, visland is causing some memory leak or SOMETHING atm. So... to avoid further issues/make it to where it works properly, implimenting it (pretty much as seemless, I get peeps don't like change but)
              ALSO. If you use "YesAlready" and have it to where the setting "ContentsFinderConfirm" is checkmarked, please enable that in the settings tab to true, that way you can keep it on and not have to worry about toggling it. 
  -> 3.3.3: Added the fucking manual like the main repo. 
  -> 3.3.2: Added the ability to Infinite Loop w/o having to set a number
  -> 3.3.1: Added some checks to wait till you're fully loaded out (in case of high ping) [Chest fix is next on the list for high ping]
  -> 3.3.0: Repair Functionality & Potentional duty load check (@leaf update)
  Created by: Leontopodium Nivale, Class Support: Ellipsis | Menu Optimizing/tweaks: Leaf

  Creators note: thank you Ellipsis for getting all the classes working, you did an amazing job. You deserve the credit here.
                 also @Leaf thanks for tweaking it and making this more friendly for situations I didn't account for, you're the best 

  ***************
  * Description *
  ***************

  This is meant to be used for Alexander - The Burden of the Father (NORMAL NOT SAVAGE)
  It's setup to where you should be able to loop it as many time as you want, and be able to farm mats for GC seals
  Known classes to work: ALL

  *********************
  *  Required Plugins *
  *********************


  Plugins that are used are:
  -> VNavmesh (for pathing) AND/OR Visland: https://puni.sh/api/repository/veyn
  -> Pandora (Setting "Open Chest") : https://love.puni.sh/ment.json
  -> RotationSolver : https://puni.sh/api/repository/croizat
   -> Something Need Doing [Expanded Edition] : https://puni.sh/api/repository/croizat
    -> In the SND window, press the question mark to make the help setting's menu open 
    -> Go to options tab -> /target -> DISABLE THIS!! " Stop macro if target not found (only applies to SND's targeting system') "
]]

--[[

  **************
  *  Settings  *
  **************
  ]]

  UserName = "" --[[ this is just a quick way to set my preset settings here, so I don't have to go through and re-edit all of the baseline ones that the script defaults to whenever copy/pasting it from the github. 
                     If you want to use my preferred values, go ahead. Not gonna stop you (not that I could)
                     Just moreso got tired of re-tping things XD But I also know peeps don't like having excess things at times 
                  ]]

  MovementType = Visland  
  -- Options: VNavmesh | Visland 
  -- Select which one you would like, Visland is the one that we've used in this script for a LONG time
  -- VNavmesh however works just as well. You can have both plugins installed, just select which one you want to use for movement 

  NumberofLoops = 5 -- number of loops you would like to do 
  InfiniteLoops = false -- options: true | false 
  -- If you want it to continually loop w/o a cap, change InfiniteLoops to true 
  -- this will ignore the number of loops and continually go w/o stopping

  rate = 0.3 -- Increase this at lower fps [0.3 works on 15fps+]
  timeoutThreshold = 15 -- Number of seconds to wait before timeout

  ManualSetDuty = false -- true | false option
  -- if you don't want to deal with the duty selection process, and select the duty yourself/turned on Unsync set this to true. If you want to just automate to the duty, set this to false.
  -- This assumes that you have EVERYTHING unlocked

  DutyFinderOrder = true -- true | false option
  -- If you have your duty from 50 at top, and 90 toward the bottom, leave this as true
  -- If you have your duty from 90 at top, and 50 toward the bottom, change this to false

  YesAlreadyContentCheckBox = false -- true | false option 
  -- If you have it to where you have the setting to automatically confirm in "YesAlready" set this to true. 
  -- This will make it to where it won't hang on trying to get the duty confirm window to load, and press the duty commence button
  -- I could pause yes already, but that's a headache I don't wanna think about at this second lol. 
  -- default is false

  ManualRepair = false -- if you want to repair between the loops that you do. [defaults is false | on is true]
  RepairAmount = 99 -- lowest point your gear will 

  EchoHowMany = true -- Would you like to know where in the script the loop is at? [default is true | off is false]
  TrueLoop = false -- would you like to know how many loops you're currently at actually? (tracks how many bolts/things you have) [default is false | on is true]

  CastingDebug = false -- true | false option
  -- Just something for me to debug test w/

--[[

  ************
  *  Script  *
  *   Start  *
  ************

]]

-- functions
  function TargetNearestObjectKind(objectKind, radius, subKind)
    local smallest_distance = 10000000000000.0
    local closest_target
    local radius = radius or 0
    local subKind = subKind or 5
    local nearby_objects = GetNearbyObjectNames(radius^2,objectKind)
    
    if nearby_objects.Count > 0 then
        for i = 0, nearby_objects.Count - 1 do
            yield("/target "..nearby_objects[i])
            if not GetTargetName() or nearby_objects[i] ~= GetTargetName()
                or (objectKind == 2 and subKind ~= GetTargetSubKind()) then
            elseif GetDistanceToTarget() < smallest_distance then
                smallest_distance = GetDistanceToTarget()
                closest_target = GetTargetName()
            end
        end
        ClearTarget()
        if closest_target then yield("/target "..closest_target) end
    end
    return closest_target
  end

  function PlayerTest()
    repeat
      yield("/wait "..rate)
    until IsPlayerAvailable()
  end


-- Custom values being setup at the beginning before running the script

    if UserName == "Ice" then 
        MovementType = VNavmesh
        InfiniteLoops = true
        ManualSetDuty = true
        DutyFinderOrder = true
        YesAlreadyContentCheckBox = false
        ManualRepair = true
        RepairAmount = 99
        EchoHowMany = true
        TrueLoop = true
    end

    LensID = 12674
    ShaftID = 12675
    CrankID = 12676
    SpringID = 12677
    PedalID = 12678
    BoltID = 12680

    LensCount = GetItemCount(LensID)
    ShaftCount = GetItemCount(ShaftID)
    CrankCount = GetItemCount(CrankID)
    SpringCount = GetItemCount(SpringID)
    PedalCount = GetItemCount(PedalID)
    BoltCount = GetItemCount(BoltID)

    ActualLoopCount = math.min(BoltCount//2,ShaftCount//2,SpringCount//2,PedalCount//1,CrankCount//1)

--Visland Loops
    Alex_Chest = "H4sIAAAAAAAACuWQSWvDMBCF/0qZsyMkR7It3UIX8CHdCLgLJYhkTASxVWy5C8b/vYpj40ALvRZ605t5enr6WrjWBYKCxR4/1ny9ggAy/flqTelqUM8t3NraOGNLUC08gAqJFDGXEQ/gERSjJKJcijCAJ1AzQZKEJiHrvLQlphegaAD3emsaH8aIF0v7hgWWrt+kpcNKb1xm3O5mcJ/Ohm6+U72z7+PGl/Fpud7XONn7hiyAy8K68eHUYTEcF71jEHcN1m44H4IzbdyUeFBXtjq35Xb4OD0OV6bApffRLviGZUYJo5IyGU9kBOeRkEcykgjJEhH/QzIhoaHkyURlLrk4UonIPJpTmZxQ4YfdyMVf/Y0Ljz3hH8i4CnXdVHi2sXmO1Z8D9dJ9Ad/rgrl7AwAA"


-- Values that are needed for the whole script
    CurrentLoop = 1 -- This is just the loop counter itself, keeps tracks of how many you've done.
    if ActualLoopCount > CurrentLoop and TrueLoop == true then 
        CurrentLoop = ActualLoopCount
    end
    DutyCounter = 0
    DutyFail = 0


if ManualSetDuty == true then
    DutyCounter = 1
end

if NumberofLoops == 0 then 
    InfiniteLoops = true 
    yield("/e Hmm... you didn't set it to infinite, but you also set it as 0, so I'm going to safely assume you meant to put it as infinite. Fixed that for you")
end

::LoopTest::
    if NumberofLoops >= CurrentLoop and InfiniteLoops == false then
        if EchoHowMany == true then
            yield("/echo Loop: "..CurrentLoop.." out of ".. NumberofLoops)
        end
            PlayerTest()
    elseif NumberofLoops < CurrentLoop and InfiniteLoops == false then
        goto StopLoop
    elseif InfiniteLoops == true then 
        if EchoHowMany == true then 
            yield("/e Current Loop is at: "..CurrentLoop)
        end
        PlayerTest()
    end

    if CurrentLoop == 69 then 
        yield("/e Heh... nice.")
    elseif CurrentLoop == 100 then 
        yield("/e Woo! 100 in, only... many more to go")
    elseif CurrentLoop == 300 then 
        yield("/e Wow, 300. Man Idyllshire is going to be hurting for gear after this")
    elseif CurrentLoop == 500 then 
        yield("/e Wanna know what a pirate's favorite letter is?")
        yield("/e You might this it's 'Arr' but his first love was the 'C' ")
    end

-- Repair Functionality
    if ManualRepair == true then
        if NeedsRepair(99) then
            while not IsAddonVisible("Repair") do
                yield("/generalaction repair")
                yield("/wait 0.5")
            end
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
        end
    end

::DutyFinder::
    if DutyFail == 4 then
        goto StopLoop
    elseif DutyCounter == 0 then -- Initially setting up duty to loop Alexander - Burden of the Father (A4N)
        PathStop()
        --Open duty finder until it's visible
        while not IsAddonVisible("ContentsFinder") do
            yield("/dutyfinder")
            yield("/wait "..rate)
        end
        --wait till duty finder has finished loading
        while not IsAddonReady("ContentsFinder") do
            yield("/wait "..rate)
        end
        -- Setting up Unsync if it wasn't already
        SetDFUnrestricted(true)
        --wait until duty finder settings has closed
        yield("/pcall ContentsFinder True 12 1") -- Clearing out any old duties
        --wait till old selections are cleared out
        repeat
            yield("/wait "..rate)
        until GetNodeText("ContentsFinder", 15) == "0/5 Selected"
        OpenRegularDuty(115)
        local timeout = 0
        repeat
            yield("/wait "..rate)
            timeout = timeout + 1
            if timeout > timeoutThreshold / rate then 
                goto NOTALLUNLOCK 
            end
        until GetNodeText("JournalDetail", 19) == "Alexander - The Burden of the Father"
        if DutyFinderOrder then
            yield("/pcall ContentsFinder True 3 27")
        else
            yield("/pcall ContentsFinder True 3 75")
        end
        timeout = 0
        repeat
            yield("/wait "..rate)
            timeout = timeout + 1
            if timeout > timeoutThreshold / rate then 
                goto NOTALLUNLOCK 
            end
        until GetNodeText("ContentsFinder", 14) == "Alexander - The Burden of the Father"
    
    ::NOTALLUNLOCK::
        if GetNodeText("ContentsFinder", 14) ~= "Alexander - The Burden of the Father" then
            for i = 1, 501 do
                yield("/pcall ContentsFinder True 3 "..i)
                yield("/wait "..rate)
                if GetNodeText("ContentsFinder", 14) == "Alexander - The Burden of the Father" then break end
            end
            yield("/wait "..rate)
        end

        yield("/pcall ContentsFinder True 12 0")
        DutyCounter = DutyCounter + 1
        while IsAddonVisible("ContentsFinderConfirm") == false and YesAlreadyContentCheckBox == false do 
            yield("/wait "..rate)
        end 
        elseif DutyCounter == 1 then -- Quicker menu'ing here to load in
            PathStop()
            --Open duty finder until it's visible
            while not IsAddonVisible("ContentsFinder") do
                yield("/dutyfinder")
                yield("/wait "..rate)
            end
            --wait till duty finder has finished loading
            while not IsAddonReady("ContentsFinder") do
                yield("/wait "..rate)
            end
            yield("/pcall ContentsFinder True 12 0") --Duty Load
            while IsAddonVisible("ContentsFinderConfirm") == false and YesAlreadyContentCheckBox == false do 
                yield("/wait "..rate)
            end 
    elseif DutyCounter == 2 then
    yield("/echo Hmm... it seems like this has failed, so going to reset it")
    DutyCounter = 0
    DutyFail = DutyFail + 1
    goto DutyFinder
end


::DutyCommence::
    yield("/pcall ContentsFinderConfirm True 8")
    repeat
        yield("/wait "..rate)
    until IsInZone(445) and IsAddonVisible("_Image")

::BattleInitialize::
    manip_phase = 0
    while not GetCharacterCondition(26) do
        -- Target selection and movement logic
        local current_target = GetTargetName()
        if not current_target or current_target == "" then
            yield("/targetenemy")  -- Attempt to auto-target the next enemy
            current_target = GetTargetName()
            if current_target == "" then
                yield("/wait "..rate)
            end
        end

        local enemy_max_dist = 40
        if GetDistanceToTarget() > 3 then
            if GetDistanceToTarget() <= enemy_max_dist then
                local enemy_x = GetTargetRawXPos()
                local enemy_y = GetTargetRawYPos()
                local enemy_z = GetTargetRawZPos()
                if MovementType == VNavmesh then 
                    PathfindAndMoveTo(enemy_x, enemy_y, enemy_z)
                    while PathfindInProgress() do 
                        yield("/wait 0.05")
                    end
                    yield("/wait "..rate)
                    yield("/rotation manual")
                    while GetDistanceToTarget() > 3 do 
                        yield("/wait 0.05")
                    end
                    PathStop()  -- Stop movement after reaching near the target
                elseif MovementType == Visland then 
                    yield("/visland moveto " .. enemy_x .. " " .. enemy_y .. " " .. enemy_z)
                    yield("/wait "..rate)
                    yield("/rotation manual")
                    while GetDistanceToTarget() > 3 do 
                        yield("/wait 0.05")
                    end 
                    yield("/visland stop")
                end 
            end
        end
    end

::StartofBattle::
    --rotation
    while GetCharacterCondition(26) do
        yield("/wait "..rate)
        -- Target selection and movement logic
        local current_target = GetTargetName() --Leaf: need find the setting to always zoom out or something
        if not current_target or current_target == "" then
            yield("/targetenemy")  -- Attempt to auto-target the next enemy
            current_target = GetTargetName()
            if current_target == "" then
                yield("/wait "..rate)
            end
        end

        while IsPlayerCasting() do
            if CastingDebug == true then
                yield("/e EY WATCH IT. I'M CASTING")
            end
            yield("/wait "..rate/3)
        end

        local enemy_max_dist = 75
        if GetDistanceToTarget() > 3 then
            if GetDistanceToTarget() <= enemy_max_dist then
                local enemy_x = GetTargetRawXPos()
                local enemy_y = GetTargetRawYPos()
                local enemy_z = GetTargetRawZPos()
                PathfindAndMoveTo(enemy_x, enemy_y, enemy_z)
                if MovementType == VNavmesh then 
                    while PathfindInProgress() do 
                        yield("/wait 0.05")
                    end
                    yield("/wait "..rate)
                    yield("/rotation manual")
                    while GetDistanceToTarget() > 3 do 
                        yield("/wait 0.05")
                    end
                    PathStop()  -- Stop movement after reaching near the target
                elseif MovementType == Visland then 
                    yield("/visland moveto " .. enemy_x .. " " .. enemy_y .. " " .. enemy_z)
                    yield("/wait "..rate)
                    yield("/rotation manual")
                    while GetDistanceToTarget() > 3 do 
                        yield("/wait 0.05")
                    end 
                    yield("/visland stop")
                end 
            end
        end
    end
    -- This section might need an additional command to re-target or adjust positioning
    -- if the enemy is beyond the max distance, depending on your needs.

    yield("/rotation cancel")

::LootCollection:: 
    if MovementType == VNavmesh then 
        -- Chest #1
        PathfindAndMoveTo(1.93,10.60,-6.31)
        while PathfindInProgress() do
            yield("/wait 0.05")
        end
        while PathIsRunning() do 
            yield("/wait 0.05")
        end 
        yield('/target "Treasure Coffer"')
        yield("/pint")

        -- Chest #2
        PathfindAndMoveTo(-0.15,10.54,-8.23)
        while PathfindInProgress() do
            yield("/wait 0.05")
        end
        while PathIsRunning() do 
            yield("/wait 0.05")
        end 
        yield('/target "Treasure Coffer"')
        yield("/pint")

        -- Chest #3
        PathfindAndMoveTo(-2.18,10.57,-6.41)
        while PathfindInProgress() do
            yield("/wait 0.05")
        end
        while PathIsRunning() do 
            yield("/wait 0.05")
        end 
        yield('/target "Treasure Coffer"')
        yield("/pint")
    elseif MovementType == Visland then 
        repeat
            yield("/wait "..rate)
        until IsMoving()
        repeat
            yield("/wait "..rate)
        until not IsVislandRouteRunning()
    end
        

    while TargetNearestObjectKind(4) do
        if PathIsRunning() == false then
            ChestX = GetTargetRawXPos()
            ChestY = GetTargetRawYPos()
            ChestZ = GetTargetRawZPos()
            if MovementType == VNavmesh then 
                PathfindAndMoveTo(ChestX, ChestY, ChestZ)
                while PathfindInProgress() do 
                    yield("/wait 0.05")
                end 
            elseif MovementType == Visland then 
                if not IsVislandRouteRunning() then
                    yield("/visland moveto " .. GetTargetRawXPos() .. " " .. GetTargetRawYPos() .. " " .. GetTargetRawZPos())
                end
                yield("/wait "..rate)
            end
        end
        yield("/wait "..rate)
    end

    CurrentLoop = CurrentLoop + 1
    yield("/echo Leaving the instance")
    yield("/pdfleave")

    repeat
        yield("/wait "..rate)
    until not IsInZone(445) and not GetCharacterCondition(34) and not GetCharacterCondition(56) and not GetCharacterCondition(45)

    goto LoopTest

::StopLoop::
    if DutyFail < 4 then
        yield("/echo Alex Looping has completed")
    elseif DutyFail >= 4 then
        yield("/echo It seems like it's failed, maybe lag?")
    end