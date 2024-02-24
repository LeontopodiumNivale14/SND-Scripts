--[[

**********
*  INFO  *
**********

Idea behind this is to switch over to navmesh for gathering nodes. 2 fold reasons:
1: visland kinda looks botty. If I could impliment a random choice of pathing, it'll make it look less botty
2: Improve the movement overall between nodes

This is a very WIP idea atm, just some mapping and don't wanna lose this (in case I every wanna go back and finish this)

]]

-- Functions needed for the script
  function MountCheck()
    while GetCharacterCondition(77, false) do
      if GetCharacterCondition(4, false) then
        yield("/mount \"Company Chocobo\"")
        yield("/wait 3")
      else
        yield("/generalaction jump")
        yield("/wait 1.5")
      end
    end
  end

  function GatheringCheck()
    while GetCharacterCondition(6) do 
      yield("/wait 1")
    end
  end

  function MoveTest()
    while IsMoving() do 
      yield("/wait 0.5")
    end
    yield("/wait 1")
  end
  
-- Nodes in the route
  -- Node 1
  MountCheck()
  yield("/vnavmesh flyto -161.292 -5.056 -376.591")
  MoveTest()
  yield("/target Rocky Outcrop")
  yield("/vnavmesh flytarget")
  MoveTest()
  yield("/wait 1")
  GatheringCheck()

  -- Node 2
  MountCheck()
  yield("/vnavmesh flyto -169.792 -8 -511.632")
  MoveTest()
  yield("/target Mineral Deposit")
  yield("/vnavmesh flytarget")
  MoveTest()
  yield("/wait 1")
  GatheringCheck()

  -- Node 3 
  MountCheck()
  yield("/vnavmesh flyto -84.117 -20 -597.159")
  MoveTest()
  yield("/target Mineral Deposit")
  yield("/vnavmesh flytarget")
  MoveTest()
  yield("/wait 1")
  GatheringCheck()

  -- Node 4
  MountCheck()
  yield("/vnavmesh flyto -51.634 -46.467 -512.629")
  MoveTest()
  yield("/target Mineral Deposit")
  yield("/vnavmesh flytarget")
  MoveTest()
  yield("/wait 1")
  GatheringCheck()

  -- Node 5
  MountCheck()
  yield("/vnavmesh moveto -55.267 -48.400 -512.808")
  MoveTest()
  yield("/vnavmesh flyto -21.089 -25.691 -530.630")
  MoveTest()
  yield("/target Rocky Outcrop")
  yield("/vnavmesh flytarget")
  MoveTest()
  yield("/wait 1")
  GatheringCheck()

  -- Node 6
  MountCheck()
  yield("/vnavmesh flyto 61.883 -47.092 -514.653")
  MoveTest()
  yield("/target Rocky Outcrop")
  yield("/vnavmesh flytarget")
  MoveTest()
  yield("/wait 1")
  GatheringCheck()

  -- Node 7 
  MountCheck()
  yield("/vnavmesh flyto 103.145 -48.132 -477.225")
  MoveTest()
  yield("/target Mineral Deposit")
  yield("/vnavmesh flytarget")
  MoveTest()
  yield("/wait 1")
  GatheringCheck()

  -- Node 8 
  MountCheck()
  yield("/vnavmesh flyto -199.373 -4.013 -360.313")
  MoveTest()
  yield("/target Mineral Deposit")
  yield("/vnavmesh flytarget")
  MoveTest()
  yield("/wait 1")
  GatheringCheck()