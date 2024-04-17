--[[
    
    **************************************
    *  Sharlayan [EW] Tsai Leve Turnin  * 
    *************************************

    *********************************
    *  Author: Leontopodium Nivale  *
    *********************************

    ******************
    * Version  |  5  *
    ******************

    ***************
    * Description *
    ***************

    Automated Leve Turnin. (Currently only set for Old Sharlayan/

    *********************
    *  Required Plugins *
    *********************


    Plugins that are used are:
    -> Pandora's Box
    -> TextAdvanced
		-> Add the following:     Do you really want to trade a high-quality item?
    -> Something Need Doing [Expanded Edition] : https://puni.sh/api/repository/croizat
          -> If there's extra settings needed to be changed in the plugin
          -> I try and put it below it so people know that it's related to this
]]

--[[ 

    **************
    *  Settings  *
    **************
    ]]


    VariableNameHere = true 
        -- This is where I type the description of it all 
        -- Sometimes do multiline to keep formatting clean 
        -- Options: True | False 

    LoopAmount = 20
	
	LeveQuestNumber = 1643
		-- 1647 = Tsai tou Vounou : The Mountain Steeped
		-- 1643 = Carrot Nibbles : A Stickler for Carrots

--[[

    ************
    *  Script  *
    *   Start  *
    ************

]]

    CurrentLoop = 1
    PandoraSetFeatureState("Auto-select Turn-ins", true)
    yield("/wait 0.1")
    PandoraSetFeatureConfigState("Auto-select Turn-ins", "AutoConfirm", true)
    yield("/at y")
    yield("/wait 0.1")
	
	if LeveQuestNumber == 1647 then 
		itemID = 36060 
		LeveDetail = 1642
	elseif LeveQuestNumber == 1643 then 
		itemID = 36047
		LeveDetail = 1643
	end

::LUATEATURNIN::

    if GetItemCount(itemID) < 3 then 
        yield("/e HOLD ON. You don't seem to have any more Tsai tou Vounou in your pockets. Just gonna... put a halt on your script so you don't grab unnecessary Leve's")
        yield("/snd stop")
    end

    yield("/target Grigge")
    yield("/wait 0.1")
    yield("/interact")
    yield("/wait 0.1")

    while IsAddonVisible("SelectString") == false do 
      yield("/wait 0.1")
    end 

    while IsAddonReady("SelectString") == false do 
      yield("/wait 0.1")
    end 

    yield("/pcall SelectString true 1")

    while IsAddonReady("JournalDetail") == false do 
      yield("/wait 0.1")
    end

	yield("/pcall GuildLeve true 12 7")
	yield("/wait 0.3")

    yield("/pcall GuildLeve true 13 1 "..LeveDetail)
    yield("/wait 0.3")
    yield("/pcall JournalDetail true 3 "..LeveDetail)
    yield("/wait 0.3")

    yield("/pcall GuildLeve true -2")

    while IsAddonVisible("SelectString") == false do 
      yield("/wait 0.1")
    end 

    while IsAddonReady("SelectString") == false do 
      yield("/wait 0.1")
    end 

    yield("/pcall SelectString true 3")

    while GetTargetName() ~= "" do 
      yield("/wait 0.1")
    end 

    yield("/target Ahldiyrn")
    yield("/wait 0.1")
    yield("/interact")

    while GetTargetName() ~= "" do 
      yield("/wait 0.1")
    end 

    CurrentLoop = CurrentLoop + 1

    if LoopAmount >= CurrentLoop then 
        goto LUATEATURNIN
    else
        yield("/e Thank you for using the automated Leve Turnin")
    end 