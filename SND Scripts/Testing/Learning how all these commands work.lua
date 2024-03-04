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
   GetRecastTime(UInt32 actionId)
or GetRealRecastTime(UInt32 actionId)
Example: GetRealRecastTime(7514) -- if casting vercure, will track the cast time of vercure

-- Checks to see how much time is left before you can cast another action/spell
   GetSpellCooldown(UInt32 actionId)
or GetRealSpellCooldown(UInt32 actionId)

-- Info text here when I get the second 
  GetSpellCooldownInt(UInt32 actionId)
  Example: GetSpellCooldownInt(24298) -- Kerachole [SGE AOE Mit]
  Example: yield("/e Spell CD: "..GetSpellCooldownInt(24298)) -- Echos back how much time is left on Kerachole [SGE AOE Mit]

-- Info text here when I get the second 
GetActionStackCount(Int32 maxStacks, UInt32 actionId)

-- Info text here when I get the second 
ExecuteAction(UInt32 actionId)

-- Info text here when I get the second 
ExecuteGeneralAction(UInt32 actionId)

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

-- Info text here when I get the second 
OpenRegularDuty(UInt32 cfcID)

-- Info text here when I get the second 
SetDFLanguageJ(Boolean state)

-- Info text here when I get the second 
SetDFLanguageE(Boolean state)

-- Info text here when I get the second 
SetDFLanguageD(Boolean state)

-- Info text here when I get the second 
SetDFLanguageF(Boolean state)

-- Info text here when I get the second 
SetDFJoinInProgress(Boolean state)

-- Info text here when I get the second 
SetDFUnrestricted(Boolean state)

-- Info text here when I get the second 
SetDFLevelSync(Boolean state)

-- Info text here when I get the second 
SetDFMinILvl(Boolean state)

-- Info text here when I get the second 
SetDFSilenceEcho(Boolean state)

-- Info text here when I get the second 
SetDFExplorerMode(Boolean state)

-- Info text here when I get the second 
SetDFLimitedLeveling(Boolean state)

-- Info text here when I get the second 
Int32 GetDiademAetherGaugeBarCount()

-- Check if a game UI window is "visible". Becomes true as soon as the addon begins loading, before it's actually on screen and usable.
Boolean IsAddonVisible(String addonName)

-- Check if an element node is visible in game UI windows. Does not support nested nodes (it was supposed to, but it didn't work).
Boolean IsNodeVisible(String addonName, Int32 node, Int32 child1 = -1, Int32 child2 = -1)

-- Similar to IsAddonVisible, but waits for the addon to finish loading. Slower, but better to use if you're reading text nodes, as the text nodes are not populated immediately.
Boolean IsAddonReady(String addonName)

-- Info text here when I get the second 
String GetToastNodeText(Int32 index, Int32[] nodeNumbers)

-- Used for reading text from game UI windows. Addon name needs to be in "quotes". Supports nested text nodes. Use the Node List in addon inspector, and the index you want is in [1] square brackets at the start of the line.
String GetNodeText(Int32 index, Int32[] nodeNumbers)

-- Info text here when I get the second 
String GetSelectStringText(Int32 index)

-- Info text here when I get the second 
String GetSelectIconStringText(Int32 index)

-- Info text here when I get the second 
Int32 GetNodeListCount(String addonName)

--[[
*********************
*  CHARACTER STATE  *
*      COMMANDS     *
*********************
]]

-- Info text here when I get the second 
Boolean IsPlayerAvailable()

-- Info text here when I get the second 
Boolean HasStatus(String statusName)

-- Info text here when I get the second 
Boolean HasStatusID(UInt32[] statusIDs)

-- Info text here when I get the second 
UInt32 GetStatusStackCount(UInt32 statusID)

-- Info text here when I get the second
Single GetStatusTimeRemaining(UInt32 statusID)

-- Info text here when I get the second 
UInt32 GetStatusSourceID(UInt32 statusID)

-- Info text here when I get the second 
Boolean GetCharacterCondition(Int32 flagID, Boolean hasCondition = True)

-- Info text here when I get the second 
String GetCharacterName(Boolean includeWorld = False)

-- Info text here when I get the second 
Boolean IsInZone(Int32 zoneID)

-- Info text here when I get the second 
Boolean IsLocalPlayerNull()

-- Info text here when I get the second 
Boolean IsPlayerDead()

-- Info text here when I get the second 
Boolean IsPlayerCasting()

-- Info text here when I get the second 
Boolean IsMoving()

-- Info text here when I get the second 
Boolean IsPlayerOccupied()

-- Info text here when I get the second 
UInt32 GetGil()

-- Info text here when I get the second 
UInt32 GetClassJobId()

-- Info text here when I get the second 
Single GetPlayerRawXPos(String character = )

-- Info text here when I get the second 
Single GetPlayerRawYPos(String character = )

-- Info text here when I get the second 
Single GetPlayerRawZPos(String character = )

-- Info text here when I get the second 
Int32 GetLevel(Int32 expArrayIndex = =1)

-- Info text here when I get the second 
Byte GetPlayerGC()

-- Info text here when I get the second 
Int32 GetFCRank()

-- Info text here when I get the second 
String GetFCGrandCompany()

-- Info text here when I get the second 
Int32 GetFCOnlineMembers()

-- Info text here when I get the second 
Int32 GetFCTotalMembers()

-- Info text here when I get the second 
Void RequestAchievementProgress(UInt32 id)

-- Info text here when I get the second 
UInt32 GetRequestedAchievementProgress()

-- Info text here when I get the second 
UInt32 GetCurrentBait()

-- Info text here when I get the second 
Uint16 GetLimitBreakCurrentValue()

-- Info text here when I get the second 
UInt32 GetLimitBreakBarValue()

-- Info text here when I get the second 
Byte GetLimitBreakBarCount()

-- Info text here when I get the second 
UInt32 GetPenaltyTimeRemainingInMinutes()

-- Info text here when I get the second 
Byte GetMaelstromGCRank()

-- Info text here when I get the second 
Byte GetFlamesGCRank()

-- Info text here when I get the second 
Byte GetAddersGCRank()

-- Info text here when I get the second 
Void SetMaelstromGCRank(Byte rank)

-- Info text here when I get the second 
Void SetFlamesGCRank(Byte rank)

-- Info text here when I get the second 
Void SetAddersGCRank(Byte rank)

--[[
**************
*  CRAFTING  *
*  COMMANDS  *
**************
]]

-- EDITORS NOTE:
-- Skipping this for now... just cause artisan exist

--[[
******************
*  ENTITY STATE  *
*    COMMANDS    *
******************
]]

-- Info text here when I get the second 
Single GetDistanceToPoint(Single x, Single y, Single z)

-- Info text here when I get the second 
Single GetTargetName()

-- Info text here when I get the second 
Single GetTargetRawXPos()

-- Info text here when I get the second 
Single GetTargetRawYPos()

-- Info text here when I get the second 
Single GetTargetRawZPos()

-- Info text here when I get the second 
Boolean IsTargetCasting()

-- Info text here when I get the second 
UInt32 GetTargetActionID()

-- Info text here when I get the second 
UInt32 GetTargetUsedActionID()

-- Info text here when I get the second 
Single GetTargetHP()

-- Info text here when I get the second 
Single GetTargetMaxHP()

-- Info text here when I get the second 
Single GetTargetHPP()

-- Info text here when I get the second 
Single GetTargetRotation()

-- Info text here when I get the second 
Nullable`1 GetTargetObjectKind()

-- Info text here when I get the second 
Nullable`1 GetTargetSubKind()

-- Info text here when I get the second 
Void TargetClosestEnemy(Single distance = 0)

-- Info text here when I get the second 
Void ClearTarget()

-- Info text here when I get the second 
Single GetDistanceToTarget()

-- Info text here when I get the second 
String GetFocusTargetName()

-- Info text here when I get the second 
Single GetFocusTargetRawXPos()

-- Info text here when I get the second 
Single GetFocusTargetRawYPos()

-- Info text here when I get the second 
Single GetFocusTargetRawZPos()

-- Info text here when I get the second 
Boolean IsFocusTargetCasting()

-- Info text here when I get the second 
UInt32 GetFocusTargetActionID()

-- Info text here when I get the second 
UInt32 GetFocusTargetUsedActionID()

-- Info text here when I get the second 
UInt32 GetFocusTargetHP()

-- Info text here when I get the second 
UInt32 GetFocusTargetMaxHP() 

-- Info text here when I get the second 
UInt32 GetFocusTargetHPP()

-- Info text here when I get the second 
UInt32 GetFocusTargetRotation()

-- Info text here when I get the second 
Void ClearFocusTarget()

-- Info text here when I get the second 
Single GetDistanceToFocusTarget()

-- Info text here when I get the second 
Single GetObjectRawXPos(String name)

-- Info text here when I get the second 
Single GetObjectRawYPos(String name)

-- Info text here when I get the second 
Single GetObjectRawZPos(String name)

-- Info text here when I get the second 
Boolean IsObjectCasting(String name)

-- Info text here when I get the second 
UInt32 GetObjectActionID(String name)

-- Info text here when I get the second 
UInt32 GetObjectUsedActionID(String name)

-- Info text here when I get the second 
UInt32 GetObjectHP(String name)

-- Info text here when I get the second 
UInt32 GetObjectMaxHP(String name)

-- Info text here when I get the second 
UInt32 GetObjectHPP(String name)

-- Info text here when I get the second 
UInt32 GetObjectRotation(String name)

--[[

***************
*  INVENTORY  *
*   COMMANDS  *
***************

]]

-- Info text here when I get the second 
Int32 GetItemCount(Int32 itemID, Boolean includeHQ = True)

-- Info text here when I get the second 
Int32 GetInventoryFreeSlotCount()

--[[

**************
*    IPC     *
*  COMMANDS  *
**************

]]

-- Info text here when I get the second 
Nullable`1 PandoraGetFeatureEnabled(String feature)

-- Info text here when I get the second 
Nullable`1 PandoraGetFeatureConfigEnabled(String feature, String config)

-- Info text here when I get the second 
Void PandoraSetFeatureState(String feature, String config)

-- Info text here when I get the second 
Void PandoraSetFeatureConfigState(String feature, String config, Boolean State)

-- Info text here when I get the second 
Void PandoraPauseFeature(String feature, Int32 ms)

-- Info text here when I get the second 
Void SetAutoHookState(Boolean State)

-- Info text here when I get the second 
Void SetAutoHookGigState(Boolean state)

-- Info text here when I get the second 
Void SetAutoHookGigSize(Int32 size)

-- Info text here when I get the second 
Void SetAutoHookGigSpeed(Int32 speed)

-- Info text here when I get the second 
Void SetAutoHookPreset(Spring preset)

-- Info text here when I get the second 
Void UseAutoHookAnonymousPreset(String preset)

-- Info text here when I get the second
Void DeletedSelectedAutoHookPreset()

-- Info text here when I get the second
Void DeleteAllAutoHookAnonymousPresets()

-- Info text here when I get the second
Boolean DeliverooIsTurnInRunning()

-- Info text here when I get the second
Boolean IsVislandRouteRunning()

-- Info text here when I get the second
Boolean NavIsReady()

-- Info text here when I get the second
Single NavBuildProgress()

-- Info text here when I get the second
Void NavReload()

-- Info text here when I get the second
Void NavRebuild()

-- Info text here when I get the second
Void NavPathfind(Single x, Single y, Single z, Boolean fly)

-- Info text here when I get the second
Boolean NavIsAutoLoad()

-- Info text here when I get the second
Void NavSetAutoLoad(Boolean state)

-- Info text here when I get the second
Nullable`1 QueryMeshNearestPointX(Single x, Single y, Single z, Single halfExtentXZ, Single halfExtentY)

-- Info text here when I get the second
Nullable`1 QueryMeshNearestPointY(Single x, Single y, Single z, Single halfExtentXZ, Single halfExtentY)

-- Info text here when I get the second
Nullable`1 QueryMeshNearestPointZ(Single x, Single y, Single z, Single halfExtentXZ, Single halfExtentY)

-- Info text here when I get the second
Nullable`1 QueryMeshPointOnFloorX(Single x, Single y, Single z, Single halfExtentXZ)

-- Info text here when I get the second
Nullable`1 QueryMeshPointOnFloorY(Single x, Single y, Single z, Single halfExtentXZ)

-- Info text here when I get the second
Nullable`1 QueryMeshPointOnFloorZ(Single x, Single y, Single z, Single halfExtentXZ)

-- Info text here when I get the second
Void PathMoveTo(Single x,Single y, Single z, Boolean Fly)

-- Info text here when I get the second
Void PathStop()

-- Info text here when I get the second
Boolean PathIsRunning()

-- Info text here when I get the second
Int32 PathNumWaypoints()

-- Info text here when I get the second
Boolean PathGetMovementAllowed(Boolean state)

-- Info text here when I get the second
Void PathSetMovementAllowed(Boolean state)

-- Info text here when I get the second
Boolean PathGetAlignCamera()

-- Info text here when I get the second
Void PathSetAlignCamera()

-- Info text here when I get the second
Single PathGetTolerance()

-- Info text here when I get the second
Void PathSetTolerance(Single t)

-- Info text here when I get the second
Void PathfindAndMoveTo(Single x, Single y, Single z, Boolean fly)

-- Info text here when I get the second
Boolean PathfindInProgress()

-- Info text here when I get the second
Void ARSetSuppressed(Boolean state)

-- Info text here when I get the second
List`1 ARGetRegisteredCharacters()

-- Info text here when I get the second
List`1 ARGetRegisteredEnabledCharacters()

-- Info text here when I get the second
List`1 ARGetRegisteredRetainers()

-- Info text here when I get the second
List`1 ARGetRegisteredEnabledRetainers()

-- Info text here when I get the second
Boolean ARAnyWaitingToBeProcessed(Boolean allCharacters = False)

-- Info text here when I get the second
Boolean ARRetainersWaitingToBeProcessed(Boolean allCharacters = False)

-- Info text here when I get the second
Boolean ARSubsWaitingToBeProcessed(Boolean allCharacters = False)

-- Info text here when I get the second
Void PauseYesAlready()

-- Info text here when I get the second
Void RestoreYesAlready()

--[[

**************
*   QUEST    *
*  COMMANDS  *
**************

]]

-- Info text here when I get the second
Boolean IsQuestAccepted(Uint16 id)

-- Info text here when I get the second
Boolean IsQuestCompleted(Uint16 id)

-- Info text here when I get the second
Byte GetQuestSequence(Uint16 id)

-- Info text here when I get the second
Nullable`1 GetQuestIDByName(String name)

--[[

**************
*   SYSTEM   *
*  COMMANDS  *
**************

]]

-- Info text here when I get the second
String GetClipboard()

-- Info text here when I get the second
Void SetClipboard(String text) 

-- ... Pretty self explanitory. Crashes the game for you (WHY... idk)
Void CrashTheGame()

-- Info Text Here
Void LogInfo(String text)

-- Info Text Here
Void LogDebug(String text)

-- Info Text Here
Void LogVerbose(String text)

--[[
*****************
*  WORLD STATE  *
*   COMMANDS    *
*****************
]]

-- Info text here when I get the second
Int32 GetZoneID()

-- Info text here when I get the second
Single GetFlagXCoord()

-- Info text here when I get the second
Single GetFlagYCoord()

-- Info text here when I get the second
Single GetFlagZone()

-- Info text here when I get the second
Byte GetActiveWeatherID()

-- Info text here when I get the second
Int64 GetCurrentEorzeaTimestamp()

-- Info text here when I get the second
Int32 GetCurrentEorzeaSecond()

-- Info text here when I get the second
Int32 GetCurrentEorzeaMinute()

-- Info text here when I get the second
Int32 GetCurrentEorzeaHour()

-- Info text here when I get the second
List`1 GetActiveFates()

-- Info text here when I get the second
Uint16 GetNearestFate()

-- Info text here when I get the second
Boolean IsInFate()

-- Info text here when I get the second
Single GetFateDuration(Uint16 fateID)

-- Info text here when I get the second
Single GetFateHangInCount(Uint16 fateID)

-- Info text here when I get the second
Single GetFateLocationX(Uint16 fateID)

-- Info text here when I get the second
Single GetFateLocationY(Uint16 fateID)

-- Info text here when I get the second
Single GetFateLocationZ(Uint16 fateID)

-- Info text here when I get the second
Single GetContentTimeLeft()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingRoute()

-- Info text here when I get the second
Byte GetCurrentOceanFishingTimeofDay()

-- Info text here when I get the second
Int32 GetCurrentOceanFishingStatus()

-- Info text here when I get the second
Byte GetCurrentOceanFishingZone()

-- Info text here when I get the second
Single GetCurrentOceanFishingZoneTimeLeft()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingTimeOffset()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingWeatherID()

-- Info text here when I get the second
Boolean OceanFishingIsSpectralActive()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingMission1Type()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingMission2Type()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingMission3Type()

-- Info text here when I get the second
Byte GetCurrentOceanFishingMission1Goal() 

-- Info text here when I get the second
Byte GetCurrentOceanFishingMission2Goal()

-- Info text here when I get the second
Byte GetCurrentOceanFishingMission3Goal()

-- Info text here when I get the second
String GetCurrentOceanFishingMission1Name()

-- Info text here when I get the second
String GetCurrentOceanFishingMission2Name()

-- Info text here when I get the second
String GetCurrentOceanFishingMission3Name()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingMission1Progress()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingMission2Progress()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingMission3Progress()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingPoints()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingScore()

-- Info text here when I get the second
UInt32 GetCurrentOceanFishingTotalScore()

-- Info text here when I get the second
Single GetAccursedHoardRawX()

-- Info text here when I get the second
Single GetAccursedHoardRawY()

-- Info text here when I get the second
Single GetAccursedHoardRawZ()

-- Info text here when I get the second
List`1 GetNearbyObjectNames(Single distance = 0, Byte objectKind = 0)
