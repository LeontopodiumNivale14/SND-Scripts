--[[
Description: Teleports you to Idyllshire (or if you're standing in front of an aetheryte) and takes you to the Alex Vendor to trade your raid pieces -> gear,
which then takes you to your personal Grand Company and turns them into what you have selected from Deliveroo.

If you have OTP on, and you have your company aetheryte tickets, you can do this loop for free wihtout costing you any gil.

This requires: 
-> IMPORTANT: YesAlready -> Yes/No -> Add this:  You cannot currently equip this item. Proceed with the transaction?
  Yes, you can zone lock this to strictly Idyllshire if you would like (I did)

  ALSO IMPORTANT!! YesAlready -> Bothers -> Scroll near the VERY bottom and make sure "ShopExchangeItemDialog" is checkmarked

  -> Teleporter
  -> Pandora (Enable "Auto-select Turn-ins & Automatically Confirm")
  -> Lifestream 
  -> Deliveroo [If you need the link, here --> https://plugins.carvel.li/]

  Version: 2.7 [Finally Released, now with GC Teleport Tickets]
    - Fixed the teleport issue in Idyllshire
]]


::SettingUpValues::
--[[!! If you're shop is skipping buying items, increase this value. 
Default is 1 cause that's worked for me, but 5 has helped others as well]]
Alex_Shop_Timer = 1


-- Visland Routes
LimsaGC = "H4sIAAAAAAAACuWT20oDMRCGX0XmOoRsJsluciceoBf1UJRaxYvFjTTgJtLNKrL03c0e2oJ9A5ur+SfDzz8fSQc3ZW3BwKP3qajOFqGNFggsy5/P4HxswLx0cBcaF13wYDp4AsORFixTSGAFRjDK+iMIPIPJBcVcI26TCt7OLsFkvCCwKCvXJrOMMgLz8GVr6yOYJGY+2k35Fpcurm/7+T+9KWDK1KzD9+4mhUlu7+VHYw/jQ8KMwFUdot1ZRVtP5fkwMYn71jZxqnvjZeniwbFX12FzEXw1Lc7G5oOr7TzNsS05wiI4zSQTWgxcUFOdjtxj0RKzU8SiJFUoimL/WkYinAqFXJ4ikVzSHFHxIyKy0FydIhGNlCmh90R4LlGl3cevIwshlfj/XF63vz7BbA6QBQAA"
UldahGC = "H4sIAAAAAAAACuWUy2rDMBBFfyXM2h00elnyrqQPskgfoSV90IVpVGKIrRIrLSXk3ys7dgMhX1B7pTu6XMaHi7Zwk5cOMnhcLfLl6Ho8mvlNcJDAPP/59EUVashet3Dn6yIUvoJsC0+QnZHgyBXXNoHnKDmyBF6auRKoNUmzi9pXbnIBGYl4OcsXxSZmUeOc+i9XuipAFsWkCm6dv4d5EZa3jf9o1i0YV6qX/ru/ibvEtI98VbuDvV2QErgsfXB9VHBldzxvHZ2437g6dOcmeJ4X4ZDYqCu/Hvtq0f032w8fitJNo4/tkhNUSCOzknRLhdC2n+nQCIVkLFfDRMMVWm6FaNEc+sIlcp0qOUwoxDA1sTX7wsg/Kkyh5FzTQLtCKTKj6IiKNUhWi4FWJb4ezFjbI2lfFtnXhaMiKfgwyUiOklQaYZxCo9EYkYr/j+Zt9wtPlPDdzQcAAA=="
GridaniaGC = "H4sIAAAAAAAACuWVTUsDMRCG/0qZ8zYkmXzt3qRq6aF+FKF+4GGxkQbcjXRTRUr/u9PdLQXFc8He8mZehpmHmWQDV2XloYDxKizKOpSD8Wgwi+vkIYN5+fUeQ50aKJ42cBObkEKsodjAPRTSMp0jtzqDBygEkxk8QoHIcqGt3JKKtZ+cUwgpNCsXYU15kPEMpvHDV75OUJCY1Mmvypc0D2l5vfP/uOvro3KaZfzcR6gOyvZavjX+YG+LUxlcVDH5farkq/541jp6cbv2TerPu8TzMqRDxp26jKtRrBd9z7y7vAuVn5KPb7PfRKg5aY1ReyJKc8lNy0UqptApiccDI44GZqiYdEpgNypDwSxJlLolIwRz3KEyp0mGuhe5yTsyxMlaabqREZJxZ7R0JwlGO5YbTpPRkSEWlvYn78ggQ26cVSdJxiiGTtjulRlypjmiwu6VYcqqXPPT3CVjGRqp+onZgREatW3JDHMmuZP8z4+J7P+EzPP2G0RZ1w7VBwAA"
IdyllshireAlex = "H4sIAAAAAAAACuWUyWrDMBCGX6XMWRUaydbiW+kCOaRLKKRp6cE0UyKIrRIrLSXk3Ss7DqHJpddinWbTzz8fQhu4LSuCAkbzJTULv6KzSVhHAgbT8vsj+Do2ULxs4D40PvpQQ7GBJyjOleXaOGs1gxkUUmiOmVM5g+fUROROau3MNuWhptEVFJmxDCbl3K+TIHLBYBw+qaI6pusMRnWkVfkWpz4u7tp58bvW20y+mkX42neSoaT2Xi4bOox3LpHBdRUi7aUiVX140U30ycOamtjHrfC09PGg2GY3YXUZ6nm/vNgVH31F4zQntuwUjTRco1XW7NCg4C4du0MjW04mz9Qw0QiujMnQ9Wi6ZbsXI7iVKHU+SCwoubICzTGVFpd0mRwmFMUFSpudUFGCp6eS24FicVyhEDZ9tUdYdMKSW/dHKkcE/hOV1+0Pt8UVbrcGAAA="
Limsa_Ticket_Usage = "H4sIAAAAAAAACl2PW0sDMRCF/0o5z2HZW3c1b6IWCtYbla0tPoR2aoMmkWaqyLL/3WSJCL7NmXx8OdPjVhmCxI02Xk2WevtGPHny6pUg0KnvD6cte8hNj3vnNWtnIXusIM+rbNo0As+QdZ6V7bRqBdaQbZ1VeVXWzRCiszS/gizKM4FHtdOnoCqyXGDhPsmQZcgQ5pbpqLbcaT7cRf7fLnUMjfzBff2+hCrBtlfvnv7wsV8hcG0cj19HFZNJ48VIpPBwIs9pjuJO6XhqMsY0c8dLZ3fp7IDF5VIbWgQuH16GHyf6vu9AAQAA"
Gridania_Ticket_Usage = "H4sIAAAAAAAACl2Py07DMBBFf6WatYniJqmMd6g81EV5qSgF1IXVDHQEtlHsglCUf2ccGSGxmzM+ur4zwLWxCBqueuqMIzPb0P4N4+whmFcEAa35/vDkYgD9PMCtDxTJO9ADbEGfLFSh6lrWAh6ZyqIpZTNfnAp4YlRFpapGVSOjd7g6By2ruYB709GR82RRClj7T7ToImiGlYvYm31sKR5ukv9vl7tyrXDwX78v3IfTXsx7wD99KikFXFgfp69TVESbx7PJyHB3xBDznIJbQ+nenJjo0vdL77p8O2tpuSGLa/bKcTf+ALqh+NVIAQAA"
Uldah_Ticket_Usage = "H4sIAAAAAAAACt1Qy07DMBD8lWovXExkJyHUviEeUg/lpVYpIA5WsxCLxkb1FoSi/DubNlUR4gvY087saDQ7LVzbBsHAfHVU2Xo0c8s3pNE82lcEAaX9eg/OUwTz1MJtiI5c8GBaWIA5Vlme6EJLLeABTJ5IzTM+EfDIRz1OlE5l3jEMHicXYFQmBdzbym3YTyUMpuEDG/QEhsHEE67tkkpH9U2v/8UNSTlWrMPn/sJ52O3FriIe5NuQSsBlEwj3VoTNsJ5tFQO422CkYe+NS+vo4Nijq7A+D74afpc7cuYanLJOduKPZvI00adFlv5sRue7ZpQsmEj1/2/mufsGGpBPq2ACAAA="

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
-- body
  while GetCharacterCondition(32) do
   yield("/wait 1")
  end
  yield("/wait 1")
  while GetCharacterCondition(45) or GetCharacterCondition(51) do
   yield("/wait 1") 
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
  yield("/wait 1.0")
end

TeleportTest()

if IsInZone(478) == false and GetCharacterCondition(27) == false then
  yield("/echo Hmm.... either you moved, or the teleport failed, lets try that again")
  yield("/wait 1")
  goto IdyllshireTurnin
end

if IsInZone(478) then
  yield("/wait 3")
  yield("/target Aetheryte")
  yield("/lockon")
  yield("/automove")
  yield("/wait 1.5")
  yield("/automove")
  yield("/li West")
  yield("/wait 1")
end

AetheryteTeleport()

Distance_Test = GetDistanceToPoint(-71.618, 208.926, -24.662)
if Distance_Test > 4 then
  yield ("/echo hmm.... that failed for some reason. Gonna try that again")
  goto IdyllshireTurnin
end

yield("/visland resume")
yield("/visland stop")
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
  yield("/wait 1.0")
  yield("/pcall SelectString True 0")
  yield("/wait 1.0")
  yield("/pcall SelectString True 0")
  yield("/wait 1.0")
end

Shop_Menu = 1
Gordian_Part = 1

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
   --yield("/echo Shop Menu: "..Alex_Shop) -- Just Debugging Stuff
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
   --yield("/echo Shop Menu: "..Alex_Shop)
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
    --yield("/echo Shop Menu: "..Alex_Shop)
    yield("/wait "..Alex_Shop_Timer)

  -- Pedal Check Section
  elseif (PedalCount <= 1) and (Alex_Shop >= Alex_Pedal1) and (Alex_Shop <= Alex_Pedal2) then
    Alex_Shop = Alex_Bolt1
    -- yield("/echo Pedal Count: "..PedalCount)
    -- yield("/echo Should be moving to Springs")
    yield("/wait 0.2")

  elseif (PedalCount >= 2) and (Alex_Shop >= Alex_Pedal1) and (Alex_Shop <= Alex_Pedal2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop + 1
    PedalCount = GetItemCount(PedalID)
    --yield("/echo Shop Menu: "..Alex_Shop)
    yield("/wait "..Alex_Shop_Timer)

-- Bolt Section
  -- If no bolts, then it stops
  elseif (BoltCount == 0) and (Alex_Shop >= Alex_Bolt1) and (Alex_Shop <= Alex_Bolt2) then
    Alex_Shop = Alex_Stop
    -- yield("/echo Bolt Count: "..BoltCount)
    -- yield("/echo Should be moving to Pedals")

  elseif (BoltCount >= 1) and (Alex_Shop >= Alex_Bolt1) and (Alex_Shop <= Alex_Bolt2) then
    yield("/pcall ShopExchangeItem True 0 "..Alex_Shop.." 1")
    Alex_Shop = Alex_Shop + 1
    BoltCount = GetItemCount(BoltID)
    --yield("/echo Shop Menu: "..Alex_Shop)
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
    yield("/wait 1.5")

    goto ShopInitialize

  elseif (Alex_Shop == Alex_Stop) and (Shop_Menu == 2) then
    -- yield("/echo DOW 2 Menu is completed")
    
    Gordian_Part = Gordian_Part + 1
    Shop_Menu = (Shop_Menu + 1)

    -- yield("/echo Shop Menu is Currently: "..Shop_Menu)

    yield("/pcall ShopExchangeItem True -1")
    yield("/wait 1")
    yield("/pcall SelectString True 2")
    yield("/wait 1.5")

    goto ShopInitialize

  elseif (Alex_Shop == Alex_Stop) and (Shop_Menu == 3) then
    --yield("/echo DOM Menu is completed")

    Gordian_Part = Gordian_Part + 1
    Shop_Menu = (Shop_Menu + 1)

    --yield("/echo Shop Menu is Currently: "..Shop_Menu)

    yield("/pcall ShopExchangeItem True -1")
    yield("/wait 1")
    yield("/pcall SelectString True 7")
    yield("/wait 1.5")

  end
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
  yield("/item Immortal Flames aetheryte tickets")
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
if (LimsaGCTicket >= 1) then 
  goto LimsaAetheryteTicket
elseif (GridaniaGCTicket >= 1) then
  goto GridaniaAetheryteTicket
elseif (UldahGCTicket >= 1) then
  goto UldahAetheryteTicket
elseif IsInZone(129) and (LimsaGCTicket == 0) then -- Limsa's GC
  goto LimsaLower
elseif IsInZone(130) and (GridaniaGCTicket == 0) then -- Ul'dah's GC
  goto Uldah
elseif IsInZone(132) and (UldahGCTicket == 0) then -- Grdiania's GC
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
  yield("/visland exectemponce "..GridaniaGC)
  yield("/wait 0.5")
  goto WalkingtoGC
end

::LimsaAetheryteTicket::
if IsInZone(128) then -- Limsa Upper
  yield("/visland exectemponce "..Limsa_Ticket_Usage)
  yield("/wait 0.5")
  goto WalkingtoGC
end

::GridaniaAetheryteTicket::
if IsInZone(132) then
  yield("/visland exectemponce "..Gridania_Ticket_Usage)
  yield("/wait 0.5")
  goto WalkingtoGC
end

::UldahAetheryteTicket::
if IsInZone(130) then
  yield("/visland exectemponce "..Uldah_Ticket_Usage)
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
if BoltCount == 0 then
  yield("/visland stop")
  goto StoppingScript
elseif (BoltCount > 0) then
  yield("/visland stop")
  goto IdyllshireTurnin
end

::StoppingScript::
yield("/echo Turnins have finished, thanks for using")