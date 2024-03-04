--[[

  ***************
  * Description *
  ***************

  This is meant to be used for Alexander - The Eyes of the Creator (SAVAGE, NOT NORMAL)
  It's setup to where you should be able to loop it as many time as you want, and be able to farm mats for GC seals
  Known classes to work: ALL
  Version: 1.0
  Created by: Leontopodium Nivale


  *********************
  *  Required Plugins *
  *********************


  Plugins that are used are:
  -> Visland (for pathing) : https://puni.sh/api/repository/veyn
  -> Pandora (Setting "Open Chest") : https://love.puni.sh/ment.json
  -> RotationSolver : https://puni.sh/api/repository/croizat
  -> Something Need Doing [Expanded Edition] : https://puni.sh/api/repository/croizat
]]

--[[

  **************
  *  Settings  *
  **************
  ]]

  -- How many loops do you wanna do
  NumberofLoops = 2
  rate = 0.3 --Increase this at lower fps

  -- if you don't want to deal with the duty selection process, and select the duty yourself/turned on Unsync set this to true. If you want to just automate to the duty, set this to false. 
  -- This assumes that you have EVERYTHING unlocked
  ManualSetDuty = false

  -- If you have your duty from 50 at top, and 90 toward the bottom, leave this as true
  -- If you have your duty from 90 at top, and 50 toward the bottom, change this to false
  DutyFinderOrder = true


--[[

  ************
  *  Script  *
  *   Start  *
  ************

]]


-- Values that are needed for the whole script
CurrentLoop = 1 -- This is just the loop counter itself, keeps tracks of how many you've done.
DutyCounter = 0
DutyFail = 0

if ManualSetDuty == true then
  DutyCounter = 1
end

::LoopTest::
if NumberofLoops >= CurrentLoop then
    yield("/echo Loop: "..CurrentLoop.." out of ".. NumberofLoops)
elseif NumberofLoops < CurrentLoop then
    goto StopLoop
end

::DutyFinder::
if DutyFail == 4 then
    goto StopLoop

elseif DutyCounter == 0 then -- Initially setting up duty to loop Alexander - Burden of the Father (A4N)
    yield("/visland stop")
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
    OpenRegularDuty(190)
    yield("/wait "..rate)
    if DutyFinderOrder then
      yield("/pcall ContentsFinder True 3 44") 
    else
      yield("/pcall ContentsFinder True 3 58")
    end
    
    yield("/wait "..rate)
    yield("/pcall ContentsFinder True 12 0")
    DutyCounter = DutyCounter + 1
    repeat
        yield("/wait "..rate)
    until IsAddonVisible("ContentsFinderConfirm")
    
elseif DutyCounter == 1 then -- Quicker menu'ing here to load in
    yield("/visland resume")
    yield("/visland stop")
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
    repeat
        yield("/wait "..rate)
    until IsAddonVisible("ContentsFinderConfirm")
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
until IsInZone(584) and IsAddonVisible("_Image")

manip_phase = 0

::BattleInitialize::


  if manip_phase == 0 then
    yield("/visland moveto -40.188 114.710 2.868")
    repeat
      yield("/wait "..rate)
    until not IsVislandRouteRunning()
    repeat 
      yield("/targetenemy")
      current_target = GetTargetName()
      yield("/wait 0.1")
    until current_target == "Faust Z"
  elseif manip_phase == 1 then
    repeat 
      yield("/targetenemy")
      current_target = GetTargetName()
      yield("/wait 0.1")
    until current_target == "Refurbisher 0"
  end

yield("/rotation manual")
yield("/wait 5")
  

::StartofBattle::
--rotation
while GetCharacterCondition(26) do 
    yield("/wait "..rate)
    -- yield("/e In Battle")
end

  
  if manip_phase == 0 then
    yield("/rotation cancel")
    while not IsPlayerAvailable() do yield("/wait 0.1") end
    yield("/target Cranial Hatch <wait.0.5>")
    yield("/pinteract <wait.1.0>")
    repeat
      yield("/wait "..rate)
      yield("/target Ingress")
      current_target = GetTargetName()
    until current_target == "Ingress"
    yield("/pint <wait.1.0>")
    repeat 
      yield("/wait "..rate)
    until IsPlayerAvailable()
    yield("/visland moveto 0 -250.290 -241.197")
    repeat
      yield("/wait "..rate)
    until not IsVislandRouteRunning()
    manip_phase = manip_phase + 1
    goto BattleInitialize
  end

  while not IsPlayerAvailable() do yield("/wait 0.1") end

CurrentLoop = CurrentLoop + 1
yield("/echo Leaving the instance")
yield("/pdfleave")

repeat
    yield("/wait "..rate)
until not IsInZone(584) and not GetCharacterCondition(45)

goto LoopTest

::StopLoop::
if DutyFail < 4 then
    yield("/echo Alex Looping has completed")
elseif DutyFail >= 4 then
    yield("/echo It seems like it's failed, maybe lag?")
end