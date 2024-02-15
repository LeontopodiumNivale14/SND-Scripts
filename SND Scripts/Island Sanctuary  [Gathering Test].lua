--[[
Man... what a thing this has turned into. IF THIS WORKS IT WOULD BE GREAT
]]

-- Required user inputs
Personal_Item_Goal = 999
LoopAmount = 3

Route_Number = 1

-- Need this to tell what the caps on items is 
Item_Maximum = 999
Current_Loop = 0

--Visland Routes
Base_Quartz = "H4sIAAAAAAAACuVSy2rDMBD8lbJnRUheyZZ9K31ADmmbUHAf9CAalQhqq9jrltb43ys7DqH0E3Lb2Z0dZoft4cZWDgrYhI7c2bqzDf0Ag9J+fwRfUwvFcw93ofXkQw1FDw9QLGSmucIsRwaPUEghORqpGDxFkAouMVd6iDDUbnk5ErRmsLFb30U9yQWDVfh0laspQgbLmlxjX6n0tLsdF8Tf3mwx2mp34eswiX6i2pt9b92RPpmMkldVIHeQIlfN5fnEmMG6cy3N9ShcWk9HxRFdh+Yi1Nv5drFv3vvKrSJPDOxfMoiKK5PoKRfMM54ITKdcFmg0N0Iqc5rB6Hhdjun+YzA3PEOTmn00anygLElPIZqX4Rddx459cwMAAA=="
VQuartz_Route = "H4sIAAAAAAAACu2WXW/TMBSG/0rl62D8bZ/cIT6kSgw2hNTBtIvQejRqE5fEBUHV/z4ns5MhddpVJSp65xOfnJw8On797tCHorIoRzfXl5P3zm1uJ1fbovF/Xk4bV6MMzYrfG1fWvkX5zQ5durb0ZdjId+ga5VxobJhkGfoSAhCYMuAZ+oryFxwUBqb4PoSuttM3KCcZ+lQsym0oxXAILtxPW9na9zvT2tummPtZ6Zcfu2xGQjEj/96JzTZu+305+bYu5qtJ4+ar0Ge7dL9SZmgwfOOuWLd2fL3vmmbobeV8amfqbRWXr/qMGFxtbevjuis8K0o/Vuyid6557epFhEEeHn4uK3sR8sg+O4BKYa2JHlAxqvQDKkEIFoHXUVC1Gztfre3idDgB1sDpOFOcES1GUkpKIw+jIpjJ51iRg5ROAgzDhrA0QBwDMTRh0ZhxDUcZoB+9HEzuXFMVfTungAqw4WaYICkZS6Rk0ChpzqQiKckw0yMpAmIQJRMYKnrW70RKYcklDKiAs0eogD+hSf/h6ZOAu18aSBmlIJES4RKkZ6FKqBTFlCgxaLo2EIeKA2BJuDifvzRVJqhTd+NFVEanqeIQXKgix7GaJ+efpMScaDn6TCWie+IgMeizTCVQFHPDHpGiJvlMDib4c6megMWfH6nTtZkyOG7oQEQqQZKizewkyQh5nHP2z190t/t7bgNdriwPAAA="


-- Array's that are for each route

--Clam/Islefish | Larve/Squid
ClamArray = {8, 4}

--XP Route || Quarts | Iron | Durium Sand | Leucogranite
QuartzArray = {6, 3, 2}

--Jellyfish/Coral | Laver/Squid
LaverJellyfishArray = {8, 6}

--Coconut/Palm Log/Leaf | Marble/Limestone
CoconutArray = {7, 4}

-- Isleblooms | Quartz | Leucogranite | Iron
IslebloomsArray = {4, 5, 1, 1}

-- Marble/Limestone | Surecane/Vine | Coconut | Tinsand | Hemp
MarbleArray = {7, 1, 1, 1, 1}

--Node Functions (checks to see how many items that you currently have)
function Islefish_ClamNode()
  IslefishID = 37575
  ClamID = 37555
  IslefishCount = GetItemCount(IslefishID)
  ClamCount = GetItemCount(ClamID)
end

function Larve_SquidNode()
  LarveID = 37556
  SquidID = 37576
  LarveCount = GetItemCount(LarveID)
  SquidCount = GetItemCount(SquidID)
end

function QuartzNode()
  QuartzID = 37573
  QuartzCount = GetItemCount(QuartzID)
end

function Iron_DuriumNode()
  IronID = 37572
  DuriumID = 41630
  IronCount = GetItemCount(IronID)
  DuriumCount = GetItemCount(DuriumID)
end

function LeucograniteNode()
  LeucograniteID = 37574
  LeucograniteCount = GetItemCount(LeucograniteID)
end

--Shop spending functions, to quickly reference for multiple routes
function QuartzShop()
  yield("/echo Amount to be at total: "..Quartz_Amount)
  Quartz_Send = QuartzCount-Quartz_Amount
  yield("/echo Amount to send: "..Quartz_Send)
end

function IronShop()
  yield("/echo Amount to be at total: "..Iron_Amount)
  Iron_Send = IronCount-Iron_Amount
  yield("/echo Amount to send: "..Iron_Send)
end

function LeucograniteShop()
  yield("/echo Amount to be at total: "..Leucogranite_Amount)
  Leucogranite_Send = LeucograniteCount-Leucogranite_Amount
  yield("/echo Amount to send: "..Leucogranite_Send)
end

function DuriumShop()
  yield("/echo Amount to be at total: "..Durium_Amount)
  Durium_Send = DuriumCount-Durium_Amount
  yield("/echo Amount to send: "..Durium_Send)
end

--Setup for moving to the shop, and getting ready to sell the items
function Sellingitemsto()
  yield("/visland moveto -268 40 226")
  yield("/wait 1")
  MovingTest()

  yield("/visland moveto -268 41 209.838")
  yield("/wait 1")
  MovingTest()
 
  yield("/target Enterprising Exporter <wait.0.5>")
  yield("/pint <wait.0.5>")
  yield("/pcall SelectString True 0 <wait.1.0>")
end

function LeavingShop()
 yield("/pcall MJIDisposeShop False -2")

 yield("/visland moveto -268 40 226")
 yield("/wait 1")
 MovingTest()
end

--Shop Selling, just a quick way to reference vs typing all these out... god hope these work 
function QuartzSell()
  yield("/pcall MJIDisposeShop True 12 25 <wait.0.5>")
  yield("/pcall MJIDisposeShopShipping True 11 "..Quartz_Send)
  yield("/wait 1.5")
end

function IronSell()
  yield("/pcall MJIDisposeShop True 12 24 <wait.0.5>")
  yield("/pcall MJIDisposeShopShipping True 11 "..Iron_Send)
  yield("/wait 1.5")
end

function LeucograniteSell()
  yield("/pcall MJIDisposeShop True 12 26 <wait.0.5>")
  yield("/pcall MJIDisposeShopShipping True 11 "..Leucogranite_Send)
  yield("/wait 1.5")
end

function DuriumSell()
  yield("/pcall MJIDisposeShop True 12 39 <wait.0.5>")
  yield("/pcall MJIDisposeShopShipping True 11 "..Durium_Send)
  yield("/wait 1.5")
end



-- Checks to see how far you are from in front of the main workshop, if a certain distance, will teleport you in front of It
function IslandReturn()
  yield("/pcall _ActionContents True 9 1 <wait.0.5>")
  while GetCharacterCondition(27) do
    yield("/wait 1")
  end
  yield("/wait 1")
  while GetCharacterCondition(45) do
    yield("/wait 1")
  end
end

-- Moving Test
function MovingTest()
  while IsMoving() do 
    yield("/wait 1")
  end
end

::XPLoop::

QuartzNode()
Iron_DuriumNode()
LeucograniteNode()

if ((QuartzCount < Personal_Item_Goal) or (IronCount < Personal_Item_Goal) or (LeucograniteCount < Personal_Item_Goal) or (DuriumCount < Personal_Item_Goal)) and (Route_Number == 1) then

  Quartz_Amount = Item_Maximum-(QuartzArray[1]*LoopAmount)
  Iron_Amount = Item_Maximum-(QuartzArray[2]*LoopAmount)
  Durium_Amount = Item_Maximum-(QuartzArray[2]*LoopAmount)
  Leucogranite_Amount = Item_Maximum-(QuartzArray[3]*LoopAmount)
  QuartzShop()
  IronShop()
  LeucograniteShop()
  DuriumShop()

  if (Quartz_Send >= 0) or (Iron_Send >= 0) or (Leucogranite_Send >= 0) or (Durium_Send >= 0) then
    IslandReturn()
    Sellingitemsto()
    if (Quartz_Send >= 0) then
      QuartzSell()
    end
    if (Iron_Send >= 0) then
      IronSell()
    end
    if (Leucogranite_Send >= 0) then
      LeucograniteSell()
    end
    if (Durium_Send >= 0) then
      DuriumSell()
    end
    LeavingShop()
  end
end

yield("/visland exectemponce "..Base_Quartz.." <wait.0.5>")
while IsVislandRouteRunning() do
  yield("/wait 1")
end

while Current_Loop <= LoopAmount do
  yield("/visland exectemponce "..VQuartz_Route.." <wait.0.5>")
    while IsVislandRouteRunning() do
      yield("/wait 1")
    end
  Current_Loop = Current_Loop + 1
end