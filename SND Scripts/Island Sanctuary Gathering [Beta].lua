--[[
Man... what a thing this has turned into. IF THIS WORKS IT WOULD BE GREAT
Version: 0.6.5 [7 routes are done, slowly but surely this will be done.]

Uses 
-> V(ery) Island [aka visland]
-> Flying is currently required, but once it's all routed out, i'll make a non-flying routes included as well for anyone who's below lv. 10
]]

-- Need this to tell what the caps on items is 
-- 999 is the default max
-- 800 is if you would like a little bit of a gap so graneries don't overcap
  ItemMax = 999 

-- If you want feedback on how what loop your currently on, or how many items are being sent to the shop, enable them as "true" below

  ItemCountEcho = true
  LoopEcho = true

--[[ Order of loops
  1 -> Clam/Islefish
  2 -> Islewort
  3 -> Sugarcane
  4 -> Tinsand
  5 -> Coconut
  6 -> Apple
  7 -> Marble/Limestone
  8 -> ... Figuring out the rest tomorrow
]]

-- If you want to skip a specific route (check above one section) change that route to true
-- This is moreso for testing more than anything, but it works if you don't want to gather a certain item/route
  SkipRoute1 = false
  SkipRoute2 = false
  SkipRoute3 = false
  SkipRoute4 = false
  SkipRoute5 = false
  SkipRoute6 = false
  SkipRoute7 = false
  SkipRoute8 = false

-- Route Loop Amounts
  --[[
    I'll have the max amount each can run on the side, but on the chance you're currently using materials for workshop,
    IF YOU'RE DOING A CUSTOM AMOUNT, ADJUST THE TOP ONE, AND LEAVE THE CAP AT 999
    ]]

  if ItemMax == 999 then

    --Islefish/Clam | Laver/Squid
    Route1Loop = 124 -- Max 124

    -- Islewort | Popoto Seeds | Parsnip Seeds
    Route2Loop = 71 --base is 71

    --Sugarcane | Vine
    Route3Loop = 90 -- base is 90

    -- Tinsand/Sand | Marble/Limestone
    Route4Loop = 142 -- base is 142

    -- Coconut/Palm Log/Leaf | Marble/Limestone
    Route5Loop = 142 -- base is 142

    --  Apple/Vine/Beehive | Log/Sap/Opal | Sugarcane/Vine | Log/Resin
    Route6Loop = 199 -- base is 199

    -- Marble/Limestone | Surecane/Vine | Coconut | Tinsand | Hemp
    Route7Loop = 142 -- base is 142

  elseif ItemMax == 800 then 

    --Islefish/Clam | Laver/Squid
    Route1Loop = 100 -- Max 100

    -- Islewort | Popoto Seeds | Parsnip Seeds
    Route2Loop = 57 --base is 57

    --Sugarcane | Vine
    Route3Loop = 72 -- base is 72

    -- Tinsand/Sand | Marble/Limestone
    Route4Loop = 114 -- base is 114

    -- Coconut/Palm Log/Leaf | Marble/Limestone
    Route5Loop = 114 -- base is 114

    --  Apple/Vine/Beehive | Log/Sap/Opal | Sugarcane/Vine | Log/Resin
     Route6Loop = 160 -- base is 160

    -- Marble/Limestone | Surecane/Vine | Coconut | Tinsand | Hemp
    Route7Loop = 114 -- base is 114

  elseif (ItemMax < 799) or (ItemMax > 800 and ItemMax < 999) then
    yield("/echo *-tilts head-* somehow... you managed to input a number outside the 2 I specificied, go back to the top and try again... Please?")
    yield("/snd stop")
  end

 --Visland Routes
  B2Islefish = "H4sIAAAAAAAACuWVTWvcMBCG/0rQ2TvVjL5GvrVpC3tI24TAtg05mEZhDWurxEpCWPa/Z9Z2CCGXXotvmg+/jB40r/fqW9MlVatPzZBOSj5ZD7t02w7bD6e7plOV2jRPf3Pbl0HVV3v1Iw9taXOv6r36qeoVaQfBB2sq9UvVAYGtI+sq9VvVyFFqms1Bwtyn9WfJaSfFi+amvRdBBF2ps/yQutQXCSu17ku6a/6UTVu2348f6Le5eViZa9jmx5eKDCRqt81uSK/t45Qi+aXLJb1IldTNx49jxxyc36ehzOej8KZpy6viMfqa705zfzNfXk/Jy7ZLZ9KnD9V7NKgJAtsjDEGDGsFQYJrQUACKwbllorERUAf0MxkNZEwwIxnvIVoJFgoGXESiOIKR9WHywY9cVug1yG7hUsGgMQ7DZDMEkdngBMZYD95YXiQYBI9O2zivEoFj8Rg7kXHsQFNc5i55IA4UabJfA85Gp+NkMisfGJiZFkkGjdzdc5hcZmXEjIOOOD8aHxms9v+8TvJD+1/RXB+eAbz3pC7+CAAA"
  Vislefish = "H4sIAAAAAAAACu2YTW/bMAyG/0qhc8KJor7o29BtQA7dFwZ0H9jBWNXGgGMPtbtiKPrfR6dSskOH5dJD0vhgWLagSA/4ki9zp97Wq6QqhXBy2tarF4uhTZfNsFQzdV7//tk33Tio6tudet8Pzdj0naru1GdVOQIvl6OZ+qKquXWAwQc7U19lFHQEz9bey7Dv0uKVqvRMfawvmhtZjEAGZ/2vtErduP6y6MZ0Xf8Yz5tx+S7P/vtd3qPsaVj2t+WLbEZWu6zbIW2nr3eIM/V61Y/lhxdjWuXHl+sZefDhJg1jfp4WPq+bcbviNHrTX5/23UU+uH54+alZpTOZp+9nj2HRkdBlKhZ8NFigMESh8jgU838oRqPh6B5FM6T6NqWLk7Hurtq0B6CsBiTEuAkfYwl9IeXAaTJPQqqtr6/SybBMbbsPmDwER+wzJjm7RRsfMPnogFn7nTCZQ8dEVjNnTAhBW2MyphCBBeJRdxMpZODIvpCiSWieMilvwbLFY0BVxoCngJlSAIsuhpydMAB53C07Hbbs5gZMwMh2U+4wsHUlPSFoxt3q3YFzQgMRAxazZEGOpksaZxlGCsdqJ/FkgchzsU8SJEFMZuHEEAI/TXbaO/80dxqc9VS0N5EzhmIOKql/wES0kwM3h+TA5yhHdxR1zKbJTGYyEpX0rQNICvfPrzeRLBSA5ZbV5YWLm5zAGosEkDf/atmeleeeS2MCzk2uKFd/Yrfp4owGKw3K0U3mkNISUtFMnX82lFHU5bYtL8YQnmMWIpGXtB0brTE5v/knIEIQR3nUmrAIgM4Fty1jyDb6TRkjUZvfrYzhYQWQ5KDomEoISRlDa7zOMeSZpODvpqw9BvP9/g8MSzViohQAAA=="

  B2Islewort = "H4sIAAAAAAAACuWTyWrDMBRFfyW8tSyeRg+LQkfIIp0ouANdiEYlgtgqkdJQTP69iu0QSj/Bu3efri5XB9TBrWksVHBhgp1lZ7N5WNud30QgUJufL+/aGKB66+DeBxedb6Hq4BmqjGlGZV6UmsALVCWnJeZYEniFiilJcynYPinf2vlVWqFSBB7N0m1THKNIYOG/bWPbmCSBeRvtxnzE2sXV3eEC/t2NLVOrsPK740mqk9I+zTrYk73vmCKvGx/tMSraZhzPe8coHrY2xHE+BNfGxVPiQd34zaVvl+PTcVg+ucYukg/35D8YhVSrgg1cGC+o4jznPRiJVCjUSk2TjBBUci5LMaBBQREF5qpnkyVKlKGUE4XDtKAFCjbA0ekH5YqPaCQqKhjXEyDzvv8Fz5TxE5MEAAA="
  Vislewort = "H4sIAAAAAAAACu2YSW/bMBCF/4rBszvlDNfxregC+JA2XYB0QQ9CrTYCbMmwlARFkP/ekUglDeAAvuTgBb6IFkUQH948vuGtel+sSjVTBJN5uyxvmk338rxZN13z8rzYtHW1nnwuy0Wrpuqi+Ltuqrpr1ezHrTpv2qqrmlrNbtVXNXuBgcFFzVP1Tc1cAHLEOFXf5ZVFBx7Z3Mmwqcv5GzXTU/WpWFRXshaBDM6a63JV1t3wZl535ab41V1U3eWHfjZpJI7u8Zu88eJPcV1O1stCPp6q9rK5GSfJ5mT538WyLR++HHYs+3q7arpxJ/OuXOXHV8OMPPh4VbZdfu4Xviiq7mHFfvSu2bxu6kUGodOfX6pVeSbz9N10C6ZI4AwamzhZCIF1DBmUQfDauridlHlMiraQ0lsZ7QUYNhCNyfoxYIl5xGIJrGd8Fv3cVMvFZJ2kvg+ciCLYyCZx0qA1BTfKxwIz7YSJDh2TSCgMhSWYrEjLE8aMiTyg3U1Nh4/Jgw6YKAVRj9MjJcfgowknTD0m68FpjokTA1n04+EWtJx7/uRNPSYTwFCkAdPw7Ch7k0MpuuhPckpVJzaDmDKAmLaLrH3mJNHJB/+M5jSEu73wJm/BYEgnnSQjq52jTIn7REB8wpS8iXVgHtVkNXsaQQUEDk9lgoMOlGQ1RPHphEXSQMTewAcqEWVonzNQ7k+VGTnaGJ2958SWe2tKoAxI0QVzlPpJTezIRQsMM9qP9Cfod2toD92l+6DNOWgbDYZtpuQxALqnmtkjoyRpyPtcZNLBhf8wSQHqYN0JU8JEvi+zXkwEjGJGGZO20uuGk5p6TBiBxLhd4iRysiaMCdKyxCYrZ90Rerb4BXC0ge87EJZfzkISGMFzPMYshIhy5WGTSTsU8QRP4+2a2FHk4NxOXPRhcZHrDxOxbyt6MF582dtRLnJ8OafdEy3r4XD5efcP3/cIkwYYAAA="

  B2Sugarcane = "H4sIAAAAAAAACuWTyWrDMBCGXyXMWREaLZalQ6Er5JCugXShB5GojaC2Sqy0lJB3r+w4hNJH8G02/fzzMdrCtas8WDhzjR+NT0YPm3e3XrjaA4G5+/mMoU4N2Jct3MYmpBBrsFt4BDvmsqCGKVUSeAKrkEpUSmsCz2A5asoU7nISaz+5AIt5ksC9W4ZNlkPKCEzjl698nXJKYFInv3aLNA9pddM+YH9rvc3sqlnF70Mn28lqb+6j8cfxzmOWvKxi8gep5Ks+PO0m+uRu45vUx63w3IV0VGyzq7g+j/WyX53ti7NQ+WmeYzvyH4yWVBWqEB0XREG5LAV2XEqTW4KXxTDJCEOZbk+kBcNKqkWJ/cEoWggphskFGVVGa7O/GJO/DkduOi5jLBWVRnM+TDI0c9E8b5vBaE5RGOR7MEJoWkgt5ADAvO5+ARK0E/moBQAA"
  VSugarcane = "H4sIAAAAAAAACu2YSW/bMBCF/0rBsz2d4XC46FZ0AXJIdyRd0IOQqI2AWipsuUVh5L93ZJFOgaaor7V900gETX1+nPeojXleLxpTGYYHb9Zf6uVV3TUPL9quMTNzWf/81rfdsDLVx4152a/aoe07U23MO1NZBovRY5qZ96aSBJ6sc3ZmPphqzt5B5Gj5Vuu+a86emApn5nV93a51NgYtzvvvzaLphu2Ts25olvXVcNkONy/y6N/v5VXqolY3/Y/yRFejs32uv66au+HbJdLMPF30Q/nhs6FZ5MtH2xG5eLVuVkO+Hie+rNvhbsaxetYvH/fddX5znG6+bRfNuY7D29mfXBxw9FKoRPLIBYoAofP3M7H/ZmKRbIpyL5lV+fP+B0QC0aKnLSNPML5UyIwUWXLpxCgACYVgJ0YIFNhJZuQE0CHvpSN7wDqicasVEUUSjBkQJ2CO7rTRQFKyIkVEKVD0hZGWQvboGYXRqEK2Ma+m5tIoqi0jiiDOpaNnJBAs+WCzkBi0TUcuLZsYKEray+rtIVm9ZhwfkbhQIeG4k472JpZw9NKZo4rFheCtnzBZ8DFKyYkYQTcY+eMTz3xMQV6CnRxMAiT2FF0B40D4b1nxkPOzxhvwMpKZ9OLAMpXkQxqLQjrCU4UGY3A+pJwHVRwu4I6KVyW5k5XPrZ5CcyBUMeAOkCVgxFMeHFUk6EbnnhiJ+lRpxUyaD/1+p4pDPp1q7wXdUpyPpxqTmXeMkn70wNNOmzsgTpZxUpJoQEwBbTEvlRKSdqhDd/VPt78AvjLBEUATAAA="

  B2Tinsand = "H4sIAAAAAAAACuWTy2oDMQxFfyVoPTHyjF/xotAnZJG+CKQPujCNSwwdu8ROSwn592qmE0LpJ2SnK8mXqwPewrVrPVg4c9mPxiejeYjZxSVUsHDfHynEksE+b+E25VBCimC38AB2XEvOjFJNBY9ghWJiIit4AlvXDWsmiHJHMkU/vQDLUdLw3i3Dhsw4wwpm6dO3PhaSFUxj8Wv3WhahrG66B/i3N0SkTHmVvvYTCkNub+49+8N6n5AsL9tU/N6q+HYoT/uNQdxtfC5D3RkvXCgHx05dpfV5isvhcPxtzkPrZ7SHu+o/Fo6c6Vpo3XPh3DAhNArRs+HYMOKm6+NkIwSbGK2kGthIhlI0qHo2jWGSaqWOkg0ybVBr3t1LbJRipr+dwIy5IW6i1sfwo152P0BAnB6RBAAA"
  VTinsand = "H4sIAAAAAAAACu2XTYvbMBCG/0rQOTtoJI0+fFv6ATlsv1hIt6UHd6M2prVVYqVLCfnvlR1pU2hg97LQFPtkyWI8fvzqndGOvapbzypGMLtuur7uVmzOlvWvH6HpYs+qjzv2JvRNbELHqh17zyoEZ1AJg3N2wypy4IZLz9kHVl2gc6AEuX0ahs4vnrOKz9m7etVsUzAJaXAVfvrWd3F8suii39S3cdnE9eu8+s+5nF3KqV+Hu/IkJZOifam/9/64fMwwJfWiDbG8eBF9m28vxxV58Hbr+5jvh8DLuonHiMPoZdg8C90qfzg/TF43rb9K6/h+/hcWCZJQCBqpaA5cC0tHKNYZexqKeBiK4CjcEO0Emn77ufWbr341yz/vXwelQaEip+7lQ0qZAoqDlBOnkdMFgnRSkbhXFFlTFKU1kEQ1KWogZQENV+LoR0hFUCTAcSEmTgMnAmGVlLIISjpni28LAo4GHwVK/O8WZVOJ06moHUClfSi5sBkUKrDIJ0UdegEOaI3OFpXKOzeugOIKCJV8mq3XhhDXs7t1E/1sE26/nYGo0IHWkuyBlYJkUi7b1Fj2hNITq9JMIRhrSjMlk8g0uswKAaWmqfSNoAQHSn1BtvS046Sy6gDKJke3pCdRFVGlEqdEElIRlSWRURkDXKF7Ik2doVel3lMRcUGpPThxyDMK0vnPmked8k51C2dyyvu0/w0UDxibIA8AAA=="

  B2Coconut = "H4sIAAAAAAAACuWT20oDMRCGX6XMdRpyTpoLQatCL+oJYT3gRWgjDbiJdLOKlH13s9stRXyE3s0/mfz885Hs4MbVHixcuMZPpmeTeVql2GZAULmfzxRibsC+7uAuNSGHFMHu4AnslDGJDZ1xg+AZrCZYKKmJQvAClhGDmVaCdkWm6BeXYCmREsGDW4e2GFJMECzTl699zEUiWMTst26Vq5A3t/0F8rc3xiy5mk36PpyUQMXt3X00/jg+pCyWV3XK/mCVfT2W58PEKO5b3+Sx7o0rF/LRsVfXaTtPcT0uT/bNx1D7ZZkjHfqPxkjMDNVqIEOpwlRyuidDCcWMc32iZMqbIUoQwUc0BDPK9UBG4RnlSsmTBMPL9lybft3+MymsDBFs4DLVBmvBhTkBMG/dLz3YS42PBAAA"
  VCoconut = "H4sIAAAAAAAACu2XTW/UMBCG/8rK593BM/b4IzdUQKpEoSCkFhCHqE3ZiCaudr1UqOp/Z7JxVCGK6KWH7fZmJ441eTTzzjs36l3dNapSDmYH6Sz1m/ziuL7sZm/T97Jo6gs1Vyf1r6vU9nmtqq836jit29ymXlU36lRVNoDjGP1cfVaVRzDsPc/VF1UtPIEjq8OtbFPfHL5SlZ6rj/V5u5GrCGRzlH42XdPn7ZvDPjer+iyftHn5fjhNGikG/vNNCfpqCDCvmkYCXC/T9XREIpPLL+rLdXP33TZcnKvXXcpTHIe56cry5fZE2XzYNOtc1sPFJ3Wb724cdm/S6iD154WCHh9+arvmSM7p2/lfjJgBOVjcMnIRdLAcR0bGg40u0IMY0RNmtCALMcYQ3JhJFpxhMoWSA4xI6O7HZP6PSd8LaCe4eNDae5qwGGfcSIUCeGaOe19fC9IQoos8MmIwxKFAchaIffB7X2AGbPBOlGdSIUuMEyXJK88U9rC+WH5ciwRPVFgzlsyJYJAJn8sLSdq6xjj1eOel2kZIMUJgtM/9a4FDI0cTxkRywMaGkkmopcsT2b3XINSAIkJjL3MiK9rHMDGyIIlkHoXRukspL2fXyzY3s1U6+7EDwoQRnFigkk9WHKQfXPa26DQYQ/Yfar2HrIilvoIrBtuIJJEtjU3ck8VoH2UG2UlUYhpRxNxOrIzU4OCctrQYHLoQH2QD9FOyAeIgHYZoRiqSThrd5I0MyOzxnEDTwE+A4q+1nxodoZ/cgJXxhNjFPbSRFoK2pkwgGkisY1FrFj1ylomfelV9u/0Njz5u/VMSAAA="

  B2Apple = "H4sIAAAAAAAACuWSy2rDMBBFfyXMWhGSJduyFoX0BVmkLwrugy5EoxJBLJlIaSnG/96x6xBKPyG7uaOry9VBHdyYxoKGcxPtbH42W7Tt1gKB2ny3wfkUQb92cBeiSy540B08gZ5njFEheEHgGXQpaMVkXhF4Ac0Vp0pKVvUog7fLS9yxPCfwYNZuj3GcMgKr8Gkb6xNKAkuf7M68p9qlze1wgf3dTRWxVdyEr8MJ1sG0D7ON9mgfO2LkVROSPUQl20zjYnRM4n5vY5rmIbg2Lh0TB3UddhfBr6ens9/lo2vsCn2sJ//BSEELmQk1guGc0yJXhRrJKEVLWVZZfpJkspJRWfJSjmQKZIGcGH4gJCMVzSrBT4DLW/8DcT3W/3EDAAA="
  VApple = "H4sIAAAAAAAACu2XW28aMRCF/wryM5p4xnfe0rSV8pDeVJVe1IdVccJKsEZgUkWI/97ZXZOkEkipqjyQ5M2zWIP345zxYSPeVfMoRiIADr7UTTx5FeO0vo6Ds2m9ODldLGZRDMW4ulmkuskrMfqxER/Sqs51asRoI76KEfkAymocim9iZA1oozXqofjOFYJSIaDdcpmaeP5ajORQfKom9Zp7KeDiIl3HeWwyNxqK8ybHZfUrj+s8fV92339WTstHWk3T790nfBbudlnNVvFue3dAPtSbecq7Lz7PcV6Wp92OUnxcx1Uu67bxuKrzXce2epuWZ6mZlPeW/cPP9Txe8D65He6h4kFacjsq5LT3HRQTwCkT1H4m9DcTuYcJSaTgzV4y9WpWNZNB1f5wg7yM8RhQqQBEvX6MA6mddR0pb8GjN/oeKZTGHIRF/whrntbMKl0OJvUyHwEodA68tkH3qDxYNEi90zx4T44OonrKXkOnQWkdeq8pYMm046j1mgODlu4r6Hl7DdlrwRdSBEE72QvIaCDU1jyIFD0HUmhBSltQ8dpKMh0qxXectwFfUBVUHiGQsiUBeHCssF5V6AFZFi+qulUVRyJPaDpUTvJlF8h2qIjHudPyQFT635uumqarqrk5GvNxYgqqZALLmaDoSXOo4iD1ONbL62qWmqtjYcSvAo50kZKF4GSrqzYMcJzSHDgfLTcdmZqICHQXv1tSxHRM//+EL0OrJD4sij95SlrzOGrvuNZzPKaMxJKiDBhj6HGm+LG5zhN4awslC6h4HvWzyQAao9xB1+GTieA/t38AleOmDDkQAAA="

  B2Marble = "H4sIAAAAAAAACuWSy0vEMBDG/5VlzmlI0mb6OAg+YQ/1hVAfeIhuZAPbRtqsIqX/u9PaZREvXkVymW8y+fjmR3o4N7WFAo5MZxfRwaI07dPGAoPKfLx614QOioceLn3ngvMNFD3cQhEpiTxGFMjgDoos5TrDOGNwD4XMkYsk0TiQ9I1dnlBPaM3g2qzclvwkFwxK/2Zr2wSSDJZNsK15DpUL64vxgfjem0NSrG7t33c3lIfcXsyms/vxKSRZntY+2J1VsPVcHk4Ts7ja2i7M9WhcGRf2jqM68+2xb1bz7uKreeNqW9KcGNhPMknOtY7pTGSkzLhSaaonNBo56jyX6l+iUTFXqFDQNyEyGI+rEpSIfg/KVMvfQlF/F8rj8AkFGcXCcQMAAA=="
  VMarble = "H4sIAAAAAAAACu2W24rbMBCGXyXo2qvV6CzflR4g0PQM6YFeaBM1MY3tYCu7lLDv3nEs7xa60OQikNDcGI0sj6WPf0b/lrzxZSA5MXQ08c3NKly/LsrQxroK1x+7J8nI1P9a10UVW5J/25J3dVvEoq5IviWfSc6BghEgM/KF5FpQJQzwjHwl+ZUDysFydY8hZhq/IDnLyAc/LzaYSlAMJvVtKEMVd2/GVQyNn8VpEZdv0+o/59JWcUftsr4b3uBWMNsPv2rD4/Ld/iAjL8s6Dj8ex1Cm4bPdihS83+B507hLPPVFfMzYRa/q5nldzdOxWT/5CTlNcB27z/6CAo5qLZTtoUgKyjiToDAqBJf6aSj831A4A+6sehJNW9Z1XI7ulkUMo6ae/TwDVgKosYarQUBgNbgHAYHQSh6H1eamDM0izEetr+ZnAIozqpiyYhCVEtLKHpRVlFmlL6J6YKWo5CikQVRW8YTKGMokuCNp6gzrj1ukAyDMwEpw57poRwuFpbT5H3s4lpsG61K5oZ4YaJ2oCOqAXxQ03HaaMrAiWQBNNceunUhpapRw7sJqUBVecM52QupVJZjjomfVlZ5j4oJqkJWhaCxFMgaWMid1auLSUYdG80isNgvfzPzO+p56k1JYXky6JCfXGQRIanJUgOKwFyJ+IKK1X5Wj2IRzQHQlqGZKud6MG0YNWJu6E9p0qY3ZixEcyMgv/G0YrVcePz59SsDQeBvNBxPAmOmIdZSAodcEuV+xHaqk03dM3+9/A2xWg98lDwAA"

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

  -- Still Figuring out order here --

  -- XP Route || Quarts | Iron | Durium Sand | Leucogranite
  QuartzArray = {6, 3, 2}

  -- Jellyfish/Coral | Laver/Squid
  LaverJellyfishArray = {8, 6}

  -- Isleblooms | Quartz | Leucogranite | Iron
  IslebloomsArray = {4, 5, 1, 1}

-- Node Functions (checks to see how many items that you currently have)
  function Islefish_ClamNode()
    IslefishID = 37575
    ClamID = 37555
    IslefishCount = GetItemCount(IslefishID)
    ClamCount = GetItemCount(ClamID)
  end

  function Laver_SquidNode()
    LaverID = 37556
    SquidID = 37576
    LaverCount = GetItemCount(LaverID)
    SquidCount = GetItemCount(SquidID)
  end

  function SugarcaneNode()
    SugarcaneID = 37567
    SugarcaneCount = GetItemCount(SugarcaneID)
  end

  function Tinsand_SandNode()
    TinsandID = 37571
    SandID = 37559
    TinsandCount = GetItemCount(TinsandID)
    SandCount = GetItemCount(SandID)
  end

  function Marble_LimestoneNode()
    MarbleID = 39890
    LimestoneID = 37565
    MarbleCount = GetItemCount(MarbleID)
    LimestoneCount = GetItemCount(LimestoneID)
  end

  function Coconut_PalmLeaf_PalmLogNode()
    CoconutID = 39225
    PalmLeafID = 37551
    PalmLogID = 37561
    CoconutCount = GetItemCount(CoconutID)
    PalmLeafCount = GetItemCount(PalmLeafID)
    PalmLogCount = GetItemCount(PalmLogID)
  end

  function Apple_BeehiveNode()
    AppleID = 37552
    BeehiveID = 39226
    AppleCount = GetItemCount(AppleID)
    BeehiveCount = GetItemCount(BeehiveID)
  end

  function Sap_WoodOpalNode()
    SapID = 37563
    WoodOpalID = 39227
    SapCount = GetItemCount(SapID)
    WoodOpalCount = GetItemCount(WoodOpalID)
  end

  function Branch_ResinNode()
    BranchID = 37553
    ResinID = 39224
    BranchCount = GetItemCount(BranchID)
    ResinCount = GetItemCount(ResinID)
  end

  function QuartzNode()
    QuartzID = 37573
    QuartzCount = GetItemCount(QuartzID)
  end

  function Iron_DuriumNode()
    IronID = 37572
    DuriumID = 41630
    IronCount = GetItemCount(IronID)
    DuriumCount = GetItemCount(DuriumID)
  end

  function LeucograniteNode()
    LeucograniteID = 37574
    LeucograniteCount = GetItemCount(LeucograniteID)
  end

  -- These are Items that are shared across multiple nodes

  function StoneNode()
    StoneID = 37554
    StoneCount = GetItemCount(StoneID)
  end

  function IslewortNode()
    IslewortID = 37558
    IslewortCount = GetItemCount(IslewortID)
  end

  function HempNode()
    HempID = 37569
    HempCount = GetItemCount(HempID)
  end

  function VineNode()
    VineID = 37562
    VineCount = GetItemCount(VineID)
  end

  function LogNode()
    LogID = 37560
    LogCount = GetItemCount(LogID)
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
    IslewortSend = (IslewortCount-IslewortAmount)
  end

  function StoneShop()
    StoneAmount = ItemMax-(ItemAmount*LoopAmount)
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

-- Checks to see how far you are from in front of the main workshop, if a certain distance, will teleport you in front of It
  function IslandReturn()
    yield("/pcall _ActionContents True 9 1 <wait.0.5>")
    while GetCharacterCondition(27) do
      yield("/wait 1")
    end
    yield("/wait 1")
    while GetCharacterCondition(45) do
      yield("/wait 1")
    end
  end

-- Moving Test
  function MovingTest()
    while IsMoving() do 
      yield("/wait 1")
    end
  end

-- Visland Route Check 
  function VislandCheck()
    while IsVislandRouteRunning() do
      yield("/wait 3")
    end
  end

--Islefish/Clam | Laver/Squid
::Route1::

  if SkipRoute1 == true then
    goto Route2
  end

  yield("/visland stop")

  CurrentLoop = 1
  LoopAmount = Route1Loop
  ItemAmount = ClamArray[1]
  Islefish_ClamNode()
  IslefishShop()
  ClamShop()
  
  ItemAmount = ClamArray[2]
  Laver_SquidNode()
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
  
  if (IslefishSend > 0) or (ClamSend > 0) or (LaverSend > 0) or (SquidSend > 0) then
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
  yield("/visland exectemponce "..B2Islefish.." <wait.1.0>")
  VislandCheck()

  while (CurrentLoop <= LoopAmount) do
    yield("/visland exectemponce "..Vislefish.." <wait.1.0>")
      VislandCheck()
    CurrentLoop = CurrentLoop + 1
    if LoopEcho == true then
      yield("/echo Current Loop: "..CurrentLoop)
    end
  end

-- Islewort | Popoto Seeds | Parsnip Seeds
::Route2::
  yield("/visland stop")

  if SkipRoute2 == true then
    goto Route3
  end

  CurrentLoop = 1
  LoopAmount = Route2Loop
  ItemAmount = IslewortArray[1]
  IslewortNode()
  IslewortShop()

  ItemAmount = IslewortArray[2]
  HempNode()
  HempShop()

  if ItemCountEcho == true then
    yield("/echo --- Spacer --- ")
    yield("/echo Hemp Send "..HempSend)
    yield("/echo Islewort Send "..IslewortSend)
  end

  IslandReturn()
  

  if (IslewortCount > 0) or (HempCount > 0) then
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

  yield("/visland exectemponce "..B2Islewort.." <wait.1.0>")
  VislandCheck()

  while (CurrentLoop <= LoopAmount) do
    yield("/visland exectemponce "..Vislewort.." <wait.1.0>")
      VislandCheck()
    CurrentLoop = CurrentLoop + 1
    if LoopEcho == true then 
      yield("/echo Current Loop: "..CurrentLoop)
    end
  end

--Sugarcane | Vine
::Route3::
  yield("/visland stop")

  if SkipRoute3 == true then 
    goto Route4
  end

  CurrentLoop = 1
  LoopAmount = Route3Loop
  ItemAmount = SugarcaneArray[1]
  SugarcaneNode()
  VineNode()
  SugarcaneShop()
  VineShop()

  if ItemCountEcho == true then
    yield("/echo --- Spacer --- ")
    yield("/echo Sugarcane send = "..SugarcaneSend)
    yield("/echo Vine send = "..VineSend)
  end

  IslandReturn()

  if (SugarcaneCount > 0) or (VineCount > 0) then
    Sellingitemsto()
    if (SugarcaneSend > 0) then
      SugarcaneSell()
    end
    if (VineSend > 0) then
      VineSell()
    end
    LeavingShop()
  end

  yield("/visland exectemponce "..B2Sugarcane.." <wait.1.0>")
  VislandCheck()
  
  while (CurrentLoop <= LoopAmount) do
    yield("/visland exectemponce "..VSugarcane.." <wait.1.0>")
      VislandCheck()
    CurrentLoop = CurrentLoop + 1
    if LoopEcho == true then
      yield("/echo Current Loop: "..CurrentLoop)
    end
  end
 
--Tinsand/Sand | Marble/Limestone
::Route4::
  yield("/visland stop")

  if SkipRoute4 == true then 
    goto Route5
  end

  CurrentLoop = 1
  LoopAmount = Route4Loop
  ItemAmount = TinsandArray[1]
  Tinsand_SandNode()
  TinsandShop()
  SandShop()

  ItemAmount = TinsandArray[2]
  Marble_LimestoneNode()
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

  if (TinsandCount > 0) or (SandCount > 0) or (MarbleCount > 0) or (LimestoneCount > 0) then
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

-- Coconut/Palm Log/Leaf | Marble/Limestone
::Route5::
  
  if SkipRoute5 == true then
    goto Route6
  end

  CurrentLoop = 1
  LoopAmount = Route5Loop
  ItemAmount = CoconutArray[1]
  Coconut_PalmLeaf_PalmLogNode()
  CoconutShop()
  PalmLeafShop()
  PalmLogShop()

  ItemAmount = CoconutArray[2]
  Marble_LimestoneNode()
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

  if (CoconutCount > 0) or (PalmLeafCount > 0) or (PalmLogCount > 0) or (MarbleCount > 0) or (LimestoneCount > 0) then
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

-- Apple/Vine/Beehive | Log/Sap/Opal | Sugarcane/Vine | Log/Resin
::Route6::
  if SkipRoute6 == true then
    goto Route7
  end

  CurrentLoop = 1
  LoopAmount = Route6Loop
  ItemAmount = AppleArray[1]
  Apple_BeehiveNode()
  VineNode()
  LogNode()
  
  AppleShop()
  BeehiveShop()
  LogShop()
  VineShop()

  ItemAmount = AppleArray[2]
  Sap_WoodOpalNode()
  SapShop()
  WoodOpalShop()

  ItemAmount = AppleArray[3]
  Branch_ResinNode()
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

  if (AppleCount > 0) or (BeehiveCount > 0) or (LogCount > 0) or (VineCount > 0) or (SapCount > 0) or (WoodOpalCount > 0) or (BranchCount > 0) or (ResinCount > 0) then 
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

-- Marble/Limestone | Surecane/Vine | Coconut | Tinsand | Hemp
::Route7::
  if SkipRoute7 == true then
    goto Route8
  end

  CurrentLoop = 1
  LoopAmount = Route7Loop
  ItemAmount = MarbleArray[1]
  Marble_LimestoneNode()
  StoneNode()
  
  MarbleShop()
  LimestoneShop()
  StoneShop()

  ItemAmount = MarbleArray[2]
  SugarcaneNode()
  VineNode()
  Coconut_PalmLeaf_PalmLogNode()
  Tinsand_SandNode()
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

  if (MarbleSend > 0) or (LimestoneSend > 0) or (SugarcaneSend > 0) or (VineSend > 0) or (CoconutSend > 0) or (PalmLeafSend > 0) or (PalmLogSend > 0) or (TinsandSend > 0) or (SandSend > 0) or (HempSend > 0) or (IslewortSend > 0) then
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

  yield("/visland exectemponce "..B2Marble.." <wait.1.0>")
  VislandCheck()
  
  while (CurrentLoop <= LoopAmount) do
    yield("/visland exectemponce "..VMarble.." <wait.1.0>")
      VislandCheck()
    CurrentLoop = CurrentLoop + 1
    if LoopEcho == true then
      yield("/echo Current Loop: "..CurrentLoop)
    end
  end

::Route8::

::DemoComplete::
  yield("/echo the demo version is completed! Yayyy!")