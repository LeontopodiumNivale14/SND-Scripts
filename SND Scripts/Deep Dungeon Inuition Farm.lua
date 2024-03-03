--[[

  ****************
  * Authors Note *
  ****************

  Authors note: TECHNICALLY if you get a Concealment, you are going to be WAY quicker on your runs. It's a 1 pom usage vs 2, which shaves off ~3 seconds per run
                And that can add up... VERY quickly. I have went through and made this as fast as I can (possibly) made it at this second. 

  Author: Ice 
  Quick note: thank you the two of you who kept bug fixing my things and asking for new features
              this wouldn't have gotten better w/o you buggin me in my dms

  **************
  *  Version:  *
  *    1.1     *
  **************

  Version Update Notes:
  1.1     -> NVM. Turns out this is faster than I could before. Updated timers again, added one before loading into NPC to make it more normalish on loadout
  1.0.4.2 -> Fixed sprint, made it constantly try to use while moving to spot
  1.0.4.1 -> Concealment save file setting added
  1.0.4   -> Speed Update (Made checking Intuition SO much faster, pomander timers as well are now fast af)
  1.0.3   -> First proper working version


  *****************
  *  Description  *
  *****************
 
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


  *********************
  *  Required Plugins *
  *********************

   -> Pandora's Box | https://love.puni.sh/ment.json
   -> VNavmesh (was last tested on 0.0.0.10) | https://puni.sh/api/repository/veyn

]]

--[[

  **************
  *  Settings  *
  **************
]]

  --Save Data Slot 
  --Top Slot = 0, Bottom Slot = 1, change the value to the save file you want to farm the achievement
  Save_Slot = 1

  -- If an Intuition is on the floor, and out of range, do you want to still get it manually?
  -- false will leave and try to find one closer
  -- true will make it to where you are in control till you get the Intuition
  ManualMovement = false

  -- If you're running on standard control scheme (like my raid mates), make sure to change this to false, it'll make vnavmesh work properly
  -- Options: true | false 
  MovementLegacy = true

  -- This setting is so you can mark off if you have concealment or not 
  -- Concealment is 100% quicker, so if you do have it in a save, would highly recommend setting this to true 
  -- if not, it'll use a primal + safety for movmement (sight doesn't really do TOO much, safety is so you don't hit a luring on the way there lol)
  -- Options: true | false 
  ConcealmentSaveFile = true 

::DeepDungeon::
while IsInZone(613) == false do
  PathStop()
  yield("/wait 0.1")
end

while GetCharacterCondition(45) do
yield("/wait 0.1")
end

if IsInZone(613) then
  yield("/wait 0.5")
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
  yield("/wait 0.1")
end

::ZoneCheck::

if GetZoneID() == 771 then
  repeat 
    yield("/wait 0.1")
  until IsPlayerAvailable()
end

::IntuitionCheck::
yield("/wait 0.2")
yield("/pcall DeepDungeonStatus True 11 14")

repeat 
  yield("/wait 0.1")
until GetToastNodeText(2, 3) == "You sense the Accursed Hoard calling you..." or GetToastNodeText(2, 3) == "You do not sense the call of the Accursed Hoard on this floor..."

if GetToastNodeText(2, 3) == "You sense the Accursed Hoard calling you..." then
  yield("Hoard Detected at: "..GetAccursedHoardRawX().." | "..GetAccursedHoardRawY().." | "..GetAccursedHoardRawZ())
  yield("/wait 0.5")
  if GetAccursedHoardRawX() == 0.0 and GetAccursedHoardRawZ() == 0.0 and ManualMovement == true then
    yield("/e Intuition is found, but out of range. Go get it!")
    yield("/pcall DeepDungeonStatus True 11 2") -- sight popped 
    Chest_Got = false
    goto IntuitionTime
  end  
  if GetAccursedHoardRawX() == 0.0 and GetAccursedHoardRawY() == 0.0 and ManualMovement == false then
    yield("/e It's out of range, getting out of here")
    LeaveDuty()
    goto DeepDungeon
  end

  yield("/echo Hey! A Hoard is here and in range.")
  if MovementLegacy == false then 
    yield("/characterconfig")
    yield("/pcall ConfigCharacter True 10 0 0 1") -- Makes sure you're on the Contorl Settings Tab
    yield("/wait 0.2")
    yield("/pcall ConfigCharaOpeGeneral True 18 143 1 0") --Legacy Button
    yield("/wait 0.2")
    yield("/pcall ConfigCharacter True 0") -- Applies the settings
    yield("/wait 0.2")
    yield("/pcall ConfigCharacter True 1") -- Closes the Config Menu
    yield("/wait 1")
  end
    if ConcealmentSaveFile == true then 
      yield("/pcall DeepDungeonStatus True 11 18") -- Concealment pomander
      repeat 
        yield("/wait 0.1")
      until IsPlayerAvailable()
    elseif ConcealmentSaveFile == false then 
      yield("/pcall DeepDungeonStatus True 12 0") -- primal summon
      yield("/wait 3")
      yield("/pcall DeepDungeonStatus True 11 1") -- safety pomander
      yield("/wait 0.5")
      repeat 
        yield("/wait 0.1")
      until IsPlayerAvailable()
    end
  yield("/vnavmesh moveto "..string.format("%.2f", GetAccursedHoardRawX()).." "..string.format("%.2f", GetAccursedHoardRawY()).." "..string.format("%.2f", GetAccursedHoardRawZ()))
  Chest_Got = false
  
elseif GetToastNodeText(2, 3) == "You do not sense the call of the Accursed Hoard on this floor..." then
    LeaveDuty()
    goto DeepDungeon
end

::IntuitionTime::
while Chest_Got == false do
  yield("/wait 0.1")
  yield("/ac sprint")
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
  if MovementLegacy == false then 
    yield("/characterconfig")
    yield("/pcall ConfigCharacter True 10 0 0 1") -- Makes sure you're on the Contorl Settings Tab
    yield("/wait 0.2")
    yield("/pcall ConfigCharaOpeGeneral True 18 143 0 0") --Standard Button
    yield("/wait 0.2")
    yield("/pcall ConfigCharacter True 0") -- saves the Settings
    yield("/wait 0.2")
    yield("/pcall ConfigCharacter True 1") -- closes the character config
    yield("/wait 0.2")
  end
    
  LeaveDuty()
  goto DeepDungeon
end