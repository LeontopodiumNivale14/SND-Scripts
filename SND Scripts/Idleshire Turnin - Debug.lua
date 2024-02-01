--tarnished gordian item ids, hardcoded.
LensID = 12674
ShaftID = 12675
CrankID = 12676
SpringID = 12677
PedalID = 12678
BoltID = 12680

--initialize item counts
LensCount = GetItemCount(LensID)
ShaftCount = GetItemCount(ShaftID)
CrankCount = GetItemCount(CrankID)
SpringCount = GetItemCount(SpringID)
PedalCount = GetItemCount(PedalID)
BoltCount = GetItemCount(BoltID)

Gordian_Part = 1
Shop_Menu = 1
Alex_Shop_Timer = 5


::ShopInitialize::

if Shop_Menu == 1 then
  Alex_Shop = 3
  Alex_Shaft1 = 3
  Alex_Shaft2 = 5
  Alex_Crank1 = 6
  Alex_Crank2 = 8
  Alex_Spring1 = 9
  Alex_Spring2 = 11
  Alex_Pedal1 = 12
  Alex_Pedal2 = 14
  Alex_Bolt1 = 15
  Alex_Bolt2 = 22
  Alex_Stop = 23

elseif Shop_Menu == 2 then
  Gordian_Part = 1
  Alex_Shop = 2
  Alex_Shaft1 = 2
  Alex_Shaft2 = 3
  Alex_Crank1 = 4
  Alex_Crank2 = 5
  Alex_Spring1 = 6
  Alex_Spring2 = 7
  Alex_Pedal1 = 8
  Alex_Pedal2 = 9
  Alex_Bolt1 = 10
  Alex_Bolt2 = 13
  Alex_Stop = 14

elseif Shop_Menu == 3 then

  Gordian_Part = 1
  Alex_Shop = 2
  Alex_Shaft1 = 2
  Alex_Shaft2 = 3
  Alex_Crank1 = 4
  Alex_Crank2 = 5
  Alex_Spring1 = 6
  Alex_Spring2 = 7
  Alex_Pedal1 = 8
  Alex_Pedal2 = 9
  Alex_Bolt1 = 10
  Alex_Bolt2 = 17
  Alex_Stop = 18
end

::BuyingItems::

while (Gordian_Part == 1) and (Shop_Menu <= Alex_Shaft2)  do

 -- Shaft Section
 if (ShaftCount <=3) and (Alex_Shop >= Alex_Shaft1) and (Alex_Shop <= Alex_Shaft2) then
   Alex_Shop = Alex_Crank1
   -- yield("/echo Shaft Count: "..ShaftCount)
   -- yield("/echo Should be moving to next menu")
   -- yield("/echo Shop Menu: "..Alex_Shop)
 elseif (ShaftCount >= 4 ) and (Alex_Shop >= Alex_Shaft1) and (Alex_Shop <= Alex_Shaft2) then
   yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
   Alex_Shop = Alex_Shop + 1
   CrankCount = GetItemCount(CrankID)
   yield("/echo Shop Menu: "..Alex_Shop) -- Just Debugging Stuff
   yield("/wait "..Alex_Shop_Timer)

 -- Crank Section
 elseif (CrankCount <=1) and (Alex_Shop >= Alex_Crank1) and (Alex_Shop <= Alex_Crank2) then
   Alex_Shop = Alex_Spring1
   -- yield("/echo Crank Count: "..CrankCount)
   -- yield("/echo Should be moving to Shaft")

 elseif (CrankCount >= 2) and (Alex_Shop >= Alex_Crank1) and (Alex_Shop <= Alex_Crank2) then
   yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
   Alex_Shop = Alex_Shop + 1
   SpringCount = GetItemCount(SpringID)
   yield("/echo Shop Menu: "..Alex_Shop)
   yield("/wait "..Alex_Shop_Timer)

  -- Springs Section
  elseif (SpringCount <=3) and (Alex_Shop >= Alex_Spring1) and (Alex_Shop <= Alex_Spring2) then
    Alex_Shop = Alex_Pedal1
    -- yield("/echo Spring Count: "..SpringCount)
    -- yield("/echo Should be moving to Crank")

  elseif (SpringCount >=4) and (Alex_Shop >= Alex_Spring1) and (Alex_Shop <= Alex_Spring2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop + 1
    SpringCount = GetItemCount(SpringID)
    yield("/echo Shop Menu: "..Alex_Shop)
    yield("/wait "..Alex_Shop_Timer)

  -- Pedal Check Section
  elseif (PedalCount <= 1) and (Alex_Shop >= Alex_Pedal1) and (Alex_Shop <= Alex_Pedal2) then
    Alex_Shop = Alex_Spring1
    -- yield("/echo Pedal Count: "..PedalCount)
    -- yield("/echo Should be moving to Springs")
    yield("/wait 0.2")

  elseif (PedalCount >= 2) and (Alex_Shop >= Alex_Pedal1) and (Alex_Shop <= Alex_Pedal2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop + 1
    PedalCount = GetItemCount(PedalID)
    yield("/echo Shop Menu: "..Alex_Shop)
    yield("/wait "..Alex_Shop_Timer)

-- Bolt Section
  -- If no bolts, then continues onto pedals
  elseif (BoltCount == 0) and (Alex_Shop >= Alex_Bolt1) and (Alex_Shop <= Alex_Bolt2) then
    Alex_Shop = Alex_Stop
    -- yield("/echo Bolt Count: "..BoltCount)
    -- yield("/echo Should be moving to Pedals")

  elseif (BoltCount >= 1) and (Alex_Shop >= Alex_Bolt1) and (Alex_Shop <= Alex_Bolt2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop + 1
    BoltCount = GetItemCount(BoltID)
    yield("/echo Shop Menu: "..Alex_Shop)
    yield("/wait "..Alex_Shop_Timer)

  -- Time to swap menu's  
  elseif (Alex_Shop == Alex_Stop) and (Shop_Menu == 1) then
    -- yield("/echo DOW 1 Menu is completed")

    Gordian_Part = Gordian_Part + 1
    Shop_Menu = (Shop_Menu + 1)

    -- yield("/echo Shop Menu is Currently: "..Shop_Menu)

    yield("/pcall ShopExchangeItem True -1")
    yield("/wait 1")
    yield("/pcall SelectString True 1")
    yield("/wait 0.5")

    goto ShopInitialize

  elseif (Alex_Shop == Alex_Stop) and (Shop_Menu == 2) then
    -- yield("/echo DOW 2 Menu is completed")
    
    Gordian_Part = Gordian_Part + 1
    Shop_Menu = (Shop_Menu + 1)

    -- yield("/echo Shop Menu is Currently: "..Shop_Menu)

    yield("/pcall ShopExchangeItem True -1")
    yield("/wait 1")
    yield("/pcall SelectString True 2")
    yield("/wait 1")

    goto ShopInitialize

  elseif (Alex_Shop == Alex_Stop) and (Shop_Menu == 3) then
    --yield("/echo DOM Menu is completed")

    Gordian_Part = Gordian_Part + 1
    Shop_Menu = (Shop_Menu + 1)

    yield("/echo Shop Menu is Currently: "..Shop_Menu)

    yield("/pcall ShopExchangeItem True -1")
    yield("/wait 1")
    yield("/pcall SelectString True 7")
    yield("/wait 1")

  end
end