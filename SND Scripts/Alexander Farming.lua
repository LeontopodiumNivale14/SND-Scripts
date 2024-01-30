--[[
This is meant to be used for Alexander - The Burden of the Father (NORMAL NOT SAVAGE)
It's setup to where you should be able to loop it as many time as you want, and be able to farm mats for GC seals
Known classes to work: MCH | SMN | RDM | BLM | BRD
]]

-- How many loops do you wanna do
NumberofLoops = 10

-- This is just the loop counter itself, keeps tracks of how many you've done.
CurrentLoop = 1

::LoopTest::
if NumberofLoops >= CurrentLoop then
  yield("/echo Loop: "..CurrentLoop.." out of ".. NumberofLoops)
elseif NumberofLoops < CurrentLoop then
  goto StopLoop
end


::DutyFinder::
yield("/visland resume")
yield("/visland stop")
yield("/dutyfinder")
yield("/wait 1")

yield("/pcall ContentsFinder True 12 0")

yield("/wait 1")

yield("/click duty_commence")
yield("/wait 3")

while GetCharacterCondition(45) do
  yield("/wait 1")
end

::Start::
if IsInZone(445) then
  yield("/wait 10")
end

::BattleInitialize::
manip_phase = 0

yield("/visland exectemponce H4sIAAAAAAAACk2PW2vDMAyF/4ueTXCyNJv9VrYO8tDdIVvHKKbVqKG2Rq3uQsh/nxJctjcd6dPRUQ83LiBYmO/xe12vH0FB534+yEdOYF97uKPk2VME28MzWF3oqrmYmaY2Cl7AlrqY1ea8qhWswJrCNGdaV4MoitheyYKCB7f1R3ErCxFL+sSAkadJGxkPbsOd591tpv/3cjgJlXb0dZpIGnF7d/uEf/gUsVSwCMSnwy1jyOV8IrK4P2LiXI/GnfPjt9lxVNd0uKS4zZ8LNjaffMClcHp4G34B1YIamzkBAAA=")
yield("/wait 0.3")

while IsVislandRouteRunning() do
  yield("/targetenemy")
  yield("/rotation Manual")
  yield("/wait 1")
end

::StartofBattle::

yield ("/wait 4")

while GetCharacterCondition(26) do
  yield("/wait 2")
  yield("/targetenemy")
end

yield ("/wait 4")

if (not GetCharacterCondition(26)) then
  yield("/visland exectemponce H4sIAAAAAAAACuWS22oDIRRF/+U8G9GMl9G30AvMQ3ojMG1KCdJYImS0ZEwvhPn3OhPTKfQP2jf3OZvtduEBrkxjQcNsaz9WbLUABLX5fA3Oxxb04wFuQuuiCx70Ae5BU1wyNaWMIXhIimAuqRQSwRL0hOFScFlw3iUdvK3OQRMEd2bt9imN4iTm4c021sdhU/lod+Y51i5urrP75yyXS6XaTXg/bVKblPZitq0d7UNFiuCiCfF0cRVtk4+zwZHF7d62MZ/74Nq4OCb26jLszoJf55eT43DhGjtPPtKhX1wIpoTLkishvskwJrg6kpFYcSmp+IdkJhSrKVeSF+OXKUSZMPVgeMKklCj+PJin7gumThGobAMAAA==")
end

yield("/wait 3")

while IsMoving() do
  yield("/wait 1")
end

CurrentLoop = CurrentLoop + 1
yield("/echo Leaving the instance")
yield("/wait 0.3")
yield("/pdfleave")
yield("/wait 7")

goto LoopTest

::StopLoop::
yield("/echo Alex Looping has completed")