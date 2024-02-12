--[[
Man... what a thing this has turned into. IF THIS WORKS IT WOULD BE GREAT
]]

-- Need this to tell what the caps on items is 
  ItemMax = 999

  Skip = true

-- Route Loop Amounts
  --[[
    I'll have the max amount each can run on the side, but on the chance you're currently using materials for workshop,
    just reduce the amount the loop amount by a couple to make sure it will let you keep crafting what you need.
    ]]
  
  --Islefish/Clam | Larve/Squid
  Route1Loop = 124 -- Max 124

  -- Islewort | Popoto Seeds | Parsnip Seeds
  Route2Loop = 71 --base is 71

  --Sugarcane | Vine
  Route3Loop = 90 -- base is 90

  -- Tinsand/Sand | Marble/Limestone
  Route4Loop = 





--Visland Routes
  B2Islefish = "H4sIAAAAAAAACuWVTWvcMBCG/0rQ2TvVjL5GvrVpC3tI24TAtg05mEZhDWurxEpCWPa/Z9Z2CCGXXotvmg+/jB40r/fqW9MlVatPzZBOSj5ZD7t02w7bD6e7plOV2jRPf3Pbl0HVV3v1Iw9taXOv6r36qeoVaQfBB2sq9UvVAYGtI+sq9VvVyFFqms1Bwtyn9WfJaSfFi+amvRdBBF2ps/yQutQXCSu17ku6a/6UTVu2348f6Le5eViZa9jmx5eKDCRqt81uSK/t45Qi+aXLJb1IldTNx49jxxyc36ehzOej8KZpy6viMfqa705zfzNfXk/Jy7ZLZ9KnD9V7NKgJAtsjDEGDGsFQYJrQUACKwbllorERUAf0MxkNZEwwIxnvIVoJFgoGXESiOIKR9WHywY9cVug1yG7hUsGgMQ7DZDMEkdngBMZYD95YXiQYBI9O2zivEoFj8Rg7kXHsQFNc5i55IA4UabJfA85Gp+NkMisfGJiZFkkGjdzdc5hcZmXEjIOOOD8aHxms9v+8TvJD+1/RXB+eAbz3pC7+CAAA"
  Vislefish = "H4sIAAAAAAAACu2YTW/bMAyG/0qhc8KJor7o29BtQA7dFwZ0H9jBWNXGgGMPtbtiKPrfR6dSskOH5dJD0vhgWLagSA/4ki9zp97Wq6QqhXBy2tarF4uhTZfNsFQzdV7//tk33Tio6tudet8Pzdj0naru1GdVOQIvl6OZ+qKquXWAwQc7U19lFHQEz9bey7Dv0uKVqvRMfawvmhtZjEAGZ/2vtErduP6y6MZ0Xf8Yz5tx+S7P/vtd3qPsaVj2t+WLbEZWu6zbIW2nr3eIM/V61Y/lhxdjWuXHl+sZefDhJg1jfp4WPq+bcbviNHrTX5/23UU+uH54+alZpTOZp+9nj2HRkdBlKhZ8NFigMESh8jgU838oRqPh6B5FM6T6NqWLk7Hurtq0B6CsBiTEuAkfYwl9IeXAaTJPQqqtr6/SybBMbbsPmDwER+wzJjm7RRsfMPnogFn7nTCZQ8dEVjNnTAhBW2MyphCBBeJRdxMpZODIvpCiSWieMilvwbLFY0BVxoCngJlSAIsuhpydMAB53C07Hbbs5gZMwMh2U+4wsHUlPSFoxt3q3YFzQgMRAxazZEGOpksaZxlGCsdqJ/FkgchzsU8SJEFMZuHEEAI/TXbaO/80dxqc9VS0N5EzhmIOKql/wES0kwM3h+TA5yhHdxR1zKbJTGYyEpX0rQNICvfPrzeRLBSA5ZbV5YWLm5zAGosEkDf/atmeleeeS2MCzk2uKFd/Yrfp4owGKw3K0U3mkNISUtFMnX82lFHU5bYtL8YQnmMWIpGXtB0brTE5v/knIEIQR3nUmrAIgM4Fty1jyDb6TRkjUZvfrYzhYQWQ5KDomEoISRlDa7zOMeSZpODvpqw9BvP9/g8MSzViohQAAA=="

  B2Islewort = "H4sIAAAAAAAACuWTyWrDMBRFfyW8tSyeRg+LQkfIIp0ouANdiEYlgtgqkdJQTP69iu0QSj/Bu3efri5XB9TBrWksVHBhgp1lZ7N5WNud30QgUJufL+/aGKB66+DeBxedb6Hq4BmqjGlGZV6UmsALVCWnJeZYEniFiilJcynYPinf2vlVWqFSBB7N0m1THKNIYOG/bWPbmCSBeRvtxnzE2sXV3eEC/t2NLVOrsPK740mqk9I+zTrYk73vmCKvGx/tMSraZhzPe8coHrY2xHE+BNfGxVPiQd34zaVvl+PTcVg+ucYukg/35D8YhVSrgg1cGC+o4jznPRiJVCjUSk2TjBBUci5LMaBBQREF5qpnkyVKlKGUE4XDtKAFCjbA0ekH5YqPaCQqKhjXEyDzvv8Fz5TxE5MEAAA="
  Vislewort = "H4sIAAAAAAAACu2YSW/bMBCF/4rBszvlDNfxregC+JA2XYB0QQ9CrTYCbMmwlARFkP/ekUglDeAAvuTgBb6IFkUQH948vuGtel+sSjVTBJN5uyxvmk338rxZN13z8rzYtHW1nnwuy0Wrpuqi+Ltuqrpr1ezHrTpv2qqrmlrNbtVXNXuBgcFFzVP1Tc1cAHLEOFXf5ZVFBx7Z3Mmwqcv5GzXTU/WpWFRXshaBDM6a63JV1t3wZl535ab41V1U3eWHfjZpJI7u8Zu88eJPcV1O1stCPp6q9rK5GSfJ5mT538WyLR++HHYs+3q7arpxJ/OuXOXHV8OMPPh4VbZdfu4Xviiq7mHFfvSu2bxu6kUGodOfX6pVeSbz9N10C6ZI4AwamzhZCIF1DBmUQfDauridlHlMiraQ0lsZ7QUYNhCNyfoxYIl5xGIJrGd8Fv3cVMvFZJ2kvg+ciCLYyCZx0qA1BTfKxwIz7YSJDh2TSCgMhSWYrEjLE8aMiTyg3U1Nh4/Jgw6YKAVRj9MjJcfgowknTD0m68FpjokTA1n04+EWtJx7/uRNPSYTwFCkAdPw7Ch7k0MpuuhPckpVJzaDmDKAmLaLrH3mJNHJB/+M5jSEu73wJm/BYEgnnSQjq52jTIn7REB8wpS8iXVgHtVkNXsaQQUEDk9lgoMOlGQ1RPHphEXSQMTewAcqEWVonzNQ7k+VGTnaGJ2958SWe2tKoAxI0QVzlPpJTezIRQsMM9qP9Cfod2toD92l+6DNOWgbDYZtpuQxALqnmtkjoyRpyPtcZNLBhf8wSQHqYN0JU8JEvi+zXkwEjGJGGZO20uuGk5p6TBiBxLhd4iRysiaMCdKyxCYrZ90Rerb4BXC0ge87EJZfzkISGMFzPMYshIhy5WGTSTsU8QRP4+2a2FHk4NxOXPRhcZHrDxOxbyt6MF582dtRLnJ8OafdEy3r4XD5efcP3/cIkwYYAAA="

  B2Sugarcane = "H4sIAAAAAAAACuWTyWrDMBCGXyXMWREaLZalQ6Er5JCugXShB5GojaC2Sqy0lJB3r+w4hNJH8G02/fzzMdrCtas8WDhzjR+NT0YPm3e3XrjaA4G5+/mMoU4N2Jct3MYmpBBrsFt4BDvmsqCGKVUSeAKrkEpUSmsCz2A5asoU7nISaz+5AIt5ksC9W4ZNlkPKCEzjl698nXJKYFInv3aLNA9pddM+YH9rvc3sqlnF70Mn28lqb+6j8cfxzmOWvKxi8gep5Ks+PO0m+uRu45vUx63w3IV0VGyzq7g+j/WyX53ti7NQ+WmeYzvyH4yWVBWqEB0XREG5LAV2XEqTW4KXxTDJCEOZbk+kBcNKqkWJ/cEoWggphskFGVVGa7O/GJO/DkduOi5jLBWVRnM+TDI0c9E8b5vBaE5RGOR7MEJoWkgt5ADAvO5+ARK0E/moBQAA"
  VSugarcane = "H4sIAAAAAAAACu2YSW/bMBCF/0rBsz2d4XC46FZ0AXJIdyRd0IOQqI2AWipsuUVh5L93ZJFOgaaor7V900gETX1+nPeojXleLxpTGYYHb9Zf6uVV3TUPL9quMTNzWf/81rfdsDLVx4152a/aoe07U23MO1NZBovRY5qZ96aSBJ6sc3ZmPphqzt5B5Gj5Vuu+a86emApn5nV93a51NgYtzvvvzaLphu2Ts25olvXVcNkONy/y6N/v5VXqolY3/Y/yRFejs32uv66au+HbJdLMPF30Q/nhs6FZ5MtH2xG5eLVuVkO+Hie+rNvhbsaxetYvH/fddX5znG6+bRfNuY7D29mfXBxw9FKoRPLIBYoAofP3M7H/ZmKRbIpyL5lV+fP+B0QC0aKnLSNPML5UyIwUWXLpxCgACYVgJ0YIFNhJZuQE0CHvpSN7wDqicasVEUUSjBkQJ2CO7rTRQFKyIkVEKVD0hZGWQvboGYXRqEK2Ma+m5tIoqi0jiiDOpaNnJBAs+WCzkBi0TUcuLZsYKEray+rtIVm9ZhwfkbhQIeG4k472JpZw9NKZo4rFheCtnzBZ8DFKyYkYQTcY+eMTz3xMQV6CnRxMAiT2FF0B40D4b1nxkPOzxhvwMpKZ9OLAMpXkQxqLQjrCU4UGY3A+pJwHVRwu4I6KVyW5k5XPrZ5CcyBUMeAOkCVgxFMeHFUk6EbnnhiJ+lRpxUyaD/1+p4pDPp1q7wXdUpyPpxqTmXeMkn70wNNOmzsgTpZxUpJoQEwBbTEvlRKSdqhDd/VPt78AvjLBEUATAAA="



-- Array's that are for each route

  --Clam/Islefish | Larve/Squid
  ClamArray = {8, 4}

  --Islewort | Popoto Seeds | Parsnip Seeds
  IslewortArray = {14, 1}

  --Sugarcane | Vine 
  SugarcaneArray = {11}

  --Tinsand/Sand | Marble/Limestone
  TinsandArray = {7, 4}

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

  function IslewortNode()
    IslewortID = 37558
    IslewortCount = GetItemCount(IslewortID)
  end

  function HempNode()
    HempID = 37569
    HempCount = GetItemCount(HempID)
  end

  function Sugarcane_VineNode()
    SugarcaneID = 37576
    VineID = 37562
    SugarcaneCount = GetItemCount(SugarcaneID)
    VineCount = GetItemCount(VineID)
  end

  function Tinsand_SandNode()
    TinsandID = 37571
    SandID = 37559
    TinsandCount = GetItemCount(TinsandID)
    SandCount = GetItemCount(SandID)
  end

  function Marble_LimestoneNode()
    MarbleID = 39890
    LimestoneID = 37565
    MarbleCount = GetItemCount(MarbleID)
    LimestoneCount = GetItemCount(LimestoneID)
  end


--Shop spending functions, to quickly reference for multiple routes
  function PalmLeafShop()
  end

  function BranchShop()
  end

  function IslewortShop()
    IslewortAmount = ItemMax-(ItemAmount*LoopAmount)
    IslewortSend = (IslewortCount-IslewortAmount)
  end

  function StoneShop()
  end

  function ClamShop()
    ClamAmount = ItemMax-(ItemAmount*LoopAmount)
    ClamSend = (ClamCount-ClamAmount)
  end

  function LaverShop()
    LarveAmount = ItemMax-(ItemAmount*LoopAmount)
    LarveSend = (LarveCount-ClamAmount)
  end

  function CoralShop()
  end

  function IslewortShop()
  end

  function SandShop()
    SandAmount = ItemMax-(ItemAmount*LoopAmount)
    SandSend = (SandAmount-SandAmount)
  end

  function VineShop()
    VineAmount = ItemMax-(ItemAmount*LoopAmount)
    VineSend = (VineCount-VineAmount)
  end

  function SapShop()
  end

  function AppleShop()
  end

  function LogShop()
  end

  function PalmLogShop()
  end

  function CopperShop()
  end

  function LimestoneShop()
    LimestoneAmount = ItemMax-(ItemAmount*LoopAmount)
    LimestoneSend = (LimestoneAmount-LimestoneAmount)
  end

  function RockSaltShop()
  end

  function ClayShop()
  end

  function TinsandShop()
    TinsandAmount = ItemMax-(ItemAmount*LoopAmount)
    TinsandSend = (TinsandCount-TinsandAmount)
  end

  function SugarcaneShop()
    SugarcaneAmount = ItemMax-(ItemAmount*LoopAmount)
    SugarcaneSend = (SugarcaneCount-SugarcaneAmount)
  end

  function CottonShop()
  end

  function HempShop()
  end

  function IslefishShop()
    IslefishAmount = ItemMax-(ItemAmount*LoopAmount)
    IslefishSend = (IslefishCount-IslefishAmount)
  end

  function SquidShop()
    SquidAmount = ItemMax-(ItemAmount*LoopAmount)
    SquidSend = (SquidCount-SquidAmount)
  end

  function JellyfishShop()
  end

  function IronShop()
  end

  function QuartzShop()
  end

  function LeucograniteShop()
  end

  function IslebloomsShop()
  end

  function ResinShop()
  end

  function CoconutShop()
  end

  function BeehiveShop()
  end

  function WoodOpalShop()
  end

  function CoalShop()
  end

  function GlimshroomShop()
  end
  
  function WaterShop()
  end
  
  function ShaleShop()
  end

  function MarbleShop()
    MarbleAmount = ItemMax-(ItemAmount*LoopAmount)
    MarbleSend = (MarbleAmount-MarbleCount)
  end

  function MythrilShop()
  end

  function SpectrineShop()
  end

  function DuriumShop()
  end

  function YellowCopperShop()
  end

  function GoldShop()
  end

  function HawkeyeShop()
  end

  function CrystalShop()
  end

  function 

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
  function ClamSell()
    yield("/pcall MJIDisposeShop True 12 3 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..ClamSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
   end

  function IslefishSell()
    yield("/pcall MJIDisposeShop True 12 21 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..IslefishSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function LarveSell()
    yield("/pcall MJIDisposeShop True 12 4 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..LarveSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function SquidSell()
    yield("/pcall MJIDisposeShop True 12 22 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..SquidSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function IslewortSell()
    yield("/pcall MJIDisposeShop True 12 6 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..IslewortSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function HempSell()
    yield("/pcall MJIDisposeShop True 12 20 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..HempSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function SugarcaneSell()
    yield("/pcall MJIDisposeShop True 12 18 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..SugarcaneSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function VineSell()
    yield("/pcall MJIDisposeShop True 12 8 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..VineSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function QuartzSell()
    yield("/pcall MJIDisposeShop True 12 25 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..QuartzSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function IronSell()
    yield("/pcall MJIDisposeShop True 12 24 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..IronSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function LeucograniteSell()
    yield("/pcall MJIDisposeShop True 12 26 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..LeucograniteSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function DuriumSell()
    yield("/pcall MJIDisposeShop True 12 39 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..DuriumSend)
    yield("/pcall SelectYesno True 0")
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


-- Visland Route Check 
  function VislandCheck()
    while IsVislandRouteRunning() do
      yield("/wait 3")
    end
  end


--Islefish/Clam | Larve/Squid
::Route1::

  if Skip == true then
    goto Route2
  end

  yield("/visland stop")

  CurrentLoop = 1
  LoopAmount = Route1Loop
  ItemAmount = ClamArray[1]
  Islefish_ClamNode()
  IslefishShop()
  ClamShop()

  ItemAmount = ClamArray[2]
  Larve_SquidNode()
  LarveShop()
  SquidShop()

  yield("/echo Islefish Send "..IslefishSend)
  yield("/echo Clam Send "..ClamSend)
  yield("/echo Larve Send "..LarveSend)
  yield("/echo Squid Send "..SquidSend)

  IslandReturn()
  
  if (IslefishSend > 0) or (ClamSend > 0) or (LarveSend > 0) or (SquidSend > 0) then
    Sellingitemsto()
    if (IslefishSend > 0) then
      IslefishSell()
    end
    if (ClamSend > 0) then
      ClamSell()
    end
    if (LarveSend > 0) then
      LarveSell()
    end
    if (SquidSend > 0) then
      SquidSell()
    end
    LeavingShop()
  end
  yield("/visland exectemponce "..B2Islefish.." <wait.1.0>")
  VislandCheck()

  while (CurrentLoop <= LoopAmount) do
    yield("/visland exectemponce "..Vislefish.." <wait.1.0>")
      VislandCheck()
    CurrentLoop = CurrentLoop + 1
    yield("/echo Current Loop: "..CurrentLoop)
  end

-- Islewort | Popoto Seeds | Parsnip Seeds
::Route2::
  yield("/visland stop")

  if Skip == true then
    goto Route3
  end

  CurrentLoop = 1
  LoopAmount = Route2Loop
  ItemAmount = IslewortArray[1]
  IslewortNode()
  IslewortShop()

  ItemAmount = IslewortArray[2]
  HempNode()
  HempShop()

  yield("/echo Hemp Send "..HempSend)
  yield("/echo Islewort Send "..IslewortSend)

  IslandReturn()
  

  if (IslewortCount > 0) or (HempCount > 0) then
    Sellingitemsto()
    if (IslewortSend > 0) then
      --yield("/echo Islewort")
      IslewortSell()
    end
    if (HempSend > 0) then
      --yield("/echo Hemp")
      HempSell()
    end
    LeavingShop()
  end

  yield("/visland exectemponce "..B2Islewort.." <wait.1.0>")
  VislandCheck()

  while (CurrentLoop <= LoopAmount) do
    yield("/visland exectemponce "..Vislewort.." <wait.1.0>")
      VislandCheck()
    CurrentLoop = CurrentLoop + 1
    yield("/echo Current Loop: "..CurrentLoop)
  end

--Sugarcane | Vine
::Route3::
  yield("/visland stop")

  CurrentLoop = 1
  LoopAmount = Route3Loop
  ItemAmount = SugarcaneArray[1]
  Sugarcane_VineNode()
  SugarcaneShop()
  VineShop()

  yield("/echo Sugarcane send = "..SugarcaneSend)
  yield("/echo Vine send = "..VineSend)

  IslandReturn()

  if (SugarcaneCount > 0) or (VineCount > 0) then
    Sellingitemsto()
    if (SugarcaneCount > 0) then
      SugarcaneSell()
    end
    if (VineCount > 0) then
      VineSell()
    end
    LeavingShop()
  end

  yield("/visland exectemponce "..B2Sugarcane.." <wait.1.0>")
  VislandCheck()
  
  while (CurrentLoop <= LoopAmount) do
    yield("/visland exectemponce "..VSugarcane.." <wait.1.0>")
      VislandCheck()
    CurrentLoop = CurrentLoop + 1
    yield("/echo Current Loop: "..CurrentLoop)
  end
 
-- Tinsand
::Route4::
  yield("/visland stop")

  CurrentLoop = 1
  LoopAmount = Route4Loop
  ItemAmount = SugarcaneArray[1]
  Sugarcane_VineNode()
  SugarcaneShop()
  VineShop()

  yield("/echo Sugarcane send = "..SugarcaneSend)
  yield("/echo Vine send = "..VineSend)

  IslandReturn()

  if (SugarcaneCount > 0) or (VineCount > 0) then
    Sellingitemsto()
    if (SugarcaneCount > 0) then
      SugarcaneSell()
    end
    if (VineCount > 0) then
      VineSell()
    end
    LeavingShop()
  end

  yield("/visland exectemponce "..B2Sugarcane.." <wait.1.0>")
  VislandCheck()
  
  while (CurrentLoop <= LoopAmount) do
    yield("/visland exectemponce "..VSugarcane.." <wait.1.0>")
      VislandCheck()
    CurrentLoop = CurrentLoop + 1
    yield("/echo Current Loop: "..CurrentLoop)
  end      



::DemoComplete::
  yield("/echo the demo version is completed! Yayyy!")