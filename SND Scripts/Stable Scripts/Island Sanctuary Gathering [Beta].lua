--[[

    ******************************************
    *  Island Sanctuary - Gather All Script  * 
    ******************************************

    *********************************
    *  Author: Leontopodium Nivale  *
    *********************************

    ************************
    * Version  |  0.0.7.0  *
    ************************

    Man... what a thing this has turned into. IF THIS WORKS IT WOULD BE GREAT
    0.0.7.0 : 9/22 Routes are completed, laid a roadmap for where everything goes. Rewrote/fixed code format for my sanity sake (curse old me for how I did it and made it complicated)
    0.0.6.5 : 7 routes are done, slowly but surely this will be done.

    ***************
    * Description *
    ***************

    The idea of this script is to automate gathering EVERY. SINGLE. ITEM. in Island Sanctuary. This is kinda been a long time project, and probably one of the bigger ambitions I had whenever I started learning coding
    You esentially setup WHAT you want to gather in the settings, and let it run. Don't need to touch FF anymore at that point till it's completed.
    This is meant moreso for atleast Lv. 10+, I did try and put the ones where you would be able to reach till then at the end of the loops to run, but.
    (Examples are the quartz loop up top, the Coal/Shale inside the Mountain... ect)

    *********************
    *  Required Plugins *
    *********************

    -> Visland  : https://puni.sh/api/repository/veyn
    -> Vnavmesh : https://puni.sh/api/repository/veyn
    -> Pandora : https://love.puni.sh/ment.json
    -> Something Need Doing [Expanded Edition] : https://puni.sh/api/repository/croizat

    ******************
    *  Author Notes  *
    ******************

    Reformatting is done, still need to math out the formula's, and make it to where navmesh will fly to certain points on the island (Please... test this Ice obviously)

]]

--[[ 

    **************
    *  Settings  *
    **************
    ]]

    WorkshopKeepAmount = 0
    --[[ 
        Used to say how much items you want to keep for workshop 
        Making this a general "this is the amount I want to keep on all" for the second. 
        So for example, if I had a workshop that had 60 stone for instance, and everything else was lower than 60, I would put 60 here 
        Mainly used to make sure that you won't error out on selling items
    ]]

    ItemCountEcho = true
    LoopEcho = true
    -- If you want feedback on how what loop your currently on, or how many items are being sent to the shop, enable them as "true" below

    SkipRoute1 = true
    SkipRoute2 = true
    SkipRoute3 = false
    SkipRoute4 = false
    SkipRoute5 = false
    SkipRoute6 = false
    SkipRoute7 = false
    SkipRoute8 = false
    -- If you want to skip a specific route (check above one section) change that route to true
    -- This is moreso for testing more than anything, but it works if you don't want to gather a certain item/route


    --[[ Order of loops
        1 -> Clam/Islefish
        2 -> Islewort
        3 -> Sugarcane
        4 -> Tinsand
        5 -> Coconut
        6 -> Apple
        7 -> Marble/Limestone
        8 -> Clay/Sand [Ground XP Loop]
        9 -> Cotton
        10 -> Branch/Log/Resin
        11 -> Copper/Mythril 
        12 -> Opal/Log/Sap
        13 -> Hemp 
        14 -> Multi-colored Isleblooms 
        15 -> Iron Ore
        16 -> Laver/Squid | Jellyfish/Coral
        17 -> Rocksalt 
        18 -> Leucogranite 
        19 -> Quartz [Mountain XP Loop]
        20 -> Coal/Shale | Glimshroom 
        21 -> Effervescent Water 
        22 -> Crystal/Hawk Sand | Yelow Copper/Gold Ore [x2]
    ]]

-- Array's that are for each route

  -- Clam/Islefish | Laver/Squid
    ClamArray = {8, 4}

  -- Islewort | Popoto Seeds | Parsnip Seeds
    IslewortArray = {14, 1}

  -- Sugarcane | Vine 
    SugarcaneArray = {11}

  -- Tinsand/Sand | Marble/Limestone
    TinsandArray = {7, 4}

  -- Coconut/Palm Log/Leaf | Marble/Limestone
    CoconutArray = {7, 4}

  -- Apple/Vine/Beehive | Log/Sap/Opal | Sugarcane/Vine | Log/Resin
  AppleArray = {5, 3, 2}

  -- Marble/Limestone | Surecane/Vine | Coconut | Tinsand | Hemp
  MarbleArray = {7, 1}

  -- Clay | Tinsand | (Marble/Limestone | Branch/Log/Resin) | Sand
  ClayArray = {7, 2, 1, 10}

  -- Cotton | Hemp | Palm Leaf/
  CottonArray = {7, 3, 1, 11}

  -- Branch/Log/Resin


  -- Copper/Mythril 


  -- Opal/Log/Sap


  -- Hemp 


  -- Isleblooms | Quartz | Leucogranite | Iron
  IslebloomsArray = {4, 5, 1, 1}

  -- Iron Ore

  -- Jellyfish/Coral | Laver/Squid
  LaverJellyfishArray = {8, 6}

  -- Rocksalt 

  -- Leucogranite 

  -- XP Route || Quarts | Iron | Durium Sand | Leucogranite
  QuartzArray = {6, 3, 2}

  -- Coal/Shale | Glimshroom 

  -- Effervescent Water 

  -- Crystal/Hawk Sand | Yelow Copper/Gold Ore [x2]

-- Route Loop Amounts

    ItemMax = 999 

    --Islefish/Clam | Laver/Squid
    Route1Base = (ItemMax//ClamArray[1])
    LoopTestA = 0
    if WorkshopKeepAmount > 0 then 
        LoopTestA = math.ceil(WorkshopKeepAmount/ClamArray[1])
    end
    Route1Loop = Route1Base - LoopTestA

    -- Islewort | Popoto Seeds | Parsnip Seeds
    Route1Base = (ItemMax//IslewortArray[1])
    LoopTestA = 0
    if WorkshopKeepAmount > 0 then 
        LoopTestA = math.ceil(WorkshopKeepAmount/IslewortArray[1])
    end
    Route2Loop = Route1Base - LoopTestA

    -- Sugarcane | Vine
    Route1Base = (ItemMax//SugarcaneArray[1])
    LoopTestA = 0
    if WorkshopKeepAmount > 0 then 
        LoopTestA = math.ceil(WorkshopKeepAmount/SugarcaneArray[1])
    end
    Route3Loop = Route1Base - LoopTestA

    -- Tinsand/Sand | Marble/Limestone
    Route1Base = (ItemMax//TinsandArray[1])
    LoopTestA = 0
    if WorkshopKeepAmount > 0 then 
        LoopTestA = math.ceil(WorkshopKeepAmount/TinsandArray[1])
    end
    Route4Loop = Route1Base - LoopTestA

    -- Coconut/Palm Log/Leaf | Marble/Limestone
    Route1Base = (ItemMax//CoconutArray[1])
    LoopTestA = 0
    if WorkshopKeepAmount > 0 then 
        LoopTestA = math.ceil(WorkshopKeepAmount/CoconutArray[1])
    end
    Route5Loop = Route1Base - LoopTestA

    --  Apple/Vine/Beehive | Log/Sap/Opal | Sugarcane/Vine | Log/Resin
    Route1Base = (ItemMax//AppleArray[1])
    LoopTestA = 0
    if WorkshopKeepAmount > 0 then 
        LoopTestA = math.ceil(WorkshopKeepAmount/AppleArray[1])
    end
    Route6Loop = Route1Base - LoopTestA

    -- Marble/Limestone | Surecane/Vine | Coconut | Tinsand | Hemp
    Route1Base = (ItemMax//MarbleArray[1])
    LoopTestA = 0
    if WorkshopKeepAmount > 0 then 
        LoopTestA = math.ceil(WorkshopKeepAmount/MarbleArray[1])
    end
    Route7Loop = Route1Base - LoopTestA

    -- Clay | Tinsand | Marble/Limestone | Branch/Log/Resin | Sand
    Route1Base = (ItemMax//ClayArray[1])
    LoopTestA = 0
    if WorkshopKeepAmount > 0 then 
        LoopTestA = math.ceil(WorkshopKeepAmount/ClayArray[1])
    end
    Route8Loop = Route1Base - LoopTestA

    -- Cotton | Islewort | Log/Branch/Resin | Hemp
    Route1Base = (ItemMax//ClamArray[1])
    LoopTestA = 0
    if WorkshopKeepAmount > 0 then 
        LoopTestA = math.ceil(WorkshopKeepAmount/ClamArray[1])
    end
    Route9Loop = Route1Base - LoopTestA

-- Visland Routes
    Vislefish = "H4sIAAAAAAAACu2Y30/bMBDH/xXk5/Zm+/zr+jaxTaomNsYmsR/aQ7YaGilNGHGHJsT/vkvnlCFAQhHlhbxUOce1Lp+7fP2NL8W7YhXFTOxXxerFvK3iSdkuxUQcF3/OmrJOrZh9uxSHTVumsqnF7FJ8FjOLIAMqOxFfxGxqDLig1UR85cBLguDIXHHY1HH+SszkRBwVi3LNS2ng4KD5HVexTps7h0VanpT1QsxOiqqNEzGvUzwvfqbjMi3fd3/XUmkK9uadnHUbi4sYF3upqE+ryGm3y+ain8f5treW3TwE5/p61aQ+u3mKq3z5cjMjBx/WsU3/X3+MvzbBQfMjD39Mzdl+Uy8yHR55W1bVfrPOj3fUrFPMyeb0josyXefVRW+a85trdIOfylU84HnyanKLv5GgUKmQ+VvQBpXrC2DBStRPU4CqOD+Ne+0yVtXzoe/AWySX6TNSo0z4R98FC0TSPYi+HukPoo9GEmX6Crw0Wmf6PgBxbe6mr0bxeYz2VwQUyPUFwE5tHOYCOAOGjBrbf1fiozU49CrD92CUDT4rv/KATj1M+UftGQB/qkF7FchsjY/yZGwv/SwwpB7mfEb8Q/ArDUF5hVv87Exkv/MShwH96Ht2JT1TbQDRUW/7uaW9c9l2OiLwnp5I+Z+p759aCdY47AWoK4jWGPIrwE4ICPEe+4MDaiDvpP98eCsmajHIkM2+7r6tAmK/40oPvOve4/ZH4EMU3gPxT5YYx7htZzU3tLndnTbjBrvDfkcF1nZuPttLJLs92dESDJ8ujCc7O1UcpkwqaN97TITAEmOvT9dU8PeYnFFwhnQ8awyfGWwFh9C67VlmAM8fWKOj31m7ew/KWm+vDY0iE9zW0CBLjhsNzePJC+t7sIR9w7OhUUY7mTveEbKjHOVlGO/vV38BkInwdk8ZAAA="

    Vislewort = "H4sIAAAAAAAACu2ZXWvbMBSG/0rRtafqWzq5G90GYXTL1kL3wS68RV0NiZXFSsso/e87tuWuZQ2DUOcmIjeW7Qjp8etXr45vybty6cmETJuFvwnreDwLqxDD8axcN3W1Ojrzft6QglyUv1ehqmNDJl9vySw0VaxCTSa35BOZvOAWqHYMCvKZTLSlQgvgBfmClxTX1HCQd9gMtZ++IhNWkI/lvNpgX4Ji4zRc+6WvIzYLMivj1WVVz8nkslw0viDTOvp1+SNeVPHqfft3wbgApx9fSdMof5bX/mi1KLG3gjRX4Wa4CUfb/NNnNwUc6OtliMPQptEv0+HL7o7U+LDxTXx4fOZ/dY3T8D2dPothdRLqeWKDZ95Wi8VJ2LRza2cdNtGnkabhXZRV/DuutvUmrB/30Z48r5b+FO9jd8UT9J2gWnKpevyKWgvM2cRfcmqY0u7pByB3eADsSfQHxBskdVImtUuqBMBAWwmqDPD9qP2mWsyPVv2bejj4hXBUOZA9fkYZE1YPYlcUQGT6I9JHwdvOXZC+whfBCO4SfWEoV1n7o9I3lFnew7eodc0G+BqocdJm7Y9IXxmqGbgeP1ChuBlijmWYgEymPyJ9aakUTnT0u2Mtku9rjs7jTBb/qNaD8YXzPmTiOqsdMJPwY+Q3dq/i73YpB5R5jKKS2z7zYKJXTGuR4EMbOQVk+qP6PjALMGhfMTBi4G85BbstdOb91S64GXW4tPa0MW463q65HWzHsbnfjHloViMx5ADX6h4/KGhtv+cvKTqP3VLOyWrfRe19vWzAzZCxHKwdiwvc7Kl2dphqb7ezkLazklEJKsE33FKut9XNMvxnSvTGJKfBqo59QB9diFmlM/1R91PCtF7TSl9Q4Gj0iT5TWFazWfsj0ueOClxrdY8fxa+kHTZUCjDuK0w9eZl9tqK9AApOWbgvHwD+UobH/RM14HKGfz7cnGMtWPXrquYodWvE8JEErd6B1VvMPYfIHXBjXVg63tYEWt4Gl1KjBnFjkNGa6S3VsYz7P7i/3f0BTpNvGSYfAAA="

    VSugarcane = "H4sIAAAAAAAACu2Yy07dMBCG38Xr4Noejy/ZVbSVUEVLSwW9qIsUTInEiSnxaVUh3r2Tc2wuAqQDUlb1zuM41uTLn5k/vmTvukVgLdtf/uwujrohvDjoh8Aadtj9PY/9kEbWfrtke3HsUx8H1l6yz6xVwJVwRviGfWEtem6k0lo17Ctrt8Bo7sApuKI4DmHnFWtFwz52x/2SdgNOwW78HRZhSLRVw/a6dHrSD8esPenOxtCwnSGFi+4oHfbp9H2+/fZczpmyHE/jn3KF0hvvbbHKWTbs9SKmkslOCos8fLlakYMPyzCm2+P98GsV7MYfeXo/xfPtOBxnGDTztj87247L6VGmh4zLFO6md9j16SavKXoTL+7uMU1+6hdhl9aJq+Y+bs3BGSywnTQCCmvkUmjzMGp1F7XYBLUSUnmHDwIfi0j+H/LInRJGrtAbySc0NqOnN+G1r+hnQm+5RGmtWqMXXFrQmNFr5EIL2Ej1GxWYqvrb6OVUb4rknUThMnfwHMDpWm1mqjYcvVeIRfLeSmcKegpRqop+rmpDlsVmQ2PI3mg/fQIr9NJx1NpX9POgJ7donJBQ0EsEd42eKhGgrejnQb8lOKC21iizpq+4cQ6LkReOk+7lIxanGvmn8578pEGr1t0VLfdgpNOFt+YIj5n5ivvpuAG5NtZnD0l0tRXFQ0pDr0Jv1lCrh3yG1OlUIJtIkq645q4kByGqh5xR8yg02IIeqYmWgg6SPKXZ7L+pnhY8gz31U2kgHxeQYwe4Ru/pyExU/z6X7DWX4BWIte4RufVWKH0jfCGp+tfW+ize36/+AawqhecpFgAA"

    B2Tinsand = "H4sIAAAAAAAACuWTy2oDMQxFfyVoPTHyjF/xotAnZJG+CKQPujCNSwwdu8ROSwn592qmE0LpJ2SnK8mXqwPewrVrPVg4c9mPxiejeYjZxSVUsHDfHynEksE+b+E25VBCimC38AB2XEvOjFJNBY9ghWJiIit4AlvXDWsmiHJHMkU/vQDLUdLw3i3Dhsw4wwpm6dO3PhaSFUxj8Wv3WhahrG66B/i3N0SkTHmVvvYTCkNub+49+8N6n5AsL9tU/N6q+HYoT/uNQdxtfC5D3RkvXCgHx05dpfV5isvhcPxtzkPrZ7SHu+o/Fo6c6Vpo3XPh3DAhNArRs+HYMOKm6+NkIwSbGK2kGthIhlI0qHo2jWGSaqWOkg0ybVBr3t1LbJRipr+dwIy5IW6i1sfwo152P0BAnB6RBAAA"
    VTinsand = "H4sIAAAAAAAACu2XTYvbMBCG/0rQOTtoJI0+fFv6ATlsv1hIt6UHd6M2prVVYqVLCfnvlR1pU2hg97LQFPtkyWI8fvzqndGOvapbzypGMLtuur7uVmzOlvWvH6HpYs+qjzv2JvRNbELHqh17zyoEZ1AJg3N2wypy4IZLz9kHVl2gc6AEuX0ahs4vnrOKz9m7etVsUzAJaXAVfvrWd3F8suii39S3cdnE9eu8+s+5nF3KqV+Hu/IkJZOifam/9/64fMwwJfWiDbG8eBF9m28vxxV58Hbr+5jvh8DLuonHiMPoZdg8C90qfzg/TF43rb9K6/h+/hcWCZJQCBqpaA5cC0tHKNYZexqKeBiK4CjcEO0Emn77ufWbr341yz/vXwelQaEip+7lQ0qZAoqDlBOnkdMFgnRSkbhXFFlTFKU1kEQ1KWogZQENV+LoR0hFUCTAcSEmTgMnAmGVlLIISjpni28LAo4GHwVK/O8WZVOJ06moHUClfSi5sBkUKrDIJ0UdegEOaI3OFpXKOzeugOIKCJV8mq3XhhDXs7t1E/1sE26/nYGo0IHWkuyBlYJkUi7b1Fj2hNITq9JMIRhrSjMlk8g0uswKAaWmqfSNoAQHSn1BtvS046Sy6gDKJke3pCdRFVGlEqdEElIRlSWRURkDXKF7Ik2doVel3lMRcUGpPThxyDMK0vnPmked8k51C2dyyvu0/w0UDxibIA8AAA=="

    B2Coconut = "H4sIAAAAAAAACuWT20oDMRCGX6XMdRpyTpoLQatCL+oJYT3gRWgjDbiJdLOKlH13s9stRXyE3s0/mfz885Hs4MbVHixcuMZPpmeTeVql2GZAULmfzxRibsC+7uAuNSGHFMHu4AnslDGJDZ1xg+AZrCZYKKmJQvAClhGDmVaCdkWm6BeXYCmREsGDW4e2GFJMECzTl699zEUiWMTst26Vq5A3t/0F8rc3xiy5mk36PpyUQMXt3X00/jg+pCyWV3XK/mCVfT2W58PEKO5b3+Sx7o0rF/LRsVfXaTtPcT0uT/bNx1D7ZZkjHfqPxkjMDNVqIEOpwlRyuidDCcWMc32iZMqbIUoQwUc0BDPK9UBG4RnlSsmTBMPL9lybft3+MymsDBFs4DLVBmvBhTkBMG/dLz3YS42PBAAA"
    VCoconut = "H4sIAAAAAAAACu2XTW/UMBCG/8rK593BM/b4IzdUQKpEoSCkFhCHqE3ZiCaudr1UqOp/Z7JxVCGK6KWH7fZmJ441eTTzzjs36l3dNapSDmYH6Sz1m/ziuL7sZm/T97Jo6gs1Vyf1r6vU9nmtqq836jit29ymXlU36lRVNoDjGP1cfVaVRzDsPc/VF1UtPIEjq8OtbFPfHL5SlZ6rj/V5u5GrCGRzlH42XdPn7ZvDPjer+iyftHn5fjhNGikG/vNNCfpqCDCvmkYCXC/T9XREIpPLL+rLdXP33TZcnKvXXcpTHIe56cry5fZE2XzYNOtc1sPFJ3Wb724cdm/S6iD154WCHh9+arvmSM7p2/lfjJgBOVjcMnIRdLAcR0bGg40u0IMY0RNmtCALMcYQ3JhJFpxhMoWSA4xI6O7HZP6PSd8LaCe4eNDae5qwGGfcSIUCeGaOe19fC9IQoos8MmIwxKFAchaIffB7X2AGbPBOlGdSIUuMEyXJK88U9rC+WH5ciwRPVFgzlsyJYJAJn8sLSdq6xjj1eOel2kZIMUJgtM/9a4FDI0cTxkRywMaGkkmopcsT2b3XINSAIkJjL3MiK9rHMDGyIIlkHoXRukspL2fXyzY3s1U6+7EDwoQRnFigkk9WHKQfXPa26DQYQ/Yfar2HrIilvoIrBtuIJJEtjU3ck8VoH2UG2UlUYhpRxNxOrIzU4OCctrQYHLoQH2QD9FOyAeIgHYZoRiqSThrd5I0MyOzxnEDTwE+A4q+1nxodoZ/cgJXxhNjFPbSRFoK2pkwgGkisY1FrFj1ylomfelV9u/0Njz5u/VMSAAA="

    B2Apple = "H4sIAAAAAAAACuWSy2rDMBBFfyXMWhGSJduyFoX0BVmkLwrugy5EoxJBLJlIaSnG/96x6xBKPyG7uaOry9VBHdyYxoKGcxPtbH42W7Tt1gKB2ny3wfkUQb92cBeiSy540B08gZ5njFEheEHgGXQpaMVkXhF4Ac0Vp0pKVvUog7fLS9yxPCfwYNZuj3GcMgKr8Gkb6xNKAkuf7M68p9qlze1wgf3dTRWxVdyEr8MJ1sG0D7ON9mgfO2LkVROSPUQl20zjYnRM4n5vY5rmIbg2Lh0TB3UddhfBr6ens9/lo2vsCn2sJ//BSEELmQk1guGc0yJXhRrJKEVLWVZZfpJkspJRWfJSjmQKZIGcGH4gJCMVzSrBT4DLW/8DcT3W/3EDAAA="
    VApple = "H4sIAAAAAAAACu2XW28aMRCF/wryM5p4xnfe0rSV8pDeVJVe1IdVccJKsEZgUkWI/97ZXZOkEkipqjyQ5M2zWIP345zxYSPeVfMoRiIADr7UTTx5FeO0vo6Ds2m9ODldLGZRDMW4ulmkuskrMfqxER/Sqs51asRoI76KEfkAymocim9iZA1oozXqofjOFYJSIaDdcpmaeP5ajORQfKom9Zp7KeDiIl3HeWwyNxqK8ybHZfUrj+s8fV92339WTstHWk3T790nfBbudlnNVvFue3dAPtSbecq7Lz7PcV6Wp92OUnxcx1Uu67bxuKrzXce2epuWZ6mZlPeW/cPP9Txe8D65He6h4kFacjsq5LT3HRQTwCkT1H4m9DcTuYcJSaTgzV4y9WpWNZNB1f5wg7yM8RhQqQBEvX6MA6mddR0pb8GjN/oeKZTGHIRF/whrntbMKl0OJvUyHwEodA68tkH3qDxYNEi90zx4T44OonrKXkOnQWkdeq8pYMm046j1mgODlu4r6Hl7DdlrwRdSBEE72QvIaCDU1jyIFD0HUmhBSltQ8dpKMh0qxXectwFfUBVUHiGQsiUBeHCssF5V6AFZFi+qulUVRyJPaDpUTvJlF8h2qIjHudPyQFT635uumqarqrk5GvNxYgqqZALLmaDoSXOo4iD1ONbL62qWmqtjYcSvAo50kZKF4GSrqzYMcJzSHDgfLTcdmZqICHQXv1tSxHRM//+EL0OrJD4sij95SlrzOGrvuNZzPKaMxJKiDBhj6HGm+LG5zhN4awslC6h4HvWzyQAao9xB1+GTieA/t38AleOmDDkQAAA="

    B2Marble = "H4sIAAAAAAAACuWSy0vEMBDG/5VlzmlI0mb6OAg+YQ/1hVAfeIhuZAPbRtqsIqX/u9PaZREvXkVymW8y+fjmR3o4N7WFAo5MZxfRwaI07dPGAoPKfLx614QOioceLn3ngvMNFD3cQhEpiTxGFMjgDoos5TrDOGNwD4XMkYsk0TiQ9I1dnlBPaM3g2qzclvwkFwxK/2Zr2wSSDJZNsK15DpUL64vxgfjem0NSrG7t33c3lIfcXsyms/vxKSRZntY+2J1VsPVcHk4Ts7ja2i7M9WhcGRf2jqM68+2xb1bz7uKreeNqW9KcGNhPMknOtY7pTGSkzLhSaaonNBo56jyX6l+iUTFXqFDQNyEyGI+rEpSIfg/KVMvfQlF/F8rj8AkFGcXCcQMAAA=="
    VMarble = "H4sIAAAAAAAACu2W24rbMBCGXyXo2qvV6CzflR4g0PQM6YFeaBM1MY3tYCu7lLDv3nEs7xa60OQikNDcGI0sj6WPf0b/lrzxZSA5MXQ08c3NKly/LsrQxroK1x+7J8nI1P9a10UVW5J/25J3dVvEoq5IviWfSc6BghEgM/KF5FpQJQzwjHwl+ZUDysFydY8hZhq/IDnLyAc/LzaYSlAMJvVtKEMVd2/GVQyNn8VpEZdv0+o/59JWcUftsr4b3uBWMNsPv2rD4/Ld/iAjL8s6Dj8ex1Cm4bPdihS83+B507hLPPVFfMzYRa/q5nldzdOxWT/5CTlNcB27z/6CAo5qLZTtoUgKyjiToDAqBJf6aSj831A4A+6sehJNW9Z1XI7ulkUMo6ae/TwDVgKosYarQUBgNbgHAYHQSh6H1eamDM0izEetr+ZnAIozqpiyYhCVEtLKHpRVlFmlL6J6YKWo5CikQVRW8YTKGMokuCNp6gzrj1ukAyDMwEpw57poRwuFpbT5H3s4lpsG61K5oZ4YaJ2oCOqAXxQ03HaaMrAiWQBNNceunUhpapRw7sJqUBVecM52QupVJZjjomfVlZ5j4oJqkJWhaCxFMgaWMid1auLSUYdG80isNgvfzPzO+p56k1JYXky6JCfXGQRIanJUgOKwFyJ+IKK1X5Wj2IRzQHQlqGZKud6MG0YNWJu6E9p0qY3ZixEcyMgv/G0YrVcePz59SsDQeBvNBxPAmOmIdZSAodcEuV+xHaqk03dM3+9/A2xWg98lDwAA"

    B2Clay = "H4sIAAAAAAAACuWTS0sDMRSF/0q56zTkOZNkIWhV6KK+EMYHLoKNNNCZSCdVSul/93Y6pRQ3bqW7e25uDud+JGu48XUABxe+DYPh2WA09ysgUPnVZ4pNbsG9ruEutTHH1IBbwxO4odCKCmGlIPAMThlaGmsVgRdwghvKtbV2gzI1YXwJjjOtCTz4aVyiH6eMwCR9hTo0GSWBcZPDwr/nKubZ7fYCO+71ETFWO0vf+xPMg24fft6Gw3gXEi2v6pTD3iqHui/Pu4le3C9Dm/t6a1z5mA+OW3WdFqPUTPvd2a75GOswwTm2Ib/JWE25kGXHhXOkJIXtuHCmqNZGniYXa6g2lu+42BLfS8GKjospqOSGm5PEwo2kWlm246ILWupCKVQIptRUSsHEX8HgX/yvYN42P2li6bGHBAAA"
    VClay = "H4sIAAAAAAAACu2Xy27bMBBFf0XgWphyhq+hdkXaAlmkbyBpiy7UmImFRmJh0Q2CIP9e2pKSFnAAd5GFHe9IiqCoo3svh7fibd0GUQmUUHyqu9mLo6v6RpTitL75FZsu9aL6divex75JTexEdSvORIVswTtmV4ovojIWrGb0qhRfReUYpETNd7kXu3D8SlSyFB/rWbPMaynInZP4O7ShS6KiUhx3KSzq83TapPm7cfbfY+P+8pb6ebyenuS95NUu6qs+PExfbxBL8bqNaXrxcQrt2Hy5njF2PixDn8b2auHTukkPK656b+LiKHaz8bvlMPi5acNJnifvyg1UHGgt1QTFeDQ0MPFgnfWPMKF/mcgNTEgieTYbyfTLH21YXIZZ0ef/twOciCSoNZoVJwdKrZhlTKzBaCdxK0z0v5jaGNO8uJ43KRSLeP5zJ0gROM9+IMWAzmk9oHIgrZT6SRTVxmU3K+JFMWsWaScweWCyeB9HiqWSg/WYwBhFaqs4kvsUR6QQmCVPNnNyTGhm0Kzddjbbe+0oA57kKB0HXis3UPKgiO3BYQMlD0Q4QZLa2ZGSBUY2B0prSlrmsLFTWkvnHK8peQSLJB8JoefmOK0BPar7XCIzWi5j8sp5OmBaY8pltSc9nWkOJY5qkkDoD5gGNVmVTzkznnIaLOF08ptcWeKWAU57X3RrzglOK6cN6UQGtRn0lK8qzF6a53dlo6wYVnaIbEvA2rqhSEJUkJPqaSI7Leur2F0WaRHCDlBCn301OsxnrXhSA6ScRMo5dI94bH+U8/3uD/rmybgpEQAA"

    B2Cotton = ""
    VCotton = "H4sIAAAAAAAACu2XTW/bMAyG/0qgs0GIkqgP34ZuA3roPophXTfsYLTaaiC2g0TpMAT576MtO8Wwdeulh3zcTFsilCcv+VIb8aZqoijFWZdS184uu3WKs49KFOKq+rno6jatRPllI951qzrVXSvKjfgkSkMWHBL6QlyLkgIQSWkL8VmUSgcIwWjccti18fylKFESFeKyuq3XnA5BFuKiu49NbBNvKMR5m+KyuklXdbp722+Qv78bD8mnWt11P6YvfBzO9q2ar+LD8uGMWIhXTZfilCrFZnx8MawYg/fruErjc5/4qqrTQ8Y+et0tz7r2dvzpMr/8UDfxgtfJbfEnGKvBSml2XIzOVIwC/uYehaL+D0VJVMHTX9Hc5P9vMa949x5gcgpYKJgxeRaMJ7MDFYwJTwUlDx2UBDmwyXpy2uxAObAOHy+zYwNFEJwPEyiJVu04cac6CWri1LdnZafK88r0XbwHRRKUdCdBjaC8AefQZVAOSAUzOpxh8zOoT5U3gnLghs6TQUkKOLYoQrDenjgNnEgpQInZ87gpeaf0BMoSoPdGHeXMRBZ5flTZ4xTBWGWWa+5fg8BhI2GtuAmJBWnd1HycAauceq5Bsvpe3ce9cX3SHlS+emTtSDSKRuPvnU6TtMepINn7vNYDGORSst5j5hI0R+HJA9FhK8h4VoG12b24Q/OFTWb9aCQwWj8XpkU1b2ZpGeMeQNLWg+SxJ1u8Bc/ApqGRI3auk5gGMaFmTrvZ2iDRdFvTCForfwS96Ov2FwmvOWdWEgAA"

-- Array's that are for each route

  -- Clam/Islefish | Laver/Squid
  ClamArray = {8, 4}

  -- Islewort | Popoto Seeds | Parsnip Seeds
  IslewortArray = {14, 1}

  -- Sugarcane | Vine 
  SugarcaneArray = {11}

  -- Tinsand/Sand | Marble/Limestone
  TinsandArray = {7, 4}

  -- Coconut/Palm Log/Leaf | Marble/Limestone
  CoconutArray = {7, 4}

  -- Apple/Vine/Beehive | Log/Sap/Opal | Sugarcane/Vine | Log/Resin
  AppleArray = {5, 3, 2}

  -- Marble/Limestone | Surecane/Vine | Coconut | Tinsand | Hemp
  MarbleArray = {7, 1}

  -- Clay | Tinsand | (Marble/Limestone | Branch/Log/Resin) | Sand
  ClayArray = {7, 2, 1, 10}

  -- Still Figuring out order here --

  -- XP Route || Quarts | Iron | Durium Sand | Leucogranite
  QuartzArray = {6, 3, 2}

  -- Jellyfish/Coral | Laver/Squid
  LaverJellyfishArray = {8, 6}

  -- Isleblooms | Quartz | Leucogranite | Iron
  IslebloomsArray = {4, 5, 1, 1}

  -- Cotton | Hemp | Palm Leaf/
  CottonArray = {7, 3, 1, 11}
  
-- Island Sancutary Items 
    IslefishID = 37575
	ClamID = 37555
    LaverID = 37556
    SquidID = 37576
	SugarcaneID = 37567
	TinsandID = 37571
    MarbleID = 39890
    LimestoneID = 37565
    CoconutID = 39225
    PalmLeafID = 37551
    PalmLogID = 37561
    AppleID = 37552
    BeehiveID = 39226
    SapID = 37563
    WoodOpalID = 39227
    BranchID = 37553
    ResinID = 39224
	ClayID = 37570
	QuartzID = 37573
    IronID = 37572
    DuriumID = 41630
	LeucograniteID = 37574
    CottonID = 37568
    StoneID = 37554
	IslewortID = 37558
	HempID = 37569
	VineID = 37562
	LogID = 37560
	SandID = 37559

-- Node Functions (checks to see how many items that you currently have)
    function IslandGatherItems()
        IslefishCount = GetItemCount(IslefishID)
        ClamCount = GetItemCount(ClamID)
        LaverCount = GetItemCount(LaverID)
        SquidCount = GetItemCount(SquidID)
		SugarcaneCount = GetItemCount(SugarcaneID)
		TinsandCount = GetItemCount(TinsandID)
		MarbleCount = GetItemCount(MarbleID)
        LimestoneCount = GetItemCount(LimestoneID)
        CoconutCount = GetItemCount(CoconutID)
        PalmLeafCount = GetItemCount(PalmLeafID)
        PalmLogCount = GetItemCount(PalmLogID)
        AppleCount = GetItemCount(AppleID)
        BeehiveCount = GetItemCount(BeehiveID)
        SapCount = GetItemCount(SapID)
        WoodOpalCount = GetItemCount(WoodOpalID)
        BranchCount = GetItemCount(BranchID)
        ResinCount = GetItemCount(ResinID)
        ClayCount = GetItemCount(ClayID)
        QuartzCount = GetItemCount(QuartzID)
        IronCount = GetItemCount(IronID)
        DuriumCount = GetItemCount(DuriumID)
        LeucograniteCount = GetItemCount(LeucograniteID)
        CottonCount = GetItemCount(CottonID)
        StoneCount = GetItemCount(StoneID)
        IslewortCount = GetItemCount(IslewortID)
        HempCount = GetItemCount(HempID)
        VineCount = GetItemCount(VineID)
        LogCount = GetItemCount(LogID)
        SandCount = GetItemCount(SandID)
    end

-- Shop spending functions, to quickly reference for multiple routes
    function PalmLeafShop()
        PalmLeafAmount = ItemMax-(ItemAmount*LoopAmount)
        PalmLeafSend = (PalmLeafCount-PalmLeafAmount)
    end

    function BranchShop()
        BranchAmount = ItemMax-(ItemAmount*LoopAmount)
        BranchSend = (BranchCount-BranchAmount)
    end

    function IslewortShop()
        IslewortAmount = ItemMax-(ItemAmount*LoopAmount)
        if IslewortAmount < 0 then
            IslewortAmount = 0
        end
        IslewortSend = (IslewortCount-IslewortAmount)
    end

    function StoneShop()
        StoneAmount = ItemMax-(ItemAmount*LoopAmount)
        if StoneAmount < 0 then
            StoneAmount = 0 
        end
        StoneSend = (StoneCount-StoneAmount)
    end

    function ClamShop()
        ClamAmount = ItemMax-(ItemAmount*LoopAmount)
        ClamSend = (ClamCount-ClamAmount)
    end

    function LaverShop()
        LaverAmount = ItemMax-(ItemAmount*LoopAmount)
        LaverSend = (LaverCount-ClamAmount)
    end

    function CoralShop()
        CoralAmount = ItemMax-(ItemAmount*LoopAmount)
        CoralSend = (CoralCount-CoralAmount)
    end

    function IslewortShop()
        IslewortAmount = ItemMax-(ItemAmount*LoopAmount)
        IslewortSend = (IslewortCount-IslewortAmount)
    end

    function SandShop()
        SandAmount = ItemMax-(ItemAmount*LoopAmount)
        SandSend = (SandCount-SandAmount)
    end

    function VineShop()
        VineAmount = ItemMax-(ItemAmount*LoopAmount)
        VineSend = (VineCount-VineAmount)
    end

    function SapShop()
        SapAmount = ItemMax-(ItemAmount*LoopAmount)
        SapSend = (SapCount-SapAmount)
    end

    function AppleShop()
        AppleAmount = ItemMax-(ItemAmount*LoopAmount)
        AppleSend = (AppleCount-AppleAmount)
    end

    function LogShop()
        LogAmount = ItemMax-(ItemAmount*LoopAmount)
        LogSend = (LogCount-LogAmount)
    end

    function PalmLogShop()
        PalmLogAmount = ItemMax-(ItemAmount*LoopAmount)
        PalmLogSend = (PalmLogCount-PalmLogAmount)
    end

    function CopperShop()
        CopperAmount = ItemMax-(ItemAmount*LoopAmount)
        CopperSend = (CopperCount-CopperAmount)
    end

    function LimestoneShop()
        LimestoneAmount = ItemMax-(ItemAmount*LoopAmount)
        LimestoneSend = (LimestoneCount-LimestoneAmount)
    end

    function RockSaltShop()
        RockSaltAmount = ItemMax-(ItemAmount*LoopAmount)
        RockSaltSend = (RockSaltCount-RockSaltAmount)
    end

    function ClayShop()
        ClayAmount = ItemMax-(ItemAmount*LoopAmount)
        ClaySend = (ClayCount-ClayAmount)
    end

    function TinsandShop()
        TinsandAmount = ItemMax-(ItemAmount*LoopAmount)
        TinsandSend = (TinsandCount-TinsandAmount)
    end

    function SugarcaneShop()
        SugarcaneAmount = ItemMax-(ItemAmount*LoopAmount)
        SugarcaneSend = (SugarcaneCount-SugarcaneAmount)
    end

    function CottonShop()
        CottonAmount = ItemMax-(ItemAmount*LoopAmount)
        CottonSend = (CottonCount-CottonAmount)
    end

    function HempShop()
        HempAmount = ItemMax-(ItemAmount*LoopAmount)
        HempSend = (HempCount-HempAmount)
    end

    function IslefishShop()
        IslefishAmount = ItemMax-(ItemAmount*LoopAmount)
        IslefishSend = (IslefishCount-IslefishAmount)
    end

    function SquidShop()
        SquidAmount = ItemMax-(ItemAmount*LoopAmount)
        SquidSend = (SquidCount-SquidAmount)
    end

    function JellyfishShop()
        JellyfishAmount = ItemMax-(ItemAmount*LoopAmount)
        JellyfishSend = (JellyfishCount-JellyfishAmount)
    end

    function IronShop()
        IronAmount = ItemMax-(ItemAmount*LoopAmount)
        IronSend = (IronCount-IronAmount)
    end

    function QuartzShop()
        QuartzAmount = ItemMax-(ItemAmount*LoopAmount)
        QuartzSend = (QuartzCount-QuartzAmount)
    end

    function LeucograniteShop()
        LeucograniteAmount = ItemMax-(ItemAmount*LoopAmount)
        LeucograniteSend = (LeucograniteCount-LeucograniteAmount)
    end

    function IslebloomsShop()
        IslebloomsAmount = ItemMax-(ItemAmount*LoopAmount)
        IslebloomsSend = (IslebloomsCount-IslebloomsAmount)
    end

    function ResinShop()
        ResinAmount = ItemMax-(ItemAmount*LoopAmount)
        ResinSend = (ResinCount-ResinAmount)
    end

    function CoconutShop()
        CoconutAmount = ItemMax-(ItemAmount*LoopAmount)
        CoconutSend = (CoconutCount-CoconutAmount)
    end

    function BeehiveShop()
        BeehiveAmount = ItemMax-(ItemAmount*LoopAmount)
        BeehiveSend = (BeehiveCount-BeehiveAmount)
    end

    function WoodOpalShop()
        WoodOpalAmount = ItemMax-(ItemAmount*LoopAmount)
        WoodOpalSend = (WoodOpalCount-WoodOpalAmount)
    end

    function CoalShop()
        CoalAmount = ItemMax-(ItemAmount*LoopAmount)
        CoalSend = (CoalCount-CoalAmount)
    end

    function GlimshroomShop()
        GlimshroomAmount = ItemMax-(ItemAmount*LoopAmount)
        GlimshroomSend = (GlimshroomCount-GlimshroomAmount)
    end
  
    function WaterShop()
        WaterAmount = ItemMax-(ItemAmount*LoopAmount)
        WaterSend = (WaterCount-WaterAmount)
    end
  
    function ShaleShop()
        ShaleAmount = ItemMax-(ItemAmount*LoopAmount)
        ShaleSend = (ShaleCount-ShaleAmount)
    end

    function MarbleShop()
        MarbleAmount = ItemMax-(ItemAmount*LoopAmount)
        MarbleSend = (MarbleCount-MarbleAmount)
    end

    function MythrilShop()
        MythrilAmount = ItemMax-(ItemAmount*LoopAmount)
        MythrilSend = (MythrilCount-MythrilAmount)
    end

    function SpectrineShop()
        SpectrineAmount = ItemMax-(ItemAmount*LoopAmount)
        SpectrineSend = (SpectrineCount-SpectrineAmount)
    end

    function DuriumShop()
        DuriumAmount = ItemMax-(ItemAmount*LoopAmount)
        DuriumSend = (DuriumCount-DuriumAmount)
    end

    function YellowCopperShop()
        YellowCopperAmount = ItemMax-(ItemAmount*LoopAmount)
        YellowCopperSend = (YellowCopperCount-YellowCopperAmount)
    end

    function GoldShop()
        GoldAmount = ItemMax-(ItemAmount*LoopAmount)
        GoldSend = (GoldCount-GoldAmount)
    end

    function HawkeyeShop()
        HawkeyeAmount = ItemMax-(ItemAmount*LoopAmount)
        HawkeyeSend = (HawkeyeCount-HawkeyeAmount)
    end

    function CrystalShop()
        CrystalAmount = ItemMax-(ItemAmount*LoopAmount)
        CrystalSend = (CrystalCount-CrystalAmount)
    end

-- Setup for moving to the shop, and getting ready to sell the items
    function Sellingitemsto()
        yield("/visland moveto -268 40 226")
        yield("/wait 1")
        MovingTest()

        yield("/visland moveto -268 41 209.838")
        yield("/wait 1")
        MovingTest()
 
        yield("/target Enterprising Exporter <wait.0.5>")
        yield("/pint <wait.0.5>")
        yield("/pcall SelectString True 0 <wait.1.0>")
    end

    function LeavingShop()
        yield("/pcall MJIDisposeShop False -2")
        yield("/visland moveto -268 40 226")
        yield("/wait 1")
        MovingTest()
        MountUp()
    end

-- Shop Selling, tells the shop which one to interact w/  
    function PalmLeafSell()
        yield("/pcall MJIDisposeShop True 12 0 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..PalmLeafSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function BranchSell()
        yield("/pcall MJIDisposeShop True 12 1 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..BranchSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function StoneSell()
        yield("/pcall MJIDisposeShop True 12 2 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..StoneSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function ClamSell()
        yield("/pcall MJIDisposeShop True 12 3 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..ClamSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function LaverSell()
        yield("/pcall MJIDisposeShop True 12 4 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..LaverSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function CoralSell()
        yield("/pcall MJIDisposeShop True 12 5 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..CoralSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function IslewortSell()
        yield("/pcall MJIDisposeShop True 12 6 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..IslewortSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function SandSell()
        yield("/pcall MJIDisposeShop True 12 7 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..SandSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function VineSell()
        yield("/pcall MJIDisposeShop True 12 8 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..VineSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function SapSell()
        yield("/pcall MJIDisposeShop True 12 9 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..SapSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function AppleSell()
        yield("/pcall MJIDisposeShop True 12 10 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..AppleSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function LogSell()
        yield("/pcall MJIDisposeShop True 12 11 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..LogSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function PalmLogSell() 
        yield("/pcall MJIDisposeShop True 12 12 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..PalmLogSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function CopperSell()
        yield("/pcall MJIDisposeShop True 12 13 wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..CopperSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function LimestoneSell()
        yield("/pcall MJIDisposeShop True 12 14 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..LimestoneSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function RockSaltSell()
        yield("/pcall MJIDisposeShop True 12 15 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..RockSaltSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function ClaySell()
        yield("/pcall MJIDisposeShop True 12 16 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..ClaySend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function TinsandSell()
        yield("/pcall MJIDisposeShop True 12 17 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..TinsandSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function SugarcaneSell()
        yield("/pcall MJIDisposeShop True 12 18 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..SugarcaneSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function CottonSell()
        yield("/pcall MJIDisposeShop True 12 19 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..CottonSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function HempSell()
        yield("/pcall MJIDisposeShop True 12 20 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..HempSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function IslefishSell()
        yield("/pcall MJIDisposeShop True 12 21 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..IslefishSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function SquidSell()
        yield("/pcall MJIDisposeShop True 12 22 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..SquidSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function JellyfishSell()
        yield("/pcall MJIDisposeShop True 12 23 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..JellyfishSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function IronSell()
        yield("/pcall MJIDisposeShop True 12 24 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..IronSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function QuartzSell()
        yield("/pcall MJIDisposeShop True 12 25 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..QuartzSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function LeucograniteSell()
        yield("/pcall MJIDisposeShop True 12 26 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..LeucograniteSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function IslebloomsSell()
        yield("/pcall MJIDisposeShop True 12 27 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..IslebloomsSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function ResinSell()
        yield("/pcall MJIDisposeShop True 12 28 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..ResinSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function CoconutSell()
        yield("/pcall MJIDisposeShop True 12 29 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..CoconutSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function BeehiveSell()
        yield("/pcall MJIDisposeShop True 12 30 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..BeehiveSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function WoodOpalSell()
        yield("/pcall MJIDisposeShop True 12 31 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..WoodOpalSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function CoalSell()
        yield("/pcall MJIDisposeShop True 12 32 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..CoalSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function GlimshroomSell()
        yield("/pcall MJIDisposeShop True 12 33 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..GlimshroomSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end
  
    function WaterSell()
        yield("/pcall MJIDisposeShop True 12 34 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..WaterSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end
  
    function ShaleSell()
        yield("/pcall MJIDisposeShop True 12 35 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..ShaleSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function MarbleSell()
        yield("/pcall MJIDisposeShop True 12 36 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..MarbleSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function MythrilSell()
        yield("/pcall MJIDisposeShop True 12 37 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..MythrilSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function SpectrineSell()
        yield("/pcall MJIDisposeShop True 12 38 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..SpectrineSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function DuriumSell()
        yield("/pcall MJIDisposeShop True 12 39 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..DuriumSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function YellowCopperSell()
        yield("/pcall MJIDisposeShop True 12 40 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..YellowCopperSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function GoldSell()
        yield("/pcall MJIDisposeShop True 12 41 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..GoldSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function HawkeyeSell()
        yield("/pcall MJIDisposeShop True 12 42 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..HawkeyeSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

    function CrystalSell()
        yield("/pcall MJIDisposeShop True 12 43 <wait.0.5>")
        yield("/pcall MJIDisposeShopShipping True 11 "..CrystalSend)
        yield("/pcall SelectYesno True 0")
        yield("/wait 1.5")
    end

-- Base Script Functions
    function IslandReturn() -- Checks to see how far you are from in front of the main workshop, if a certain distance, will teleport you in front of It
        yield("/pcall _ActionContents True 9 1 <wait.0.5>")
        while GetCharacterCondition(27) do
            yield("/wait 1")
        end
            yield("/wait 1")
        while GetCharacterCondition(45) do
            yield("/wait 1")
        end
        while IsPlayerAvailable() == false do 
            yield("/wait 1")
        end
        yield("/wait 2")
    end
	
	function Truncate1Dp(num)
		return truncate and ("%.1f"):format(num) or num
	end	

	function MeshCheck()
		local was_ready = NavIsReady()
		if not NavIsReady() then
			while not NavIsReady() do
				LogInfo("[Debug]Building navmesh, currently at " .. Truncate1Dp(NavBuildProgress() * 100) .. "%")
				yield("/wait 1")
				local was_ready = NavIsReady()
				if was_ready then
					LogInfo("[Debug]Navmesh ready!")
				end
			end
		else
			LogInfo("[Debug]Navmesh ready!")
		end
	end

    function MovingTest() -- Moving Test
        MeshCheck()
        while PathfindInProgress() do 
            yield("/wait 0.11")
        end
        while IsMoving() or PathIsRunning() do 
            yield("/wait 1")
        end
    end

    function VislandCheck() -- Visland Route Check 
        while IsVislandRouteRunning() do
            yield("/wait 3")
        end
    end

    function MountUp()
        while GetCharacterCondition(4, false) do
            yield("/wait 0.1")
            if GetCharacterCondition(27) then
                yield("/wait 2")
            else
                yield('/gaction "mount roulette"')
            end
        end
    end

    function FlyPathing(x, y, z)
        MountUp()
        PathfindAndMoveTo(-219.95 , 79.69 , 193.44, true) -- better positioning away from the house
        MovingTest()

        PathfindAndMoveTo(x , y , z, true) -- Heading to Islefish spot
        MovingTest()
    end

::Route1:: --Islefish/Clam | Laver/Squid

    if SkipRoute1 == true then
      goto Route2
    end

    yield("/visland stop")

    CurrentLoop = 1
    LoopAmount = Route1Loop
    ItemAmount = ClamArray[1]
    IslandGatherItems()
	
    IslefishShop()
    ClamShop()
  
    ItemAmount = ClamArray[2]
    LaverShop()
    SquidShop()

    if ItemCountEcho == true then
        yield("/echo --- Spacer --- ")
        yield("/echo Islefish Send "..IslefishSend)
        yield("/echo Clam Send "..ClamSend)
        yield("/echo Laver Send "..LaverSend)
        yield("/echo Squid Send "..SquidSend)
    end

    IslandReturn()
  
    if (IslefishSend + ClamSend + LaverSend + SquidSend > 0) then
        Sellingitemsto()
        if (IslefishSend > 0) then
            IslefishSell()
        end
        if (ClamSend > 0) then
            ClamSell()
        end
        if (LaverSend > 0) then
            LaverSell()
        end
        if (SquidSend > 0) then
            SquidSell()
        end
        LeavingShop()
    end
    MountUp()
    FlyPathing(33.99 , -36.49 , -695.93)

    while (CurrentLoop <= LoopAmount) do
        yield("/visland exectemponce "..Vislefish.." <wait.1.0>")
        VislandCheck()
        CurrentLoop = CurrentLoop + 1
        if LoopEcho == true then
            yield("/echo Current Loop: "..CurrentLoop)
        end
    end

::Route2:: -- Islewort | Popoto Seeds | Parsnip Seeds
    yield("/visland stop")

    if SkipRoute2 == true then
        goto Route3
    end

    CurrentLoop = 1
    LoopAmount = Route2Loop
    ItemAmount = IslewortArray[1]
    IslandGatherItems()
    IslewortShop()
    
    ItemAmount = IslewortArray[2]
    HempShop()

    if ItemCountEcho == true then
        yield("/echo --- Spacer --- ")
        yield("/echo Hemp Send "..HempSend)
        yield("/echo Islewort Send "..IslewortSend)
    end

    IslandReturn()

    if (IslewortCount + HempCount > 0) then
        Sellingitemsto()
        if (IslewortSend > 0) then
            --yield("/echo Islewort")
            IslewortSell()
        end
        if (HempSend > 0) then
            --yield("/echo Hemp")
            HempSell()
        end
        LeavingShop()
    end

    FlyPathing(-177.37 , 59.10 , -403.71)

    while (CurrentLoop <= LoopAmount) do
        yield("/visland exectemponce "..Vislewort.." <wait.1.0>")
        VislandCheck()
        CurrentLoop = CurrentLoop + 1
        if LoopEcho == true then 
            yield("/echo Current Loop: "..CurrentLoop)
        end
    end

::Route3:: --Sugarcane | Vine
    yield("/visland stop")

    if SkipRoute3 == true then 
        goto Route4
    end

    CurrentLoop = 1
    LoopAmount = Route3Loop
    ItemAmount = SugarcaneArray[1]
    IslandGatherItems()
	
    SugarcaneShop()
    VineShop()

    if ItemCountEcho == true then
        yield("/echo --- Spacer --- ")
        yield("/echo Sugarcane send = "..SugarcaneSend)
        yield("/echo Vine send = "..VineSend)
    end

    IslandReturn()

    if (SugarcaneCount + VineCount > 0) then
        Sellingitemsto()
        if (SugarcaneSend > 0) then
            SugarcaneSell()
        end
        if (VineSend > 0) then
            VineSell()
        end
        LeavingShop()
    end

    FlyPathing(17.22 , 60.10 , -357.24)
  
    while (CurrentLoop <= LoopAmount) do
        yield("/visland exectemponce "..VSugarcane.." <wait.1.0>")
        VislandCheck()
        CurrentLoop = CurrentLoop + 1
        if LoopEcho == true then
            yield("/echo Current Loop: "..CurrentLoop)
        end
    end
 
::Route4:: --Tinsand/Sand | Marble/Limestone
    yield("/visland stop")

    if SkipRoute4 == true then 
        goto Route5
    end

    CurrentLoop = 1
    LoopAmount = Route4Loop
    ItemAmount = TinsandArray[1]
	IslandGatherItems()
    TinsandShop()
    SandShop()

    ItemAmount = TinsandArray[2]
    MarbleShop()
    LimestoneShop()


    if ItemCountEcho == true then
        yield("/echo --- Spacer --- ")
        yield("/echo Tinsand = "..TinsandSend)
        yield("/echo Sand = "..SandSend)
        yield("/echo Marble = "..MarbleSend)
        yield("/echo Limestone = "..LimestoneSend)
    end

    IslandReturn()

    if (TinsandCount + SandCount + MarbleCount + LimestoneCount > 0) then
        Sellingitemsto()
        if TinsandSend > 0 then
            TinsandSell()
        end
        if SandSend > 0 then
            SandSell()
        end
        if MarbleSend > 0 then
            MarbleSell()
        end
        if LimestoneSend > 0 then
            LimestoneSell()
        end
        LeavingShop()
    end

    yield("/visland exectemponce "..B2Tinsand.." <wait.1.0>")
    VislandCheck()
  
    while (CurrentLoop <= LoopAmount) do
        yield("/visland exectemponce "..VTinsand.." <wait.1.0>")
        VislandCheck()
        CurrentLoop = CurrentLoop + 1
        if LoopEcho == true then
            yield("/echo Current Loop: "..CurrentLoop)
        end
    end

::Route5:: -- Coconut/Palm Log/Leaf | Marble/Limestone
  
    if SkipRoute5 == true then
        goto Route6
    end

    CurrentLoop = 1
    LoopAmount = Route5Loop
    ItemAmount = CoconutArray[1]
    IslandGatherItems()
    CoconutShop()
    PalmLeafShop()
    PalmLogShop()

    ItemAmount = CoconutArray[2]
    MarbleShop()
    LimestoneShop()

    if ItemCountEcho == true then
        yield("/echo --- Spacer --- ")
        yield("/echo Coconut = "..CoconutSend)
        yield("/echo Palm Leaf = "..PalmLeafSend)
        yield("/echo Palm Log = "..PalmLogSend)
        yield("/echo Marble = "..MarbleSend)
        yield("/echo Limestone = "..LimestoneSend)
    end

    IslandReturn()

    if (CoconutCount + PalmLeafCount + PalmLogCount + MarbleCount + LimestoneCount > 0) then
        Sellingitemsto()
        if CoconutSend > 0 then
            CoconutSell()
        end
        if PalmLeafSend > 0 then
            PalmLeafSell()
        end
        if PalmLogSend > 0 then
            PalmLogSell()
        end
        if MarbleSend > 0 then
            MarbleSell()
        end
        if LimestoneSend > 0 then
            LimestoneSell()
        end
        LeavingShop()
    end

    yield("/visland exectemponce "..B2Coconut.." <wait.1.0>")
    VislandCheck()
  
    while (CurrentLoop <= LoopAmount) do
        yield("/visland exectemponce "..VCoconut.." <wait.1.0>")
        VislandCheck()
        CurrentLoop = CurrentLoop + 1
        if LoopEcho == true then
            yield("/echo Current Loop: "..CurrentLoop)
        end
    end

::Route6:: -- Apple/Vine/Beehive | Log/Sap/Opal | Sugarcane/Vine | Log/Resin
    if SkipRoute6 == true then
        goto Route7
    end

    CurrentLoop = 1
    LoopAmount = Route6Loop
    ItemAmount = AppleArray[1]
    IslandGatherItems()
  
    AppleShop()
    BeehiveShop()
    LogShop()
    VineShop()

    ItemAmount = AppleArray[2]
    SapShop()
    WoodOpalShop()

    ItemAmount = AppleArray[3]
    BranchShop()
    ResinShop()

    if ItemCountEcho == true then
        yield("/echo --- Spacer --- ")
        yield("/echo Apple = "..AppleSend)
        yield("/echo Beehive = "..BeehiveSend)
        yield("/echo Log = "..LogSend)
        yield("/echo Vine = "..VineSend)
        yield("/echo Sap = "..SapSend)
        yield("/echo Wood Opal = "..WoodOpalSend)
        yield("/echo Branch = "..BranchSend)
        yield("/echo Resin = "..ResinSend)
    end

    IslandReturn()

    if (AppleCount + BeehiveCount + LogCount + VineCount + SapCount + WoodOpalCount + BranchCount + ResinCount > 0) then 
        Sellingitemsto()
        if AppleSend > 0 then
            AppleSell()
        end
        if BeehiveSend > 0 then
            BeehiveSell()
        end
        if LogSend > 0 then
            LogSell()
        end
        if VineSend > 0 then
            VineSell()
        end
        if SapSend > 0 then
            SapSell()
        end
        if WoodOpalSend > 0 then
            WoodOpalSell()
        end
        if BranchSend > 0 then 
            BranchSell()
        end
        if ResinSend > 0 then
            ResinSell()
        end
        LeavingShop()
    end

    yield("/visland exectemponce "..B2Apple.." <wait.1.0>")
    VislandCheck()
  
    while (CurrentLoop <= LoopAmount) do
        yield("/visland exectemponce "..VApple.." <wait.1.0>")
        VislandCheck()
        CurrentLoop = CurrentLoop + 1
        if LoopEcho == true then
            yield("/echo Current Loop: "..CurrentLoop)
        end
    end

::Route7:: -- Marble/Limestone | Surecane/Vine | Coconut | Tinsand | Hemp
	if SkipRoute7 == true then
		goto Route8
    end

	CurrentLoop = 1
	LoopAmount = Route7Loop
	ItemAmount = MarbleArray[1]
	IslandGatherItems()
  
	MarbleShop()
	LimestoneShop()
	StoneShop()

	ItemAmount = MarbleArray[2]
	SugarcaneNode()
	VineNode()
	Coconut_PalmLeaf_PalmLogNode()
	TinsandNode()
	SandNode()
	HempNode()
	IslewortNode()

	SugarcaneShop()
	VineShop()
	CoconutShop()
	PalmLeafShop()
	PalmLogShop()
	TinsandShop()
	SandShop()
	HempShop()
	IslewortShop()

	if ItemCountEcho == true then
		yield("/echo --- Spacer --- ")
		yield("/echo Marble = "..MarbleSend)
		yield("/echo Limestone = "..LimestoneSend)
		yield("/echo Sugarcane send = "..SugarcaneSend)
		yield("/echo Vine send = "..VineSend)
		yield("/echo Coconut = "..CoconutSend)
		yield("/echo Palm Leaf = "..PalmLeafSend)
		yield("/echo Palm Log = "..PalmLogSend)
		yield("/echo Tinsand = "..TinsandSend)
		yield("/echo Sand = "..SandSend)
		yield("/echo Hemp Send "..HempSend)
		yield("/echo Islewort Send "..IslewortSend)
	end

	IslandReturn()

	if (MarbleSend + LimestoneSend + SugarcaneSend + VineSend + CoconutSend + PalmLeafSend + PalmLogSend + TinsandSend + SandSend + HempSend + IslewortSend > 0) then
		Sellingitemsto()
		if MarbleSend > 0 then
			MarbleSell()
		end
		if LimestoneSend > 0 then
			LimestoneSell()
		end
		if SugarcaneSend > 0 then
			SugarcaneSell()
		end
		if VineSend > 0 then
			VineSell()
		end
		if CoconutSend > 0 then 
			CoconutSend()
		end
		if PalmLeafSend > 0 then
			PalmLeafSell()
		end
		if PalmLogSend > 0 then
			PalmLogSell()
		end
		if TinsandSend > 0 then
			TinsandSell()
		end
		if SandSend > 0 then
			SandSell()
		end
		if HempSend > 0 then
			HempSell()
		end
		if IslewortSend > 0 then
			IslewortSell()
		end

		LeavingShop()
	end

	PathfindAndMoveTo(50.29 , -38.47 , -703.64, true)
	VislandCheck()
  
	while (CurrentLoop <= LoopAmount) do
		yield("/visland exectemponce "..VMarble.." <wait.1.0>")
		VislandCheck()
		CurrentLoop = CurrentLoop + 1
		if LoopEcho == true then
			yield("/echo Current Loop: "..CurrentLoop)
		end
	end

::Route8:: -- Clay | Tinsand | Marble/Limestone | Branch/Log/Resin | Sand | Stone
    if SkipRoute8 == true then
        goto Route9
    end

    CurrentLoop = 1
    LoopAmount = Route8Loop
    ItemAmount = ClayArray[1]
    IslandGatherItems()
    ClayShop()

    ItemAmount = ClayArray[2]
    TinsandShop()

    ItemAmount = ClayArray[3]
    LogNode()

    MarbleShop()
    LimestoneShop()
    BranchShop()
    ResinShop()
    LogShop()
  
    ItemAmount = ClayArray[4]
    StoneShop()

    if ItemCountEcho == true then
        yield("/echo --- Spacer --- ")
    end

    IslandReturn()
    Sellingitemsto()
    
    if Claysend > 0 then
        ClaySell()
    end
    if TinsandSend > 0 then
        TinsandSell()
    end
    if MarbleSend > 0 then
        MarbleSell()
    end
    if LimestoneSend > 0 then
        LimestoneSell()
    end
    if BranchSend > 0 then
        BranchSell()
    end
    if LogSend > 0 then
        LogSell()
    end
    if ResinSend > 0 then 
        ResinSell()
    end
    if SandSend > 0 then
        SandSell()
    end
    if StoneSend > 0 then 
        StoneSell()
    end

    LeavingShop()

    yield("/visland exectemponce "..B2Clay.." <wait.1.0>")
    VislandCheck()
  
    while (CurrentLoop <= LoopAmount) do
        yield("/visland exectemponce "..VClay.." <wait.1.0>")
        VislandCheck()
        CurrentLoop = CurrentLoop + 1
        if LoopEcho == true then
            yield("/echo Current Loop: "..CurrentLoop)
        end
    end

::Route9:: -- Cotton/Islewort | Islewort/Popoto | Branch/Log/Resin | Hemp/Islewort
    CurrentLoop = 1
    LoopAmount = Route9Loop
    ItemAmount = CottonArray[1]

    CottonNode()
    CottonShop()

    ItemAmount = CottonArray[2]
    HempNode()
    HempShop()

    ItemAmount = CottonArray[3]
    Coconut_PalmLeaf_PalmLogNode()
    CoconutShop()
    PalmLeafShop()
    PalmLogShop()
 
    ItemAmount = CottonArray[4]
    IslewortNode()
    IslewortShop()
 
    IslandReturn()

    Sellingitemsto()
    if CottonSend > 0 then
        CottonSell()
    end
    if HempSend > 0 then
        HempSell()
    end
    if CoconutSend > 0 then
        CoconutSell()
    end 
    if PalmLeafSend > 0 then
        PalmLeafSell()
    end
    if PalmLogSend > 0 then
        PalmLogSell()
    end 
    if IslewortSend > 0 then
        IslewortSell()
    end

    LeavingShop()

::DemoComplete::
  yield("/echo the demo version is completed! Yayyy!")