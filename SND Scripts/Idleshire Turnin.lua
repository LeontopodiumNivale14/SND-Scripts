--[[
This has been.... a pain to work on xD But it's worth it. 
This requires: 
  -> Teleporter
  -> Pandora (Enable "Auto-select Turn-ins & Automatically Confirm")
  -> Lifestream 
  -> Deliveroo

  Version: 1 
  it's currently setup to constantly transfer/get the gear until you run out of all mats to be able to GET gear.
  If there's an issue, just ping me in the discord (LegendofIceman)
]]


::SettingUpValues::
-- Visland Routes
LimsaGC = "H4sIAAAAAAAACuWT20oDMRCGX0XmOoRsJsluciceoBf1UJRaxYvFjTTgJtLNKrL03c0e2oJ9A5ur+SfDzz8fSQc3ZW3BwKP3qajOFqGNFggsy5/P4HxswLx0cBcaF13wYDp4AsORFixTSGAFRjDK+iMIPIPJBcVcI26TCt7OLsFkvCCwKCvXJrOMMgLz8GVr6yOYJGY+2k35Fpcurm/7+T+9KWDK1KzD9+4mhUlu7+VHYw/jQ8KMwFUdot1ZRVtP5fkwMYn71jZxqnvjZeniwbFX12FzEXw1Lc7G5oOr7TzNsS05wiI4zSQTWgxcUFOdjtxj0RKzU8SiJFUoimL/WkYinAqFXJ4ikVzSHFHxIyKy0FydIhGNlCmh90R4LlGl3cevIwshlfj/XF63vz7BbA6QBQAA"
UldahGC = "H4sIAAAAAAAACuWUy2rDMBBFfyXM2h00elnyrqQPskgfoSV90IVpVGKIrRIrLSXk3ys7dgMhX1B7pTu6XMaHi7Zwk5cOMnhcLfLl6Ho8mvlNcJDAPP/59EUVashet3Dn6yIUvoJsC0+QnZHgyBXXNoHnKDmyBF6auRKoNUmzi9pXbnIBGYl4OcsXxSZmUeOc+i9XuipAFsWkCm6dv4d5EZa3jf9o1i0YV6qX/ru/ibvEtI98VbuDvV2QErgsfXB9VHBldzxvHZ2437g6dOcmeJ4X4ZDYqCu/Hvtq0f032w8fitJNo4/tkhNUSCOzknRLhdC2n+nQCIVkLFfDRMMVWm6FaNEc+sIlcp0qOUwoxDA1sTX7wsg/Kkyh5FzTQLtCKTKj6IiKNUhWi4FWJb4ezFjbI2lfFtnXhaMiKfgwyUiOklQaYZxCo9EYkYr/j+Zt9wtPlPDdzQcAAA=="
GridaniaGC = "H4sIAAAAAAAACuWVTUsDMRCG/0qZ8zYkmXzt3qRq6aF+FKF+4GGxkQbcjXRTRUr/u9PdLQXFc8He8mZehpmHmWQDV2XloYDxKizKOpSD8Wgwi+vkIYN5+fUeQ50aKJ42cBObkEKsodjAPRTSMp0jtzqDBygEkxk8QoHIcqGt3JKKtZ+cUwgpNCsXYU15kPEMpvHDV75OUJCY1Mmvypc0D2l5vfP/uOvro3KaZfzcR6gOyvZavjX+YG+LUxlcVDH5farkq/541jp6cbv2TerPu8TzMqRDxp26jKtRrBd9z7y7vAuVn5KPb7PfRKg5aY1ReyJKc8lNy0UqptApiccDI44GZqiYdEpgNypDwSxJlLolIwRz3KEyp0mGuhe5yTsyxMlaabqREZJxZ7R0JwlGO5YbTpPRkSEWlvYn78ggQ26cVSdJxiiGTtjulRlypjmiwu6VYcqqXPPT3CVjGRqp+onZgREatW3JDHMmuZP8z4+J7P+EzPP2G0RZ1w7VBwAA"
IdyllshireAlex = "H4sIAAAAAAAACuWUyWrDMBCGX6XMWRUaydbiW+kCOaRLKKRp6cE0UyKIrRIrLSXk3Ss7DqHJpddinWbTzz8fQhu4LSuCAkbzJTULv6KzSVhHAgbT8vsj+Do2ULxs4D40PvpQQ7GBJyjOleXaOGs1gxkUUmiOmVM5g+fUROROau3MNuWhptEVFJmxDCbl3K+TIHLBYBw+qaI6pusMRnWkVfkWpz4u7tp58bvW20y+mkX42neSoaT2Xi4bOox3LpHBdRUi7aUiVX140U30ycOamtjHrfC09PGg2GY3YXUZ6nm/vNgVH31F4zQntuwUjTRco1XW7NCg4C4du0MjW04mz9Qw0QiujMnQ9Wi6ZbsXI7iVKHU+SCwoubICzTGVFpd0mRwmFMUFSpudUFGCp6eS24FicVyhEDZ9tUdYdMKSW/dHKkcE/hOV1+0Pt8UVbrcGAAA="


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

::IdyllshireTurnin::

if IsInZone(478) == false then
  yield("/tp Idyllshire")
  yield("/wait 0.5")
end

while GetCharacterCondition(27) do 
  yield("/wait 1") 
end
yield("/wait 1")
while GetCharacterCondition(45) or GetCharacterCondition(51) do 
  yield("/wait 3") 
end

if IsInZone(478) then
  yield("/target Aetheryte")
  yield("/lockon")
  yield("/automove")
  yield("/wait 1.0")
  yield("/automove")
  yield("/li West")
  yield("/wait 1")
end

while GetCharacterCondition(32) do
   yield("/wait 1")
end

yield("/wait 1")

while GetCharacterCondition(45) or GetCharacterCondition(51) do
   yield("/wait 1") 
end

yield("/visland exectemponce "..IdyllshireAlex)
yield("/wait 0.5")

while IsVislandRouteRunning() do
  yield("/wait 0.5")
end

if (not IsVislandRouteRunning()) then
  yield("/ac dismount")
  yield("/wait 2")
  yield("/target Sabina")
  yield("/wait 0.35")
  yield("/pint Sabina")
  yield("/wait 1.0")
  yield("/pcall SelectIconString True 0")
  yield("/wait.1.0")
  yield("/pcall SelectString True 0")
  yield("/wait 1.0")
  yield("/pcall SelectString True 0")
  yield("/wait 1.0")
end

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
    -- yield("/echo Bolt Count: "..BoltCount)
    -- yield("/echo Should be moving to Pedals")

  elseif BoltCount >= 1 and (Alex_Shop >= Alex_Bolt) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    BoltCount = GetItemCount(BoltID)
    yield("/wait 1")

  -- Pedal Check Section
  elseif PedalCount <= 1 and (Alex_Shop >= Alex_Ped1) then
    Alex_Shop = Alex_Spr1
    -- yield("/echo Pedal Count: "..PedalCount)
    -- yield("/echo Should be moving to Springs")
    yield("/wait 0.2")

  elseif (Alex_Shop <= Alex_Ped1) and (Alex_Shop >= Alex_Ped2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    PedalCount = GetItemCount(PedalID)
    yield("/wait 1.0")
  
  -- Springs Section
  elseif (SpringCount <=3) and (Alex_Shop >= Alex_Spr1) then
    Alex_Shop = Alex_Cra1
    -- yield("/echo Spring Count: "..SpringCount)
    -- yield("/echo Should be moving to Crank")

  elseif (Alex_Shop <= Alex_Spr1) and (Alex_Shop >= Alex_Spr2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    SpringCount = GetItemCount(SpringID)
    yield("/wait 1")

  -- Crank Section
  elseif (CrankCount <=1) and (Alex_Shop >= Alex_Cra1) then
    Alex_Shop = Alex_Sha1
    -- yield("/echo Crank Count: "..CrankCount)
    -- yield("/echo Should be moving to Shaft")

  elseif (Alex_Shop <= Alex_Cra1) and (Alex_Shop >= Alex_Cra2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    SpringCount = GetItemCount(SpringID)
    yield("/wait 1")

  -- Shaft Section
  elseif ShaftCount <=3 and (Alex_Shop >= Alex_Sha1) then
    Alex_Shop = Alex_Stop
    -- yield("/echo Shaft Count: "..ShaftCount)
    -- yield("/echo Should be moving to next menu")
    -- yield("/echo Shop Menu: "..Alex_Shop)
  elseif (Alex_Shop <= Alex_Sha1) and (Alex_Shop >= Alex_Sha2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop - 1
    CrankCount = GetItemCount(CrankID)
    -- yield("/echo Shop Menu: "..Alex_Shop)
    yield("/wait 1")
  
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

::GrandCompanyTurnin::

TeleportToGCTown()
yield("/wait 0.5")
while GetCharacterCondition(27) do yield("/wait 1") end

yield("/wait 1")

while GetCharacterCondition(45) do yield("/wait 1") end

::GrandCompanyCheck::
if IsInZone(129) then -- Limsa's GC
  goto LimsaLower
elseif IsInZone(130) then -- Ul'dah's GC
  goto Uldah
elseif IsInZone(132) then -- Grdiania's GC
  goto Gridania
end

::LimsaLower::
if IsInZone(129) then -- Limsa's GC
  yield("/target Aetheryte")
  yield("/lockon")
  yield("/automove")
  yield("/wait 1.0")
  yield("/automove")
  yield("/li The Aftcastle")
  yield("/wait 1")
    while GetCharacterCondition(32) do
      yield("/wait 1")
    end
    while GetCharacterCondition(45) or GetCharacterCondition(51) do
      yield("/wait 1") 
    end
end

if IsInZone(128) then -- Limsa Upper
  yield("/visland exectemponce "..LimsaGC)
  yield("/wait 0.5")
  goto WalkingtoGC
end

::Uldah::
if IsInZone(130) then
  yield("/visland exectemponce "..UldahGC)
  yield("/wait 0.5")
  goto WalkingtoGC
end

::Gridania::
if IsInZone(132) then
  yield("/visland exectemponce "..UldahGC)
  yield("/wait 0.5")
  goto WalkingtoGC
end

::WalkingtoGC::
while IsVislandRouteRunning() do
  yield("/wait 2")
end

::GCTurnin::
yield("/deliveroo enable")
yield("/wait 0.5")

while DeliverooIsTurnInRunning() do
  yield("/wait 1")
end

::InventoryCheck::
if (BoltCount > 0) or (PedalCount > 1) or (SpringCount > 3) or (CrankCount > 1) or (ShaftCount > 3) then
  goto IdyllshireTurnin
end

::StoppingScript::
yield("/echo Turnins have finished, thanks for using")