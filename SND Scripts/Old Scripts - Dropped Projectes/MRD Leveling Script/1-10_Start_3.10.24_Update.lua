 --[[ 
 Start of the script

    V.0.0.10.7.3

    From Ice: updated flowers | broke it up into more modular to copy/paste ease
              

    Last updated: 3.9.24
    -> things that we need to go back to and fix 
      -> add 2 waypoints before mrd guild to make targeting npc consistent (had 4 issues w/ that guy weirdly enough)
      -> Figure out MSQ Quest near the middle na noscea aetherrite (stupid npcs)
        -> read text from hunting log? 
      


    !!!Required Plugins & Settings!!!
        SND:....Duh
        vnavmesh: Settings: NavmeshManager >>> Toggle: Align Camera to Movement Direction
        TextAdvance: This plugin will be activated at the start of the script with /at. DO NOT manually turn it on.
        Settings: GeneralConfig >>> Toggle: Automatic Reward Pickup >>> At bottom of settings, move "Equippable item for current job" to top of priority
        SimpleTweaks: Search for "equip" >>> Toggle: Equip Recommended Command >>> Hit drop down arrow next to Toggle >>> Change command to "/equip"
        LifeStream
        Teleporter: This and LifeStream are used for handling all teleport and aethernet usage.
  ]]

 --Functions
    function VNavMovement() --Used to Do NOTHING While Moving
        repeat
        yield("/wait 0.1")
        until not PathIsRunning()
    end

    function ZoneTransitions() --Used At ALL Zone Transitions for /wait
        repeat 
             yield("/wait 0.1")
        until GetCharacterCondition(45, true) or GetCharacterCondition(51, true)
        repeat 
            yield("/wait 0.1")
        until GetCharacterCondition(45, false) or GetCharacterCondition(51, false)
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
    
    --ALWAYS takes target = X
    --ALWAYS takes enemy_max_dist = X
    function QuestCombat(target) -- Targeting/Movement Logic for Overworld
    local current_target = target
    -- Targeting loop
    for _ = 1, 10 do
        yield("/target " .. target)
        current_target = GetTargetName()
        if current_target == "" then
            yield("/wait 0.2")
        elseif current_target == target then
            break
        end
    end
    -- Target evaluation
    if GetTargetName() == target then
        local BestTarget, LowestDistance = 0, 0
        -- Finding the best target
        for i = 0, 10 do
            yield("/target " .. target .. " <list." .. i .. ">")
            yield("/wait 0.1")

            if GetTargetName() == target and GetTargetHP() > 0 then
                local dist_to_target = GetDistanceToTarget()
                if dist_to_target <= enemy_max_dist then
                    if BestTarget == 0 or dist_to_target < LowestDistance then
                        BestTarget = i
                        LowestDistance = dist_to_target
                    end
                end
            end
        end
        -- Target switching
        if BestTarget > 0 then
            yield("/target " .. target .. " <list." .. BestTarget .. ">")
            yield("/wait 0.5")
        end
    end
    -- Movement logic
    if GetTargetName() == target and GetTargetHP() > 0 then
        local dist_to_enemy = GetDistanceToTarget()
      if dist_to_enemy >= 0 and dist_to_enemy <= enemy_max_dist then
          repeat
            yield("/vnavmesh movetarget")
            yield("/wait 0.1")
            yield("/rotation manual")
          until GetDistanceToTarget() <= 3
            yield("/vnavmesh stop")
	      end
        repeat
          yield("/wait 0.1")
        until GetTargetHP() == 0
		  yield("/wait 0.5")
	  end
	end

    --ALWAYS takes target = X
    --ALWAYS takes enemy_max_dist = X
    function QuestCombat(target1, target2)
    local allTargets = {target1, target2}
    local combinedList = {}
    local BestTarget = 0
    local LowestDistance = 0
    for _, current_target in ipairs(allTargets) do
        local currentList = {}
        for i = 0, 20 do
            yield("/target " .. current_target .. " <list." .. i .. ">")
            yield("/wait 0.1")
            local currentTargetName = GetTargetName()
            if (currentTargetName == target1 or currentTargetName == target2) and GetTargetHP() > 0 and GetDistanceToTarget() <= enemy_max_dist then
                local distance = GetDistanceToTarget()
                table.insert(currentList, {target = current_target, index = i, distance = distance})
            end
        end
        table.sort(currentList, function(a, b) return a.distance < b.distance end)
        if #currentList > 0 and (BestTarget == 0 or currentList[1].distance < LowestDistance) then
            BestTarget = #combinedList + 1
            LowestDistance = currentList[1].distance
        end
        for _, entry in ipairs(currentList) do
            table.insert(combinedList, entry)
        end
    end
    if BestTarget > 0 then
        local bestEntry = combinedList[BestTarget]
        yield("/target " .. bestEntry.target .. " <list." .. bestEntry.index .. ">")
        yield("/wait 0.5")

        local dist_to_enemy = GetDistanceToTarget()

        if GetTargetHP() > 0 and dist_to_enemy <= enemy_max_dist then
          repeat
            yield("/vnavmesh movetarget")
            yield("/wait 0.1")
            yield("/rotation manual")
          until GetDistanceToTarget() <= 3
            yield("/vnavmesh stop")
        end
      end
        repeat
          yield("/wait 0.1")
        until GetTargetHP() == 0
          yield("/wait 0.5")
    end

    function QuestInstance() -- Targetting/Movement Logic for Solo Duties
    while true do
      if IsPlayerAvailable() == false then
        yield("/wait 1")
        yield("/pcall SelectYesno true 0")
      elseif GetCharacterCondition(1) == true then
        yield("/pint")
        yield("/wait 1")
        while IsPlayerCasting() do 
          yield("/wait 0.5")
	    end
        repeat 
          yield("/wait 0.1")
	    until IsAddonVisible("SelectYesno")
        repeat 
          yield("/pcall SelectYesno true 0")
          yield("/wait 0.1")
        until IsAddonVisible("SelectYesno") == false
      end
        if not IsPlayerAvailable() and GetCharacterCondition(26, false) then
            repeat
                yield("/wait 0.1")
            until GetCharacterCondition(34, true)
        else
            local paused = false
            while GetCharacterCondition(34, true) do
                if paused then
                    repeat
                        yield("/wait 0.1")
                    until GetCharacterCondition(26, false)
                    paused = false
                else
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
                    
                    if dist_to_enemy and dist_to_enemy > 0 and dist_to_enemy <= enemy_max_dist then
                        local enemy_x, enemy_y, enemy_z = GetTargetRawXPos(), GetTargetRawYPos(), GetTargetRawZPos()
                        yield("/vnavmesh moveto " .. enemy_x .. " " .. enemy_y .. " " .. enemy_z)
                        yield("/wait 3")
                        yield("/vnavmesh stop")  
                    end
                    
                    -- Check condition to pause
                    if not IsPlayerAvailable() or not GetCharacterCondition(26, true) then
                        paused = true
                   end
                end
             end
          end
       end
    end



-- Phase 1 | Close to Home Quest(MSQ#1)-- Quest #1 | loading Into Limsa
  yield("/at y") -- enables AdvancedText
  yield("/target Ryssfloh")
  yield("/vnavmesh movetarget")
  VNavMovement()
  yield("/pint")
  QuestNPC()
  
  -- Movement to the elevator
  PathfindAndMoveTo(-6.1722960472107,20.265306472778,3.9637887477875,false)
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
  PathfindAndMoveTo(17.951627731323,40.216011047363,-5.4437046051025,false)
  VNavMovement()
  yield("/target Baderon")
  yield("/wait 0.5")
  yield("/pint")
  QuestNPC()
  -- Start of MSQ Questline | MSQ #1
  yield("/target Baderon")
  yield("/wait 0.5")
  yield("/pint")
  QuestNPC()

  -- Mini-side quest(required) | Making a Name (SQ#1)

    PathfindAndMoveTo(8.1509618759155,39.517570495605,2.6219840049744,false)
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
    PathfindAndMoveTo(4.9933366775513,20.0,9.7082824707031,false)   
    VNavMovement()       
    yield("/wait 0.5")   
  -- once downstairs, targeting peculiar herb

    
    while GetNodeText("_ToDoList", 17, 3) ~= "Deliver the peculiar herbs to Ahldskyf." do 
      yield("/target Peculiar Herb")
      yield("/vnavmesh movetarget")
      VNavMovement()
      yield("/pint")
      yield("/wait 0.5")
	  repeat
	    yield("/wait 0.1")
	  until IsPlayerAvailable()
      GetNodeText("_ToDoList", 17, 3)
    end
  
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
  
-- Phase 2 | Aetheryte Spots | Main Floor | Back to (MSQ#1)
  -- 1: Main Aetheryte
  PathfindAndMoveTo(-78.917869567871,18.800325393677,-1.6075956821442,false) -- Main Aetheryte (#1/3 )
  VNavMovement()
  yield("/target Aetheryte")
  QuestNPC()
  PathfindAndMoveTo(-62.043544769287,18.000333786011,7.2772459983826,false) -- Start Quests for Gil/XP
  VNavMovement()
  yield("/target J'nasshym")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-99.624862670898,18.000333786011,16.530649185181,false)  -- Start Quests for Gil/XP
  VNavMovement()
  yield("/target Sweetnix Rosycheeks")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-104.21018218994,18.000333786011,10.599261283875,false)  -- small detour, remove when fixed
  VNavMovement()
  PathfindAndMoveTo(-140.09278869629,18.200000762939,18.263156890869,false)  -- Talking to MSQ Quest Dude (#2/3 Completed)
  VNavMovement()   
  yield("/target Swozblaet")   
  QuestNPC()    
  PathfindAndMoveTo(-214.33099365234,15.99905872345,50.48551940918,false) -- Hawker's Alley
  VNavMovement()  
  yield("/target Aethernet Shard")
  QuestNPC()
  PathfindAndMoveTo(-216.37718200684,15.999116897583,47.992137908936,false) -- small detour, remove when fixed
  VNavMovement()
  PathfindAndMoveTo(-333.44641113281,11.999345779419,55.036689758301,false) -- Arcanist Guild
  VNavMovement()  
  yield("/target Aethernet Shard")
  QuestNPC()
  PathfindAndMoveTo(-341.58633422852,12.899764060974,5.7203345298767,false)
  VNavMovement()
  yield("/target P'tahjha")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-333.44641113281,11.999345779419,55.036689758301,false)
  VNavMovement()
  yield("/li Hawk")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-180.99783325195,4.0,182.45573425293,false) -- Fisherman's Guild 
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathfindAndMoveTo(-154.0831451416,1.9499998092651,240.47909545898,false)
  VNavMovement()
  yield("/target Lonwoerd") --Gil/XP Quests Marked for Turnin
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-180.99783325195,4.0,182.45573425293,false) -- Fisherman's Guild 
  VNavMovement()

-- Phase 3 | Taking elevator back to the top to get the aftcastle one set
  yield("/li Limsa")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-99.624862670898,18.000333786011,16.530649185181,false)
  VNavMovement()
  yield("/target Sweetnix Rosycheeks")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-62.043544769287,18.000333786011,7.2772459983826,false)
  VNavMovement()
  yield("/target J'nasshym") --Gil/XP Quests TurnedIn
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-2.2985215187073,20.388378143311,6.1517596244812,false) -- movement near lift attendy
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
  
-- Phase 4 | Aftcastle Area
  PathfindAndMoveTo(13.979390144348,40.000003814697,71.650901794434,false) -- Aftcastle/GC
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathfindAndMoveTo(-54.091522216797,41.999923706055,-130.0699005127,false) -- Cul Guild
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathfindAndMoveTo(-66.637710571289,42.02001953125,-138.17468261719,false)
  VNavMovement()
  yield("/target H'lahono") --HandsQuest
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(0.65065896511078,44.000003814697,-165.0496673584,false)
  VNavMovement()
  yield("/target Mordyn") --GilQuest
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(16.728298187256,47.600006103516,-156.17373657227, false) -- Testing camera movement here
  VNavMovement()
  PathfindAndMoveTo(15.509805679321,47.600006103516,-160.78062438965,false) -- need to add a waypoint before here to turn this stupid fucking camera
  VNavMovement()  
  yield("/target Carvallain") --GilQuest
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/target Aethernet Shard")
  QuestNPC()
  PathfindAndMoveTo(0.86121982336044,44.999759674072,-241.59284973145,false)
  VNavMovement()
  PathfindAndMoveTo(-1.891327381134,44.999786376953,-241.65409851074,false)
  VNavMovement()
  yield("/target Ginnade") --GilQuest
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Ginnade") --GilQuest
  yield("/wait 0.5")
  QuestNPC()

-- Phase 5 | MarauderNPC 
  PathfindAndMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  PathfindAndMoveTo(-7.9256439208984,44.999835968018,-246.92102050781)
  VNavMovement()
  yield("/target Blauthota") --Last Objective of MSQ
  QuestNPC()
  yield("/target Blauthota") --Pickup Marauder Class Quest
  QuestNPC()
  PathfindAndMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --Marauder ClassQuest1
  yield("/pint")
  yield("/wait 0.5")
  while not IsAddonVisible("SelectYesno") do
    yield("/wait 0.1")
  end
  yield("/pcall SelectYesno true 0")
  yield("/wait 7")
  PathfindAndMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/target Aethernet Shard")
  yield("/li limsa")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-8.6731939315796,20.000003814697,-0.83659130334854,false)
  VNavMovement()
  yield("/target N'delika")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(19.416982650757,20.0,3.5375361442566,false)
  VNavMovement()
  yield("/target Abylfarr") --HandsQuest
  QuestNPC()
  yield("/wait 0.5")
  PathfindAndMoveTo(65.304870605469,19.673780441284,0.74774837493896,false)
  VNavMovement()
  ZoneTransitions()
  
-- Phase 6 | Now in MiddleLaNoscea

  --CombatForMarauder1
--FATE check
    if GetNearestFate() == 227 then
      PathfindAndMoveTo(73.479949951172,46.919898986816,129.80227661133)
      VNavMovement()
    end

  target = "Lost Lamb"
  enemy_max_dist = 40
    while GetNearestFate() == 227 do
      QuestCombat(target)
    end

    if GetNearestFate() ~= 227 then
      PathfindAndMoveTo(32.437065124512,44.1100730896,148.72560119629)
      VNavMovement() 
      QuestACheck = GetNodeText("_ToDoList", 20, 3)
    end

  target = "Wharf Rat"
  enemy_max_dist = 20
-- yield("/e Get Node Text: "..VariableNameHere)
    while QuestACheck ~= "Slay wharf rats." do 
      QuestCombat(target)
      QuestACheck = GetNodeText("_ToDoList", 20, 3)
    end
  -- Wharf Rats Killed
  
  -- Combat Zone 2 | Ladybug Kills 

  yield("/wait 1")
  PathfindAndMoveTo(25.784727096558,32.698993682861,182.25621032715)
  VNavMovement() 

  QuestACheck = GetNodeText("_ToDoList", 22, 3)
  target = "Little Ladybug"
  enemy_max_dist = 20
-- yield("/e Get Node Text: "..VariableNameHere)
    while QuestACheck ~= "Slay little ladybugs." do 
      QuestCombat(target)
      QuestACheck = GetNodeText("_ToDoList", 22, 3)
    end
  --Little Ladybugs Killed

  yield("/wait 1")

--FATE check
    if GetNearestFate() == 227 then
      PathfindAndMoveTo(73.479949951172,46.919898986816,129.80227661133)
      VNavMovement()
    end

  target = "Lost Lamb"
  enemy_max_dist = 40
    while GetNearestFate() == 227 do
      QuestCombat(target)
    end

    if GetNearestFate() ~= 227 then
      PathfindAndMoveTo(117.1192779541,50.075611114502,179.3766784668) --Kill Lambs for quest and Lv4
      VNavMovement()
      QuestACheck = GetNodeText("_ToDoList", 21, 3)
    end

  target = "Lost Lamb"
  enemy_max_dist = 20
-- yield("/e Get Node Text: "..VariableNameHere)
    while QuestACheck ~= "Report to Axemaster Wyrnzoen at the Marauders' Guild." do 
      QuestCombat(target)
      QuestACheck = GetNodeText("_ToDoList", 20, 3)
    end
  -- 3/3 sheep killed here

  -- Sheep Killing time, for the quest "A sheepish Request"
  -- Need to kill 1 more sheep for this quest
  yield("/wait 1")
  PathfindAndMoveTo(117.1192779541,50.075611114502,179.3766784668) --Kill Lambs for quest and Lv4
  VNavMovement()

  target = "Lost Lamb"
  enemy_max_dist = 20
  QuestACheck = GetNodeText("_ToDoList", 17, 3)
  while QuestACheck ~= "Deliver the slices of fresh lamb to H'lahono." do 
    QuestCombat(target)
    QuestACheck = GetNodeText("_ToDoList", 17, 3)
  end

  -- Making sure you're Level 4, should be enough for the quest

  yield("/wait 1")
  PathfindAndMoveTo(117.1192779541,50.075611114502,179.3766784668) --Kill Lambs for quest and Lv4
  VNavMovement()

  -- Leveling Combat
  CurrentLevel = GetLevel()
  target = "Lost Lamb"
  enemy_max_dist = 40
  while CurrentLevel < 4 do 
    QuestCombat(target)
	CurrentLevel = GetLevel()
  end

  --Leveling Combat is Completed 

-- Phase 7 | Back To Town for Turnin
  yield("/wait 2")
  yield("/echo CombatDone")
  PathfindAndMoveTo(60.959041595459,45.337265014648,163.48120117188)
  VNavMovement()
  PathfindAndMoveTo(-52.371814727783,33.775688171387,160.22235107422,false)
  VNavMovement()
  ZoneTransitions()
  PathfindAndMoveTo(-78.917869567871,18.800325393677,-1.6075956821442,false) -- Main Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  yield("/li mara")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --Marauder ClassQuest1TurnIn
  QuestNPC()
  PathfindAndMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/li cul")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-66.637710571289,42.02001953125,-138.17468261719,false)
  VNavMovement()
  yield("/target H'lahono") --HandsQuestTurnIn
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-54.498607635498,44.174835205078,-149.12669372559,false)
  VNavMovement()
  yield("/target Lyngsath")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-45.557144165039,39.473575592041,-158.25939941406)
  VNavMovement()
  PathfindAndMoveTo(0.65065896511078,44.000003814697,-165.0496673584,false)
  VNavMovement()
  PathfindAndMoveTo(16.728298187256,47.600006103516,-156.17373657227, false) -- Testing camera movement here
  VNavMovement()
  PathfindAndMoveTo(15.509805679321,47.600006103516,-160.78062438965,false)
  VNavMovement()  
  yield("/target Carvallain") --GilQuestTurnIn
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/wait 0.5")
  yield("/li aft")
  QuestNPC()
  
  --Major pathing issue at this waypoint nav. Goes to bridge, then out towards the staits, THEN to the actual waypoint(Does NOT break script)
  PathfindAndMoveTo(17.951627731323,40.216011047363,-5.4437046051025,false) --AftCastle
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
  
-- Phase 8 | Lv. 5 MarauderQuest2
  
  PathfindAndMoveTo(13.979390144348,40.000003814697,71.650901794434,false) -- Aftcastle/GC
  VNavMovement()
  yield("/li mara")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --MarauderQuest2PickUp
  QuestNPC()
  PathfindAndMoveTo(0.95664918422699,30.47562789917,-243.90733337402,false)
  VNavMovement()
  yield("/target Broenbhar")
  QuestNPC()
  PathfindAndMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/li zeph")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-51.298538208008,43.705871582031,89.055526733398,false)
  VNavMovement()
  PathfindAndMoveTo(-59.387577056885,43.6589012146,44.600933074951,false)
  VNavMovement()
  yield("/target Rhotgeim")
  QuestNPC()
  PathfindAndMoveTo(-68.036102294922,43.558475494385,21.417110443115,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathfindAndMoveTo(-52.836452484131,46.060787200928,16.763906478882,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathfindAndMoveTo(-74.146026611328,43.199932098389,5.0597648620605,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathfindAndMoveTo(-59.387577056885,43.6589012146,44.600933074951,false)
  VNavMovement()
  yield("/target Rhotgeim")
  QuestNPC()
  PathfindAndMoveTo(-50.618251800537,45.443103790283,31.108413696289) --RockPathing
  VNavMovement()
  PathfindAndMoveTo(-13.616562843323,46.429695129395,31.857374191284,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathfindAndMoveTo(-14.428750038147,47.369762420654,14.010503768921,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathfindAndMoveTo(0.063758663833141,48.234233856201,9.8540506362915,false)
  VNavMovement()
  yield("/target Solid Rock")
  yield("/wait 1")
  yield("/ac \"Heavy Swing\"")
  yield("/wait 1")
  PathfindAndMoveTo(-59.387577056885,43.6589012146,44.600933074951,false)
  VNavMovement()
  yield("/target Rhotgeim")
  QuestNPC()
  PathfindAndMoveTo(-52.371814727783,33.775688171387,160.22235107422,false)
  VNavMovement()
  ZoneTransitions()
  PathfindAndMoveTo(-78.917869567871,18.800325393677,-1.6075956821442,false) -- Main Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  yield("/li mara")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --MarauderQuest2MidWay
  QuestNPC()
  PathfindAndMoveTo(-3.604177236557,31.475637435913,-256.73098754883,false)
  VNavMovement()
  yield("/target Solkwyb")
  QuestNPC()
  PathfindAndMoveTo(-4.3582139015198,43.999992370605,-220.13581848145) --New TP WP 
  VNavMovement()
  yield("/li temp")
  ZoneTransitions()
  PathfindAndMoveTo(6.4717974662781,65.053382873535,96.684936523438,false)
  VNavMovement()

-- Phase 9 | HuntingLog(Wharf Rat/Little Ladybug)
    yield("/wait 2")
    yield("/maincommand Hunting Log")
    yield("/wait 0.5")
    yield("/pcall MonsterNote true 2 2 0")
    target = "Wharf Rat"
    enemy_max_dist = 50
    HuntingLog = GetNodeText("MonsterNote", 2, 19, 4)
       while HuntingLog == "Wharf Rat" do
         QuestCombat(target)
         HuntingLog = GetNodeText("MonsterNote", 2, 19, 4)
       end
  
    target = "Little Ladybug"
    enemy_max_dist = 50
    HuntingLog = GetNodeText("MonsterNote", 2, 18, 4)
       while HuntingLog == "Little Ladybug" do
         QuestCombat(target)
         HuntingLog = GetNodeText("MonsterNote", 2, 18, 4)
       end
    yield("/wait 0.5")
    yield("/maincommand Hunting Log")
--HuntingLog #1/2 Done
  yield("/wait 1")
  PathfindAndMoveTo(154.49647521973,40.158256530762,39.757175445557,false)
  VNavMovement()

--Check for FATE
    if GetNearestFate() == 249 then
      PathfindAndMoveTo(132.9976348877,35.688209533691,46.381507873535) --FATE near Crab NEST
      VNavMovement()
    end

    target = "Cane Toad"
    enemy_max_dist = 100
    while GetNearestFate() == 249 do
      QuestCombat(target)
    end
--FATE Clear

  yield("/wait 1")

--HuntingLog(Aurelia)
    yield("/maincommand Hunting Log")
    yield("/wait 0.5")
    yield("/pcall MonsterNote true 2 2 0")
    target = "Aurelia"
    enemy_max_dist = 50
    HuntingLog = GetNodeText("MonsterNote", 2, 18, 4)
       while HuntingLog == "Aurelia" do
         QuestCombat(target)
         HuntingLog = GetNodeText("MonsterNote", 2, 18, 4)
       end
    yield("/wait 0.5")
    yield("/maincommand Hunting Log")

--HuntingLog #3 Done
  yield("/wait 1")
  PathfindAndMoveTo(126.60077667236,35.722774505615,41.863372802734,false)
  VNavMovement()
  PathfindAndMoveTo(130.02513122559,35.873977661133,30.906391143799,false)
  VNavMovement()
  yield("/target Megalocrab Nest")
  QuestNPC()
  PathfindAndMoveTo(163.25636291504,33.950466156006,69.154777526855,false)
  VNavMovement()
  PathfindAndMoveTo(155.53428649902,33.701583862305,87.744407653809,false)
  VNavMovement()
  QuestInstance() --MRDLv5QuestInstance
  yield("/wait 5")
  yield("/rotation cancel")
  yield("/wait 1")
  PathfindAndMoveTo(97.347503662109,44.301445007324,130.72618103027,false)
  VNavMovement()
  PathfindAndMoveTo(-66.549263000488,75.841918945313,116.06774902344,false)
  VNavMovement()
  ZoneTransitions()
  PathfindAndMoveTo(13.979390144348,40.000003814697,71.650901794434,false) -- Aftcastle/GC
  VNavMovement()
  yield("/li mara")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-4.2817740440369,45.631217956543,-257.67599487305,false)
  VNavMovement()
  yield("/target Wyrnzoen") --MarauderQuest2TurnIn
  QuestNPC()
  
-- Phase 10 | AFTER MarauderQuest2
  
  PathfindAndMoveTo(-2.6799099445343,43.999996185303,-217.53343200684,false) -- Murauders Guild TP
  VNavMovement()
  yield("/li hawk")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-158.54499816895,18.0,34.706218719482,false)
  VNavMovement()
  PathfindAndMoveTo(-155.60202026367,18.200000762939,23.272695541382,false)
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
  
  PathfindAndMoveTo(-214.33099365234,15.99905872345,50.48551940918,false) -- Hawker's Alley
  VNavMovement()
  yield("/target Aethernet Shard")
  yield("/li zeph")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(49.247787475586,49.565105438232,44.474590301514,false) --Bridge To Summerford
  VNavMovement()
  PathfindAndMoveTo(83.612861633301,64.659301757813,-160.05340576172,false) --HuntLogZone1
  VNavMovement()

--HuntingLog(Tiny Mandragora/Bee Cloud)
    yield("/maincommand Hunting Log")
    yield("/wait 0.5")
    yield("/pcall MonsterNote true 2 2 0")
    target = "Tiny Mandragora"
    enemy_max_dist = 30
    HuntingLog = GetNodeText("MonsterNote", 2, 20, 3)
       while HuntingLog ~= "2/3" do
         QuestCombat(target)
         HuntingLog = GetNodeText("MonsterNote", 2, 20, 3)
       end
    yield("/wait 0.5")

    target = "Bee Cloud"
    enemy_max_dist = 50
    HuntingLog = GetNodeText("MonsterNote", 2, 18, 3)
       while HuntingLog ~= "1/3" do
         QuestCombat(target)
         HuntingLog = GetNodeText("MonsterNote", 2, 18, 3)
       end
    yield("/wait 0.5")
  
  PathfindAndMoveTo(114.22240447998,75.805595397949,-193.7717590332,false) --HuntLogZone2
  VNavMovement()

    target = "Tiny Mandragora"
    enemy_max_dist = 20
    HuntingLog = GetNodeText("MonsterNote", 2, 20, 4)
       while HuntingLog == "Tiny Mandragora" do
         QuestCombat(target)
         HuntingLog = GetNodeText("MonsterNote", 2, 20, 4)
       end
    yield("/wait 0.5")
  
    target = "Bee Cloud"
    enemy_max_dist = 50
    HuntingLog = GetNodeText("MonsterNote", 2, 18, 3)
       while HuntingLog ~= "2/3" do
         QuestCombat(target)
         HuntingLog = GetNodeText("MonsterNote", 2, 18, 3)
       end
    yield("/wait 0.5")
  
  PathfindAndMoveTo(134.70129394531,85.724945068359,-217.11079406738,false) --HuntLogZone3
  VNavMovement()
  
    target = "Bee Cloud"
    enemy_max_dist = 20
    HuntingLog = GetNodeText("MonsterNote", 2, 18, 4)
       while HuntingLog == "Bee Cloud" do
         QuestCombat(target)
         HuntingLog = GetNodeText("MonsterNote", 2, 18, 4)
       end
    yield("/wait 0.5")
    yield("/maincommand Hunting Log")
--End of HuntingLog #4/6

  PathfindAndMoveTo(223.61380004883,113.09998321533,-258.57131958008,false) --Pathing To Summerford Aetheryte
  VNavMovement()
  yield("/target Aetheryte")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(204.98315429688,112.51494598389,-221.57643127441,false)
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
  
-- Phase 11 | GearMSQComplete--
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  --Need to put combat zone for MRD HuntLog
  PathfindAndMoveTo(51.421283721924,64.135360717773,-196.59872436523)
  VNavMovement()
  PathfindAndMoveTo(-58.502807617188,25.932806015015,-139.03913879395)
  VNavMovement()
  yield("/target Stone Monument")
  yield("/wait 0.5")
  QuestInstance()
  yield("/wait 5")
  yield("/rotation cancel")
  PathfindAndMoveTo(204.70286560059,110.71823120117,-260.78509521484)
  VNavMovement()
  PathfindAndMoveTo(204.98315429688,112.51494598389,-221.57643127441,false)
  VNavMovement()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(192.50439453125,100.62660980225,-283.33264160156) --Waypoint to align with Wauter
  VNavMovement()
  PathfindAndMoveTo(195.50608825684,100.93323516846,-277.20611572266) --Wauter  #1
  VNavMovement()
  yield("/target Wauter")
  yield("/wait 0.5")
  
	if GetCharacterCondition(32, false) then
		yield("/pint")
		yield("/wait 3")
		yield("/send NUMPAD8")
		yield("/send NUMPAD0")
	end
	repeat
		yield("/wait 0.1")
	until IsPlayerAvailable()
		
  PathfindAndMoveTo(163.92828369141,92.26880645752,-189.3630065918)
  VNavMovement()
  PathfindAndMoveTo(165.78706359863,93.56795501709,-191.80377197266) --Sozai Rarzai  #2
  VNavMovement()
  yield("/target Sozai Rarzai")
  yield("/wait 0.5")
  
  if GetCharacterCondition(32, false) then
		yield("/pint")
		yield("/wait 3")
		yield("/send NUMPAD8")
		yield("/send NUMPAD0")
	end
	repeat
		yield("/wait 0.1")
	until IsPlayerAvailable()
		
  PathfindAndMoveTo(92.796020507813,65.586853027344,-254.96600341797) --Eyrimhus  #1
  VNavMovement()
  yield("/target Eyrimhus")
  yield("/wait 0.5")
  
	if GetCharacterCondition(32, false) then
		yield("/pint")
		yield("/wait 3")
		yield("/send NUMPAD8")
		yield("/send NUMPAD0")
	end
	repeat
		yield("/wait 0.1")
	until IsPlayerAvailable()
		
  PathfindAndMoveTo(19.934577941895,61.055458068848,-268.96914672852) --Aylmer  #1
  VNavMovement()
  yield("/target Aylmer")
  yield("/wait 0.5")
  
  	if GetCharacterCondition(32, false) then
		yield("/pint")
		yield("/wait 3")
		yield("/send NUMPAD8")
		yield("/send NUMPAD0")
	end
	repeat
		yield("/wait 0.1")
	until IsPlayerAvailable()
		
  PathfindAndMoveTo(-13.451251029968,60.000858306885,-249.49378967285)
  VNavMovement()
  PathfindAndMoveTo(32.501968383789,54.725826263428,-152.12467956543) --Sevrin  NO "Talk"
  VNavMovement()
  yield("/target Sevrin")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(48.333168029785,63.85338973999,-193.54249572754)
  VNavMovement()
  PathfindAndMoveTo(204.70286560059,110.71823120117,-260.78509521484)
  VNavMovement()
  PathfindAndMoveTo(204.98315429688,112.51494598389,-221.57643127441,false)
  VNavMovement()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(47.383068084717,47.643409729004,11.217027664185)
  VNavMovement()
  PathfindAndMoveTo(129.92631530762,45.640029907227,133.08485412598)
  VNavMovement()
  yield("/target Sevrin")
  yield("/wait 0.5")
  yield("/doubt")
  yield("/wait 0.5")
  while GetCharacterCondition(32, false) do
    yield("/wait 0.1")
  end
  repeat
    yield("/wait 0.1")
  until IsPlayerAvailable()
  PathfindAndMoveTo(187.04379272461,46.258148193359,121.92200469971) --Adjust to enter Circle(QuestCount =2)
  VNavMovement()
  yield("/wait 2")
 
--Need TextNode for this quest, and contents to get it off of "QuestCount" tracking
 QuestCount = 1
  target = "Goblin Mugger"
  enemy_max_dist = 20
  while QuestCount <= 2 do 
    QuestCombat(target)
	repeat
	  yield("/wait 0.1")
	until GetCharacterCondition(26, false) or GetCharacterCondition(26, true)
	QuestCount = QuestCount + 1
  end
  QuestCount = 1

  yield("/wait 1")
  PathfindAndMoveTo(191.75929260254,46.258148193359,120.7652130127) --Middle of NPCs
  VNavMovement()
  yield("/target Aylmer")
  yield("/wait 0.5")
  QuestNPC()
  yield("/wait 1")
  yield("/target Sozai Rarzai")
  yield("/wait 0.5")
  QuestNPC()
  yield("/wait 1")
  yield("/target Eyrimhus")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(129.92631530762,45.640029907227,133.08485412598)
  VNavMovement()
  yield("/target Sevrin")
  yield("/wait 0.5")
  QuestNPC()
  yield("/wait 1")
  yield("/target Sack of Oranges")
  QuestNPC()
  PathfindAndMoveTo(178.26762390137,64.402320861816,291.18728637695)
  VNavMovement()
  yield("/target Ossine")
  QuestNPC()
  PathfindAndMoveTo(48.615592956543,48.768337249756,47.593215942383)
  VNavMovement()
  PathfindAndMoveTo(204.70286560059,110.71823120117,-260.78509521484)
  VNavMovement()
  PathfindAndMoveTo(204.98315429688,112.51494598389,-221.57643127441,false)
  VNavMovement()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(203.77429199219,111.99100494385,-215.62156677246)
  VNavMovement()
  yield("/target Gurcant")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(47.236507415771,63.712902069092,-189.44537353516)
  VNavMovement()
  PathfindAndMoveTo(51.399276733398,64.280731201172,-186.75158691406)
  VNavMovement()
  yield("/target Rhotwyda")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(2.994265794754,59.120254516602,-222.45124816895)
  VNavMovement()
  PathfindAndMoveTo(-18.681606292725,58.075496673584,-256.19888305664)
  VNavMovement()
  PathfindAndMoveTo(-109.14585113525,45.360908508301,-252.91511535645)
  VNavMovement()
  PathfindAndMoveTo(-194.4778137207,40.197025299072,-212.83786010742)
  VNavMovement()
  PathfindAndMoveTo(-144.4317779541,45.17306137085,-213.03736877441) --Into The Aurochs
  VNavMovement()
--These are HuntLog monsters, but 4 inside the area. Need to kill all 4. QuestCount still best method. Much more realiable with TargetHP controlling it.
    QuestCount = 1
    target = "Wounded Auroch"
    enemy_max_dist = 30
    while QuestCount <= 4 do 
      QuestCombat(target)
	repeat
	  yield("/wait 0.1")
	until GetTargetHP() == 0
      yield("/wait 0.5")
	  QuestCount = QuestCount + 1
    end
  
  yield("/wait 1")
  PathfindAndMoveTo(-131.0075378418,46.635925292969,-193.31425476074) 
  VNavMovement()
  yield("/target Blackloam")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-123.00118255615,46.088733673096,-210.64706420898)
  VNavMovement()
  yield("/target Blackloam")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-132.37780761719,45.430095672607,-227.4736328125)
  VNavMovement()
  yield("/target Blackloam")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-196.71836853027,40.356788635254,-226.06214904785)
  VNavMovement()
  PathfindAndMoveTo(-1.5631061792374,57.623302459717,-307.0329284668)
  VNavMovement()
  yield("/target Pfrewahl")
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Pfrewahl")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-83.816619873047,49.387714385986,-238.23860168457) --Path to safe pirate
  VNavMovement()
  PathfindAndMoveTo(-74.274314880371,49.250606536865,-220.70556640625)
  VNavMovement()

--Need TextNode for and contents for this quest. Possibly use multi-Target QuestCombat() Logic
    QuestCount = 1
    target = "Grounded Pirate"
    enemy_max_dist = 20
    while QuestCount <= 2 do 
      QuestCombat(target)
  	repeat
	  yield("/wait 0.1")
	until GetTargetHP() == 0
	  QuestCount = QuestCount + 1
    end
  
    QuestCount = 1
    target = "Grounded Raider"
    enemy_max_dist = 20
    while QuestCount <= 1 do 
      QuestCombat(target)
	repeat
	  yield("/wait 0.1")
	until GetTargetHP() == 0
	  QuestCount = QuestCount + 1
    end

  PathfindAndMoveTo(-1.5631061792374,57.623302459717,-307.0329284668)
  VNavMovement()
  yield("/target Pfrewahl")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(204.70286560059,110.71823120117,-260.78509521484)
  VNavMovement()
  PathfindAndMoveTo(204.98315429688,112.51494598389,-221.57643127441,false)
  VNavMovement()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(235.67512512207,113.08489990234,-247.38922119141)
  VNavMovement()
  PathfindAndMoveTo(232.79409790039,113.09999084473,-243.93742370605)
  VNavMovement()
  yield("/target Grynewyda")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-134.2057800293,38.333271026611,-324.84936523438) --Path to Ramp
  VNavMovement()
  PathfindAndMoveTo(-142.41960144043,20.319999694824,-336.92071533203) --Path to Aylmer
  VNavMovement()
  yield("/target Aylmer")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-76.367485046387,11.999063491821,-410.32125854492)
  VNavMovement()
  PathfindAndMoveTo(-61.137363433838,12.427773475647,-410.83074951172) --Eyrimhus
  VNavMovement()
  yield("/target Eyrimhus")
  yield("/wait 0.5")
  QuestNPC()
  PathfindAndMoveTo(-35.690616607666,10.915529251099,-430.33917236328) --Sozai Rarzai(INSTANCE FIGHT)
  VNavMovement()
  yield("/target Sozai Rarzai")
  QuestInstance()
  yield("/wait 5")
  yield("/rotation cancel")
  PathfindAndMoveTo(-51.219242095947,12.552453994751,-413.86236572266) --AfterFight Movement Check
  VNavMovement()
  PathfindAndMoveTo(-77.343658447266,12.072567939758,-406.48889160156)
  VNavMovement()
  PathfindAndMoveTo(204.70286560059,110.71823120117,-260.78509521484)
  VNavMovement()
  PathfindAndMoveTo(204.98315429688,112.51494598389,-221.57643127441,false)
  VNavMovement()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  yield("/target Staelwyrn")
  yield("/wait 0.5")
  QuestNPC()
  yield("/tp limsa")
    while IsPlayerCasting() do 
		yield("/wait 0.5")
    end
  ZoneTransitions()
  yield("/wait 3")
  yield("/li aft")
  ZoneTransitions()
  PathfindAndMoveTo(17.951627731323,40.216011047363,-5.4437046051025,false) --AftCastle
  VNavMovement()
  yield("/target Baderon")
  yield("/wait 0.5")
  QuestNPC()
  --JustDesertsFINISHED--
  