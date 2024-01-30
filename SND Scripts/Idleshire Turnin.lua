
-- Condition 26 = InCombat, could be used to kill legs easier
manip_phase = 0



::Destory_Alex::
yield('/target "Left Foreleg"') -- Target Left Leg
yield("/rotation Manual")
yield("/wait 0.5")

while GetCharacterCondition(26) do
  if GetTargetName() == "Left Foreleg" then
    yield("/wait 1")
  elseif GetTargetName() == "Right Foreleg" then
    yield("/wait 1")
  elseif GetTargetName() == "The Manipulator" then
    yield("/wait 1")
  elseif GetTargetName() == "" then
    if manip_phase = 0 then
      yield("/wait 0.5")
      yield('/target "The Manipulator"')
      manip_phase = manip_phase + 1
    elseif manip_phase == "1" then
      yield("/wait 8")
      yield('/target "Right Foreleg"')
      manip_phase = manip_phase + 1
    elseif manip_phase == "2" then
      yield("/wait 0.5")
      yield('/target "The Manipulator"')
      manip_phase = manip_phase + 1
    end
end
      
-- Need to add the visland route to open the chest, and leave duty here