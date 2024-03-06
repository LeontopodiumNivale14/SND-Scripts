--Functions
function VNavMovement()
  repeat
    yield("/wait 0.1")
  until not PathIsRunning()
end

function MineralTarget()
  yield("/target Mineral Deposit")
  yield("/wait 0.3")
  if UnMounty == true then 
    yield("/ac dismount")
    yield("/wait 1")
    UnMounty = false
  end
  if GetCharacterCondition(77) then
    yield("/vnavmesh flytarget")
  elseif GetCharacterCondition(77, false) then
    yield("/vnavmesh movetarget")
  end
  repeat
    yield("/wait 0.1")
  until not PathIsRunning()
  repeat
    yield("/wait 0.1")
    yield("/pint")
  until GetCharacterCondition(6, true)
  repeat
    yield("/wait 0.1")
  until GetCharacterCondition(6, false)
end

function RockyTarget()
  yield("/target Rocky Outcrop")
  yield("/wait 0.3")
  if UnMounty == true then 
    yield("/ac dismount")
    yield("/wait 1")
    UnMounty = false
  end
  if GetCharacterCondition(77) then
    yield("/vnavmesh flytarget")
  elseif GetCharacterCondition(77, false) then
    yield("/vnavmesh movetarget")
  end
  repeat
    yield("/wait 0.1")
  until not PathIsRunning()
  repeat
    yield("/wait 0.1")
    yield("/pint")
  until GetCharacterCondition(6, true)
  repeat
    yield("/wait 0.1")
  until GetCharacterCondition(6, false)
end

function CanadianMounty()
  if GetCharacterCondition(4, false) then
    yield('/gaction "mount roulette"')
    yield("/wait 4")
  end
end

function MountFly()
  CanadianMounty()
  yield("/gaction jump")
  yield("/wait 0.5")
  yield("/gaction jump")
end
  
function VislandMovement()
  repeat
    yield("/wait 0.1")
  until not IsVislandRouteRunning()
end

function RanRouteTime()
  RandomRoute = math.random(1,2)
end
  
  
-- Base -> 1st Mineral Deposit
  MountFly()
