--[[
    
    *****************************
    *  BLM LayLines Meme Macro  * 
    *****************************

    *********************************
    *  Author: Leontopodium Nivale  *
    *********************************

    ***************
    * Description *
    ***************

    This is just the funny BLM Macro that is set to automatically do the message anytime you do the LayLines. Do note: I would advise just running this whenever you're in a duty more than anything

    *********************
    *  Required Plugins *
    *********************


    Plugins that are used are:
    -> Something Need Doing [Expanded Edition] : https://puni.sh/api/repository/croizat
]]

--[[

    ************
    *  Script  *
    *   Start  *
    ************

]]

::BlmCastCheck::
    while GetSpellCooldown(3573) == 0 do 
        yield("/wait 0.2")
    end 

    yield("/p <se.5> Please be aware that I am about to use one of my core class abilities, which is called Ley Lines.")
    yield("/wait 0.1")
    yield("/p I am placing the Ley Lines NOW.")
    yield("/wait 1")
    yield("/p When I use Ley Lines it places a CIRCLE on the GROUND that lasts for THIRTY SECONDS. <se.1> ")
    yield("/wait 1")
    yield("/p If I remain in the circle, my Global Cooldown will be accelerated by FIFTEEN (15) PERCENT (%). ")
    yield("/wait 1")
    yield("/p It is BENEFICIAL FOR THE GROUP if I am ALLOWED to REMAIN inside the Ley Lines.")
    yield("/wait 1")
    yield("/p Please let me do my own thing and do not place area of effect attacks inside the Ley Lines")
    yield("/wait 13")
    yield("/p There are THIRTEEN SECONDS left in my Ley Lines. <se.1> ")
    yield("/wait 5")
    yield("/p There are EIGHT SECONDS left in my Ley Lines. <se.6> ")
    yield("/wait 7")
    yield("/p THERE IS ONE SECOND LEFT IN MY LEY LINES. <se.1>") 
    yield("/wait 1")
    yield("/p <se.6> The Ley Lines have faded. Thank you for your cooperation. I will be doing this again in NINETY SECONDS. <se.6>")

    repeat
        yield("/wait 0.2")
    until GetSpellCooldown(3573) == 0

    goto BlmCastCheck