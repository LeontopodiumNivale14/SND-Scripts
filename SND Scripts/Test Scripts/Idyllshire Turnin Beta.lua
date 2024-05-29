--[[

    ***********************
    *  Idyllshire Turnin  *
    *   Alex 1-4 Edition  *
    ***********************

    **************
    *   VERSION  *
    *   3.3.3.0  *
    **************

    Update notes:
		3.3.3.1   -> Testing out to see if this works... how I think it will? Rewrote the teleport script a bit? Because the old one caused me to crash -.-
        3.3.3.0   -> In prep of me putting this in c#, I wanted to go through this and try and make this whole turnin process.... a lot more cleaner? The code has been bothing me for *awhile* and knowing how tables works and being able to transport variables
                     I figured this would be a good test. and turns out, works fucking fantasic. It now properly cycles through all the items/shop menu's without it being a monster to look at, and the table is easily editable for future uses of items. 
                     Especially with dawntrail coming around, o3n is looking like it might be a good farm if it matches/is faster than a4n atm... So to future proofing more!
        3.3.2.0   -> ALRIGHT. Fixed the Teleporting to the GC (Like... 99% on this) also, fixed it interacting w/ Sabina. There's probably something else for me to tweak but... :/
				  -> ACTUALLY made it turn on the pandora settings that you need.
        3.3.1.11  -> Removed Old GC Ticket teleport system, since that's just baked into the GCTeleport itself. Took that time to also re-write that whole section and clean it up a bit.
        3.3.1.10  -> Made some tiny optimizations that's been bugging me, nothing to major. mounting in Idyllshire for instance...
        3.3.1.0   -> Small fix to if you're buying in gridania, added a waypoint so you wouldn't get stuck on the step trying to turn it in
        3.3.0.0   -> Rewrote the buying process to go from bolts -> pedal -> spring -> crank -> shaft
                     This functionally does nothing for normal buyer peeps 
                     Also made it to where you could max buy on the first page, so it'll get in/out of Idyllshire quicker
                  -> This setting is "MaxSingleItem", you'll find the toglle under Settings, off by default as always
        3.2.0.0   -> Inventory Buying Fix

    Author: Leontopodium Nivale

    ***************
    * Description *
    ***************

    Teleports you to Idyllshire (or if you're standing in front of an aetheryte) and takes you to the Alex Vendor to trade your raid pieces -> gear,
    which then takes you to your personal Grand Company and turns them into what you have selected from Deliveroo.

    If you have OTP on, and you have your company aetheryte tickets, you can do this loop for free wihtout costing you any gil.

    *********************
    *  Required Plugins *
    *********************

    -> Teleporter | 1st Party Plugin
    -> Pandora (Enable "Auto-select Turn-ins & Automatically Confirm") | NOTE. THESE WILL ACTIVATE NOW IN THE SCRIPT.
    -> Lifestream 
    -> Deliveroo [If you need the link, here --> https://plugins.carvel.li/]
    -> vnavmesh (replaced visland)
    -> YesAlready
        -> YesAlready -> Yes/No -> Add this:  You cannot currently equip this item. Proceed with the transaction?
           Yes, you can zone lock this to strictly Idyllshire if you would like (I did)
        -> YesAlready -> Bothers -> Scroll near the VERY bottom and make sure "ShopExchangeItemDialog" is checkmarked

]]

--[[

  **************
  *  Settings  *
  **************

]]


	-- !!HEADS UP!! If you're running at lower than 60 FPS. INCREASE THIS VALUE. 
	-- If you're shop is skipping buying items, increase this value. 
	-- Default is 1 cause that's worked for me, but 5 has helped others as well
	Alex_Shop_Timer = 1
	postItemBuy = 1.2

	-- If you want to max the first item in the stop, enable this. 
	-- this will do the same as the MaxInventory, but instead of menu-ing through all of them, it'll buy then just head directly to the GC
	-- Cause.... man there's a lot of bolts to turn in w/ this XD
	-- It's off by default, so nobody freak out
	MaxSingleItem = true


--[[

  ************
  *  Script  *
  *   Start  *
  ************

]]

::Functions::

    function TeleportTest()
        while GetCharacterCondition(27) do 
            yield("/wait 1") 
        end
        yield("/wait 1")
        while GetCharacterCondition(45) or GetCharacterCondition(51) do 
            yield("/wait 3") 
        end
    end

    function AetheryteTeleport()
        while GetCharacterCondition(32) do
            yield("/wait 1")
        end
        yield("/wait 1")
        while GetCharacterCondition(45) or GetCharacterCondition(51) do
            yield("/wait 1") 
        end
    end

    function DistanceToVendor()
        if IsInZone(478) then -- Idyllshire
            Distance_Test = GetDistanceToPoint(-19.277, 211, -36.076)
        end
    end

    function PathFinding()
        yield("/wait 0.2")
        while PathfindInProgress() do
            yield("/wait 0.5")
        end
    end

    function DeliverooEnable()
        if DeliverooIsTurnInRunning() == false then
            yield("/wait 1")
            yield("/deliveroo enable")
        end
    end
	
	function formatNumberWithCommas(number)
		-- Validate input to ensure it is a number
		if type(number) ~= "number" then
			error("Invalid input: number expected, got " .. type(number))
		end

		-- Check if the number is an integer
		local is_integer = (number % 1 == 0)

		-- Convert to string based on whether it is an integer
		local formatted = is_integer and string.format("%d", number) or tostring(number)

		local k
		-- Loop to insert commas every three digits before the decimal
		while true do
			formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", '%1,%2')
			if k == 0 then break end
		end
		return formatted
	end

    function CurrentItem()
        if currentCurrencyItem == BoltID then 
            SkipChecker = boltSkip
        elseif currentCurrencyItem == PedalID then 
            SkipChecker = pedalSkip
        elseif currentCurrencyItem == SpringID then 
            SkipChecker = springSkip
        elseif currentCurrencyItem == CrankID then 
            SkipChecker = crankSkip
        elseif currentCurrencyItem == ShaftID then 
            SkipChecker = shaftSkip
        end
    end

    function RaidTurninShop(itemType, itemTypeBuy, GearItem, pcallValue, maxBuy, shopDelay)
        if GetItemCount(itemType) >= itemTypeBuy then 
            if GetItemCount(GearItem) == 0 then 
                i_count = GetInventoryFreeSlotCount()
                itemBuyAttempt = 1 
                while GetItemCount(GearItem) == 0 do 
                    if maxBuy == false then 
                        buyAmount = 1 
                    elseif maxBuy == true then 
                        if itemBuyAttempt == 1 then 
                            currentItemTotal = GetItemCount(itemType)//itemTypeBuy
                            buyAmount = i_count
                            if buyAmount > currentItemTotal then 
                                buyAmount = currentItemTotal
                            end
							LogInfo("current buy amount = "..buyAmount)
                        elseif itemBuyAttempt >= 6 then -- this would be a switch here in c# ideally...
                            if itemType == ShaftID then 
                                skipItem = true
                            elseif itemType == CrankID then 
                                skipItem = true
                            elseif itemType == SpringID then 
                                skipItem = true
                            elseif itemType == PedalID then 
                                skipItem = true
                            end 
                        elseif itemBuyAttempt > 1 then 
                            buyAmount = (buyAmount//2)
                        end
                    end 
                    yield("/pcall ShopExchangeItem True 0 "..pcallValue.. " "..buyAmount)
                    yield("/wait "..shopDelay)
                    if IsAddonReady("Request") == true then 
                        yield("/pcall Request True 1")
                        yield("/wait 0.2")
                    end
                    itemBuyAttempt = itemBuyAttempt + 1
                    LogInfo("[Turnins] Item Buy Attempt: "..itemBuyAttempt)
                    if skipItem == true then 
                        break 
                    end
                end 
            end 
        end 
    end

-- hardcoded IDs
    --tarnished gordian item ids, hardcoded.
        LensID = 12674
        ShaftID = 12675
        CrankID = 12676
        SpringID = 12677
        PedalID = 12678
        BoltID = 12680
        LimsaTicketID = 21069
        GridaniaTicketID = 21070
        UldahTicketID = 21071

    -- ItemBuyAmounts
        ShaftBuyAmount = 4
        CrankBuyAmount = 2 
        SpringBuyAmount = 4
        PedalBuyAmount = 2 
        BoltBuyAmount = 1 

    --initialize item counts
        LensCount = GetItemCount(LensID)
        ShaftCount = GetItemCount(ShaftID)
        CrankCount = GetItemCount(CrankID)
        SpringCount = GetItemCount(SpringID)
        PedalCount = GetItemCount(PedalID)
        BoltCount = GetItemCount(BoltID)
        LimsaGCTicket = GetItemCount(LimsaTicketID)
        GridaniaGCTicket = GetItemCount(GridaniaTicketID)
        UldahGCTicket = GetItemCount(UldahTicketID)
  
    -- FUCKING TURNING THESE ON. Because I don't trust people
        PandoraSetFeatureState("Auto-select Turn-ins", true) 
        PandoraSetFeatureConfigState("Auto-select Turn-ins", "AutoConfirm", true)
        yield("/e HEY. LISTEN. I just turned on those 2 VERY important things that I said that was necessary. (Unless your running textadvanced, that's fine as well)")

    -- Settting up items to skip 
        pedalSkip = false 
        springSkip = false 
        crankSkip = false 
        shaftSkip = false 
        boltSkip = false 

    -- RaidTurninShop(itemType, itemTypeBuy, GearItem, pcallValue, maxBuy, shopDelay)
    sabina_table = 
        {
            -- shop 1/dow1
            {1, BoltID, BoltBuyAmount, 11506, 22},
            {1, BoltID, BoltBuyAmount, 11505, 21},
            {1, BoltID, BoltBuyAmount, 11501, 20},
            {1, BoltID, BoltBuyAmount, 11500, 19},
            {1, BoltID, BoltBuyAmount, 11496, 18},
            {1, BoltID, BoltBuyAmount, 11495, 17},
            {1, BoltID, BoltBuyAmount, 11491, 16},
            {1, BoltID, BoltBuyAmount, 11490, 15},
            {1, PedalID, PedalBuyAmount, 11485, 14},
            {1, PedalID, PedalBuyAmount, 11484, 13},
            {1, PedalID, PedalBuyAmount, 11483, 12},
            {1, SpringID, SpringBuyAmount, 11478, 11},
            {1, SpringID, SpringBuyAmount, 11477, 10},
            {1, SpringID, SpringBuyAmount, 11476, 9},
            {1, CrankID, CrankBuyAmount, 11464, 8},
            {1, CrankID, CrankBuyAmount, 11463, 7},
            {1, CrankID, CrankBuyAmount, 11462, 6},
            {1, ShaftID, ShaftBuyAmount, 11457, 5},
            {1, ShaftID, ShaftBuyAmount, 11456, 4},
            {1, ShaftID, ShaftBuyAmount, 11455, 3},
            -- shop 2/dow2 
            {2, BoltID, BoltBuyAmount, 11507, 13},
            {2, BoltID, BoltBuyAmount, 11502, 12},
            {2, BoltID, BoltBuyAmount, 11497, 11},
            {2, BoltID, BoltBuyAmount, 11492, 10},
            {2, PedalID, PedalBuyAmount, 11486, 9},
            {2, PedalID, PedalBuyAmount, 11487, 8},
            {2, SpringID, SpringBuyAmount, 11479, 7},
            {2, SpringID, SpringBuyAmount, 11480, 6},
            {2, CrankID, CrankBuyAmount, 11465, 5},
            {2, CrankID, CrankBuyAmount, 11466, 4},
            {2, ShaftID, ShaftBuyAmount, 11458, 3},
            {2, ShaftID, ShaftBuyAmount, 11459, 2},
            -- shop 3/dom 
            {3, BoltID, BoltBuyAmount, 11508, 17},
            {3, BoltID, BoltBuyAmount, 11509, 16},
            {3, BoltID, BoltBuyAmount, 11503, 15},
            {3, BoltID, BoltBuyAmount, 11504, 14},
            {3, BoltID, BoltBuyAmount, 11498, 13},
            {3, BoltID, BoltBuyAmount, 11499, 12},
            {3, BoltID, BoltBuyAmount, 11493, 11},
            {3, BoltID, BoltBuyAmount, 11494, 10},
            {3, PedalID, PedalBuyAmount, 11488, 9},
            {3, PedalID, PedalBuyAmount, 11489, 8},
            {3, SpringID, SpringBuyAmount, 11481, 7},
            {3, SpringID, SpringBuyAmount, 11482, 6},
            {3, CrankID, CrankBuyAmount, 11467, 5},
            {3, CrankID, CrankBuyAmount, 11468, 4},
            {3, ShaftID, ShaftBuyAmount, 11460, 3},
            {3, ShaftID, ShaftBuyAmount, 11461, 2},
        }
    -- yield("/e -> "..GetNodeText("ShopExchangeItem", 2, 17, 13)) = Prototype Gordian Armet of Fending

::IdyllshireTurnin::

    while IsInZone(478) == false and GetCharacterCondition(27) == false do
        yield("/tp Idyllshire")
        yield("/wait 1")
    end

    TeleportTest()

    if IsInZone(478) == false and GetCharacterCondition(27) == false then
        yield("/echo Hmm.... either you moved, or the teleport failed, lets try that again")
        yield("/wait 0.5")
        goto IdyllshireTurnin
    end

    if IsInZone(478) then
        DistanceToVendor()
        if Distance_Test > 1 then
            while GetCharacterCondition(4, false) do
                yield('/gaction "Mount Roulette"')
                yield("/wait 0.3")
                while IsPlayerCasting() do  
                    yield("/wait 0.1")
                end
                yield("/wait 2")
            end
            yield("/wait 0.5")
            yield("/vnavmesh moveto -19.277 211 -36.076")
			-- yield("/gaction sprint")
        end
    end

::SabinaTest::

	while IsPlayerAvailable() == false do 
		yield("/wait 1")
	end 
	
    DistanceToVendor()

    while Distance_Test > 1 do
        yield ("/wait 0.1")
        DistanceToVendor()
    end

    if GetCharacterCondition(4, true) then 
        yield("/ac dismount")
        repeat
            yield("/wait 0.5")
        until GetCharacterCondition(4, false)
    end 
    yield("/wait 1")
    yield("/target Sabina")
    yield("/wait 0.5")
    yield("/interact")
    yield("/wait 1.0")
    yield("/pcall SelectIconString True 0")
    yield("/wait 1.0")
    yield("/pcall SelectString True 0")
    yield("/wait 1.0")
    yield("/pcall SelectString True 0")
    yield("/wait 1.0")

::BuyingItems::
    for i = 1, #sabina_table do 
        -- RaidTurninShop(itemShop, itemType, itemTypeBuy, GearItem, pcallValue, maxBuy, shopDelay)
        -- yield("/e i = "..i) -- just for me to tell where I'm at in the table rn
        currentCurrencyItem = sabina_table[i][2]
        shopItemAquired = sabina_table[i][4]
        if sabina_table[i][1] == 2 then 
            if GetNodeText("ShopExchangeItem", 2, 17, 13) ~= "Prototype Gordian Hood of Scouting" then 
                yield("/pcall ShopExchangeItem True -1")
                while IsAddonReady("SelectString") == false do 
                    yield('/wait 1')
                end 
                yield("/pcall SelectString True 1")
                while IsAddonReady("ShopExchangeItem") == false do 
                    yield("/wait 1")
                end 
            end
        elseif sabina_table[i][1] == 3 then 
            if GetNodeText("ShopExchangeItem", 2, 17, 13) ~= "Prototype Gordian Crown of Casting" then 
                yield("/pcall ShopExchangeItem True -1")
                while IsAddonReady("SelectString") == false do 
                    yield('/wait 1')
                end 
                yield("/pcall SelectString True 2")
                while IsAddonReady("ShopExchangeItem") == false do 
                    yield("/wait 1")
                end 
            end
        end
        CurrentItem()
        if SkipChecker == false then 
            RaidTurninShop(sabina_table[i][2], sabina_table[i][3], sabina_table[i][4], sabina_table[i][5], MaxSingleItem, postItemBuy)
        end 
        if GetItemCount(shopItemAquired) == 0 then 
            if currentCurrencyItem == PedalID then 
                pedalSkip = true
            elseif currentCurrencyItem == SpringID then 
                springSkip = true
            elseif currentCurrencyItem == CrankID then 
                crankSkip = true
            elseif currentCurrencyItem == ShaftID then 
                shaftSkip = true
            end   
        end
        if GetInventoryFreeSlotCount() == 0 then 
            break 
        end
    end

    LogInfo("Item buying process is complete, leaving the vendor")
    yield("/pcall ShopExchangeItem True -1")
    yield("/wait 1")
    yield("/pcall SelectString True 7")
    yield("/wait 3")

::GrandCompanyTurnin::

    TeleportToGCTown(false)
    yield("/wait 7")

    TeleportTest()

    if IsInZone(478) == true and GetCharacterCondition(27) == false then
        yield("/echo Hmm.... either you moved, or the teleport failed, lets try that again")
        yield("/wait 1")
        goto GrandCompanyTurnin
    end

::GrandCompanyCheck::

	while IsPlayerAvailable() == false do 
		yield("/wait 1")
	end 
	
    while DeliverooIsTurnInRunning() == false do
        if IsInZone(129) then -- Limsa Lower                                                                                     ;
            LogInfo("[IdyllshireTurnin] Currently in Limsa Lower!")
            yield("/wait 3")
            yield("/target Aetheryte")
            AetheryteX = GetTargetRawXPos()
            AetheryteY = GetTargetRawYPos()
            AetheryteZ = GetTargetRawZPos()
            PathfindAndMoveTo(AetheryteX, AetheryteY, AetheryteZ, false)
            PathFinding()
            while GetDistanceToPoint(AetheryteX, AetheryteY, AetheryteZ) > 7 do 
                yield("/wait 0.1")
            end 
            PathStop()
            yield("/li The Aftcastle")
            LogInfo("[IdyllshireTurnin] Heading to the Aftcastle")
            while GetCharacterCondition(32) do
                yield("/wait 1")
            end
            while IsInZone(128) == false do 
                yield("/wait 2")
            end
        elseif IsInZone(128) then -- Limsa Upper
            yield("/wait 5")
            PathfindAndMoveTo(93.9,40.175,75.409, false)
            LogInfo("[IdyllshireTurnin] Heading to the Limsa Upper GC")
            PathFinding()
            yield("/wait 0.5")
            while GetDistanceToPoint(93.9,40.175,75.409) > 1 do 
                yield("/wait 0.1")
            end 
            LogInfo("[IdyllshireTurnin] Limsa Upper GC has been reached!")
            DeliverooEnable()
        elseif IsInZone(130) then -- Ul'dah's GC
            yield("/wait 5")
            PathfindAndMoveTo(-142.361,4.1,-106.919, false)
            LogInfo("[IdyllshireTurnin] Heading to Ul'Dah's GC")
            PathFinding()
            while GetDistanceToPoint(-142.361,4.1,-106.919) > 1 do 
                yield("/wait 0.1")
            end 
            LogInfo("[IdyllshireTurnin] Ul'Dah's GC has been reached!")
            DeliverooEnable()
        elseif IsInZone(132) then -- Grdiania's GC
            yield("/wait 5")
            PathfindAndMoveTo(-67.757,-0.501,-8.393, false)
            PathFinding()
            while GetDistanceToPoint(-67.757,-0.501,-8.393) > 1 do 
                yield("/wait 0.1")
                if PathIsRunning() == false then 
                    PathfindAndMoveTo(-67.757,-0.501,-8.393, false)
                end 
            end 
            LogInfo("[IdyllshireTurnin] Gridania's GC has been reached!")
            DeliverooEnable()
        end
    end

    while DeliverooIsTurnInRunning() do
        yield("/wait 1")
    end

	GilSellAmount = (GetItemCount(10120) * 360)
	yield("/e ------ Current Gil Amount -------- ")
	yield("/e Current gil total is: "..formatNumberWithCommas(GilSellAmount))
	yield("/e ---------------------------------- ")

::InventoryCheck::

    ShaftCount = GetItemCount(ShaftID) -- 4
    CrankCount = GetItemCount(CrankID) -- 2 
    SpringCount = GetItemCount(SpringID) -- 4
    PedalCount = GetItemCount(PedalID) -- 2 
    BoltCount = GetItemCount(BoltID) -- 1

    if ((ShaftCount <= 3 or shaftSkip == true) 
		and (CrankCount <= 1 or crankSkip == true) 
		and (SpringCount <=3 or springSkip == true) 
		and (PedalCount <=1 or pedalSkip == true) 
		and BoltCount == 0) then
			PathStop()
			goto StoppingScript
    elseif (ShaftCount >= 4 or CrankCount >= 2 or SpringCount >= 4 or PedalCount >= 2 or BoltCount >= 1) then
        PathStop()
        goto IdyllshireTurnin
    end

::StoppingScript::
    yield("/echo Turnins have finished, thanks for using")