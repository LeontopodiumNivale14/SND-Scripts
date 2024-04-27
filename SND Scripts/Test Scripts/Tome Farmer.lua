--[[

  ****************
  *  Tome Farmer *
  ****************

  ***********
  * Version *
  *  0.0.d  *
  ***********

  -> 0.0.1: 

  Created by: Leontopodium Nivale

  ***************
  * Description *
  ***************

  This is meant to be used for Alexander - The Burden of the Father (NORMAL NOT SAVAGE)
  It's setup to where you should be able to loop it as many time as you want, and be able to farm mats for GC seals
  Known classes to work: ALL

  *********************
  *  Required Plugins *
  *********************


  Plugins that are used are:
  -> VNavmesh (for pathing) AND/OR Visland: https://puni.sh/api/repository/veyn
  -> Pandora (Setting "Open Chest") : https://love.puni.sh/ment.json
  -> RotationSolver : https://puni.sh/api/repository/croizat
   -> Something Need Doing [Expanded Edition] : https://puni.sh/api/repository/croizat
    -> In the SND window, press the question mark to make the help setting's menu open 
    -> Go to options tab -> /target -> DISABLE THIS!! " Stop macro if target not found (only applies to SND's targeting system') "
]]

--[[

  **************
  *  Settings  *
  **************
  ]]

  MovementType = Visland  
  -- Options: VNavmesh | Visland 
  -- Select which one you would like, Visland is the one that we've used in this script for a LONG time
  -- VNavmesh however works just as well. You can have both plugins installed, just select which one you want to use for movement 

  rate = 0.3

--[[

  ************
  *  Script  *
  *   Start  *
  ************

]]

-- functions
	function TargetNearestObjectKind(objectKind, radius, subKind)
		local smallest_distance = 10000000000000.0
		local closest_target
		local radius = radius or 0
		local subKind = subKind or 5
		local nearby_objects = GetNearbyObjectNames(radius^2,objectKind)
    
		if nearby_objects.Count > 0 then
			for i = 0, nearby_objects.Count - 1 do
				yield("/target "..nearby_objects[i])
				if not GetTargetName() or nearby_objects[i] ~= GetTargetName()
					or (objectKind == 2 and subKind ~= GetTargetSubKind()) then
				elseif GetDistanceToTarget() < smallest_distance then
					smallest_distance = GetDistanceToTarget()
					closest_target = GetTargetName()
				end
			end
			ClearTarget()
			if closest_target then yield("/target "..closest_target) end
		end
		return closest_target
	end

	function PlayerTest()
		repeat
			yield("/wait "..rate)
		until IsPlayerAvailable()
	end

    function InCombat()
        yield("/vnavmesh pathstop")
        yield("/rotation auto")
        while GetCharacterCondition(26, true) do
            yield("/wait "..rate)
            -- Target selection and movement logic
            local current_target = GetTargetName() --Leaf: need find the setting to always zoom out or something
            if not current_target or current_target == "" then
                yield("/targetenemy")  -- Attempt to auto-target the next enemy
                current_target = GetTargetName()
                if current_target == "" then
                    yield("/wait "..rate)
                end
            end

            while IsPlayerCasting() do
                if CastingDebug == true then
                    yield("/e EY WATCH IT. I'M CASTING")
                end
                yield("/wait "..rate/3)
            end

            local enemy_max_dist = 75
            if GetDistanceToTarget() > 3 then
                if GetDistanceToTarget() <= enemy_max_dist then
                    local enemy_x = GetTargetRawXPos()
                    local enemy_y = GetTargetRawYPos()
                    local enemy_z = GetTargetRawZPos()
                    PathfindAndMoveTo(enemy_x, enemy_y, enemy_z)
                    if MovementType == VNavmesh then 
                        while PathfindInProgress() do 
                            yield("/wait 0.1")
                        end
                        yield("/wait "..rate)
                        while GetDistanceToTarget() > 3 do 
                            yield("/wait 0.1")
                        end
                        PathStop()  -- Stop movement after reaching near the target
                    elseif MovementType == Visland then 
                        yield("/visland moveto " .. enemy_x .. " " .. enemy_y .. " " .. enemy_z)
                        yield("/wait "..rate)
                        while GetDistanceToTarget() > 3 do 
                            yield("/wait 0.1")
                        end 
                        yield("/visland stop")
                    end 
                end
            end
        end
        -- This section might need an additional command to re-target or adjust positioning
        -- if the enemy is beyond the max distance, depending on your needs.

        yield("/rotation cancel")
    end

    function CombatWP(i)
        PathfindAndMoveTo(x, y, z)
        while GetCharacterCondition(26, false) and GetDistanceToPoint(x, y, z) > 1 do 
            yield("/wait 1")
        end 
        PathStop()
        if waypoint_tables[i][4] == 3 then 
            while GetCharacterCondition(26, false) do
                yield("/targetenemy")
                yield("/wait 0.2")
                if GetTargetName() ~= "" then 
                    yield("/vnavmesh movetarget")
                    while PathfindInProgress() do
                        yield("/wait 1")
                    end
                    while PathIsRunning() do 
                        yield("/wait 1")
                    end 
                end 
            end
        end
        InCombat()
    end

    function MovementWP()
        PathfindAndMoveTo(x, y, z)
        while PathfindInProgress() do
            yield("/wait 1")
        end
        while PathIsRunning() and GetCharacterCondition(61, false) do 
            yield("/wait 1")
            yield("/e Movement WP")
        end 
        yield("/wait "..waitTimer)
    end

    function TreasureWP()
        yield("/target Treasure Coffer")
        if GetTargetName() == "Treasure Coffer" then 
            yield("/vnavmesh movetarget")
            yield("/wait 0.5")
            while PathfindInProgress() do
                yield("/wait 1")
            end
            while PathIsRunning() do 
                yield("/wait 1")
            end 
            yield("/interact")
        end 
    end

-- Custom values being setup at the beginning before running the script

--Visland Loops
    waypoint_tables = 
    {
        {-419.5864,-445.3000,148.4272,0,0}, -- 1-1 combat 
        {-428.1627,-448.8700,96.6388,0,0}, -- 1-2 combat 
        {-437.8250,-448.6490,77.7161,1,6}, -- Teleporter 1 
        {-521.6462,-498.8947,5.8660,1,0}, -- Movmement to align w/ the pathing after teleporter 1
		{-518.7369,-502.3367,-39.0797,0,0}, -- 1-3 combat 
        {-469.4704,-506.2767,-83.1214,0,0}, -- 1-4 combat 
        {-450.1586,-505.9923,-114.2876,1,6}, -- Teleporter 2
        {-401.2342,-550.7040,-229.9396,3,0}, -- Boss "Dark Elf"
        {0,0,0,2,0}, -- Chest #1 | Boss Chest
        {-400.72797, -554.2923, -276.5595,1,6}, -- Teleporter 3
        {-374.2758,-567.1304,-421.4959,1,10}, -- Transition to "the past woooo"
        {6.4207,232.9271,301.7120,1,0}, -- Movement to the first chest
        {0,0,0,2,0}, -- Chest #2 | Optional Chest #1 
        {60.4167,229.2604,296.5231,0,0}, -- 2-1 combat 
        {59.8992,226.6785,271.7450,0,0}, -- 2-2 combat 
        {0.2429,207.6876,171.1910,0,0}, -- 2-3 combat 
        {0,0,0,2,0}, -- Chest #3 | Optional Chest #2 
        {-1.1456,199.6749,129.4815,0,0}, -- 2-4 combat
        {-0.5750,199.9359,48.7000,3,0}, -- Boss "Damcyan Antlion"
        {0,0,0,2,0}, -- Chest #4 | Boss Chest
        {-0.4723,199.9000,-49.4636,0,0}, -- 3-1 combat 
        {0,0,0,2,0}, -- Chest #5| Optional Chest #3
        {-0.5200,200.4050,-82.3890,0,0}, -- 3-2 single ad kill 
        {0.3187,199.9000,-148.3189,0,0}, -- 3-3 combat
        {-26.9116,199.9340,-233.28010,0}, -- 3-4 combat 
        {-40.4653,199.9515,-265.8266,0,0}, -- Movement to the chest
        {0,0,0,2,0}, -- Chest #6| Optional Chest #4
        {-0.2862,209.0000,-331.1236,0,0}, -- Last ad pack 
        {-0.0880,217.8100,-377.6678,1,3}, -- Area before cutscene
        {-0.2240,219.9001,-424.6483,3,0}, -- 3rd Boss Arena
        {0.2016,219.9001,-429.8767,1,0}, --Hmm...
        {0,0,0,2,0}, -- Chest #7| Boss Chest
    }

	StartingZone = GetZoneID()

::StartofBattle::

    for i=1, #waypoint_tables do 
        x = waypoint_tables[i][1]
        y = waypoint_tables[i][2]
        z = waypoint_tables[i][3]
        if waypoint_tables[i][4] == 0 or waypoint_tables[i][4] == 3 then
            CombatWP(i)
        elseif waypoint_tables[i][4] == 1 then
            waitTimer = waypoint_tables[i][5]
            MovementWP()
        elseif waypoint_tables[i][4] == 2 then
            TreasureWP()
        end
    end