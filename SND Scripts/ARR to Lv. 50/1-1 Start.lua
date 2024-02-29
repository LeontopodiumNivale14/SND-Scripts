 -- Start of the script
 
 --Functions
function VNavMovement()
  repeat
    yield("/wait 0.1")
    yield("/gaction sprint")
  until not PathIsRunning()
end

function ZoneTransitions()
  repeat 
    yield("/wait 0.1")
  until not IsPlayerAvailable()
  repeat 
    yield("/wait 0.1")
  until IsPlayerAvailable()
  yield("/wait 5")
end

function QuestNPC()
  while GetCharacterCondition(32, false) do
    yield("/pint")
    yield("/wait 0.1")
  end
  repeat
    yield("/wait 0.1")
  until IsPlayerAvailable()
  yield("/wait 1")
end


  -- First Loaded into Limsa
  yield("/at") -- enables AdvancedText
  yield("/target Ryssfloh")
  yield("/vnavmesh movetarget")
  VNavMovement()
  yield("/pint")
  QuestNPC()
  
  -- Movement to the elevator
  PathMoveTo(-6.1722960472107,20.265306472778,3.9637887477875)
  VNavMovement()
  yield("/target Grehfarr")
  yield("/vnavmesh movetarget")
  VNavMovement()
  yield("/pint")
  while not IsAddonVisible("SelectYesno") do
      yield("/wait 0.1")
  end
  yield("/pcall SelectYesno True 0")
  ZoneTransitions()
  
  -- Getting out of instance/finishing first quest
  PathMoveTo(17.951627731323,40.216011047363,-5.4437046051025)
  VNavMovement()
  yield("/target Baderon")
  yield("/wait 0.5")
  yield("/pint")
  QuestNPC()

  -- Close to Home Quest
  yield("/target Baderon")
  yield("/wait 0.5")
  yield("/pint")
  QuestNPC()

    -- Mini-side quest(required)
	-- Making a Name

  PathMoveTo(8.1509618759155,39.517570495605,2.6219840049744)
  VNavMovement()
  yield("/target Niniya")
  yield("/wait 0.5")
  yield("/pint")
  QuestNPC()
  yield("/target Skaenrael")
  yield("/vnavmesh movetarget")
  VNavMovement()
  yield("/pint")
  yield("/wait 0.5")
  while not IsAddonVisible("SelectYesno") do
      yield("/wait 0.1")
  end
  yield("/pcall SelectYesno True 0")
  ZoneTransitions()

  -- once downstairs, targeting peculiar herb
  QuestCount = 1
  while QuestCount <= 6 do 
    yield("/target Peculiar Herb")
    yield("/vnavmesh movetarget")
    VNavMovement()
    yield("/pint")
    yield("/wait 0.5")
	repeat
	  yield("/wait 0.1")
	until IsPlayerAvailable()
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  
  -- Finishing up the quest here with this person
  yield("/target Ahldskyf")
  yield("/vnavmesh movetarget")
  VNavMovement()
  yield("/pint")
  QuestNPC()

  -- Finishing side quest here, free movement
  --NotificationSpam = 1
  --while NotificationSpam <= 7 do
  --yield("/pcall HowToNotice True 1")
  --yield("/wait 0.1")
  --end
  --yield("/pcall HowTo True -1")
  
  
  -- Aetheryte Spots | Main Floor
  -- 1: Main Aetheryte
  PathMoveTo(-78.917869567871,18.800325393677,-1.6075956821442) -- Main Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  QuestNPC()
  PathMoveTo(-214.33099365234,15.99905872345,50.48551940918) -- Hawker's Alley
  VNavMovement()  
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-333.44641113281,11.999345779419,55.036689758301) -- Arcanist Guild
  VNavMovement()  
  yield("/target Aethernet Shard")
  QuestNPC()
  yield("/wait 0.5")
  yield("/li Hawk")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-180.99783325195,4.0,182.45573425293) -- Fisherman's Guild 
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  yield("/wait 0.5")
  
  -- Taking elevator back to the top to get the aftcastle one set
  yield("/li Limsa")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-2.2985215187073,20.388378143311,6.1517596244812) -- movement near lift attendy
  VNavMovement()
  yield("/target Grehfarr") -- lift attendy himself (he's doing a great job)
  yield("/vnavmesh movetarget")
  VNavMovement()
  yield("/pint") 
  yield("/wait 0.5")
  while not IsAddonVisible("SelectIconString") do
      yield("/wait 0.1")
  end
  yield("/pcall SelectIconString true 1")
  while not IsAddonVisible("SelectYesno") do
      yield("/wait 0.1")
  end
  yield("/pcall SelectYesno true 0")
  ZoneTransitions()
  
  -- Aftcastle Area
  PathMoveTo(13.979390144348,40.000003814697,71.650901794434) -- Aftcastle/GC
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-54.091522216797,41.999923706055,-130.0699005127) -- Cul Guild
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684) -- Murauders Guild TP
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()

-- Temp Line --
