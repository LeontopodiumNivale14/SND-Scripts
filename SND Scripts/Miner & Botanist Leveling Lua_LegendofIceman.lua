--[[
  Description: Full automation of Diadem, to allow leveling of an item. You need to initially click the first item you want to gather here, but afterwards can just walk away.
               Now built to have both Botanist & Miner in the same script. Detects which class you're on, and has a built in route for both as well!
  
  Required Plugins:
    -> visland
    -> snd [Make sure to press the lua button when you import this]
  Author: LegendofIceman
  Version: 6
  Class: Miner/BTN
  Link: https://discord.com/channels/1001823907193552978/1191076157882388581/1193291297067384873
]]

--When do you want to repair your own gear? From 0-100 (it's in percentage, but enter a whole value
Repair_Amount = 75


-- Miner Red Route
Miner_Red = "H4sIAAAAAAAACu2Z32sjRwzH/xWzTy04w0gjaTR+K70WAk1/HAdp7+iDibec6dkb7E3LEfK/V2PPelNqw4Kfbrd52rGH9eSD9NVXmufqx+WmrhbVm/VyVW9mN7O79bbezb6ava1Xsx/seT5DIXycfV3Nq/vl58dmvW331eLDc/Vzs1+362ZbLZ6rX6vFDUh0STTpvPrNluz8vHpvD0GDQ/VCL7ZutvXtm2phX71drtZP9ibM++6av+pNvW1tOa9ut229Wz609+v2409l9+vPypHtQPuPzd/dN3YSe9sfy0/7ut9+OB7Mq+82Tdv98G1bb8rjN4cdZfHLU71vy3N+8f1y3fZvzKvvm923zXZV/mt//PDdelPf2T7/Mj/HhJzHGI5IgvMQUbDjwi7GxIOw+DNYQoj+PJpd8/Dn51nz1D7smscvgxM49lo4oUuKFKHjJA4hpvOcwrQ4kXFiJTiAQhcCSjxiIrWQIeF4nhP8mxOMLM2SiwmDHONHO+lhACcBRCcpPejUNOaIJKeQxQoVLmihgzoMy6WUgrNoNrl+LD/NVvVjPtCXQUodo8aOVCJgFe5QgUPPRIPSyo8shMRp5FNBTxqSL3LDyA5JzlPxLvLEQghc1OiP2YYOUDz1qJLzKcVB2TYyYbYoMWHmdAwhckyilOv8AYx4xxFggmCUHED0neHxp4qVojP1iTxIbsZVsWJy1itke5yZgHUTRqjIsHhLMO+HhcolucGxyE205koDFGEGdWByoz0p0ks2cGqk2PoDldh1YMBOFbGzQcEESeBSCzZqy0zR3GFMVITZCr0ZxJM99M5U+rpkC2MJIWLHCWNPSjxS6eEZbLbh9bpkGw+p6DB46HQp2x7rOTojDZhbfKZBffy4ks1qWbAoKe0pirPGtPNAhOajU7oqgmgs0w2zg8TxhIlsmoi9VqvG61rWsXBiR8nMc3FKptYSJPjUk0JiL9NLNBt5cCJ5JdUoUrBQsi6fPF4VQDyKAGKxSaEF0KvinxLlAUg3NFPloNNrQSJaxFAs9cvKmVCAvtKzIRuWVeOiYnoimvOoREtMkG95Dlh87ukx/J9VC/A2d04pvIoeCXnyceTEDsxw6/REGXyyTt4X85P7DtTuDixjsVp1nX+Wkfjn/4CKUfAUP96Rv1TTJwbqBoLVcp/6+0IKiaFrysgGIlbE4vRS7QaSXV/A6S6DXKnpwS7IGAmG3WKMqnqZPVan3I1ag41XMeRW7MCF7eJQBt4Pnk8rSWksaYXm/ADytUUhJcH+OlIm3AJTJPX7yz84saGyJyMAAA=="

-- Botanist Pink Route
Botanist_Pink = "H4sIAAAAAAAACu2ZWWvbQBDHv4rQUwvOsDvHHn7rCYGmF4X0oA+iUWvRWiqx0lJCvntno5WTggMBP1Wy/aKRxHr185x/XZYvq3VdLsunTXVWr4uj4nHXV22z6YsHxeum/V68aNp6UaBn8614WC7K0+rPz65p+025/HRZvu42Td90bbm8LN+XyyPkAGxclEX5QU0LXkIM0S3Kj2qy16vOeLlSu2vr46fl0izKt9VZc6HrEahx0v2q13Xbl0u7KI/bvj6vvvSnTb96le++fS5vXre1WXW/xyu6H13ta/VjU9/cfr1JXfLZuuvHHz7u63U+fHR9RzbeXNSbPh+nhU+rpr9ZMVnPu/MnXXuWn90MJ9816/pE7zNXizvIhMBhICMgIxMPIXKk3UzwXyY4LSaC4GNwAxKE4EW/IxdRLnIvKmYHFSIfdpP5cbFZFb/qb3Vfpc0UP6v+y+r/wBVABHmLy0Z2WzdiQOvCgdcNL2JlhEgDL9LUw2iFMjBL4D2jm2EuIvZgMWciBvIOYxixIDhhv5cf2WnFHYlTP7K5pjGIEytbXhYQzYHXbV4ugDOBc+ClIGRBl4mREAQxc+wByBvAmCrcwCU6J5R7I2IH3hDuFXg4scBTXlE/Iy8fBXHLS23r9msQJsZLqxlEgzw4GAq4kMwBGDoLzlmaY+AxObA2/d2Ji1cOQrnPRFEf04S+lx/RTjLrqr84r4v+vK7/D0jaESENbUHyJI4+jpAsWI98gMTkIdo4RJgC0/jCyDeU1LHM/ZrwiUVY8CBBtpknmmhzptbiD2TuOeDeFWE8iQiLBgJlcSRBUjR2hKTzm87CB0hCETimMp8izIJowxi2yVqbJO0K5ji0CWvfHIlHLjrN5o4axYMPsl+AybRaIVG5jSi3joRJlEw5ZMSFbPYrZlPDpfKRmCxOarNkfMRt46i2Y2dxjkGn6qxKIkPGJtaMHcfJH9WrbHD7DWxuam6kpd5Kzt2sxU7jbMRllKS7I3PPE5cKR2BVQcqCgOb0aOV63r2WliKrQmmCn2HcoTFA0ftMRtKzDkxUAo8UeI5vS4wO9DbaUc42QiqCDFxUT9OaRnvVtDTsTSq6jL5ZS9l6wKWSrU8a7oDLqBu5OFtcn6/+Ah2KxUP6HQAA"

-- Main loop, test to see if you're in the Diadem or not
::Wait::
while not IsInZone(886) do
  yield("/wait 10")
end
yield("/visland stop")
yield("/wait 3")

-- If you have the ability to repair your gear, this will allow you to do so. 
-- Currently will repair when your gear gets to 50% or below, but you can change the value to be whatever you would like
::RepairMode::
  if NeedsRepair(Repair_Amount) then
    yield("/generalaction repair")
    yield("/waitaddon Repair")
    yield("/pcall Repair true 0")
    yield("/wait 0.1")
    if IsAddonVisible("SelectYesno") then
      yield("/pcall SelectYesno true 0")
      yield("/wait 0.1")
    end
    while GetCharacterCondition(39) do yield("/wait 1") end
    yield("/wait 1")
    yield("/pcall Repair true -1")
  end

::JobTester::
Current_job = GetClassJobId()
if (Current_job == 17) or (Current_job == 16) then
  goto Enter
elseif (Current_job > 17) or (Current_job < 15) then
  yield("/echo Hmm... You're not on a gathering job, swtich to one and stop the script again.")
  yield("/snd stop")
end

-- If not in the Diadem, then if you're standing in front of the NCP "Aurvael", this will queue you into it
::Enter::
if IsInZone(886) then
  while GetCharacterCondition(34, false) and GetCharacterCondition(45, false) do
    if IsAddonVisible("ContentsFinderConfirm") then
      yield("/pcall ContentsFinderConfirm true 8")
    elseif GetTargetName()=="" then
      yield("/target Aurvael")
    elseif GetCharacterCondition(32, false) then
      yield("/pinteract")
    end
    if IsAddonVisible("Talk") then yield("/click talk") end
    if IsAddonVisible("SelectString") then yield("/pcall SelectString true 0") end
    if IsAddonVisible("SelectYesno") then yield("/pcall SelectYesno true 0") end
    yield("/wait 0.5")
  end
  while GetCharacterCondition(35, false) do yield("/wait 1") end
  while GetCharacterCondition(35) do yield("/wait 1") end
  yield("/wait 3")
end

-- Once in the Diadem, moves you to the starting point to start the gathering loop.
::Move::
if IsInZone(939) then
  while GetCharacterCondition(77, false) do
    if GetCharacterCondition(4, false) then
      yield("/mount \"Company Chocobo\"")
      yield("/wait 3")
    else
      yield("/generalaction jump")
      yield("/wait 0.5")
    end
  end
  yield("/visland movedir 0 20 0")
  yield("/wait 1")
  yield("/visland movedir 50 0 -50")
  yield("/wait 1")
  yield("/visland moveto -235 30 -435")
  yield("/wait 1")
  while IsMoving() do yield("/wait 1") end

  if Current_job == 17 then -- Botanist Route
  yield("/visland exectemp "..Botanist_Pink)
  elseif Current_job == 16 then -- Miner Route
  yield("/visland exectemp "..Miner_Red)
  end
end

goto Wait
