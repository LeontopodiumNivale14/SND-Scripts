::SettingUpValues::

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

Shop_Menu = 1
Gordian_Part = 1

::ShopInitialize::

if Shop_Menu == 1 then
  Alex_Shop = 22
  Alex_Bolt = 15
  Alex_Ped1 = 14
  Alex_Ped2 = 12
  Alex_Spr1 = 11
  Alex_Spr2 = 9
  Alex_Cra1 = 8
  Alex_Cra2 = 6
  Alex_Sha1 = 5
  Alex_Sha2 = 3
  Alex_Stop = 2
elseif Shop_Menu == 2 then
  Gordian_Part = 1
  Alex_Shop = 13
  Alex_Bolt = 10
  Alex_Ped1 = 9
  Alex_Ped2 = 8
  Alex_Spr1 = 7
  Alex_Spr2 = 6
  Alex_Cra1 = 5
  Alex_Cra2 = 4
  Alex_Sha1 = 3
  Alex_Sha2 = 2
  Alex_Stop = 1
elseif Shop_Menu == 3 then
  Gordian_Part = 1
  Alex_Shop = 17
  Alex_Bolt = 10
  Alex_Ped1 = 9
  Alex_Ped2 = 8
  Alex_Spr1 = 7
  Alex_Spr2 = 6
  Alex_Cra1 = 5
  Alex_Cra2 = 4
  Alex_Sha1 = 3
  Alex_Sha2 = 2
  Alex_Stop = 1
end

::BuyingItems::

while (Gordian_Part == 1) and (Shop_Menu <=3)  do

-- Bolt Section
  -- If no bolts, then continues onto pedals
  if BoltCount == 0 and (Alex_Shop >= Alex_Bolt) then
    Alex_Shop = Alex_Ped1
    yield("/echo Bolt Count: "..BoltCount)
    yield("/echo Should be moving to Pedals")

  elseif BoltCount >= 1 and (Alex_Shop >= Alex_Bolt) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    BoltCount = GetItemCount(BoltID)
    yield("/wait 1")

  -- Pedal Check Section
  elseif PedalCount <= 1 and (Alex_Shop >= Alex_Ped1) then
    Alex_Shop = Alex_Spr1
    yield("/echo Pedal Count: "..PedalCount)
    yield("/echo Should be moving to Springs")
    yield("/wait 0.2")

  elseif (Alex_Shop <= Alex_Ped1) and (Alex_Shop >= Alex_Ped2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    PedalCount = GetItemCount(PedalID)
    yield("/wait 1.0")
  
  -- Springs Section
  elseif (SpringCount <=3) and (Alex_Shop >= Alex_Spr1) then
    Alex_Shop = Alex_Cra1
    yield("/echo Spring Count: "..SpringCount)
    yield("/echo Should be moving to Crank")

  elseif (Alex_Shop <= Alex_Spr1) and (Alex_Shop >= Alex_Spr2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    SpringCount = GetItemCount(SpringID)
    yield("/wait 1")

  -- Crank Section
  elseif (CrankCount <=1) and (Alex_Shop >= Alex_Cra1) then
    Alex_Shop = Alex_Sha1
    yield("/echo Crank Count: "..CrankCount)
    yield("/echo Should be moving to Shaft")

  elseif (Alex_Shop <= Alex_Cra1) and (Alex_Shop >= Alex_Cra2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    SpringCount = GetItemCount(SpringID)
    yield("/wait 1")

  -- Shaft Section
  elseif ShaftCount <=3 and (Alex_Shop >= Alex_Sha1) then
    Alex_Shop = Alex_Stop
    yield("/echo Shaft Count: "..ShaftCount)
    yield("/echo Should be moving to next menu")
    yield("/echo Shop Menu: "..Alex_Shop)
  elseif (Alex_Shop <= Alex_Sha1) and (Alex_Shop >= Alex_Sha2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    CrankCount = GetItemCount(CrankID)
    yield("/echo Shop Menu: "..Alex_Shop)
    yield("/wait 1")
  
  -- Time to swap menu's  
  elseif (Alex_Shop == Alex_Stop) and (Shop_Menu == 1) then
    yield("/echo DOW 1 Menu is completed")

    Gordian_Part = Gordian_Part + 1
    Shop_Menu = (Shop_Menu + 1)

    yield("/echo Shop Menu is Currently: "..Shop_Menu)

    yield("/pcall ShopExchangeItem True -1")
    yield("/wait 1")
    yield("/pcall SelectString True 1")
    yield("/wait 0.5")

    goto ShopInitialize

  elseif (Alex_Shop == Alex_Stop) and (Shop_Menu == 2) then
    yield("/echo DOW 2 Menu is completed")
    
    Gordian_Part = Gordian_Part + 1
    Shop_Menu = (Shop_Menu + 1)

    yield("/echo Shop Menu is Currently: "..Shop_Menu)

    yield("/pcall ShopExchangeItem True -1")
    yield("/wait 1")
    yield("/pcall SelectString True 2")
    yield("/wait 1")

    goto ShopInitialize

  elseif (Alex_Shop == Alex_Stop) and (Shop_Menu == 3) then
    yield("/echo DOM Menu is completed")

    Gordian_Part = Gordian_Part + 1
    Shop_Menu = (Shop_Menu + 1)

    yield("/echo Shop Menu is Currently: "..Shop_Menu)

    yield("/pcall ShopExchangeItem True -1")
    yield("/wait 1")
    yield("/pcall SelectString True 7")
    yield("/wait 1")
  end
end