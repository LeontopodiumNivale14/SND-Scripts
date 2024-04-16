--[[
    
    **************************************
    *  Sharlayan [EW] Tsai Leve Turnin  * 
    *************************************

    *********************************
    *  Author: Leontopodium Nivale  *
    *********************************

    ******************
    * Version  |  3  *
    ******************

    ***************
    * Description *
    ***************

    This is just my attempt at automating this damn leve turnin, that way I don't have to have a quest in my inventory that I will NEVER complete -.- XD
    This was made all in lua, all within SND as usual

    *********************
    *  Required Plugins *
    *********************


    Plugins that are used are:
    -> Pandora's Box
    -> TextAdvanced
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


::LUATEATURNIN::

    if GetItemCount(36060) < 3 then 
        yield("/e HOLD ON. You don't seem to have any more Tsai tou Vounou in your pockets. Just gonna... put a halt on your script so you don't grab unnecessary Leve's")
        yield("/e snd stop")
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

    yield("/click select_string2")

    while IsAddonReady("JournalDetail") == false do 
      yield("/wait 0.1")
    end


    yield("/pcall GuildLeve true 13 1 1647")
    yield("/wait 0.3")
    yield("/pcall JournalDetail true 3 1647")
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