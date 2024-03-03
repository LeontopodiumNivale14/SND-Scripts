 -- Start of the script
 
 --Functions
  function VNavMovement()
    repeat
      yield("/wait 0.1")
    until not PathIsRunning()
  end

  function ZoneTransitions()
    repeat 
      yield("/wait 0.1")
    until not IsPlayerAvailable()
    repeat 
      yield("/wait 0.1")
    until IsPlayerAvailable()
  end

  function QuestNPC()
    while GetCharacterCondition(32, false) do
      yield("/pint")
      yield("/wait 0.1")
    end
    repeat
      yield("/wait 0.1")
    until IsPlayerAvailable()
  end

  function TeleportDelayTimer()
    yield("/wait 2")
  end

  function QuestCombat()
     if GetCharacterCondition(26, false) then
        local current_target = GetTargetName()
        if not current_target or current_target == "" then
            yield("/targetenemy")
            current_target = GetTargetName()
            if current_target == "" then
            yield("/wait 0.5")
            end
        end
        local enemy_max_dist = 20
        local dist_to_enemy = GetDistanceToTarget()
        if dist_to_enemy and dist_to_enemy > 0 then
            if dist_to_enemy <= enemy_max_dist then
            local enemy_x = GetTargetRawXPos()
            local enemy_y = GetTargetRawYPos()
            local enemy_z = GetTargetRawZPos()
            yield("/vnavmesh moveto " .. enemy_x .. " " .. enemy_y .. " " .. enemy_z)
            yield("/wait 1")  
            yield("/rotation manual")
            yield("/wait 2")
            yield("/vnavmesh stop") 
            end
         end
      end
      yield("/wait 0.5")
      while GetCharacterCondition(26) do 
        yield("/wait 1")
        local current_target = GetTargetName()
        if not current_target or current_target == "" then
            yield("/targetenemy") 
            current_target = GetTargetName()
            if current_target == "" then
            yield("/wait 0.5") 
            end
        end
        local enemy_max_dist = 20
        local dist_to_enemy = GetDistanceToTarget()
        if dist_to_enemy and dist_to_enemy > 0 then
            if dist_to_enemy <= enemy_max_dist then
            local enemy_x = GetTargetRawXPos()
            local enemy_y = GetTargetRawYPos()
            local enemy_z = GetTargetRawZPos()
            yield("/vnavmesh moveto " .. enemy_x .. " " .. enemy_y .. " " .. enemy_z)
            yield("/wait 2")
            yield("/vnavmesh stop")  
            end
         end
      end
  end

  function InstanceCombat()
     if GetCharacterCondition(26, false) then
        local current_target = GetTargetName()
        if not current_target or current_target == "" then
            yield("/targetenemy")
            current_target = GetTargetName()
            if current_target == "" then
            yield("/wait 0.5")
            end
        end
        local enemy_max_dist = 50
        local dist_to_enemy = GetDistanceToTarget()
        if dist_to_enemy and dist_to_enemy > 0 then
            if dist_to_enemy <= enemy_max_dist then
            local enemy_x = GetTargetRawXPos()
            local enemy_y = GetTargetRawYPos()
            local enemy_z = GetTargetRawZPos()
            yield("/vnavmesh moveto " .. enemy_x .. " " .. enemy_y .. " " .. enemy_z)
            yield("/wait 1")  
            yield("/rotation manual")
            yield("/wait 2")
            yield("/vnavmesh stop") 
            end
         end
      end
      yield("/wait 0.5")
      while GetCharacterCondition(26) do 
        yield("/wait 1")
        local current_target = GetTargetName()
        if not current_target or current_target == "" then
            yield("/targetenemy") 
            current_target = GetTargetName()
            if current_target == "" then
            yield("/wait 0.5") 
            end
        end
        local enemy_max_dist = 50
        local dist_to_enemy = GetDistanceToTarget()
        if dist_to_enemy and dist_to_enemy > 0 then
            if dist_to_enemy <= enemy_max_dist then
            local enemy_x = GetTargetRawXPos()
            local enemy_y = GetTargetRawYPos()
            local enemy_z = GetTargetRawZPos()
            yield("/vnavmesh moveto " .. enemy_x .. " " .. enemy_y .. " " .. enemy_z)
            yield("/wait 2")
            yield("/vnavmesh stop")  
            end
         end
      end
  end

  --function RanNumberGenerator()
    --math.randomseed(os.time())
   -- yield("/wait "..math.random(2,5))
 -- end

-- Starting Quest

  -- First Loaded into Limsa
  yield("/at y") -- enables AdvancedText
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
  yield("/wait 1")     
  PathMoveTo(4.9933366775513,20.0,9.7082824707031)   
  VNavMovement()       
  yield("/wait 0.5")   

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
  
  
  -- Aetheryte Spots | Main Floor
  -- 1: Main Aetheryte
  PathMoveTo(-78.917869567871,18.800325393677,-1.6075956821442) -- Main Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  QuestNPC()
  PathMoveTo(-62.043544769287,18.000333786011,7.2772459983826)
  VNavMovement()
  yield("/target J'nasshym")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-99.624862670898,18.000333786011,16.530649185181)
  VNavMovement()
  yield("/target Sweetnix Rosycheeks")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-140.09278869629,18.200000762939,18.263156890869)  --
  VNavMovement()   --
  yield("/target Swozblaet")   --
  QuestNPC()    --
  PathMoveTo(-214.33099365234,15.99905872345,50.48551940918) -- Hawker's Alley
  VNavMovement()  
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-333.44641113281,11.999345779419,55.036689758301) -- Arcanist Guild
  VNavMovement()  
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-341.58633422852,12.899764060974,5.7203345298767)
  VNavMovement()
  yield("/target P'tahjha")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-333.44641113281,11.999345779419,55.036689758301)
  VNavMovement()
  yield("/li Hawk")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-180.99783325195,4.0,182.45573425293) -- Fisherman's Guild 
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-154.0831451416,1.9499998092651,240.47909545898)
  VNavMovement()
  yield("/target Lonwoerd")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-180.99783325195,4.0,182.45573425293) -- Fisherman's Guild 
  VNavMovement()
  
-- Taking elevator back to the top to get the aftcastle one set
  yield("/li Limsa")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-99.624862670898,18.000333786011,16.530649185181)
  VNavMovement()
  yield("/target Sweetnix Rosycheeks")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-62.043544769287,18.000333786011,7.2772459983826)
  VNavMovement()
  yield("/target J'nasshym")
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

--MarauderNPC--
  PathMoveTo(-4.2817740440369,45.631217956543,-257.67599487305)
  VNavMovement()
  PathMoveTo(-7.9256439208984,44.999835968018,-246.92102050781)
  VNavMovement()
  yield("/target Blauthota") ---Last Objective of MSQ
  QuestNPC()
  yield("/target Blauthota") ---Pickup Marauder Class Quest
  QuestNPC()
  PathMoveTo(-4.2817740440369,45.631217956543,-257.67599487305)
  VNavMovement()
  yield("/target Wyrnzoen") --Marauder ClassQuest1
  yield("/pint")
  yield("/wait 0.5")
  while not IsAddonVisible("SelectYesno") do
      yield("/wait 0.1")
  end
  yield("/pcall SelectYesno true 0")
  yield("/wait 7")
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684) -- Murauders Guild TP
  VNavMovement()
  yield("/target Aethernet Shard")
  yield("/li zeph")
  yield("/wait 0.5")
  QuestNPC()

--Now in MiddleLaNoscea
-- Doing this for the class quest now
  PathMoveTo(27.884315490723,43.61890411377,149.46348571777)
  VNavMovement()
  --ComabtZone1
  QuestCount = 1
  while QuestCount <= 5 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone1Done
  yield("/wait 1")
  PathMoveTo(23.412296295166,30.847522735596,172.52882385254)
  VNavMovement()
  --CombatZone2
  QuestCount = 1
  while QuestCount <= 3 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone2Done
  yield("/wait 1")
  PathMoveTo(55.143421173096,45.814811706543,180.3857421875)
  VNavMovement()
  --CombatZone3
  QuestCount = 1
  while QuestCount <= 3 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone3Done
  yield("/wait 1")
  yield("/echo CombatDone")
  PathMoveTo(-52.371814727783,33.775688171387,160.22235107422)
  VNavMovement()
  ZoneTransitions()
  PathMoveTo(-78.917869567871,18.800325393677,-1.6075956821442) -- Main Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  yield("/li mara")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-4.2817740440369,45.631217956543,-257.67599487305)
  VNavMovement()
  yield("/target Wyrnzoen") --Marauder ClassQuest1TurnIn
  QuestNPC()
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684) -- Murauders Guild TP
  VNavMovement()
  yield("/li Aft")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(17.951627731323,40.216011047363,-5.4437046051025) --AftCastle
  VNavMovement()
  yield("/target Baderon")
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Baderon")
  yield("/wait 0.5")
  QuestNPC()
  yield("/wait 1")
  yield("/echo COMPLETE to OnToSummerford")
  --Clearing HowTo Spam 
  while IsAddonVisible("HowToNotice") do
  yield("/pcall HowToNotice True 1")
  yield("/wait 0.1")
  end
  yield("/pcall HowTo True -1")
  yield("/wait 1")
  
--Starting OnToSummerford
  PathMoveTo(13.979390144348,40.000003814697,71.650901794434) -- AftcastleTP
  VNavMovement()
  yield("/target Aethernet Shard")
  yield("/li zeph")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(223.61380004883,113.09998321533,-258.57131958008)
  VNavMovement()
  yield("/target Aetheryte")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(204.98315429688,112.51494598389,-221.57643127441)
  VNavMovement()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
   athMoveTo(47.497604370117,47.998905181885,15.325218200684) -- Bridge movement addition
  VNavMovement()
  PathMoveTo(51.264186859131,47.619411468506,51.589653015137) -- we're over the bridge... harray
  VNavMovement()
  PathMoveTo(-52.371814727783,33.775688171387,160.22235107422)
  VNavMovement()
  ZoneTransitions()
  PathMoveTo(-78.917869567871,18.800325393677,-1.6075956821442) -- Main Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  yield("/li hawk")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-158.54499816895,18.0,34.706218719482)
  VNavMovement()
  PathMoveTo(-155.60202026367,18.200000762939,23.272695541382)
  VNavMovement()

-- Shop buying time
  yield("/target Iron Thunder")
  yield("/wait 1")
  yield("/pint")
  yield("/wait 1")
  yield("/pcall SelectIconString true 0") 
  yield("/wait 1")
  yield("/pcall SelectString true 0")
  yield("/wait 1")

  -- This is for DOW here
  yield("/pcall Shop true 0 1 1") 
  yield("/wait 1")
  yield("/pcall SelectYesno true 0")
  yield("/wait 1")
  yield("/pcall Shop true 0 5 1")
  yield("/wait 1")
  yield("/pcall SelectYesno true 0")
  yield("/wait 1")
  yield("/pcall Shop true 0 7 1")
  yield("/wait 1")
  yield("/pcall SelectYesno true 0")
  yield("/wait 1")
  yield("/pcall Shop true 0 9 1")
  yield("/wait 1")
  yield("/pcall SelectYesno true 0")
  yield("/wait 1")
  yield("/echo Lv5AllBought")
  yield("/pcall Shop true -1")
  yield("/wait 1")
  yield("/pcall SelectString true 5")
  yield("/wait 5")
  yield("/echo Ready For Summerford!")

--Prepare for MarauderQuest2--
  --Axe In The Stone--
  PathMoveTo(-90.350730895996,18.800331115723,2.4822020530701)
  VNavMovement()
  yield("/li Marauders'")
  yield("/wait 0.5")
  QuestNPC()
  -- up in front of the MAR guild now
  PathMoveTo(-1.2058923244476,44.999885559082,-254.02742004395)
  VNavMovement()
  yield("/target Wyrnzoen")
  yield("/wait 0.3")
  yield("/pint")
  QuestNPC()
  PathMoveTo(1.3508217334747,30.47562789917,-244.72003173828)
  VNavMovement()
  yield("/target Broenbhar")
  yield("/pint")
  yield("/wait 0.3")
  QuestNPC()
  -- Speaking w/ Rhotgeim
  PathMoveTo(-3.2275876998901,43.999996185303,-218.45257568359)
  VNavMovement()
  TeleportDelayTimer()
  yield("/li Zephyr Gate")
  ZoneTransitions()
  -- Out in Middle La Noscea again 
  -- Traveling to the NPC to smash (heh) some rocks
  PathMoveTo(-16.241876602173,44.185115814209,108.10806274414)
  VNavMovement()
  PathMoveTo(-51.191963195801,43.551807403564,89.46858215332)
  VNavMovement()
  PathMoveTo(-60.736248016357,43.621799468994,49.734580993652)
  VNavMovement()
  yield("/target Rhotgeim")
  yield("/pint")
  yield("/wait 0.3")
  QuestNPC()
  -- Rock smashing time
  -- Rock #1
  PathMoveTo(-67.693168640137,43.585784912109,23.214960098267)
  VNavMovement()
  yield("/target Solid Rock")
  yield('/ac "Heavy Swing"')
  yield("/wait 0.3")
  QuestNPC()
  -- Rock #2
  PathMoveTo(-54.865074157715,45.843235015869,17.340070724487)
  VNavMovement()
  yield("/target Solid Rock")
  yield('/ac "Heavy Swing"')
  yield("/wait 0.3")
  QuestNPC()
  -- Rock #3
  PathMoveTo(-72.722846984863,43.459812164307,6.8137311935425)
  VNavMovement()
  yield("/target Solid Rock")
  yield('/ac "Heavy Swing"')
  yield("/wait 0.3")
  QuestNPC()
  -- Returning back to the quest person
  PathMoveTo(-59.021057128906,43.762218475342,43.019172668457)
  VNavMovement()
  yield("/target Rhotgeim")
  yield("/pint")
  yield("/wait 0.3")
  QuestNPC()
  -- Smash #2, Electric Boogaloo
  -- Rock #1
  PathMoveTo(-14.582325935364,46.454627990723,31.634527206421)
  VNavMovement()
  yield("/target Solid Rock")
  yield('/ac "Heavy Swing"')
  yield("/wait 0.3")
  QuestNPC()
  -- Rock #2
  PathMoveTo(-14.830419540405,47.334972381592,14.525884628296)
  VNavMovement()
  yield("/target Solid Rock")
  yield('/ac "Heavy Swing"')
  yield("/wait 0.3")
  QuestNPC()
  -- Rock #3
  PathMoveTo(-0.84856963157654,48.157024383545,10.393385887146)
  VNavMovement()
  yield("/target Solid Rock")
  yield('/ac "Heavy Swing"')
  yield("/wait 0.3")
  QuestNPC()
  -- Back to Rhotgeim... AGAIN lol
  PathMoveTo(-54.65075302124,44.129451751709,44.006153106689)
  VNavMovement()
  yield("/target Rhotgeim")
  yield("/pint")
  yield("/wait 0.3")
  QuestNPC()
  -- Heading back to the guild now to finish the quest 
  PathMoveTo(-60.845741271973,43.610851287842,53.779232025146)
  VNavMovement()
  PathMoveTo(-22.686052322388,38.912437438965,145.08839416504)
  VNavMovement()
  PathMoveTo(-52.371814727783,33.775688171387,160.22235107422)
  VNavMovement()
  ZoneTransitions()
  -- Back in limsa, time to turn in the quest 
  PathMoveTo(-78.917869567871,18.800325393677,-1.6075956821442) -- Main Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  yield("/li Marauders'")
  yield("/wait 0.5")
  ZoneTransitions()
  -- Reporting Quest 
  PathMoveTo(-1.1390036344528,44.999885559082,-253.21701049805)
  VNavMovement()
  yield("/target Wyrnzoen")
  yield("/pint")
  yield("/wait 0.3")
  QuestNPC()
  PathMoveTo(-2.2472448348999,31.475744247437,-256.96371459961)
  VNavMovement()
  yield("/target Solkwyb")
  yield("/pint")
  yield("/wait 0.3")
  QuestNPC()
  PathMoveTo(-3.1268327236176,44.0,-218.11682128906)
  VNavMovement()
  yield("/li Tempest")
  ZoneTransitions()
  -- Lower Na Noscea Time 
  PathMoveTo(129.30143737793,35.822574615479,30.904420852661)
  VNavMovement()
  yield("/target Megalocrab Nest")
  yield("/pint")
  yield("/wait 0.3")
  QuestNPC()
  -- moving to the solo instance
  PathMoveTo(143.44854736328,35.508754730225,61.767261505127)
  VNavMovement()
  PathMoveTo(158.01223754883,33.698177337646,83.410934448242)
  VNavMovement()
  PathMoveTo(158.01223754883,33.791107177734,89.221717834473)
  VNavMovement()
  repeat
    yield("/wait 0.1")
  until IsAddonVisible("SelectYesno")
  yield("/pcall SelectYesno true 0")
  yiel("/wait 1")
  QuestNPC()
  InstanceCombat()
  ZoneTransitions()