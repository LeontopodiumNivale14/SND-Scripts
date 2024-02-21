--[[
Version: 1.0.1
Description: 
This is suppose to help you farm that stupid 10,000 Accursed Hoards Found (achievement in question: https://na.finalfantasyxiv.com/lodestone/playguide/db/achievement/7e168d23176/)
   I used HOH because it was the easiest thing to do, didn't start at a low level, and could get lucky and get a petrification in the first 10 floors
   The way this works is:
   -> Start on floor 1, run through floor 20 (kill the boss)
   -> If you don't have an intition pomander, you have some really horrible luck, reset the save file and try again.
   -> This is assuming you have one of the following:
     -> Magicite w/ safety 
       or
     -> Concealment

   -> Set the save file that is currently on floor 11 below, it'll load you in, check to see if you have an intition on that floor
   -> if it does, then it'll make a danger bongos and you have to go get it yourself, I don't have a way to map you to it (yet)
   -> if there isn't one on the floor, then it'll take you out of the DeepDungeon, and repeat the process

   Plugins needed:
   -> Pandora's Box
   -> VNavmesh (was last tested on 0.0.0.5)

]]

--Save Data Slot 
--Top Slot = 0, Bottom Slot = 1, change the value to the save file you want to farm the achievement
Save_Slot = 1

-- If an Intuition is on the floor, and out of range, do you want to still get it manually?
-- false will leave and try to find one closer
-- true will make it to where you are in control till you get the Intuition
ManualMovement = false

::DeepDungeon::
while IsInZone(613) == false do
  yield("/wait 1")
end

while GetCharacterCondition(45) do
yield("/wait 3")
end

if IsInZone(613) then
  while GetCharacterCondition(34, false) and GetCharacterCondition(45, false) do
    if IsAddonVisible("ContentsFinderConfirm") then
      yield("/pcall ContentsFinderConfirm true 8")
    elseif GetTargetName()=="" then
      yield("/target Kyusei")
    elseif GetCharacterCondition(32, false) then
      yield("/pinteract")
    end
    if IsAddonVisible("DeepDungeonMenu") then yield("/pcall DeepDungeonMenu True 0") end
    if IsAddonVisible("DeepDungeonSaveData") and IsAddonVisible("SelectYesno") == false then yield("/pcall DeepDungeonSaveData True "..Save_Slot.." 1") end
    if IsAddonVisible("SelectYesno") then yield("/pcall SelectYesno true 0") end
    yield("/wait 0.5")
  end
  while GetCharacterCondition(79, false) do yield("/wait 1") end
  if GetCharacterCondition(79) then yield("/wait 1") end
  yield("/wait 3")
end

::ZoneCheck::

if GetZoneID() == 771 then
  yield("/wait 3")
end

::IntuitionCheck::
if GetToastNodeText(2, 3) == "The current duty uses an independent leveling system." then
  yield("/wait 3")
end

yield("/pcall DeepDungeonStatus True 11 14 <wait.5.0>")

if GetToastNodeText(2, 3) == "You sense the Accursed Hoard calling you..." then
  if GetAccursedHoardRawX() == 0.0 and GetAccursedHoardRawY() == 0.0 and ManualMovement == true then
    yield("/e Intuition is found, but out of range. Go get it!")
    Chest_Got = false
    goto IntuitionTime
  end  
  if GetAccursedHoardRawX() == 0.0 and GetAccursedHoardRawY() == 0.0 and ManualMovement == false then
    LeaveDuty()
    goto DeepDungeon
  end

  yield("/echo Hey! A Hoard is here and in range.")
  yield("/pcall DeepDungeonStatus True 11 18 <wait.3.0>") -- Concealment pomander
  if HasStatusId(1496) == false then -- Invisible status check
    yield("/pcall DeepDungeonStatus True 12 0") -- primal summon
    yield("/wait 3")
    yield("/pcall DeepDungeonStatus True 11 1") -- safety pomander
    yield("/wait 3")
  end
  yield("/ac sprint")
  yield("/vnavmesh moveto "..string.format("%.2f", GetAccursedHoardRawX()).." "..string.format("%.2f", GetAccursedHoardRawY()).." "..string.format("%.2f", GetAccursedHoardRawZ()))
  Chest_Got = false
  
elseif GetToastNodeText(2, 3) == "You do not sense the call of the Accursed Hoard on this floor..." then
    LeaveDuty()
    goto DeepDungeon
end

::IntuitionTime::
while Chest_Got == false do
  yield("/wait 1")
  if GetToastNodeText(2, 3) == "You obtain a piece of the Accursed Hoard." then
    Chest_Got = true
  elseif GetToastNodeText(2, 3) == "You discover a piece of the Accursed Hoard!" then
    Chest_Got = true
  end
end

if Chest_Got == true then 
  while GetCharacterCondition(26) do
    yield("/wait 1")
  end
  yield("/wait 1")
  LeaveDuty()
  goto DeepDungeon
end