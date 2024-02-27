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
  PathFlyTo(-660.41577148438,301.62045288086,-160.03395080566)
  VNavMovement()
  PathFlyTo(-624.64819335938,287.37033081055,-194.13554382324)
  VNavMovement()
  PathFlyTo(-575.46350097656,34.286987304688,-236.34704589844)
  VNavMovement()

-- Base -> 1st Mineral Deposit
  MountFly()
  PathFlyTo(-660.41577148438,301.62045288086,-160.03395080566)
  VNavMovement()
  PathFlyTo(-624.64819335938,287.37033081055,-194.13554382324)
  VNavMovement()
  PathFlyTo(-575.46350097656,34.286987304688,-236.34704589844)
  VNavMovement()

-- 1st Node
  MineralTarget()

-- 2nd Node V2
  RanRouteTime()
  UnMounty = true
  if RandomRoute == 1 then  
    MountFly()
    PathFlyTo(-559.29260253906,42.670978546143,-275.22509765625)
    VNavMovement()
    PathFlyTo(-536.00115966797,35.378379821777,-273.10885620117)
    VNavMovement()
    PathFlyTo(-512.22790527344,25.180261611938,-263.19534301758)
    VNavMovement()
    yield('/visland moveto -502.98645019531 25.482217788696 -263.21426391602') 
    VislandMovement() 
  elseif RandomRoute == 2 then
    MountFly() 
    PathFlyTo(-548.14410400391,40.404155731201,-244.05953979492)
    VNavMovement()
    PathFlyTo(-519.30004882813,30.967296600342,-253.60949707031)
    VNavMovement()
    yield('/visland moveto -504.57803344727 25.756950378418 -259.34100341797') 
    VislandMovement() 
  end
  MineralTarget()

-- 3rd Node
  MountFly()
  PathFlyTo(-458.80673217773,34.295154571533,-257.38891601563) -- flying round the tree
  VNavMovement()
  MineralTarget()

-- 4th Node
  MountFly()
  PathFlyTo(-406.62145996094,12.928646087646,-295.38870239258)
  VNavMovement()
  RockyTarget()

-- 5th Node 
  MountFly()
  PathFlyTo(-372.52227783203,4.9728355407715,-348.67837524414)
  VNavMovement()
  RockyTarget()

-- 6th Node
  UnMounty = true
  MountFly()
  PathFlyTo(-347.17001342773,6.0544757843018,-397.26953125)
  VNavMovement()
  PathFlyTo(-320.52215576172,-4.3476357460022,-435.91659545898)
  VNavMovement()
  yield('/visland moveto -323.50180053711 -4.3696160316467 -439.13842773438') 
  VislandMovement() 
  RockyTarget()

-- 7th Node 
  MountFly()
  PathFlyTo(-300.97344970703,5.0310039520264,-436.40399169922)
  VNavMovement()
  yield('/visland moveto -294.18347167969 2.9988439083099 -431.02301025391') 
  VislandMovement() 
  MineralTarget()

-- 8th Node
  MountFly()
  UnMounty = true
  RanRouteTime()
  if RandomRoute == 1 then 
    PathFlyTo(-263.62493896484,6.6603555679321,-462.35461425781)
    VNavMovement()
    yield('/visland moveto -254.33256530762 3.1903803348541 -473.4963684082') 
    VislandMovement() 
    PathFlyTo(-240.4988861084,-3.9500026702881,-491.41146850586)
    VNavMovement() 
  elseif RandomRoute == 2 then 
    PathFlyTo(-262.06311035156,8.1760663986206,-430.02740478516)
    VNavMovement()
    PathFlyTo(-230.2281036377,0.65619146823883,-464.93927001953)
    VNavMovement()
    yield('/visland moveto -232.04541015625 -3.6318073272705 -481.37292480469') 
    VislandMovement() 
  end
  MineralTarget()



yield("/e Complete!")