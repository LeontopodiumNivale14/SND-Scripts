--[[

**********
*  INFO  *
**********

Have you ever wondered how this command works? Ever just need some documentation on all the custom lua functions we have in our SND [Expanded Edition]
Well... this is my atttempt to kinda write where/how all these work, and 

]]

--[[
************
*  ACTION  *
* COMMANDS *
************
]]

-- Leaves the duty that you are currently in, doesn't open any menus, just insta-leaves (as long as you're not in combat)
LeaveDuty()

-- Teleports you to the Aetherite of your Grand Company 
TeleportToGCTown()

-- Checks to see how much time as passed while casting that action.
-- actionID can be found w/ simple tweaks plugin, enable "Show ID -> Show Resolved Action ID", and hover over an action to get said ID
   GetRecastTimeElapsed(UInt32 actionId)
or GetRealRecastTimeElapsed(UInt32 actionId)
Example: GetRecastTimeElapsed(7514) -- if casting vercure, will track the current recast time

-- Gets cast time of the spell you are currently casting
-- actionID can be found w/ simple tweaks plugin, enable "Show ID -> Show Resolved Action ID", and hover over an action to get said ID
   GetRealRecastTime(UInt32 actionId)
or GetRealRecastTime(UInt32 actionId)
Example: GetRealRecastTime(7514) -- if casting vercure, will track the cast time of vercure

-- Checks to see how much time is left before you can cast another action/spell
GetSpellCooldown(7514)

--[[
************
*  ADDON   *
* COMMANDS *
************
]]

-- Open the duty roulette associated w/ the number. 
-- All values/numbers casn be found under the help section of SND in: Game Data -> Duty Roulette 
  OpenRouletteDuty(Byte contentRouletteID)
Example: OpenRouletteDuty(6) -- Opens the duty finder directly to trial roulette

