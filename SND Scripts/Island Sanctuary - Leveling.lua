--[[
Version: 2.1 [Ground & Flying ]
Author: Leontopodium Nivale
This is a small version of the "Gathering Everything" script I'm working on, just meant to be a quick way of leveling up

Note: This does require flying atm, I'll work on making a non-flying verison in a bit. (When I get a second or need a breather from the other script lol.)
Requirements:
-> Visland (V)ery Island
-> vnavmesh (Just got released on 2.19, same place on visland)
]]

-- Settings
  IslandLevel = 17
  ItemCountEcho = true
  LoopEcho = true
  ContinueLooping = true

  -- Testing 
  TestingShopSend = false

  -- If flying is disabled, it will do the ground version of the route for xp
  -- if flying is enabled, it will do the faster/xp route on top of the mountain
  FlyingEnabled = true

-- If you are currently running the workshop and you have items being used in it, make sure to add the amount you're using in the shops here
-- or if you would like to keep a certain amount of that item, also change it here

  -- For the flying Loop

  if FlyingEnabled == true then
     QuartzWorkShop = 0 
     IronWorkShop = 0 
     DuriumWorkShop = 0
     LeucograniteWorkShop = 0
     StoneWorkShop = 0
  end
  -- For the ground XP Loop
  if FlyingEnabled == false then 
    ClayWorkShop = 0
    LimestoneWorkShop = 0 
    MarbleWorkShop = 0
    TinsandWorkShop = 0
    SugarcaneWorkShop = 0
    VineWorkShop = 0
    ResinWorkShop = 0 
    LogWorkShop = 0 
    BranchWorkShop = 0

    StoneWorkShop = 0
    SandWorkShop = 0
  end

  -- Array for the Route
  -- XP Route || Quarts | Iron | Durium Sand | Leucogranite
  QuartzArray = {6, 3, 2, 11}

  -- Ground XP Route || Clay | { Stone/Limestone/Marble | Tinsand | Sugarcane/Vine | Resin/Log/Branch} | Sand
  ClayArray = {7, 1, 9}

  -- Max item amount. DO NOT CHANGE
    ItemMax = 999

-- Loop amount checker
  if FlyingEnabled == true then 
    BaseLoopAmount = math.floor(ItemMax/QuartzArray[1])
    LoopTestA = 0
    if QuartzWorkShop > 0 then
      LoopTestA = math.ceil(QuartzWorkShop/QuartzArray[1])
    end
    XPLoopAmount = BaseLoopAmount - LoopTestA -- if workshop was > 0, takes that amount and removes it from the loop
    yield("/echo LoopAmount = "..XPLoopAmount)
  end
  if FlyingEnabled == false and IslandLevel >= 5 then
    LoopTestA = 0
    BaseLoopAmount = math.floor(ItemMax/ClayArray[1])
    if ClayWorkShop > 0 then
      LoopTestA = math.ceil(ClayWorkShop/ClayArray[1])
    end
    GroundXPAmount = BaseLoopAmount - LoopTestA -- if workshop was > 0, takes that amount and removes it from the loop
    yield("/echo LoopAmount = "..GroundXPAmount)
  end
   

-- Visland Routes for the script
  B2Quartz = "H4sIAAAAAAAACuVS20rEMBD9lWWe25A0aZvmQfAKfVh1RagXfAhuZAM2kSZVtPTfTdssK/gH+jZn5nDmzGEGuJStAgEn0qlVerTa9LLzX5BAIz/frDbegXgc4No67bU1IAa4A5GSMkeMlhVN4B4EwQRRTlgCDwEUGBFasXwM0BpVn4HACdzIre6DGEEBrO27apXxASZQG686+ewb7XdXkf2zFx0GT25nP/aTYCaovchXpw702WGQPG+t3y+uvWpjeTwzItj0yvlYT8KN1P6gOKEL251as42H46V5q1u1Djw8Jr9ioZQhxrN8DoVWJcowLeZQUspzxDFh/B+mkofrKlosv0IrjkrKC77kwqbXKbPiz+fyNH4DG0XUEmwDAAA="
  VQuartz = "H4sIAAAAAAAACu2WXW/TMBSG/0rk62D8bZ/cIT6kSgw2hNTBtIvQejRqE5fEBUHV/z6ns5MhddpVJSp65xOfnJw8On79btGHsraoQIzg7Ob6Mnvv3Po2u9qUrf/zctK6BuVoWv5eu6rxHSputujSdZWvwkaxRdeo4EJjwyTL0ZcQgMCUAc/RV1S84KAwMMV3IXSNnbxBBcnRp3JebUIphkNw4X7a2jZ+vzNpvG3LmZ9WfvGxz2YkFDPy753YcOs23xfZt1U5W2atmy1Dn93C/UqZocHwjbty1dnx9X3XNEdva+dTOxNv67h8tc+IwdXGdj6u+8LTsvJjxT5659rXrplHGOTh4eeqthchj+zyA6gU1proARWjSj+gEoRgEXgdBVW3trPlys5PhxNgDZyOM8UZ0WIkpaQ08jAqgpl8jhU5SOkkwDBsCEsDxDEQQxMWjRnXcJQB+rGXg+zOtXW5b+cUUAE23AwTJCVjiZQMGiXNmVQkJRlmeiRFQAyiZAJDRc/6nUgpLLmEARVw9ggV8Cc06T88fRJw/0sDKaMUJFIiXIL0LFQJlaKYEiUGTdcG4lBxACwJF+fzl6bKBHXqb7yIyug0VRyCC1XkOFbz5PyTlJgTLUefqUR0TxwkBn2WqQSKYm7YI1LUJJ/JwQR/LtUTsPjzI3W6NlMGxw09iEglSFK0mb0kGSGPc87++YvudncPgcau5jAPAAA="

  VClay = "H4sIAAAAAAAACu2YS2vcMBSF/4rR2oirq7d3JX0QaNo0FJI2ZOFmlBnTsVVsTUII+e+VLTlpYQrdzGKS8cqyhSx/vufcM/NAPtWtIxU5Wtf3xZnfBFdcfuj9plsUF6fFR3fr1k23vCIlOa/vf/mmCwOpLh/IqR+a0PiOVA/kglSIggLTlpfkG6mkokJKNCX5TirDKGqB7DGOfOeO35IKSnJWL5pNXIrRODjxt651XYjrlOS4C66vr8N5E1af8+w/r+UNxx0NK38334lbiavd1OvBPU+f9sdK8q71YX7wcXBtPn0zzciDLxs3hHw+LnxeN+F5xXH03vdHvlvk14Z08WvTupM4Dx7LLVCAciYxMdGUc+AJiaBSaPgHEvwbCWxBgsDQGrkVzNB6H1bF3aqJ37L31z/3ghRSbY1NpAxlWguRUGkKCkDsBFU71bm/KRZNH/YCk6RKGs4SJ0sVKJFrygrKFTdM/pfO4EXpjMe3U/hEBUU8MFHh1IJS5pVSMQbM7D4aRnceJWWoMELvxn32TlJcUougZ0pWcJ0oWcrRqIPxJEpRVbPAoiMLrTIlRQ0z8kBpoiSASqnmJgZa6xSBLKOKIfCD4iZKgjLL+JMvocySi5gs1xYPmCZMiiqLYg7UmgHL1QQUmT1gSppTPHY5mbucoDEGQGr9RsbAzXZk4MPmR+v6pVsUQ90t9qHPjWnRGC3nekIQLGdsPd6KP9heY0hSMSSpUVjJs42xaBOUaEaAIHdUPsu6v647tyd+rYWxua9ZarjJfU0hlVpa/grrJkIBgUlNYw1JYGxiImXMABJ3UzdhU699tyxC7/aidGK45gyeehhaJXiso1FeGLub1Oql/yt09fgblrr3aWMTAAA="

-- Node Functions
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

    function ClayNode()
    ClayID = 37570
    ClayCount = GetItemCount(ClayID)
  end

  function Marble_LimestoneNode()
    MarbleID = 39890
    LimestoneID = 37565
    MarbleCount = GetItemCount(MarbleID)
    LimestoneCount = GetItemCount(LimestoneID)
  end

  function TinsandNode()
    TinsandID = 37571
    TinsandCount = GetItemCount(TinsandID)
  end

  function SugarcaneNode()
    SugarcaneID = 37567
    SugarcaneCount = GetItemCount(SugarcaneID)
  end

  function LogNode()
    LogID = 37560
    LogCount = GetItemCount(LogID)
  end

  function Branch_ResinNode()
    BranchID = 37553
    ResinID = 39224
    BranchCount = GetItemCount(BranchID)
    ResinCount = GetItemCount(ResinID)
  end

  -- These are Items that are shared across multiple nodes

  function SandNode()
    SandID = 37559
    SandCount = GetItemCount(SandID)
  end

  function VineNode()
    VineID = 37562
    VineCount = GetItemCount(VineID)
  end

  function LogNode()
    LogID = 37560
    LogCount = GetItemCount(LogID)
  end

  function StoneNode()
    StoneID = 37554
    StoneCount = GetItemCount(StoneID)
  end

-- Item Count Check/Shop Amount Check
  function StoneShop()
    StoneAmount = ItemMax-(ItemAmount*LoopAmount)
    if StoneAmount < 0 then 
      StoneAmount = 0
    end
    StoneSend = (StoneCount-StoneAmount)
    if StoneSend > 999 then
      StoneSend = 999
    end
    if StoneWorkShop > 0 then 
      StoneSend = StoneSend - StoneWorkShop
    end
  end

  function SandShop()
    SandAmount = ItemMax-(ItemAmount*LoopAmount)
    if SandWorkShop < 0 then
      SandAmount = 0
    end
    SandSend = (SandCount-SandAmount)
    if SandSend > 999 then
      SandSend = 999
    end
    if SandWorkShop > 0 then
      SandSend = SandSend - SandWorkShop
    end
  end

  function IronShop()
    IronAmount = ItemMax-(ItemAmount*LoopAmount)
    if IronAmount < 0 then
      IronAmount = 0
    end
    IronSend = (IronCount-IronAmount)
    --if IronWorkShop > 0 then
      --IronSend = IronSend - IronWorkShop
    --end
  end

  function QuartzShop()
    QuartzAmount = ItemMax-(ItemAmount*LoopAmount)
    if QuartzAmount < 0 then 
      QuartzAmount = 0
    end
    QuartzSend = (QuartzCount-QuartzAmount)
    --if QuartzWorkShop > 0 then
      --QuartzAmount = QuartzAmount - QuartzWorkShop
    --end
  end

  function LeucograniteShop()
    LeucograniteAmount = ItemMax-(ItemAmount*LoopAmount)
    if LeucograniteAmount < 0 then
      LeucograniteAmount = 0
    end
    LeucograniteSend = (LeucograniteCount-LeucograniteAmount)
    --if LeucograniteWorkShop > 0 then
      --LeucograniteAmount = LeucograniteAmount - LeucograniteWorkShop
    --end
  end

  function DuriumShop()
    DuriumAmount = ItemMax-(ItemAmount*LoopAmount)
    if DuriumAmount < 0 then
      DuriumAmount = 0
    end
    DuriumSend = (DuriumCount-DuriumAmount)
    --if DuriumWorkShop > 0 then 
      --DuriumAmount = DuriumAmount - DuriumWorkShop
    --end
  end

  function ClayShop()
    ClayAmount = ItemMax-(ItemAmount*LoopAmount)
    if ClayWorkShop < 0 then
      ClayAmount = 0
    end
    ClaySend = (ClayCount-ClayAmount)
  end

  function LimestoneShop()
    LimestoneAmount = ItemMax-(ItemAmount*LoopAmount)
    if LimestoneWorkShop < 0 then
      LimestoneAmount = LimestoneAmount + LimestoneWorkShop
    end
    LimestoneSend = (LimestoneCount-LimestoneAmount)
  end

  function MarbleShop()
    MarbleAmount = ItemMax-(ItemAmount*LoopAmount)
    MarbleSend = (MarbleCount-MarbleAmount)
  end

  function TinsandShop()
    TinsandAmount = ItemMax-(ItemAmount*LoopAmount)
    if TinsandWorkShop < 0 then
      TinsandAmount = TinsandAmount + TinsandWorkShop
    end
    TinsandSend = (TinsandCount-TinsandAmount)
  end

  function SugarcaneShop()
    SugarcaneAmount = ItemMax-(ItemAmount*LoopAmount)
    if SugarcaneWorkShop < 0 then 
      SugarcaneAmount = SugarcaneAmount + SugarcaneWorkShop
    end
    SugarcaneSend = (SugarcaneCount-SugarcaneAmount)
  end

  function VineShop()
    VineAmount = ItemMax-(ItemAmount*LoopAmount)
    if VineWorkShop < 0 then
      VineAmount = VineAmount + VineWorkShop
    end
    VineSend = (VineCount-VineAmount)
  end

  function ResinShop()
    ResinAmount = ItemMax-(ItemAmount*LoopAmount)
    if ResinWorkShop < 0 then
      ResinAmount = ResinAmount + ResinWorkShop
    end
    ResinSend = (ResinCount-ResinAmount)
  end

  function LogShop()
    LogAmount = ItemMax-(ItemAmount*LoopAmount)
    if LogWorkShop < 0 then
      LogAmount = LogAmount + LogWorkShop
    end
    LogSend = (LogCount-LogAmount)
  end

  function BranchShop()
    BranchAmount = ItemMax-(ItemAmount*LoopAmount)
    if BranchWorkShop < 0 then
      BranchAmount = BranchAmount + BranchWorkShop
    end
    BranchSend = (BranchCount-BranchAmount)
  end

-- Shop Selling Functions

  function StoneSell()
    yield("/pcall MJIDisposeShop True 12 2 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..StoneSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function IronSell()
    yield("/pcall MJIDisposeShop True 12 24 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..IronSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function QuartzSell()
    yield("/pcall MJIDisposeShop True 12 25 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..QuartzSend)
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

  function ClaySell()
    yield("/pcall MJIDisposeShop True 12 16 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..ClaySend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function LimestoneSell()
    yield("/pcall MJIDisposeShop True 12 14 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..LimestoneSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function MarbleSell()
    yield("/pcall MJIDisposeShop True 12 36 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..MarbleSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function TinsandSell()
    yield("/pcall MJIDisposeShop True 12 17 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..TinsandSend)
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

  function ResinSell()
    yield("/pcall MJIDisposeShop True 12 28 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..ResinSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function LogSell()
    yield("/pcall MJIDisposeShop True 12 11 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..LogSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end


  function BranchSell()
    yield("/pcall MJIDisposeShop True 12 1 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..BranchSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

  function SandSell()
    yield("/pcall MJIDisposeShop True 12 7 <wait.0.5>")
    yield("/pcall MJIDisposeShopShipping True 11 "..SandSend)
    yield("/pcall SelectYesno True 0")
    yield("/wait 1.5")
  end

-- Setup for moving to the shop, and getting ready to sell the items
  function Sellingitemsto()
    yield("/visland moveto -268 40 226")
    yield("/wait 1")
    MovingTest()

    yield("/visland moveto -267.281 41 216.883")
    yield("/wait 1")
    MovingTest()

    yield("/visland moveto -267.065 41 209.221")
    yield("/wait 1")
    MovingTest()

    yield("/target Enterprising Exporter <wait.0.5>")
    yield("/pint <wait.0.5>")
    yield("/pcall SelectString True 0 <wait.1.0>")
  end

  function LeavingShop()
    yield("/pcall MJIDisposeShop False -2")

    yield("/visland moveto -267.841 40 230.751")
    yield("/wait 1")
    MovingTest()
    
    yield('/mount "Company Chocobo"')
    yield("/wait 5")
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

    yield("/wait 1")
  end

-- Distance Test
  function DistanceToBase()  
  Distance_Test = GetDistanceToPoint(-268, 40, 226)
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

-- Route Check
if FlyingEnabled == true then
  goto FlyShop
elseif FlyingEnabled == false then
  goto GroundShop
end

-- Start of the Loop
::FlyShop::
  
  yield("/visland stop")
  yield("/visland resume")

  IslandReturn()

  DistanceToBase()

  if Distance_Test > 4 then
    goto FlyShop 
  end

  CurrentLoop = 1
  LoopAmount = XPLoopAmount
  ItemAmount = QuartzArray[1]
  QuartzNode()
  QuartzShop()

  ItemAmount = QuartzArray[2]
  Iron_DuriumNode()
  IronShop()
  if IslandLevel >= 17 then
    DuriumShop()
  end

  ItemAmount = QuartzArray[3]
  LeucograniteNode()
  LeucograniteShop()

  ItemAmount = QuartzArray[4]
  StoneNode()
  StoneShop()

  if ItemCountEcho == true then
    yield("/echo --- Spacer --- ")
    yield("/echo Quartz Send = "..QuartzSend)
    yield("/echo Iron Send = "..IronSend)
    yield("/echo Leucogranite Send = "..LeucograniteSend)
    yield("/echo Stone Send = "..StoneSend)
  end

  if TestingShopSend == true then
    yield("/snd stop")
  end

  Sellingitemsto()
    
  if (QuartzSend > 0) then
    QuartzSell()
  end
  if (IronSend > 0) then
    IronSell()
  end
  if IslandLevel >= 17 and (DuriumSend > 0) then
    DuriumSell()
  end
  if LeucograniteSend > 0 then
    LeucograniteSell()
  end
  if StoneSend > 0 then
    StoneSell()
  end
    
  LeavingShop()
    
  yield("/visland exectemponce "..B2Quartz.." <wait.1.0>")
  VislandCheck()

  goto FlyLoopTime

::FlyLoopTime::

  while CurrentLoop <= LoopAmount do
    yield("/visland exectemponce "..VQuartz.." <wait.1.0>")
    
    VislandCheck()
    CurrentLoop = CurrentLoop + 1

    if LoopEcho == true then
      yield("/echo Current Loop: "..CurrentLoop.." / "..LoopAmount)
    end
  end

  if ContinueLooping == true then
    goto FlyShop
  elseif ContinueLooping == false then
    goto EndScript
  end

-- Ground XP Route
::GroundShop::

  yield("/visland stop")
  yield("/visland resume")

  IslandReturn()

  DistanceToBase()

   if Distance_Test > 4 then
    goto GroundShop
  end

  CurrentLoop = 1
  LoopAmount = GroundXPAmount
  ItemAmount = ClayArray[1]
  ClayNode()
  ClayShop()

  ItemAmount = ClayArray[2]
  Marble_LimestoneNode()
  StoneNode()
  TinsandNode()
  SugarcaneNode()
  VineNode()
  Branch_ResinNode()
  LogNode()

  MarbleShop()
  LimestoneShop()
  StoneShop()
  TinsandShop()
  SugarcaneShop()
  VineShop()
  BranchShop()
  ResinShop()
  LogShop()

  ItemAmount = ClayArray[3]
  SandNode()
  SandShop()

  if SandSend > SandCount then
    SandSend = SandCount
  end

  yield("/e Clay send = "..ClaySend)

  yield("/echo Sand: "..SandSend)

  Sellingitemsto()

    if ClaySend > 0 then 
      ClaySell()
    end
    if MarbleSend > 0 then
      MarbleSell()
    end
    if LimestoneSend > 0 then
      LimestoneSell()
    end
    if StoneSend > 0 then 
      StoneSell()
    end
    if TinsandSend > 0 then
      TinsandSell()
    end
    if SugarcaneSend > 0 then
      SugarcaneSell()
    end
    if VineSend > 0 then
      VineSell()
    end
    if BranchSend > 0 then
      BranchSell()
    end
    if ResinSend > 0 then
      ResinSell()
    end
    if LogSend > 0 then
      LogSell()
    end
    if SandSend > 0 then
      SandSell()
    end

  LeavingShop()

  yield("/vnavmesh moveto 217.135 56.829 83.243")
  yield("/wait 1.0")
  MovingTest()

  goto GroundXPTime

::GroundXPTime::
  while CurrentLoop <= LoopAmount do
    yield("/visland exectemponce "..VClay.." <wait.1.0>")
    
    VislandCheck()
    CurrentLoop = CurrentLoop + 1

    if LoopEcho == true then
      yield("/echo Current Loop: "..CurrentLoop.." / "..LoopAmount)
    end
  end

  if ContinueLooping == true then
    goto GroundShop
  elseif ContinueLooping == false then
    goto EndScript
  end



::EndScript::
yield("/e XP Loop has concluded")