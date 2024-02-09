--[[
God what rabbit hole had I jumped down into this
]]

-- Island Sanctuary Item ID's

-- Underwater items

IslefishID = 37575
ClamID = 37555

LarveID = 37556
SquidID = 37576

-- Getting initial item counts
IslefishCount = GetItemCount(IslefishID)
ClamCount = GetItemCount(ClamID)
LarveCount = GetItemCount(LarveID)
SquidCount = GetItemCount(SquidID)

-- Amount of loops you would like to do per Route
-- Max I would recommend is 100, some routes break above that

LoopAmount = 5

Item_Cap = 300

-- Total amount of items gathered in each loop

--Clam/Islefish | Larve/Squid
ClamArray = {8, 4}

--XP Route Quarts | Iron | Durium Sand | Leucogranite
QuartzArray = {6, 3, 2}

--Jellyfish/Coral | Laver/Squid
LaverJellyfishArray = {8, 6}

--Coconut/Palm Log/Leaf | Marble/Limestone
CoconutArray = {7, 4}

-- Isleblooms | Quartz | Leucogranite | Iron
IslebloomsArray = {4, 5, 1, 1}

-- Marble/Limestone | Surecane/Vine | Coconut | Tinsand | Hemp
MarbleArray = {7, 1, 1, 1, 1}

::IslefishRoute::

if (IslefishCount > Item_Cap or ClamCount > Item_Cap) or (LarveCount > Item_Cap or SquidCount > Item_Cap) then
  yield("/echo Islefish: "..IslefishCount)
  yield("/echo Clam: "..ClamCount)
  yield("/echo Larve: "..LarveCount)
  yield("/echo Squid: "..SquidCount)
end

-- Islefish Shop
Shop_LoopAmount = ClamArray[1] * LoopAmount
Shop_ItemAmount = Item_Cap + Shop_LoopAmount
Shop_SellAmount = Shop_ItemAmount - Item_Cap

if Shop_SellAmount > 0 then 
  yield("/pcall MJIDisposeShop True 12 21")
  yield("/wait 0.5")
  yield("/pcall MJIDisposeShopShipping True 11 "..Shop_SellAmount)
end



-- Clam Shop

-- Larve Shop

-- Squid Shop 