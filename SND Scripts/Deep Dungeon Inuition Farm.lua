--[[
Description: This is suppose to help you farm that stupid 10,000 Accursed Hoards Found (achievement in question: https://na.finalfantasyxiv.com/lodestone/playguide/db/achievement/7e168d23176/)
             I used HOH because it was the easiest thing to do, didn't start at a low level, and could get lucky and get a petrification in the first 10 floors
             The way this works is:
             -> Start on floor 1, run through floor 10 (kill the boss)
             -> If you don't have an intition pomander, you have some really horrible luck, reset the save file and try again.
             -> Getting a petrification helps a lot so you don't waste time killing mobs as you run through, though not necessary

             -> Set the save file that is currently on floor 11 below, it'll load you in, check to see if you have an intition on that floor
               -> if it does, then it'll make a danger bongos and you have to go get it yourself, I don't have a way to map you to it (yet)
               -> if there isn't one on the floor, then it'll take you out of the DeepDungeon, and repeat the process

]]

--Save Data Slot 
--Top Slot = 0, Bottom Slot = 1, change the value to the save file you want to farm the achievement
Save_Slot = 1

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
  yield("/wait 1")
end

yield("/pcall DeepDungeonStatus True 11 14 <wait.5.0>")

if GetToastNodeText(2, 3) == "You sense the Accursed Hoard calling you..." then
  yield("/echo Hey! A Hoard is here <se.6>")
  Chest_Got = false
elseif GetToastNodeText(2, 3) == "You do not sense the call of the Accursed Hoard on this floor..." then
    LeaveDuty()
    goto DeepDungeon
end

while Chest_Got == false do
  yield("/wait 1")
  if GetToastNodeText(2, 3) == "You obtain a piece of the Accursed Hoard." then
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