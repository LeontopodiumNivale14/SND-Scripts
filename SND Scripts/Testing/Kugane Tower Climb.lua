  function VNavMovement() --Used to Do NOTHING While Moving
    repeat
      yield("/wait 0.1")
    until not PathIsRunning()
    yield("/wait 0.5")
  end 

-- Part 1
  PathfindAndMoveTo(-44.141536712646,14.025003433228,-35.817306518555) -- Getting to jump puzzle
  VNavMovement()
  PathMoveTo(-40.912528991699,15.522336959839,-35.770092010498) -- Jump 1 [Ledge]
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-39.099834442139,17.209999084473,-37.99320602417) -- Jump 2 [Peg 1]
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-36.183361053467,17.41003036499,-39.026420593262) -- Jump 3 [Peg 2]
  yield("/wait 0.05")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-33.759944915771,19.210020065308,-38.909271240234) -- Jump 4 [Peg 3]
  yield("/wait 0.08")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-30.417827606201,20.910150527954,-38.714973449707) -- Jump 5 [Peg 4]
  yield("/wait 0.13")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-32.009704589844,22.854316711426,-40.351844787598) -- Jump 6 Green Roof 
  yield("/wait 0.13")
  yield("/gaction jump")
  VNavMovement()
-- Movement for Part 2
  PathfindAndMoveTo(-41.472766876221,25.55012512207,-78.196868896484) -- heading to next balcony
  VNavMovement()
  PathMoveTo(-43.108730316162,26.599939346313,-78.66202545166) -- Jump to balcony
  yield("/wait 0.13")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-44.110664367676,28.099981307983,-78.843894958496) -- Jump onto ledge
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-50.616306304932,26.599939346313,-79.849990844727) -- Positioning in balcony
  VNavMovement()
  PathMoveTo(-52.484069824219,28.300001144409,-81.711639404297) -- Jump to ledge
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-54.232757568359,30.009998321533,-83.285713195801) -- Jump to post
  yield("/wait 0.08")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-54.306289672852,31.755350112915,-80.297134399414) -- Jump to roof #2
  yield("/wait 0.15")
  yield("/gaction jump")
  VNavMovement()
-- Movement for Part 3
  PathfindAndMoveTo(-48.217552185059,40.984283447266,-70.252174377441) -- pre-positioning
  VNavMovement()
  PathMoveTo(-49.73458480835,40.977420806885,-70.258201599121) -- Pre-positioning
  VNavMovement()
  PathMoveTo(-47.870979309082,40.861660003662,-70.359855651855) -- Pre-positioning
  VNavMovement()
  PathMoveTo(-46.516757965088,42.110000610352,-70.346618652344) -- Peg 1
  yield("/wait 0.03")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-49.585971832275,43.809997558594,-70.292388916016) -- Peg 2
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-52.571510314941,45.309997558594,-70.328872680664) -- Peg 3
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-49.622097015381,47.109996795654,-70.242881774902) -- Peg 4
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-49.143260955811,47.110000610352,-70.668403625488) -- Repositioning
  VNavMovement()
  PathMoveTo(-46.39,48.91,-70.686) -- 2nd to last jump before 3rd roof
  yield("/wait 0.12")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-46.0,48.909999847412,-71.081382751465) -- Repositioning
  VNavMovement()
  PathMoveTo(-49.019981384277,50.444580078125,-70.563110351563) -- Jump to roof
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
-- Phase 4
  PathfindAndMoveTo(-52.067058563232,52.105571746826,-67.81468963623)
  VNavMovement()
  PathMoveTo(-53.887729644775,53.682231903076,-65.982559204102)
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-55.71577835083,54.511569976807,-66.720489501953)
  yield("/wait 0.01")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-56.31477355957,54.817314147949,-63.216464996338)
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathfindAndMoveTo(-55.962295532227,56.269771575928,-58.629577636719)
  VNavMovement()
  PathMoveTo(-54.498600006104,57.735614776611,-58.438953399658)
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-55.061283111572,59.529998779297,-55.712879180908) -- Peg 1
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-54.743053436279,61.309997558594,-58.40837097168) -- Peg 2
  yield("/wait 0.07")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-54.456825256348,62.750007629395,-56.340286254883) -- flat board
  yield("/wait 0.09")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-55.014743804932,64.310012817383,-59.545459747314) -- Jump to circle
  yield("/wait 0.15")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-55.054664611816,65.936058044434,-62.178646087646) -- Jump above the circle
  yield("/wait 0.02")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-54.318367004395,68.4755859375,-64.664695739746)
  VNavMovement()
  PathMoveTo(-52.49242401123,67.189834594727,-65.714553833008)
  VNavMovement()
  PathMoveTo(-49.142097473145,68.410079956055,-65.806335449219) -- Peg 1
  yield("/wait 0.12")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-46.839561462402,70.210182189941,-65.814979553223) -- Peg 2
  yield("/wait 0.08")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-44.771747589111,72.010139465332,-65.781898498535) -- Peg 3
  yield("/wait 0.08")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-49.231796264648,73.510055541992,-65.636650085449) -- Peg 4
  yield("/wait 0.15")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-50.917728424072,75.110000610352,-66.127349853516) -- Peg 5
  yield("/wait 0.04")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-47.105583190918,76.409996032715,-65.882026672363) -- Peg 6
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-45.462337493896,77.249984741211,-65.46900177002) -- Corner
  yield("/wait 0.05")
  yield("/gaction jump")
  VNavMovement()
-- Phase 5
  PathMoveTo(-41.576156616211,79.049995422363,-65.550270080566) -- Peg 1
  yield("/wait 0.14")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-42.930641174316,79.049995422363,-64.131874084473) -- Repositioning 1/2
  VNavMovement()
  PathMoveTo(-41.068687438965,79.049995422363,-65.931266784668) -- Repositioning 2/2
  VNavMovement()
  PathMoveTo(-39.837459564209,80.849998474121,-63.595432281494) -- Peg 2
  yield("/wait 0.11")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-41.532611846924,82.249969482422,-61.281318664551) -- Right side of flag
  yield("/wait 0.08")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-41.509757995605,82.249969482422,-62.523979187012) -- Repositioning on right #1
  VNavMovement()
  PathMoveTo(-41.53165435791,82.249969482422,-60.6) -- Repositioning on right #2
  VNavMovement()
  PathMoveTo(-41.543075561523,82.249969482422,-56.473731994629) -- Left side of flag
  yield("/wait 0.1")
  yield("/gaction jump")
  VNavMovement()
  -- Seperator for myself.. cause this is a problem
  PathMoveTo(-41.541080474854,82.249969482422,-57.1)
  VNavMovement()
  PathMoveTo(-40.436363220215,83.75,-55.311138153076) -- Peg 1
  yield("/wait 0.05")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-40.767417907715,83.75,-55.710754394531) -- Reposition
  VNavMovement()
  PathMoveTo(-39.124370574951,85.549995422363,-51.899452209473) -- Peg 2
  yield("/wait 0.14")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-40.052394866943,87.349998474121,-54.446090698242) -- Peg 3
  yield("/wait 0.09")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-39.,87.35,-54.5) -- Repositioning
  VNavMovement()
  yield("/wait 0.5")
  PathMoveTo(-40.348064422607,88.492851257324,-54.418590545654) -- Jumping to ledge
  yield("/wait 0.05")
  yield("/gaction jump")
  VNavMovement()
  yield("/wait 0.5")
  PathMoveTo(-39.962127685547,89.650001525879,-52.001384735107) -- Peg 4
  yield("/wait 0.08")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-40.806533813477,90.887008666992,-51.972049713135) -- Outer Ledge
  yield("/wait 0.01")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-42.18355178833,89.157188415527,-53.726879119873) -- going down to lower edge
  VNavMovement()
  PathfindAndMoveTo(-42.170364379883,89.157188415527,-64.561408996582) -- moving in front of ledge
  VNavMovement()
  PathMoveTo(-42.438186645508,90.886993408203,-66.35041809082) -- jumping up 
  yield("/wait 0.2")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-44.856071472168,90.887008666992,-66.220664978027) -- Position for peg 3
  VNavMovement()
  PathMoveTo(-39.945587158203,91.010009765625,-68.298080444336) -- Last Peg #3
  yield("/wait 0.12")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-39.5,91,-68.807) -- Positioning
  VNavMovement()
  PathMoveTo(-37.75626373291,92.810012817383,-67.004463195801) -- 2nd to last peg
  yield("/wait 0.07")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-36.623279571533,92.810012817383,-67.015327453613) -- Positioning
  VNavMovement()
  PathMoveTo(-37.455615997314,94.609985351563,-65.476196289063) -- Jump to last peg
  yield("/wait 0.05")
  yield("/gaction jump")
  VNavMovement()
  PathMoveTo(-38.399185180664,95.345970153809,-65.539413452148) -- ON THE ROOF
  yield("/wait 0.02")
  yield("/gaction jump")
  VNavMovement()