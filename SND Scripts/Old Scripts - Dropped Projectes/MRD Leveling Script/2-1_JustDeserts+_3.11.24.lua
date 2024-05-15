 --[[ 
 Start of the script

    V.0.0.0.1.0

    From Elli: Start of second script. Intended to be from Just Deserts to Sastasha+
              

    Last updated: 3.10.24
    -> Moved Functions to new script.
    -> Beginning of quests after Just Deserts
      


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
        if not IsPlayerAvailable() then
            yield("/wait 1")
            yield("/pcall SelectYesno true 0")
        elseif GetCharacterCondition(1) then
            yield("/pint")
            yield("/wait 1")
            while IsPlayerCasting() do 
                yield("/wait 0.5")
            end
            repeat 
                yield("/wait 0.1")
            until not IsAddonVisible("SelectYesno")
        elseif not IsPlayerAvailable() and GetCharacterCondition(26, false) then
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


      --Start Of Sky-High MSQ--
    yield("/wait 5")
    yield("/equip")
    yield("/wait 5")
    yield("/target Baderon")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(13.203303337097,40.0,71.821281433105)
    VNavMovement()
    yield("/wait 0.5")
    yield("/li zeph")
    ZoneTransitions()
    PathfindAndMoveTo(-49.17208480835,43.851398468018,88.079132080078)
    VNavMovement()
    PathfindAndMoveTo(-143.54760742188,45.958213806152,-85.965492248535)
    VNavMovement()
    PathfindAndMoveTo(-221.53723144531,38.512428283691,-238.14985656738)
    VNavMovement()
    PathfindAndMoveTo(-256.47634887695,29.380001068115,-230.75086975098)
    VNavMovement()
    PathfindAndMoveTo(-261.88012695313,12.159959793091,-278.5576171875)
    VNavMovement()
    PathfindAndMoveTo(-281.79553222656,10.593578338623,-251.15907287598)
    VNavMovement()
    yield("/target Wyrkrhit")
    yield("/wait 0.5")
    QuestNPC()
    yield("/target Wyrkrhit")
    yield("/wait 0.5")
    QuestNPC()
    yield("/target Millioncorn Seedling")
    yield("/wait 0.5")
    QuestNPC()
    --Input Combat "Shore Slug" x2
    PathfindAndMoveTo(-376.42565917969,33.089279174805,-603.9521484375)
    VNavMovement()
    ZoneTransitions()
    
    --In Western La Noscea
    PathfindAndMoveTo(657.94866943359,9.8853921890259,471.24966430664)
    VNavMovement()
    PathfindAndMoveTo(655.19067382813,9.0739603042603,511.41616821289) --SwiftPerch Aetheryte
    VNavMovement()
    yield("/target Aetheryte")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(658.24279785156,7.4682378768921,529.33801269531)
    VNavMovement()
    PathfindAndMoveTo(651.73779296875,7.8918228149414,528.11584472656)
    VNavMovement()
    yield("/target Lyulf")
    yield("/wait 0.5")
    QuestNPC()
    yield("/target Lyulf")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(663.63427734375,8.128363609314,523.70867919922)
    VNavMovement()
    PathfindAndMoveTo(657.24530029297,8.2562227249146,521.92456054688)
    VNavMovement()
    yield("/target Fraeloef")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(656.92193603516,9.8852462768555,471.44186401367)
    VNavMovement()
    PathfindAndMoveTo(548.81079101563,4.645133972168,422.09320068359)
    VNavMovement()
    PathfindAndMoveTo(499.02206420898,11.304929733276,371.3371887207)
    VNavMovement()
    PathfindAndMoveTo(448.8603515625,11.262282371521,437.36614990234)
    VNavMovement()
    PathfindAndMoveTo(444.2248840332,14.577191352844,451.30725097656)
    VNavMovement()
    --!!!ALERT!!! FATE spawns around here "Died in Six Arms Tonight". Also prep for aggro going to lighthouse. Possible Combat logic to clear.
    yield("/target Khanswys")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(447.03173828125,11.668862342834,438.68438720703)
    VNavMovement()
    PathfindAndMoveTo(499.44152832031,11.279815673828,371.09451293945)
    VNavMovement()
    PathfindAndMoveTo(599.03570556641,28.181261062622,361.24545288086)
    VNavMovement()
    --!!!ALERT!!!ALERT!!! FATE spawns around the MSQ target. Two different ones can spawn. One for "Fat Dodo" and "Dodo Nest" Nother with a boss.
    yield("/target Destination")
    yield("/wait 0.5")
    QuestNPC()
    yield("/target Iron Brazier")
    yield("/wait 0.5")
    QuestNPC()
    --Enemy HERE: "Torchlight" x1
    PathfindAndMoveTo(513.71691894531,9.6031770706177,383.22454833984)
    VNavMovement()
    PathfindAndMoveTo(490.33612060547,10.791831970215,370.30758666992)
    VNavMovement()
    PathfindAndMoveTo(446.57913208008,11.955628395081,440.01458740234)
    VNavMovement()
    PathfindAndMoveTo(444.61465454102,14.585984230042,451.83404541016)
    VNavMovement()
    yield("/target Khanswys")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(475.61099243164,7.7759990692139,407.44393920898)
    VNavMovement()
    PathfindAndMoveTo(656.68389892578,9.8860111236572,467.6393737793)
    VNavMovement()
    PathfindAndMoveTo(657.00152587891,8.5412788391113,518.91918945313)
    VNavMovement()
    yield("/target Fraeloef")
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
    PathfindAndMoveTo(2.5764150619507,44.499130249023,112.29363250732)
    VNavMovement()
    PathfindAndMoveTo(-31.819974899292,41.499984741211,206.87745666504)
    VNavMovement()
    yield("/target H'naanza")
    yield("/wait 0.5")
    QuestNPC()
    --Relighting The Torch DONE--

    --On to the DryDocks START--
       yield("/wait 3")
       yield("/equip")
       yield("/wait 5")
       yield("/target H'naanza")
       yield("/wait 0.5")
       yield("/pint")
       yield("/wait 2")
       yield("/send NUMPAD6")
       yield("/wait 1")
       yield("/send NUMPAD0")
       yield("/wait 7")
    PathfindAndMoveTo(14.398182868958,40.0,70.906944274902)
    VNavMovement()
    yield("/wait 1")
    yield("/li temp")
    ZoneTransitions()
    PathfindAndMoveTo(132.65919494629,38.98168182373,128.15336608887)
    VNavMovement()
    PathfindAndMoveTo(169.56604003906,49.074756622314,239.32986450195)
    VNavMovement()
    PathfindAndMoveTo(105.52952575684,68.155227661133,334.2585144043)
    VNavMovement()
    PathfindAndMoveTo(-1.6608152389526,66.386138916016,416.83993530273)
    VNavMovement()
    PathfindAndMoveTo(-36.529922485352,66.326141357422,436.05426025391)
    VNavMovement()
    PathfindAndMoveTo(-30.752624511719,41.148929595947,563.10571289063)
    VNavMovement()
    PathfindAndMoveTo(-2.0737175941467,36.202785491943,595.13043212891)
    VNavMovement()
    PathfindAndMoveTo(142.19290161133,22.999876022339,581.95629882813)
    VNavMovement()
    PathfindAndMoveTo(155.57299804688,14.114977836609,668.46533203125)
    VNavMovement()
    yield("/target Aetheryte")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(153.81968688965,12.126243591309,639.69830322266)
    VNavMovement()
    PathfindAndMoveTo(214.88610839844,8.973653793335,606.01251220703)
    VNavMovement()
    PathfindAndMoveTo(244.82818603516,14.16242980957,611.06817626953)
    VNavMovement()
    yield("/target Ahtbyrm")
    yield("/wait 0.5")
    QuestNPC()
    yield("/target Ahtbyrm")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(210.32466125488,14.096021652222,659.76788330078)
    VNavMovement()
    PathfindAndMoveTo(145.43975830078,15.990365982056,689.74829101563)
    VNavMovement()
    PathfindAndMoveTo(119.37232971191,23.000835418701,740.28826904297)
    VNavMovement()
    PathfindAndMoveTo(48.336402893066,16.821605682373,782.49237060547)
    VNavMovement()
    PathfindAndMoveTo(-3.89337682724,8.9213562011719,832.67352294922)
    VNavMovement()
    PathfindAndMoveTo(-32.572978973389,8.9213562011719,860.65612792969)
    VNavMovement()
    yield("/target Haldbroda")
      yield("/wait 0.5")
      yield("/doubt")
      yield("/wait 0.5")
      while GetCharacterCondition(32, false) do
        yield("/wait 0.1")
      end
        repeat
          yield("/wait 0.1")
        until IsPlayerAvailable()
    yield("/target Haldbroda")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(-5.6241278648376,8.9213562011719,837.60693359375)
    VNavMovement()
    PathfindAndMoveTo(-58.492500305176,2.3137447834015,777.63159179688)
    VNavMovement()
    PathfindAndMoveTo(-94.744728088379,2.3205499649048,736.31732177734)
    VNavMovement()
    yield("/target Fyrilsmyd")
    yield("/wait 0.5")
    QuestNPC()

    --Righting the Shipwright !!!Potential Combat Zones!!!
    PathfindAndMoveTo(-143.96853637695,1.0371749401093,711.12921142578) --First MSQ Target
    VNavMovement()

    target = "Qiqirn Eggdigger"
    enemy_max_dist = 20
      if GetCharacterCondition(26, true) then
           QuestCombat(target)
      until GetCharacterCondition(26, false)
    yield("/wait 1")
    yield("/target Brass Helm Wheel")
    yield("/wait 0.5")
    QuestNPC() --Spawns "Qiqirn Beachcomber"
    PathfindAndMoveTo(-185.6815032959,-0.065903186798096,696.04791259766) --Second MSQ Target
    VNavMovement()

    target = "Qiqirn Beachcomber"
    enemy_max_dist = 20
      if GetCharacterCondition(26, true) then
           QuestCombat(target)
      until GetCharacterCondition(26, false)
    yield("/wait 1")
    yield("/target Tangled Rigging")
    yield("/wait 0.5")
    QuestNPC() --Spawns "Qiqirn Beachcomber"
    PathfindAndMoveTo(-178.64825439453,1.1055910587311,657.03210449219)
    VNavMovement()
    PathfindAndMoveTo(-172.47073364258,1.7117896080017,657.77307128906)
    VNavMovement()

    target = "Qiqirn Beachcomber"
    enemy_max_dist = 20
      if GetCharacterCondition(26, true) then
           QuestCombat(target)
      until GetCharacterCondition(26, false)
    yield("/wait 1")
    yield("/target Folded Sailcloth")
    yield("/wait 0.5")
    QuestNPC() --Spawns "Qiqirn Beachcomber"
    
    target = "Qiqirn Beachcomber"
    enemy_max_dist = 20
      if GetCharacterCondition(26, true) then
           QuestCombat(target)
      until GetCharacterCondition(26, false)
    --Righting the Shipwright !!!End of Combat Zones!!!

    PathfindAndMoveTo(-96.575668334961,2.3639152050018,733.55041503906)
    VNavMovement()
    yield("/target Fyrilsmyd")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(-21.715805053711,7.9255905151367,815.90576171875)
    VNavMovement()
    PathfindAndMoveTo(104.90399169922,22.248157501221,763.63903808594)
    VNavMovement()
    PathfindAndMoveTo(141.52635192871,23.000835418701,719.37030029297)
    VNavMovement()
    PathfindAndMoveTo(154.88917541504,14.114987373352,683.5341796875)
    VNavMovement()
    PathfindAndMoveTo(220.08848571777,14.096059799194,652.03924560547)
    VNavMovement()
    PathfindAndMoveTo(245.66589355469,14.16242980957,611.74829101563)
    VNavMovement()
    yield("/target Ahtbyrm")
    yield("/wait 0.5")
    QuestNPC()
    yield("/target Ahtbyrm")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(168.43269348145,14.095901489258,682.546875)
    VNavMovement()
    yield("/target Ghimthota")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(120.61141967773,23.000835418701,734.05621337891)
    VNavMovement()
    yield("/target C'nangho")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(156.68392944336,21.53085899353,786.37072753906)
    VNavMovement()
    PathfindAndMoveTo(248.52239990234,6.3319568634033,775.44512939453)
    VNavMovement()
    yield("/target Disreputable Pirate")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(242.1280670166,9.5771989822388,796.65661621094)
    VNavMovement()
    PathfindAndMoveTo(120.61141967773,23.000835418701,734.05621337891)
    VNavMovement()
    PathfindAndMoveTo(154.24000549316,14.095854759216,684.81127929688)
    VNavMovement()
    PathfindAndMoveTo(165.97648620605,14.095905303955,683.81170654297)
    VNavMovement()
    yield("/target Ghimthota")
    yield("/wait 0.5")
    QuestNPC()
    yield("/target Ghimthota")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(121.44593048096,23.000835418701,733.5556640625)
    VNavMovement()
    yield("/target C'nangho")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(98.796783447266,22.654573440552,761.11553955078)
    VNavMovement()
    PathfindAndMoveTo(10.648113250732,40.22876739502,748.84295654297)
    VNavMovement()
    PathfindAndMoveTo(27.941656112671,47.443237304688,730.11688232422)
    VNavMovement()
    PathfindAndMoveTo(104.77794647217,53.596412658691,675.04302978516)
    VNavMovement()
    yield("/target Shifty-eyed Sailor")
    yield("/wait 0.5")
    QuestNPC()
    PathfindAndMoveTo(165.97648620605,14.095905303955,683.81170654297)
    VNavMovement()
    yield("/wait 4")
    yield("/equip")
    yield("/wait 4")

    --!!!ALERT!!! Instanced Combat. HIGHLY WIP FOR TESTING!!!--
       --Goals: Get Waypoints
              --Rework targetting logic for use in instances that require movement
              --Note Enemy names
              --Get Replay for Ice
    QuestInstance()
