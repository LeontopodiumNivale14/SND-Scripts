--[[
    
    ********************************
    *  Sharlayan [EW] Leve Turnin  * 
    ********************************

    *********************************
    *  Author: Leontopodium Nivale  *
    *********************************

    ******************
    * Version  |  6  *
    ******************
	
	6     -> Should be my final fiddle with this. If you run out of leves, it SHOULD stop trying to pick it up.
	5.2   -> If you're not on CUL, this won't run now. (Just... to save some headache on a pcall causing a crash)
	5.1   -> I'm an idiot, and apperently can't type numbers correctly. SOOO. Properly collects the tsai item now
	5     -> Both Tsai & Carrot Nibble Leves are included in the script. Found some black magic to shorten the code

    ***************
    * Description *
    ***************

    Automated Leve Turnin. (Currently only set for Old Sharlayan)
	**MAKE SURE TO BE ON CUL WHEN TURNING THESE IN**

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
        -- Options: true | false 

    LoopAmount = 20
	
	LeveQuestNumber = 1647
		-- 1647 = Tsai tou Vounou : The Mountain Steeped
		-- 1643 = Carrot Nibbles : A Stickler for Carrots

--[[

    ************
    *  Script  *
    *   Start  *
    ************

]]

	if GetClassJobId() ~= 15 then 
		yield("/e WAIT. This isn't on CUL. Not going to attempt to try and run this till you swap your class.")
		yield("/snd stop")
	end

    CurrentLoop = 1
    PandoraSetFeatureState("Auto-select Turn-ins", true)
    yield("/wait 0.1")
    PandoraSetFeatureConfigState("Auto-select Turn-ins", "AutoConfirm", true)
    yield("/at y")
    yield("/wait 0.1")
	
	if LeveQuestNumber == 1647 then 
		itemID = 36060 
		LeveDetail = 1647
	elseif LeveQuestNumber == 1643 then 
		itemID = 36047
		LeveDetail = 1643
	elseif LeveQuestNumber ~= 1647 or LeveQuestNumber ~= 1643 then
		yield("/e Please select a leve that you want to do above")
		yield("/snd stop")
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

    yield("/callback SelectString true 1")

    while IsAddonReady("JournalDetail") == false do 
      yield("/wait 0.1")
    end
	
	if GetNodeText("GuildLeve",5, 2) == "0" then 
		yield("/e HMM.... you have no more leves left at all. Thanks for using the script <3")
		yield("/callback GuildLeve true -2")

		while IsAddonVisible("SelectString") == false do 
		  yield("/wait 0.1")
		end 

		while IsAddonReady("SelectString") == false do 
		  yield("/wait 0.1")
		end 

		yield("/callback SelectString true 3")
		yield("/snd stop")
	end

		

    yield("/callback GuildLeve true 13 1 "..LeveDetail)
    yield("/wait 0.3")
    yield("/callback JournalDetail true 3 "..LeveDetail)
    yield("/wait 0.3")

    yield("/callback GuildLeve true -2")

    while IsAddonVisible("SelectString") == false do 
      yield("/wait 0.1")
    end 

    while IsAddonReady("SelectString") == false do 
      yield("/wait 0.1")
    end 

    yield("/callback SelectString true 3")

    while GetTargetName() ~= "" do 
      yield("/wait 0.1")
    end 

    yield("/target Ahldiyrn")
    yield("/wait 0.1")
    yield("/interact")

    while IsAddonReady("SelectYesno") == false do
      yield("/wait 0.1")
    end

    yield("/click select_yes")

    while GetTargetName() ~= "" do 
      yield("/wait 0.1")
    end 

    CurrentLoop = CurrentLoop + 1

    if LoopAmount >= CurrentLoop then 
        goto LUATEATURNIN
    else
        yield("/e Thank you for using the automated Leve Turnin")
    end
