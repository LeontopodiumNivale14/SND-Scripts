--[[

  ***********************
  *  Idyllshire Turnin  *
  *   Alex 1-4 Edition  *
  ***********************

  **************
  *   VERSION  *
  *  3.3.1.12  *
  **************

  Update notes:
    3.3.1.12 
    3.3.1.11 -> Removed Old GC Ticket teleport system, since that's just baked into the GCTeleport itself. Took that time to also re-write that whole section and clean it up a bit.
    3.3.1.10 -> Made some tiny optimizations that's been bugging me, nothing to major. mounting in Idyllshire for instance...
    3.3.1.0 -> Small fix to if you're buying in gridania, added a waypoint so you wouldn't get stuck on the step trying to turn it in
    3.3.0.0 -> Rewrote the buying process to go from bolts -> pedal -> spring -> crank -> shaft
               This functionally does nothing for normal buyer peeps 
               Also made it to where you could max buy on the first page, so it'll get in/out of Idyllshire quicker
                 -> This setting is "MaxSingleItem", you'll find the toglle under Settings, off by default as always
    3.2.0.0 -> Inventory Buying Fix

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
  -> Pandora (Enable "Auto-select Turn-ins & Automatically Confirm") | 
  -> Lifestream 
  -> Deliveroo [If you need the link, here --> https://plugins.carvel.li/]
  -> vnavmesh (replaced visland)

  -> YesAlready

  **************
  *  IMPORTANT *
  *   SETTING  *
  **************

  -> YesAlready -> Yes/No -> Add this:  You cannot currently equip this item. Proceed with the transaction?
  Yes, you can zone lock this to strictly Idyllshire if you would like (I did)

  -> YesAlready -> Bothers -> Scroll near the VERY bottom and make sure "ShopExchangeItemDialog" is checkmarked
]]

--[[

  **************
  *  Settings  *
  **************

]]
-- If you're shop is skipping buying items, increase this value. 
-- Default is 1 cause that's worked for me, but 5 has helped others as well
Alex_Shop_Timer = 1

-- If you would like it to buy the max amount of items that it can on each run
-- DO NOTE. This will buy multiple "unique" items to turn in to the GC
-- No, you can't equip them, it's just meant to speed up the spending/buying process
-- It's off by default, so nobody freak out
MaxInventory = false

-- If you want to max the first item in the stop, enable this. 
-- this will do the same as the MaxInventory, but instead of menu-ing through all of them, it'll buy then just head directly to the GC
-- Cause.... man there's a lot of bolts to turn in w/ this XD
-- It's off by default, so nobody freak out
MaxSingleItem = false


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

::IdyllshireTurnin::

    while IsInZone(478) == false and GetCharacterCondition(27) == false do
        yield("/tp Idyllshire")
        yield("/wait 0.1")
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
                yield("/wait 0.2")
            end
            yield("/wait 0.5")
            yield("/vnavmesh moveto -19.277 211 -36.076")
        end
    end

::SabinaTest::

    DistanceToVendor()

    while Distance_Test > 1 do
        yield ("/wait 0.1")
        DistanceToVendor()
    end

    if GetCharacterCondition(4, true) then 
        yield("/ac dismount")
        repeat
            yield("/wait 0.1")
        until GetCharacterCondition(4, false)
    end 
    yield("/wait 1")
    while GetTargetName() == "" do 
        yield("/target Sabina")
    end 
    yield("/wait 0.35")
    yield("/interact Sabina")
    yield("/wait 1.0")
    yield("/pcall SelectIconString True 0")
    yield("/wait 1.0")
    yield("/pcall SelectString True 0")
    yield("/wait 1.0")
    yield("/pcall SelectString True 0")
    yield("/wait 1.0")

    Shop_Menu = 1
    Gordian_Part = 1

::ShopInitialize::
    i_count = GetInventoryFreeSlotCount()
    -- In order it goes | Shop | Shaft 1/2 | Crank 1/2 | Spring 1/2 | Pedal 1/2 | Bolt 1/2 | Stop
    if Shop_Menu == 1 then
        ShopArray = {22, 15, 14, 12, 11, 9, 8, 6, 5, 3, 2}
        Alex_Shop = ShopArray[1]
    elseif Shop_Menu == 2 then
        ShopArray = {13, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}
        Alex_Shop = ShopArray[1]
    elseif Shop_Menu == 3 then
        ShopArray = {17, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1}
        Alex_Shop = ShopArray[1]
    end

    if MaxSingleItem == true then 
        MaxInventory = false  
    end 

::BuyingItems::
    while (Alex_Shop > ShopArray[11]) do
    
        ShaftCount = GetItemCount(ShaftID)   -- 4
        CrankCount = GetItemCount(CrankID)   -- 2 
        SpringCount = GetItemCount(SpringID) -- 4
        PedalCount = GetItemCount(PedalID)   -- 2 
        BoltCount = GetItemCount(BoltID)     -- 1
        i_count = GetInventoryFreeSlotCount()

        if i_count == 0 then
            Alex_Shop = ShopArray[11]
            Shop_Menu = 3 
        elseif (BoltCount == 0) and (ShopArray[1] >= Alex_Shop and ShopArray[2] <= Alex_Shop) then -- Bolt Section
            Alex_Shop = ShopArray[3]
            -- yield("/echo Bolt Count: "..BoltCount)
            -- yield("/echo Should be moving to Pedals")
        elseif (BoltCount >= 1) and (ShopArray[1] >= Alex_Shop and ShopArray[2] <= Alex_Shop) then
            yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
            Alex_Shop = Alex_Shop - 1
            --yield("/echo Shop Menu: "..Alex_Shop)
            yield("/wait "..Alex_Shop_Timer)
            i_count = GetInventoryFreeSlotCount()
            if (MaxSingleItem == true and Alex_Shop == ShopArray[2]) or (Shop_Menu == 3 and MaxInventory == true and Alex_Shop == ShopArray[2]) then
                BoltCount = GetItemCount(BoltID)
		        if i_count > BoltCount then
                    i_count = BoltCount
                end
	            yield("/e Bolt Send Amount = "..i_count)
                yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." "..i_count)
                yield("/wait "..Alex_Shop_Timer)
                Alex_Shop = Alex_Shop - 1
                yield("/wait "..Alex_Shop_Timer)
                BoltCount = GetItemCount(BoltID)
            end
        elseif (PedalCount <= 1) and (ShopArray[3] >= Alex_Shop and ShopArray[4] <= Alex_Shop) then -- Pedal Check Section
            Alex_Shop = ShopArray[5]
            -- yield("/echo Pedal Count: "..PedalCount)
            -- yield("/echo Should be moving to Springs")
            yield("/wait 0.2")
        elseif (PedalCount >= 2) and (ShopArray[3] >= Alex_Shop and ShopArray[4] <= Alex_Shop) then
            yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
            Alex_Shop = Alex_Shop - 1
            --yield("/echo Shop Menu: "..Alex_Shop)
            yield("/wait "..Alex_Shop_Timer)
            i_count = GetInventoryFreeSlotCount()
            if (MaxSingleItem == true and Alex_Shop == ShopArray[4] and (BoltCount == 0)) or (Shop_Menu == 3 and MaxInventory == true and Alex_Shop == ShopArray[4] and (BoltCount == 0)) then
                PedalCount = GetItemCount(PedalID)
	            if i_count > (PedalCount//2) then
                    i_count = (PedalCount//2)
                end
	            yield("/e Pedal Send Amount = "..i_count)
                yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." "..i_count)
                yield("/wait "..Alex_Shop_Timer)
                Alex_Shop = Alex_Shop - 1
                yield("/wait "..Alex_Shop_Timer)
                PedalCount = GetItemCount(PedalID)
                i_count = GetInventoryFreeSlotCount()
            end 
        elseif (SpringCount <=3) and (ShopArray[5] >= Alex_Shop and ShopArray[6] <= Alex_Shop) then -- Springs Section
            Alex_Shop = ShopArray[7]
            -- yield("/echo Spring Count: "..SpringCount)
            -- yield("/echo Should be moving to Crank")
        elseif (SpringCount >=4) and (ShopArray[5] >= Alex_Shop and ShopArray[6] <= Alex_Shop) then
            yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
            Alex_Shop = Alex_Shop - 1
            --yield("/echo Shop Menu: "..Alex_Shop)
            yield("/wait "..Alex_Shop_Timer)
            i_count = GetInventoryFreeSlotCount()
            if (MaxSingleItem == true and Alex_Shop == ShopArray[6] and (BoltCount == 0 and PedalCount <= 1)) or (Shop_Menu == 3 and MaxInventory == true and Alex_Shop == ShopArray[6] and (BoltCount == 0 and PedalCount <= 1)) then
                SpringCount = GetItemCount(SpringID)
                if i_count > (SpringCount//4) then
                    i_count = (SpringCount//4)
                end
                yield("/e Spring Send Amount = "..i_count)
                yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." "..i_count)
                yield("/wait "..Alex_Shop_Timer)
                Alex_Shop = Alex_Shop - 1
                yield("/wait "..Alex_Shop_Timer)
                SpringCount = GetItemCount(SpringID)
                i_count = GetInventoryFreeSlotCount()
            end    
        elseif (CrankCount <=1) and (ShopArray[7] >= Alex_Shop and ShopArray[8] <= Alex_Shop) then -- Crank Section
            Alex_Shop = ShopArray[9]
            -- yield("/echo Crank Count: "..CrankCount)
            -- yield("/echo Should be moving to Shaft" 
        elseif (CrankCount >= 2) and (ShopArray[7] >= Alex_Shop and ShopArray[8] <= Alex_Shop) then
            yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
            Alex_Shop = Alex_Shop - 1
            --yield("/echo Shop Menu: "..Alex_Shop)
            yield("/wait "..Alex_Shop_Timer)
            i_count = GetInventoryFreeSlotCount()
            if (MaxSingleItem == true and Alex_Shop == ShopArray[8] and (BoltCount == 0 and PedalCount <= 1 and SpringCount <= 3)) or (Shop_Menu == 3 and MaxInventory == true and Alex_Shop == ShopArray[8] and (BoltCount == 0 and PedalCount <= 1 and SpringCount <= 3)) then
                CrankCount = GetItemCount(CrankID)
		        if i_count > (CrankCount//2) then
                  i_count = (CrankCount//2)
                end
		        yield("/e Crank Send Amount = "..i_count)
                yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." "..i_count)
                yield("/wait "..Alex_Shop_Timer)
                Alex_Shop = Alex_Shop - 1
                yield("/wait "..Alex_Shop_Timer)
                CrankCount = GetItemCount(CrankID)
                i_count = GetInventoryFreeSlotCount()
            end  
        elseif (ShaftCount <=3) and (ShopArray[9] >= Alex_Shop and ShopArray[10] <= Alex_Shop) then -- Shaft Section
            Alex_Shop = ShopArray[11]
            -- yield("/echo Shaft Count: "..ShaftCount)
            -- yield("/echo Should be moving to next menu")
            -- yield("/echo Shop Menu: "..Alex_Shop)
        elseif (ShaftCount >= 4 ) and (ShopArray[9] >= Alex_Shop and ShopArray[10] <= Alex_Shop) then
            yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
            Alex_Shop = Alex_Shop - 1
            --yield("/echo Shop Menu: "..Alex_Shop) -- Just Debugging Stuff
            yield("/wait "..Alex_Shop_Timer)
            i_count = GetInventoryFreeSlotCount()
            if (MaxSingleItem == true and Alex_Shop == ShopArray[10] and (BoltCount == 0 and PedalCount <= 1 and SpringCount <= 3 and CrankCount <= 1)) or (Shop_Menu == 3 and MaxInventory == true and Alex_Shop == ShopArray[10] and (BoltCount == 0 and PedalCount <= 1 and SpringCount <= 3 and CrankCount <= 1)) then
                ShaftCount = GetItemCount(ShaftID)
		        if i_count > (ShaftCount//4) then
                    i_count = (ShaftCount//4)
                end
		        yield("/e Shaft Send Amount = "..i_count)
                yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." "..i_count)
                yield("/wait "..Alex_Shop_Timer)
                Alex_Shop = Alex_Shop - 1
                yield("/wait "..Alex_Shop_Timer)
                ShaftCount = GetItemCount(ShaftID)
                i_count = GetInventoryFreeSlotCount()
            end    
        end
    end 
	  
-- Time to swap menu's  

    if (Alex_Shop == ShopArray[11]) and (Shop_Menu == 1) then
      -- yield("/echo DOW 1 Menu is completed")

      Shop_Menu = (Shop_Menu + 1)

      -- yield("/echo Shop Menu is Currently: "..Shop_Menu)

      yield("/pcall ShopExchangeItem True -1")
      yield("/wait 1")
      yield("/pcall SelectString True 1")
      yield("/wait 1.5")

      goto ShopInitialize

    elseif (Alex_Shop == ShopArray[11]) and (Shop_Menu == 2) then
      -- yield("/echo DOW 2 Menu is completed")
    
      Shop_Menu = (Shop_Menu + 1)

      -- yield("/echo Shop Menu is Currently: "..Shop_Menu)

      yield("/pcall ShopExchangeItem True -1")
      yield("/wait 1")
      yield("/pcall SelectString True 2")
      yield("/wait 1.5")

      goto ShopInitialize

    elseif (Alex_Shop == ShopArray[11]) and (Shop_Menu == 3) then
      --yield("/echo DOM Menu is completed")

      Gordian_Part = Gordian_Part + 1
      Shop_Menu = (Shop_Menu + 1)

      --yield("/echo Shop Menu is Currently: "..Shop_Menu)

      yield("/pcall ShopExchangeItem True -1")
      yield("/wait 1")
      yield("/pcall SelectString True 7")
      yield("/wait 1.5")
    end

::TicketsPlease::
    LimsaGCTicket = GetItemCount(LimsaTicketID)
    GridaniaGCTicket = GetItemCount(GridaniaTicketID)
    UldahGCTicket = GetItemCount(UldahTicketID)

::GrandCompanyTurnin::

    if (LimsaGCTicket >= 1) then 
        yield("/item Maelstrom aetheryte ticket")
        yield("/wait 1.0")
    elseif (GridaniaGCTicket >= 1) then
        yield("/item Twin Adder aetheryte ticket")
        yield("/wait 1.0")
    elseif (UldahGCTicket >= 1) then
        yield("/item Immortal Flames aetheryte ticket")
        yield("/wait 1.0")
    elseif (LimsaGCTicket == 0) or (GridaniaGCTicket == 0) or (UldahGCTicket == 0) then
        TeleportToGCTown()
        yield("/wait 1.0")
    end

    TeleportTest()

    if IsInZone(478) == true and GetCharacterCondition(27) == false then
        yield("/echo Hmm.... either you moved, or the teleport failed, lets try that again")
        yield("/wait 1")
        goto GrandCompanyTurnin
    end

::GrandCompanyCheck::
    while DeliverooIsTurnInRunning() == false do
        if IsInZone(129) then -- Limsa Upper
            yield("/wait 3")
            yield("/target Aetheryte")
            AetheryteX = GetTargetRawXPos()
            AetheryteY = GetTargetRawYPos()
            AetheryteZ = GetTargetRawZPos()
            PathfindAndMoveTo(AetheryteX, AetheryteY, AetheryteZ, false)
            while GetDistanceToPoint(AetheryteX, AetheryteY, AetheryteZ) > 7 do 
                yield("/wait 0.1")
            end 
            PathStop()
            yield("/li The Aftcastle")
            while GetCharacterCondition(32) do
                yield("/wait 1")
            end
            while GetCharacterCondition(45) or GetCharacterCondition(51) do
                yield("/wait 1") 
            end
        elseif IsInZone(128) then -- Limsa Upper
            yield("/wait 3")
            PathfindAndMoveTo(93.9,40.175,75.409, false)
            yield("/wait 0.5")
            while GetDistanceToPoint(93.9,40.175,75.409) > 1 do 
                yield("/wait 0.1")
            end 
            yield("/deliveroo enable")
            yield("/wait 0.5")
        elseif IsInZone(130) then -- Ul'dah's GC
            yield("/wait 3")
            PathfindAndMoveTo(-142.361,4.1,-106.919, false)
            while GetDistanceToPoint(93.9,40.175,75.409) > 1 do 
                yield("/wait 0.1")
            end 
            yield("/deliveroo enable")
            yield("/wait 0.5")
        elseif IsInZone(132) then -- Grdiania's GC
            yield("/wait 3")
            PathfindAndMoveTo(-59.564868927002, -1.7171915769577, 11.678337097168, false)
            while GetDistanceToPoint(-59.564868927002, -1.7171915769577, 11.678337097168) > 4 do 
                if PathIsRunning() == false then 
                    PathfindAndMoveTo(-59.564868927002, -1.7171915769577, 11.678337097168, false)
                end
                yield("/wait 0.1")
            end 
            PathfindAndMoveTo(-67.757,-0.501,-8.393, false)
            while GetDistanceToPoint(-67.757,-0.501,-8.393) > 1 do 
                yield("/wait 0.1")
                if PathIsRunning() == false then 
                    PathfindAndMoveTo(-67.757,-0.501,-8.393, false)
                end 
            end 
            yield("/deliveroo enable")
            yield("/wait 0.5")
        end
    end

    while DeliverooIsTurnInRunning() do
        yield("/wait 1")
    end

::InventoryCheck::

    ShaftCount = GetItemCount(ShaftID) -- 4
    CrankCount = GetItemCount(CrankID) -- 2 
    SpringCount = GetItemCount(SpringID) -- 4
    PedalCount = GetItemCount(PedalID) -- 2 
    BoltCount = GetItemCount(BoltID) -- 1

    if (ShaftCount <= 3 and CrankCount <= 1 and SpringCount <=3 and PedalCount <=1 and BoltCount == 0) then
        PathStop()
        goto StoppingScript
    elseif (ShaftCount >= 4 or CrankCount >= 2 or SpringCount >= 4 or PedalCount >= 2 or BoltCount >= 1) then
        PathStop()
        goto IdyllshireTurnin
    end

::StoppingScript::
    yield("/echo Turnins have finished, thanks for using")