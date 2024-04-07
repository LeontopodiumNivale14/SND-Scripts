--[[

    *****************************************
    * Diadem Farming V3 - Thoughts Edition  *
    *****************************************

    *************************
    *  Version -> 0.0.0.0   *
    *************************

    This is currently where me and UCanPatates can type up the thought process for WHAT we wanna do for V3 of this thing. 
        -> Maybe replace the whole thing with a while statement instead of doing a goto statement (not a bad idea)
        -> Make things more modular in the functions, easier to disect
        -> Make the random wait time a thing in it's own right (function/if statement) THAT WORKS. (never really got to implimenting this) (+byUcanPatates i did it already forgot we have it here)
        -> Make a Proper Debug function to use
        -> add auto go to firmament if not there when the script starts and other checks
        -> add a materia extractor just thougs maybe be in the main loop or event trigger after every dungeon exit
        -> Fix the AetherCannon/Re-write that whole function (+byUcanPatates i did this too accidently soo we have a working function that ass all this we can rewrtie it again tho noprobs)
            -> Make it to where if you're within 10 yalms, do a non-fly moveto (attempt to)
                -> if this fails to path properly, then mountfly? 
            -> If you're within 25 yalms, it'll fly to it 
            -> if nothing is detected, will continue the route, but check along the way, then execute the aethercannon process to head to it 
        -> Something to consider, SND starts to break when it hits in the 400,000's on step wise... might be a good idea to add a global wait timer in the settings for us to adjust as necessary 
            -> Maybe make the following cause LUA is firing off so fast: 
                -> Make the time between gathering at a node 1s 
                -> Make Flying/Moving between nodes 0.3s 
                -> 
        -> Adding "--" to functions and logic soo we can understand each other with the code

        -> (this was what UCanPatates talked about)
              We can actualy just use target names in a list
              Fuction whiles if there is no target selected
              And if there is a target it checks target name
              İf it is not emtpy commence
              We can just call the eneny name list for a check
              And if its matching commence killtarget
              This way we can add only kill this or that in script
              As a setting

        -> "While loop" we can make 2 main loops and maybe the third one for outside of firmament or diadem
            ->"while IsInZone(886) and GetCharacterCondition(45, false) do end" this is firmament
            ->"while IsInZone(939) and GetCharacterCondition(45, false) do end" this is diadem
        -> Action Usage: 
            -> Have all the actions in a table, or if... then statement based on which class you are, and have it toggle based on which class you're on 
                -> for instance, Kings Yield 2 for Min, Blessed Yield? For Btn... ect ect 
            -> Also have rotation conditions for the bonus node 
                -> If GP >= 900,           -> rotation A 
                -> If GP >= 800 and <= 900 -> rotation B 
                -> If GP >= 700 and <= 800 -> rotation C 
            -> also have an option to spend gp if you're going to overcap before the +5 integ node
                -> Use Harvest 2 for this ONCE (+x items based on yield)
        ->Only Target sprites option or spesific target tables

    ***************
    * Description *
    ***************
  
    *********************
    *  Required Plugins *
    *********************

    -> visland -> https://puni.sh/api/repository/veyn
    -> SomethingNeedDoing (Expanded Edition) [Make sure to press the lua button when you import this] -> https://puni.sh/api/repository/croizat
        -> Options → "/item" → Uncheckmark "Stop macro if the item to use is not found" 
        -> Options → "/item" → Uncheckmark "Stop macro if you cannot use an item"
        -> Options → "/target" → checkmark "Use SND's targeting system"
        -> Options → "/target" → uncheckmark "stop macro if target not found"
    -> Pandora's Box -> https://love.puni.sh/ment.json


    ***********
    * Credits *
    ***********

    Author: Leontopodium Nivale
    Class: Miner

    **************
    *  SETTINGS  *
    **************
]]



--[[

	***************************
	* Setting up values here  *
	***************************

]]

