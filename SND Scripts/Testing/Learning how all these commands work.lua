--[[

**********
*  INFO  *
**********

Have you ever wondered how this command works? Ever just need some documentation on all the custom lua functions we have in our SND [Expanded Edition]
Well... this is a general attempt to try and get it all in one place, that way maybe... making scripts is a lot more user friendly. 

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

-- Info here!
  GetSpellCooldownInt(UInt32 actionId)
  Example: GetSpellCooldownInt(24298) -- Kerachole [SGE AOE Mit]
  Example: yield("/e Spell CD: "..GetSpellCooldownInt(24298)) -- Echos back how much time is left on Kerachole [SGE AOE Mit]

-- Info here!
GetActionStackCount(Int32 maxStacks, UInt32 actionId)

-- Info here!
ExecuteAction(UInt32 actionId)

-- Info here!
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

-- Info here!
OpenRegularDuty(UInt32 cfcID)

-- Info here!
SetDFLanguageJ(Boolean state)

-- Info here!
SetDFLanguageE(Boolean state)

-- Info here!
SetDFLanguageD(Boolean state)

-- Info here!
SetDFLanguageF(Boolean state)

-- Info here!
SetDFJoinInProgress(Boolean state)

-- Info here!
SetDFUnrestricted(Boolean state)

-- Info here!
SetDFLevelSync(Boolean state)

-- Info here!
SetDFMinILvl(Boolean state)

-- Info here!
SetDFSilenceEcho(Boolean state)

-- Info here!
SetDFExplorerMode(Boolean state)

-- Info here!
SetDFLimitedLeveling(Boolean state)

-- Info here!
Int32 GetDiademAetherGaugeBarCount()

-- Info here!
Boolean IsAddonVisible(String addonName)

-- Info here!
Boolean IsNodeVisible(String addonName, Int32 node, Int32 child1 = -1, Int32 child2 = -1)

-- Info here!
Boolean IsAddonReady(String addonName)

-- Info here!
String GetToastNodeText(Int32 index, Int32[] nodeNumbers)

-- Info here!
String GetNodeText(Int32 index, Int32[] nodeNumbers)

-- Info here!
String GetSelectStringText(Int32 index)

-- Info here!
String GetSelectIconStringText(Int32 index)

-- Info here!
Int32 GetNodeListCount(String addonName)

--[[
*********************
*  CHARACTER STATE  *
*      COMMANDS     *
*********************
]]

-- Info here!
Boolean IsPlayerAvailable()

-- Info here!
Boolean HasStatus(String statusName)

-- Info here!
Boolean HasStatusID(UInt32[] statusIDs)

-- Info here!
UInt32 GetStatusStackCount(UInt32 statusID)

-- Info text here when I get the second
Single GetStatusTimeRemaining(UInt32 statusID)

-- Info here!
UInt32 GetStatusSourceID(UInt32 statusID)

-- Info here!
Boolean GetCharacterCondition(Int32 flagID, Boolean hasCondition = True)

-- Info here!
String GetCharacterName(Boolean includeWorld = False)

-- Info here!
Boolean IsInZone(Int32 zoneID)

-- Info here!
Boolean IsLocalPlayerNull()

-- Info here!
Boolean IsPlayerDead()

-- Info here!
Boolean IsPlayerCasting()

-- Info here!
Boolean IsMoving()

-- Info here!
Boolean IsPlayerOccupied()

-- Info here!
UInt32 GetGil()

-- Info here!
UInt32 GetClassJobId()

-- Info here!
Single GetPlayerRawXPos(String character = )

-- Info here!
Single GetPlayerRawYPos(String character = )

-- Info here!
Single GetPlayerRawZPos(String character = )

-- Info here!
Int32 GetLevel(Int32 expArrayIndex = =1)

-- Info here!
Byte GetPlayerGC()

-- Info here!
Int32 GetFCRank()

-- Info here!
String GetFCGrandCompany()

-- Info here!
Int32 GetFCOnlineMembers()

-- Info here!
Int32 GetFCTotalMembers()

-- Info here!
Void RequestAchievementProgress(UInt32 id)

-- Info here!
UInt32 GetRequestedAchievementProgress()

-- Info here!
UInt32 GetCurrentBait()

-- Info here!
Uint16 GetLimitBreakCurrentValue()

-- Info here!
UInt32 GetLimitBreakBarValue()

-- Info here!
Byte GetLimitBreakBarCount()

-- Info here!
UInt32 GetPenaltyTimeRemainingInMinutes()

-- Info here!
Byte GetMaelstromGCRank()

-- Info here!
Byte GetFlamesGCRank()

-- Info here!
Byte GetAddersGCRank()

-- Info here!
Void SetMaelstromGCRank(Byte rank)

-- Info here!
Void SetFlamesGCRank(Byte rank)

-- Info here!
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

-- Info here!
Single GetDistanceToPoint(Single x, Single y, Single z)

-- Info here!
Single GetTargetName()

-- Info here!
Single GetTargetRawXPos()

-- Info here!
Single GetTargetRawYPos()

-- Info here!
Single GetTargetRawZPos()

-- Info here!
Boolean IsTargetCasting()

-- Info here!
UInt32 GetTargetActionID()

-- Info here!
UInt32 GetTargetUsedActionID()

-- Info here!
Single GetTargetHP()

-- Info here!
Single GetTargetMaxHP()

-- Info here!
Single GetTargetHPP()

-- Info here!
Single GetTargetRotation()

-- Info here!
Nullable`1 GetTargetObjectKind()

-- Info here!
Nullable`1 GetTargetSubKind()

-- Info here!
Void TargetClosestEnemy(Single distance = 0)

-- Info here!
Void ClearTarget()

-- Info here!
Single GetDistanceToTarget()

-- Info here!
String GetFocusTargetName()

-- Info here!
Single GetFocusTargetRawXPos()

-- Info here!
Single GetFocusTargetRawYPos()

-- Info here!
Single GetFocusTargetRawZPos()

-- Info here!
Boolean IsFocusTargetCasting()

-- Info here!
UInt32 GetFocusTargetActionID()

-- Info here!
UInt32 GetFocusTargetUsedActionID()

-- Info here!
UInt32 GetFocusTargetHP()

-- Info here!
UInt32 GetFocusTargetMaxHP() 

-- Info here!
UInt32 GetFocusTargetHPP()

-- Info here!
UInt32 GetFocusTargetRotation()

-- Info here!
Void ClearFocusTarget()

-- Info here!
Single GetDistanceToFocusTarget()

-- Info here!
Single GetObjectRawXPos(String name)

-- Info here!
Single GetObjectRawYPos(String name)

-- Info here!
Single GetObjectRawZPos(String name)

-- Info here!
Boolean IsObjectCasting(String name)

-- Info here!
UInt32 GetObjectActionID(String name)

-- Info here!
UInt32 GetObjectUsedActionID(String name)

-- Info here!
UInt32 GetObjectHP(String name)

-- Info here!
UInt32 GetObjectMaxHP(String name)

-- Info here!
UInt32 GetObjectHPP(String name)

-- Info here!
UInt32 GetObjectRotation(String name)

--[[

***************
*  INVENTORY  *
*   COMMANDS  *
***************

]]

-- Info here!
Int32 GetItemCount(Int32 itemID, Boolean includeHQ = True)

-- Info here!
Int32 GetInventoryFreeSlotCount()

--[[

**************
*    IPC     *
*  COMMANDS  *
**************

]]

-- Info here!
Nullable`1 PandoraGetFeatureEnabled(String feature)

-- Info here!
Nullable`1 PandoraGetFeatureConfigEnabled(String feature, String config)

-- Info here!
Void PandoraSetFeatureState(String feature, String config)

-- Info here!
Void PandoraSetFeatureConfigState(String feature, String config, Boolean State)

-- Info here!
Void PandoraPauseFeature(String feature, Int32 ms)

-- Info here!
Void SetAutoHookState(Boolean State)

-- Info here!
Void SetAutoHookGigState(Boolean state)

-- Info here!
Void SetAutoHookGigSize(Int32 size)

-- Info here!
Void SetAutoHookGigSpeed(Int32 speed)

-- Info here!
Void SetAutoHookPreset(Spring preset)

-- Info here!
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