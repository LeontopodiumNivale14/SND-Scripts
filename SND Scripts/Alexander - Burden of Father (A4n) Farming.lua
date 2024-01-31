--[[
This is meant to be used for Alexander - The Burden of the Father (NORMAL NOT SAVAGE)
It's setup to where you should be able to loop it as many time as you want, and be able to farm mats for GC seals
Known classes to work: MCH | SMN | RDM | BLM | BRD

Version: 2.1
Created by: Ice

Plugins that are used are:
-> Visland (for pathing)
-> Pandora (Setting "Open Chest")
-> RotationSolver
]]

-- How many loops do you wanna do
NumberofLoops = 15

--Visland Loops
Alex_Start = "H4sIAAAAAAAACk2PW2vDMAyF/4ueTXCyNJv9VrYO8tDdIVvHKKbVqKG2Rq3uQsh/nxJctjcd6dPRUQ83LiBYmO/xe12vH0FB534+yEdOYF97uKPk2VME28MzWF3oqrmYmaY2Cl7AlrqY1ea8qhWswJrCNGdaV4MoitheyYKCB7f1R3ErCxFL+sSAkadJGxkPbsOd591tpv/3cjgJlXb0dZpIGnF7d/uEf/gUsVSwCMSnwy1jyOV8IrK4P2LiXI/GnfPjt9lxVNd0uKS4zZ8LNjaffMClcHp4G34B1YIamzkBAAA="
Alex_Chest = "H4sIAAAAAAAACuWQSWvDMBCF/0qZsyMkR7It3UIX8CHdCLgLJYhkTASxVWy5C8b/vYpj40ALvRZ605t5enr6WrjWBYKCxR4/1ny9ggAy/flqTelqUM8t3NraOGNLUC08gAqJFDGXEQ/gERSjJKJcijCAJ1AzQZKEJiHrvLQlphegaAD3emsaH8aIF0v7hgWWrt+kpcNKb1xm3O5mcJ/Ohm6+U72z7+PGl/Fpud7XONn7hiyAy8K68eHUYTEcF71jEHcN1m44H4IzbdyUeFBXtjq35Xb4OD0OV6bApffRLviGZUYJo5IyGU9kBOeRkEcykgjJEhH/QzIhoaHkyURlLrk4UonIPJpTmZxQ4YfdyMVf/Y0Ljz3hH8i4CnXdVHi2sXmO1Z8D9dJ9Ad/rgrl7AwAA"

-- Values that are needed for the whole script
CurrentLoop = 1 -- This is just the loop counter itself, keeps tracks of how many you've done.
DutyCounter = 0
DutyFail = 0

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
  yield("/visland resume")
  yield("/visland stop")
  yield("/dutyfinder")
  yield("/wait 0.2")

-- Setting up Unsync if it wasn't already
  yield("/pcall ContentsFinder True 15")
  yield("/wait 1.0")
  yield("/pcall ContentsFinderSetting True 1 1 1")
  yield("/wait 0.5")
  yield("/pcall ContentsFinderSetting True 0")
  yield("/wait 0.2")

  yield("/pcall ContentsFinder True 12 1") -- Clearing out any old duties
  yield("/wait 0.5")
  OpenRegularDuty(115)
  yield("/send NUMPAD0")
  yield("/send NUMPAD0")

  yield("/pcall ContentsFinder True 12 0")
  DutyCounter = DutyCounter + 1
  yield("/wait 2.0")
elseif DutyCounter == 1 then -- Quicker menu'ing here to load in
  yield("/visland resume")
  yield("/visland stop")
  yield("/dutyfinder") --Open Duty Finder
  yield("/wait 1.0")
  yield("/pcall ContentsFinder True 12 0") --Duty Load
  yield("/wait 2.0") 
elseif DutyCounter == 2 then
  yield("/echo Hmm... it seems like this has failed, so going to reset it")
  DutyCounter = 0 
  DutyFail = DutyFail + 1
  goto DutyFinder
end


::DutyCommence::
yield("/click duty_commence")
yield("/wait 3")

while GetCharacterCondition(45) do
  yield("/wait 1")
end

::Start::
if IsInZone(445) then
  yield("/wait 1")
end

while IsAddonVisible("_Image") == false do
  yield("/wait 1")
end

::BattleInitialize::
manip_phase = 0

yield("/visland exectemponce "..Alex_Start)
yield("/wait 0.3")

while IsVislandRouteRunning() do
  yield("/targetenemy")
  yield("/rotation Manual")
  yield("/wait 1")
end

::StartofBattle::

yield ("/wait 4")

while GetCharacterCondition(26) do
  yield("/wait 2")
  yield("/targetenemy")
end

yield ("/wait 4")

if (not GetCharacterCondition(26)) then
  yield("/visland exectemponce "..Alex_Chest)
end

yield("/wait 2")

while IsMoving() do
  yield("/wait 1")
end

CurrentLoop = CurrentLoop + 1
yield("/echo Leaving the instance")
yield("/wait 0.3")
yield("/pdfleave")
yield("/wait 1")

while GetCharacterCondition(45) do
  yield("/wait 1")
  yield("/echo Transitioning")
end

goto LoopTest

::StopLoop::
if DutyFail < 4 then
  yield("/echo Alex Looping has completed")
elseif DutyFail >= 4 then
  yield("/echo It seems like it's failed, maybe lag?")
end