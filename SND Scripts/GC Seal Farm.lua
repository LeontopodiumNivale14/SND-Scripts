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

-- Base values
Shop_Menu = 1

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
    Alex_Stop = 0
end


if Shop_Menu == 2 then
    Alex_Shop = 13
    Alex_Bolt = 9
    Alex_Ped1 = 8
    Alex_Ped2 = 7
    Alex_Spr1 = 6
    Alex_Spr2 = 5
    Alex_Cra1 = 4
    Alex_Cra2 = 3
    Alex_Sha1 = 2
    Alex_Sha2 = 1
    Alex_Stop = 0
end

::BuyingItems::

while Shop_Menu <=2 do

-- Bolt Section
  -- If no bolts, then continues onto pedals
  if BoltCount == 0 and (Alex_Shop >= Alex_Bolt) then
    Alex_Shop = Alex_Ped1
  elseif BoltCount >= 1 and (Alex_Shop >= Alex_Bolt) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    BoltCount = GetItemCount(BoltID)
    yield("/wait 1")

  -- Pedal Check Section
  elseif PedalCount <= 1 and (Alex_Shop >= Alex_Ped1) then
    dow1 = Alex_Spr1
    -- yield("/echo dow1: "..Alex_Shop)
  elseif (Alex_Shop <= Alex_Ped1) and (Alex_Shop >= Alex_Ped2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    PedalCount = GetItemCount(PedalID)
    yield("/wait 1.0")
  
  -- Springs Section
  elseif (SpringCount <=1) and (Alex_Shop >= Alex_Spr1) then
    Alex_Shop = Alex_Cra1
  elseif (Alex_Shop <= Alex_Spr1) and (Alex_Shop >= Alex_Spr2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    SpringCount = GetItemCount(SpringID)
    yield("/wait 1")

  -- Crank Section
  elseif (CrankCount <=1) and (Alex_Shop >= Alex_Cra1) then
    Alex_Shop = Alex_Sha1
  elseif (Alex_Shop <= Alex_Cra1) and (Alex_Shop >= Alex_Cra2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    SpringCount = GetItemCount(SpringID)
    yield("/wait 1")

  -- Shaft Section
  elseif ShaftCount <=1 and (Alex_Shop >= Alex_Sha1) then
    Alex_Shop = 0
  elseif (Alex_Shop <= Alex_Sha1) and (Alex_Shop >= Alex_Sha2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    CrankCount = GetItemCount(CrankID)
    yield("/echo Shop Menu: "..Alex_Shop)
    yield("/wait 1")

  elseif (Alex_Shop == Alex_Stop) or (Alex_Shop == 2) then
    yield("/echo finished")
    Shop_Menu = Shop_Menu + 1
    goto ShopInitialize
  end
end


::ShopStop::
yield("/echo Successful!")