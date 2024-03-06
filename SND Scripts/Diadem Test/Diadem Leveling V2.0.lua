--[[

  ************
  * Settings *
  ************

]]

--Functions
function VNavMovement()
  while PathIsRunning() do 
    yield("/wait 0.1")
    yield("/e Test A")
  end
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


while IsInZone(939) do 

  ::MinerRouteLoop::

  -- 1st Node 
    MountFly()
    PathfindAndMoveTo(-162.71871948242,-3.5657231807709,-380.83001708984,true)
    VNavMovement()
 
    RockyTarget()

  -- 2nd Node
    MountFly()
    PathfindAndMoveTo(-168.53330993652,-7.1620492935181,-517.23455810547,true)
    VNavMovement()
    UnMounty = true 
    MineralTarget()

  -- 3rd Node 
    MountFly()
    PathfindAndMoveTo(-156.49293518066,0.51802706718445,-532.48718261719,true)
    VNavMovement()
    PathfindAndMoveTo(-79.378227233887,-19.081031799316,-595.35748291016,true)
    VNavMovement()
    UnMounty = true 
    MineralTarget()

  -- 4th Node
    MountFly()
    PathfindAndMoveTo(-50.906860351563,-47.829128265381,-515.34356689453,true)
    VNavMovement()
    UnMounty = true 
    MineralTarget()

  -- 5th Node 
    MountFly()
    PathfindAndMoveTo(-21.170042037964,-27.940048217773,-535.30084228516,true)
    VNavMovement()
    UnMounty = true 
    RockyTarget()

  -- 6th Node 
    MountFly()
    PathfindAndMoveTo(58.757160186768,-46.921642303467,-518.07025146484,true)
    VNavMovement()
    UnMounty = true 
    RockyTarget()

  -- 7th Node 
    MountFly()
    PathfindAndMoveTo(106.36954498291,-48.547618865967,-502.35317993164,true)
    VNavMovement()
    UnMounty = true 
    MineralTarget()

  -- 8th Node 
    MountFly()
    PathfindAndMoveTo(-205.19468688965,-3.7425479888916,-356.46331787109,true)
    VNavMovement()
    UnMounty = true 
    MineralTarget()

    goto MinerRouteLoop
end
