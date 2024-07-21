--[[

    ****************************************
    *  Island Sanctuary - Leveling Script  * 
    ****************************************

    *********************************
    *  Author: Leontopodium Nivale  *
    *********************************

    **********************
    * Version  |  2.1.2  *
    **********************

	-> 2.1.2  : DT update, had to update some of the code (properly go back and fix "True/False" to "true/false" and change the "/pcall" to "/callback"
			    Also made it to where it list all the items you need to be able to use atleast the ground version of the leveling loop
    -> 2.1.1  : Updated script information, made sure to actually say the pandora plugin was necessary (curse you past me for not remembering)
    -> 2.1.0  : Ground & Flying Leveling is completed! Select which one you would like to do in the settings 

    ***************
    * Description *
    ***************
    This is a small version of the "Gathering Everything" script I'm working on, just meant to be a quick way of leveling up
	
	DO NOTE: You need to atleast done the following:
	-> Gotten to lv. 5 in Island Sanctuary 
	-> Have gotten all the items that you can possibly gather up to this point gathered. Which includes up to Sugarcane, if you need a full list of all the items they are:
		-> Palm Leaf
		-> Isle Branch 
		-> Stone 
		-> Clam 
		-> Laver 
		-> Coral 
		-> Islewort 
		-> Sand 
		-> Vine 
		-> Sap
		-> Apple 
		-> Log 
		-> Palm Log 
		-> Copper 
		-> Limestone 
		-> Rocksalt 
		-> Clay 
		-> Tinsand 
		-> Sugarcane

    *********************
    *  Required Plugins *
    *********************


    Plugins that are used are:
    -> Visland  : https://puni.sh/api/repository/veyn
    -> Vnavmesh : https://puni.sh/api/repository/veyn
    -> Pandora's Box: https://love.puni.sh/ment.json
    -> Something Need Doing [Expanded Edition] : https://puni.sh/api/repository/croizat
]]

--[[ 

    **************
    *  Settings  *
    **************
    ]]
    FlyingEnabled = false
    -- If flying is disabled, it will do the ground version of the route for xp
    -- if flying is enabled, it will do the faster/xp route on top of the mountain

    ContinueLooping = true
    -- Is this something you want to continually do? Or is it a one time level loop? 
    -- Options: true | false [true by default]

    IslandLevel = 1
    -- What your current level is. Used to know WHAT exactly you're selling 
    -- The MINIMUM. Level this script is configured to run at is Lv. 5.
    -- If you're below Lv. 17 and have flying, this will just skip a sell check for one of the higher gathering items if you don't have the tool
    
    ItemCountEcho = true
    -- Would you like it to tell you how many items are being sold at the shop? 

    LoopEcho = true
    -- Tells you in echo chat what loop your currently on in the gathering process

    TestingShopSend = false
    -- Testing

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

--[[

    ************
    *  Script  *
    *   Start  *
    ************

]]

-- Starting values of the script 

	if IslandLevel < 5 then 
		yield("/e Hey! I need you to be ATLEAST Lv. 5 to run this on your island, or else things break REALLY bad (as in can't accomodate for every single possible permutation rn). While you're at it, hit every node once to make sure you have it logged in your Isleventory please and ty <3 <se.1> ")
		yield("/snd stop")
		yield("/wait 1")
	end

-- Array for the Route
    QuartzArray = {6, 3, 2, 11} -- XP Route || Quarts | Iron | Durium Sand | Leucogranite
    ClayArray = {7, 1, 9} -- Ground XP Route || Clay | { Stone/Limestone/Marble | Tinsand | Sugarcane/Vine | Resin/Log/Branch} | Sand

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
    elseif FlyingEnabled == false and IslandLevel >= 5 then
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
        yield("/callback MJIDisposeShop true 12 2 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..StoneSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function IronSell()
        yield("/callback MJIDisposeShop true 12 24 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..IronSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function QuartzSell()
        yield("/callback MJIDisposeShop true 12 25 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..QuartzSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function LeucograniteSell()
        yield("/callback MJIDisposeShop true 12 26 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..LeucograniteSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function DuriumSell()
        yield("/callback MJIDisposeShop true 12 39 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..DuriumSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function ClaySell()
        yield("/callback MJIDisposeShop true 12 16 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..ClaySend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function LimestoneSell()
        yield("/callback MJIDisposeShop true 12 14 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..LimestoneSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function MarbleSell()
        yield("/callback MJIDisposeShop true 12 36 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..MarbleSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function TinsandSell()
        yield("/callback MJIDisposeShop true 12 17 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..TinsandSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function SugarcaneSell()
        yield("/callback MJIDisposeShop true 12 18 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..SugarcaneSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function VineSell()
        yield("/callback MJIDisposeShop true 12 8 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..VineSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function ResinSell()
        yield("/callback MJIDisposeShop true 12 28 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..ResinSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function LogSell()
        yield("/callback MJIDisposeShop true 12 11 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..LogSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

     function BranchSell()
        yield("/callback MJIDisposeShop true 12 1 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..BranchSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

    function SandSell()
        yield("/callback MJIDisposeShop true 12 7 <wait.0.5>")
        yield("/callback MJIDisposeShopShipping true 11 "..SandSend)
        yield("/callback SelectYesno true 0")
        yield("/wait 1.5")
    end

-- Base Script Functions 
    function Sellingitemsto() -- Setup for moving to the shop, and getting ready to sell the items
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
        yield("/callback SelectString true 0 <wait.1.0>")
    end

    function LeavingShop()
        yield("/callback MJIDisposeShop false -2")

        yield("/visland moveto -267.841 40 230.751")
        yield("/wait 1")
        MovingTest()
    
        yield('/mount "Company Chocobo"')
        yield("/wait 5")
    end

    function IslandReturn() -- Checks to see how far you are from in front of the main workshop, if a certain distance, will teleport you in front of It
        yield("/callback _ActionContents true 10 1 <wait.0.5>")
        while GetCharacterCondition(27) do
            yield("/wait 1")
        end
        yield("/wait 1")
        while GetCharacterCondition(45) do
            yield("/wait 1")
        end
        yield("/wait 1")
    end

    function DistanceToBase() -- Distance Test
        Distance_Test = GetDistanceToPoint(-268, 40, 226)
    end

    function MovingTest() -- Moving Test
        while IsMoving() do 
            yield("/wait 1")
        end
    end

    function VislandCheck() -- Visland Route Check 
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