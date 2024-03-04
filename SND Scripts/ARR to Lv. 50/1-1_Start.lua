 -- Start of the script


 -- !!!Required Plugins&Settings!!!--
      -- SND:....Duh
	  -- vnavmesh: Settings: NavmeshManager >>> Toggle: Align Camera to Movement Direction
	  -- TextAdvance: This plugin will be activated at the start of the script with /at. DO NOT manually turn it on.
	       -- Settings: GeneralConfig >>> Toggle: Automatic Reward Pickup >>> At bottom of settings, move "Equippable item for current job" to top of priority
	  -- SimpleTweaks: Search for "equip" >>> Toggle: Equip Recommended Command >>> Hit drop down arrow next to Toggle >>> Change command to "/equip"
      -- LifeStream
      -- Teleporter: This and LifeStream are used for handling all teleport and aethernet usage.

 --Functions
  function VNavMovement() --Used to Do NOTHING While Moving
    repeat
      yield("/wait 0.1")
    until not PathIsRunning()
  end

  function ZoneTransitions() --Used At ALL Zone Transitions for /wait
    repeat 
      yield("/wait 0.1")
    until not IsPlayerAvailable()
    repeat 
      yield("/wait 0.1")
    until IsPlayerAvailable()
  end

  function QuestNPC() --Used At ALL NPCs for Interaction and /wait
    while GetCharacterCondition(32, false) do
      yield("/pint")
      yield("/wait 0.1")
    end
    repeat
      yield("/wait 0.1")
    until IsPlayerAvailable()
  end

  function QuestCombat() --Targeting/Movement Logic for Overworld
    if GetCharacterCondition(26, false) then
      local current_target = GetTargetName()
      if not current_target or current_target == "" then
        yield("/targetenemy")
        current_target = GetTargetName()
        if current_target == "" then
          yield("/wait 0.2")
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
      yield("/wait 0.2")
      local current_target = GetTargetName()
      if not current_target or current_target == "" then
        yield("/targetenemy") 
        current_target = GetTargetName()
        if current_target == "" then
          yield("/wait 1") 
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

  function QuestInstance() --Targetting/Movement Logic for Solo Duties
    yield("/wait 1")
    yield("/pcall SelectYesno true 0")
    if not IsPlayerAvailable() and GetCharacterCondition(26, false) then
      repeat
	    yield("/wait 0.1")
	  until IsPlayerAvailable() and GetCharacterCondition(26, true)
    end	
    while IsPlayerAvailable() and GetCharacterCondition(26) do
      yield("/wait 1")
      yield("/rotation manual")
      
      local current_target = GetTargetName()
      
      if not current_target or current_target == "" then
        yield("/targetenemy") 
        current_target = GetTargetName()
          if current_target == "" then
            yield("/wait 1") 
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
          yield("/wait 3")
          yield("/vnavmesh stop")  
        end
      end
    end
  end

-- Quest #1 | loading Into Limsa
  yield("/at y") -- enables AdvancedText
  yield("/target Ryssfloh")
  yield("/vnavmesh movetarget")
  VNavMovement()
  yield("/pint")
  QuestNPC()
  
  -- Movement to the elevator
  PathMoveTo(-6.1722960472107,20.265306472778,3.9637887477875,false)
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
  PathMoveTo(17.951627731323,40.216011047363,-5.4437046051025,false)
  VNavMovement()
  yield("/target Baderon")
  yield("/wait 0.5")
  yield("/pint")
  QuestNPC()

-- Quest#2 |  Close to Home Quest(MSQ#1)
  yield("/target Baderon")
  yield("/wait 0.5")
  yield("/pint")
  QuestNPC()

  -- Mini-side quest(required) | Making a Name (SQ#1)

    PathMoveTo(8.1509618759155,39.517570495605,2.6219840049744,false)
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
    PathMoveTo(4.9933366775513,20.0,9.7082824707031,false)   
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

  --NotificationSpam = 1
  --while NotificationSpam <= 7 do
  --yield("/pcall HowToNotice True 1")
  --yield("/wait 0.1")
  --end
  --yield("/pcall HowTo True -1")
  
  
 -- Aetheryte Spots | Main Floor | Back to (MSQ#1)
  -- 1: Main Aetheryte
  PathMoveTo(-78.917869567871,18.800325393677,-1.6075956821442,false) -- Main Aetheryte (#1/3 )
  VNavMovement()
  yield("/target Aetheryte")
  QuestNPC()
  PathMoveTo(-62.043544769287,18.000333786011,7.2772459983826,false) -- Start Quests for Gil/XP
  VNavMovement()
  yield("/target J'nasshym")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-99.624862670898,18.000333786011,16.530649185181,false)  -- Start Quests for Gil/XP
  VNavMovement()
  yield("/target Sweetnix Rosycheeks")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-104.21018218994,18.000333786011,10.599261283875,false)  -- small detour, remove when fixed
  VNavMovement()
  PathMoveTo(-140.09278869629,18.200000762939,18.263156890869,false)  -- Talking to MSQ Quest Dude (#2/3 Completed)
  VNavMovement()   
  yield("/target Swozblaet")   
  QuestNPC()    
  PathMoveTo(-214.33099365234,15.99905872345,50.48551940918,false) -- Hawker's Alley
  VNavMovement()  
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-216.37718200684,15.999116897583,47.992137908936,false) -- small detour, remove when fixed
  VNavMovement()
  PathMoveTo(-333.44641113281,11.999345779419,55.036689758301,false) -- Arcanist Guild
  VNavMovement()  
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-341.58633422852,12.899764060974,5.7203345298767,false)
  VNavMovement()
  yield("/target P'tahjha")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-333.44641113281,11.999345779419,55.036689758301,false)
  VNavMovement()
  yield("/li Hawk")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-180.99783325195,4.0,182.45573425293,false) -- Fisherman's Guild 
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-154.0831451416,1.9499998092651,240.47909545898,false)
  VNavMovement()
  yield("/target Lonwoerd") --Gil/XP Quests Marked for Turnin
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-180.99783325195,4.0,182.45573425293,false) -- Fisherman's Guild 
  VNavMovement()

-- Taking elevator back to the top to get the aftcastle one set
  yield("/li Limsa")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-99.624862670898,18.000333786011,16.530649185181,false)
  VNavMovement()
  yield("/target Sweetnix Rosycheeks")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-62.043544769287,18.000333786011,7.2772459983826,false)
  VNavMovement()
  yield("/target J'nasshym") --Gil/XP Quests TurnedIn
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-2.2985215187073,20.388378143311,6.1517596244812,false) -- movement near lift attendy
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
  PathMoveTo(13.979390144348,40.000003814697,71.650901794434,false) -- Aftcastle/GC
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-54.091522216797,41.999923706055,-130.0699005127,false) -- Cul Guild
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(-66.637710571289,42.02001953125,-138.17468261719,false)
  VNavMovement()
  yield("/target H'lahono") --HandsQuest
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(0.65065896511078,44.000003814697,-165.0496673584,false)
  VNavMovement()
  yield("/target Mordyn") --GilQuest
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(15.509805679321,47.600006103516,-160.78062438965,false)
  VNavMovement()  
  yield("/target Carvallain") --GilQuest
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathMoveTo(0.86121982336044,44.999759674072,-241.59284973145,false)
  VNavMovement()
  PathMoveTo(-1.891327381134,44.999786376953,-241.65409851074,false)
  VNavMovement()
  yield("/target Ginnade") --GilQuest
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Ginnade") --GilQuest
  yield("/wait 0.5")
  QuestNPC()
  --MarauderNPC--
  PathMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  PathMoveTo(-7.9256439208984,44.999835968018,-246.92102050781)
  VNavMovement()
  yield("/target Blauthota") --Last Objective of MSQ
  QuestNPC()
  yield("/target Blauthota") --Pickup Marauder Class Quest
  QuestNPC()
  PathMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --Marauder ClassQuest1
  yield("/pint")
  yield("/wait 0.5")
  while not IsAddonVisible("SelectYesno") do
      yield("/wait 0.1")
  end
  yield("/pcall SelectYesno true 0")
  yield("/wait 7")
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/target Aethernet Shard")
  yield("/li limsa")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-8.6731939315796,20.000003814697,-0.83659130334854,false)
  VNavMovement()
  yield("/target N'delika")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(19.416982650757,20.0,3.5375361442566,false)
  VNavMovement()
  yield("/target Abylfarr") --HandsQuest
  QuestNPC()
  yield("/wait 0.5")
  PathMoveTo(65.304870605469,19.673780441284,0.74774837493896,false)
  VNavMovement()
  ZoneTransitions()
  
  --Now in MiddleLaNoscea
  
  PathMoveTo(27.884315490723,43.61890411377,149.46348571777,false)
  VNavMovement()
  --CombatForMarauder1
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
  PathMoveTo(31.630186080933,34.72444152832,175.53524780273,false)
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
  PathMoveTo(55.143421173096,45.814811706543,180.3857421875,false)
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
  --Doing 2 More Zones to Cover Kills
  yield("/wait 1")
  PathMoveTo(83.712463378906,46.939876556396,181.04679870605,false)
  VNavMovement()
  --CombatZone4
  QuestCount = 1
  while QuestCount <= 3 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone4Done
  yield("/wait 1")
  PathMoveTo(122.27583312988,50.257888793945,180.28672790527,false)
  VNavMovement()
  --CombatZone5
  QuestCount = 1
  while QuestCount <= 4 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone5Done
  --Back To Town for Turnin--
  yield("/wait 2")
  yield("/echo CombatDone")
  PathMoveTo(-52.371814727783,33.775688171387,160.22235107422,false)
  VNavMovement()
  ZoneTransitions()
  PathMoveTo(-78.917869567871,18.800325393677,-1.6075956821442,false) -- Main Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  yield("/li mara")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --Marauder ClassQuest1TurnIn
  QuestNPC()
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/li cul")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-66.637710571289,42.02001953125,-138.17468261719,false)
  VNavMovement()
  yield("/target H'lahono") --HandsQuestTurnIn
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-54.498607635498,44.174835205078,-149.12669372559,false)
  VNavMovement()
  yield("/target Lyngsath")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(15.509805679321,47.600006103516,-160.78062438965,false)
  VNavMovement()  
  yield("/target Carvallain") --GilQuestTurnIn
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/wait 0.5")
  yield("/li aft")
  QuestNPC()
  PathMoveTo(17.951627731323,40.216011047363,-5.4437046051025,false) --AftCastle
  VNavMovement()
  yield("/target Baderon")
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Baderon")
  yield("/wait 0.5")
  QuestNPC()
  yield("/wait 1")
  yield("/echo COMPLETE up to OnToSummerford")
  
  --Clearing HowTo Spam (Still Need To Find the Correct Amount HERE!!!)
  -- NotificationSpam = 1
  -- while NotificationSpam <= 16 do
  -- yield("/pcall HowToNotice True 1")
  -- yield("/wait 0.1")
  -- end
  -- yield("/pcall HowTo True -1")
  -- yield("/wait 1")
  
  --MarauderQuest2--
  
  PathMoveTo(13.979390144348,40.000003814697,71.650901794434,false) -- Aftcastle/GC
  VNavMovement()
  yield("/li mara")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --MarauderQuest2PickUp
  QuestNPC()
  PathMoveTo(0.95664918422699,30.47562789917,-243.90733337402,false)
  VNavMovement()
  yield("/target Broenbhar")
  QuestNPC()
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/li zeph")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-51.298538208008,43.705871582031,89.055526733398,false)
  VNavMovement()
  PathMoveTo(-59.387577056885,43.6589012146,44.600933074951,false)
  VNavMovement()
  yield("/target Rhotgeim")
  QuestNPC()
  PathMoveTo(-68.036102294922,43.558475494385,21.417110443115,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathMoveTo(-52.836452484131,46.060787200928,16.763906478882,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathMoveTo(-74.146026611328,43.199932098389,5.0597648620605,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathMoveTo(-59.387577056885,43.6589012146,44.600933074951,false)
  VNavMovement()
  yield("/target Rhotgeim")
  QuestNPC()
  PathMoveTo(-13.616562843323,46.429695129395,31.857374191284,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathMoveTo(-14.428750038147,47.369762420654,14.010503768921,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathMoveTo(0.063758663833141,48.234233856201,9.8540506362915,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathMoveTo(-59.387577056885,43.6589012146,44.600933074951,false)
  VNavMovement()
  yield("/target Rhotgeim")
  QuestNPC()
  PathMoveTo(-52.371814727783,33.775688171387,160.22235107422,false)
  VNavMovement()
  ZoneTransitions()
  PathMoveTo(-78.917869567871,18.800325393677,-1.6075956821442,false) -- Main Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  yield("/li mara")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --MarauderQuest2MidWay
  QuestNPC()
  PathMoveTo(-3.604177236557,31.475637435913,-256.73098754883,false)
  VNavMovement()
  yield("/target Solkwyb")
  QuestNPC()
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/li temp")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(6.4717974662781,65.053382873535,96.684936523438,false)
  VNavMovement()
  --ComabtZone1(HuntLogLady/Rat)
  QuestCount = 1
  while QuestCount <= 6 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone1Done
  yield("/wait 1")
  PathMoveTo(154.49647521973,40.158256530762,39.757175445557,false)
  VNavMovement()
   --ComabtZone1(HuntLogJelly)
  QuestCount = 1
  while QuestCount <= 3 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone1Done
  yield("/wait 1")
  PathMoveTo(177.40928649902,40.227787017822,52.60814666748,false)
  VNavMovement()
  yield("/wait 1")
  --ComabtZone2(HuntLogJelly)
  QuestCount = 1
  while QuestCount <= 3 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone1Done
  yield("/wait 1")
  PathMoveTo(126.60077667236,35.722774505615,41.863372802734,false)
  VNavMovement()
  PathMoveTo(130.02513122559,35.873977661133,30.906391143799,false)
  VNavMovement()
  yield("/target Megalocrab Nest")
  QuestNPC()
  PathMoveTo(163.25636291504,33.950466156006,69.154777526855,false)
  VNavMovement()
  PathMoveTo(155.53428649902,33.701583862305,87.744407653809,false)
  VNavMovement()
  QuestInstance() --MRDLv5QuestInstance
  yield("/wait 4")
  ZoneTransitions()
  yield("/wait 5")
  yield("/rotation cancel")
  yield("/wait 1")
  PathMoveTo(97.347503662109,44.301445007324,130.72618103027,false)
  VNavMovement()
  PathMoveTo(-66.549263000488,75.841918945313,116.06774902344,false)
  VNavMovement()
  ZoneTransitions()
  PathMoveTo(13.979390144348,40.000003814697,71.650901794434,false) -- Aftcastle/GC
  VNavMovement()
  yield("/li mara")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --MarauderQuest2TurnIn
  QuestNPC()
  
  --AFTER MarauderQuest2
  
  PathMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/li hawk")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-158.54499816895,18.0,34.706218719482,false)
  VNavMovement()
  PathMoveTo(-155.60202026367,18.200000762939,23.272695541382,false)
  VNavMovement()
  
  --ShoppingToTheMax--
  
  yield("/target Iron Thunder")
  yield("/wait 1")
  yield("/pint")
  yield("/wait 1")
  yield("/pcall SelectIconString true 0")
  yield("/wait 1")
  yield("/pcall SelectString true 0")
  yield("/wait 1")
    if GetItemCount(2653) == 0 then --head
  yield("/wait 1")
  yield("/pcall Shop true 0 1 1")
  yield("/wait 1")
  yield("/pcall SelectYesno true 0")
  yield("/wait 1")
    end 
    if GetItemCount(2999) == 0 then --body
  yield("/wait 1")
  yield("/pcall Shop true 0 5 1")
  yield("/wait 1")
  yield("/pcall SelectYesno true 0")
  yield("/wait 1")
    end 
    if GetItemCount(3311) == 0 then --legs
  yield("/wait 1")
  yield("/pcall Shop true 0 9 1")
  yield("/wait 1")
  yield("/pcall SelectYesno true 0")
  yield("/wait 1")
    end 
  yield("/wait 1")
  yield("/echo Lv5AllBought")
  yield("/pcall Shop true -1")
  yield("/wait 1")
  yield("/pcall SelectString true 5")
  yield("/wait 5")
  yield("/equip")
  yield("/wait 3")
  yield("/echo Ready For Summerford!")
  
  --Starting OnToSummerford
  
  PathMoveTo(-214.33099365234,15.99905872345,50.48551940918,false) -- Hawker's Alley
  VNavMovement()
  yield("/target Aethernet Shard")
  yield("/li zeph")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(49.247787475586,49.565105438232,44.474590301514,false) --Bridge To Summerford
  VNavMovement()
  PathMoveTo(83.612861633301,64.659301757813,-160.05340576172,false) --HuntLogZone1
  VNavMovement()
  --CombatZone1
  QuestCount = 1
  while QuestCount <= 3 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone1Done
  PathMoveTo(114.22240447998,75.805595397949,-193.7717590332,false) --HuntLogZone2
  VNavMovement()
  --CombatZone2
  QuestCount = 1
  while QuestCount <= 4 do 
    QuestCombat()
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1
  --CombatZone2Done
  PathMoveTo(134.70129394531,85.724945068359,-217.11079406738,false) --HuntLogZone3
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
  PathMoveTo(223.61380004883,113.09998321533,-258.57131958008,false) --Pathing To Summerford Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(204.98315429688,112.51494598389,-221.57643127441,false)
  VNavMovement()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  --GearReqQuestAccepted
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  yield("/wait 3")
  yield("/echo GearMSQQuestCOMPLETE")
  
  --GearMSQComplete--
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  PathMoveTo(-58.33943939209,26.293321609497,-125.64200592041,false)
  VNavMovement()w