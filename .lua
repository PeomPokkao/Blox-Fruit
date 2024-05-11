local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("UPPERCUT HUB", "LightTheme")
local id = game.PlaceId
local t1 = Window:NewTab("General")
local t2 = Window:NewTab("Teleport")

local Section1 = t1:NewSection("< Main >")
local Section2 = t1:NewSection("< Secondary-Main >")
local Section3 = t2:NewSection("< Teleport >")

Section1:NewButton("ReDeemCodeX2", "กดมาดูอะไรครับ", function()
end)

Section1:NewToggle("AuToFarm LeveL", "กดมาดูอะไรครับ", function(state)

end)

Section1:NewToggle("FasT aTTack", "กดมาดูอะไรครับ", function(state)

end)

Section1:NewToggle("ParT NeoN", "กดมาดูอะไรครับ", function(state)

end)

Section2:NewDropdown("Select Weapon", "กดมาดูอะไรครับ", {"Option 1", "Option 2", "Option 3"}, function(currentOption)
    print(currentOption)
end)

Section1:NewToggle("AuTo Equip", "กดมาดูอะไรครับ", function(state)

end)

if id == 2753915549 then

    Section3:NewDropdown("Teleport in First Sea", "กดมาดูอะไรครับ", {"Pirate Starter Island", "Marine Starter Island", "Middle Town", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village", "Underwater City", "Upper Skylands", "Fountain City"}, function(a)
        _G.Teleport1 = a
    end)

    Section3:NewButton("sTarT TeleporT", "กดมาดูอะไรครับ", function()

        pcall(function()
            if _G.Teleport == "Pirate Starter Island" then
                repeat wait()
                    TP(CFrame.new(1211.525390625, 16.529319763183594, 1418.1884765625))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(1211.525390625, 16.529319763183594, 1418.1884765625) or (_G.Teleport ~= "Pirate Starter Island")
            elseif _G.Teleport == "Marine Starter Island" then
                repeat wait()
                    TP(CFrame.new(-2566.4296875, 6.855668067932129, 2045.256103515625))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-2566.4296875, 6.855668067932129, 2045.256103515625) or (_G.Teleport ~= "Marine Starter Island")
            elseif _G.Teleport == "Middle Town" then
                repeat wait()
                    TP(CFrame.new(-655.8241577148438, 7.852039813995361, 1436.6790771484375))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-655.8241577148438, 7.852039813995361, 1436.6790771484375) or (_G.Teleport ~= "Middle Town")
            elseif _G.Teleport == "Jungle" then
                repeat wait()
                    TP(CFrame.new(-1255.14794921875, 11.852043151855469, 349.90667724609375))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-1255.14794921875, 11.852043151855469, 349.90667724609375) or (_G.Teleport ~= "Jungle")
            elseif _G.Teleport == "Pirate Village" then
                repeat wait()
                    TP(CFrame.new(-1181.309326171875, 4.751490592956543, 3803.545654296875))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-1181.309326171875, 4.751490592956543, 3803.545654296875) or (_G.Teleport ~= "Pirate Village")
            elseif _G.Teleport == "Desert" then
                repeat wait()
                    TP(CFrame.new(944.1578979492188, 20.919729232788086, 4373.30029296875))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(944.1578979492188, 20.919729232788086, 4373.30029296875) or (_G.Teleport ~= "Desert")
            elseif _G.Teleport == "Frozen Village" then
                repeat wait()
                    TP(CFrame.new(1201.614501953125, 45.32455062866211, -1252.9473876953125))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(1201.614501953125, 45.32455062866211, -1252.9473876953125) or (_G.Teleport ~= "Frozen Village")
            elseif _G.Teleport == "Marine Fortress" then
                repeat wait()
                    TP(CFrame.new(-4929.73779296875, 84.38469696044922, 4519.185546875))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-4929.73779296875, 84.38469696044922, 4519.185546875) or (_G.Teleport ~= "Marine Fortress")
            elseif _G.Teleport == "Skylands" then
                repeat wait()
                    TP(CFrame.new(-4913.7001953125, 737.68603515625, -2580.455810546875))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-4913.7001953125, 737.68603515625, -2580.455810546875) or (_G.Teleport ~= "Skylands")
            elseif _G.Teleport == "Prison" then
                repeat wait()
                    TP(CFrame.new(5244.16064453125, 88.66659545898438, 743.8839111328125))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(5244.16064453125, 88.66659545898438, 743.8839111328125) or (_G.Teleport ~= "Prison")
            elseif _G.Teleport == "Colosseum" then
                repeat wait()
                    TP(CFrame.new(-1832.2593994140625, 80.37112426757812, -3056.30322265625))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-1832.2593994140625, 80.37112426757812, -3056.30322265625) or (_G.Teleport ~= "Colosseum")
            elseif _G.Teleport == "Magma Village" then
                repeat wait()
                    TP(CFrame.new(-5514.2529296875, 62.79969787597656, 8579.3359375))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-5514.2529296875, 62.79969787597656, 8579.3359375) or (_G.Teleport ~= "Magma Village")
            elseif _G.Teleport == "Underwater City" then
                repeat wait()
                    TP(CFrame.new(61163.8515625, 5.307302474975586, 1819.7841796875))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(61163.8515625, 5.307302474975586, 1819.7841796875) or (_G.Teleport ~= "Underwater City")
            elseif _G.Teleport == "Upper Skylands" then
                repeat wait()
                    TP(CFrame.new(-7760.98046875, 5644.88037109375, -1882.901123046875))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(-7760.98046875, 5644.88037109375, -1882.901123046875) or (_G.Teleport ~= "Upper Skylands")
            elseif _G.Teleport == "Fountain City" then
                repeat wait()
                    TP(CFrame.new(5048.60595703125, 4.501288890838623, 4164.57080078125))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new(5048.60595703125, 4.501288890838623, 4164.57080078125) or (_G.Teleport ~= "Fountain City")
            elseif _G.Teleport == true then
                _G.PartNeon = true
            elseif _G.Teleport == false then
                _G.PartNeon = false              
            end
        end)

    end)

elseif id == 4442272183 then

    Section3:NewDropdown("Teleport in Second Sea", "กดมาดูอะไรครับ", {"Cafe", "Mansion", "Kingdom of Rose", "Green Zone", "Graveyard", "Dark Arena", "Snow Mountain", "Hot and Cold", "Cursed Ship", "Ice Castle", "Forgotten Island", "Usoap's Island"}, function(b)
        _G.Teleport2 = b
    end)

    Section3:NewButton("sTarT TeleporT", "กดมาดูอะไรครับ", function()

        pcall(function()
            if _G.Teleport == "Cafe" then
                repeat wait()
                    TP(CFrame.new(-412.3954162597656, 73.02007293701172, 373.0472106933594))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Cafe")
            elseif _G.Teleport == "Mansion" then
                repeat wait()
                    TP(CFrame.new(-512.7244262695312, 331.8605651855469, 588.41015625))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Mansion")
            elseif _G.Teleport == "Kingdom of Rose" then
                repeat wait()
                    TP(CFrame.new(-605.6656494140625, 72.95980834960938, 1255.2930908203125))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Kingdom of Rose")
            elseif _G.Teleport == "Green Zone" then
                repeat wait()
                    TP(CFrame.new(-2302.5791015625, 72.96611785888672, -2818.766357421875))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Green Zone")
            elseif _G.Teleport == "Graveyard" then
                repeat wait()
                    TP(CFrame.new(-5650.796875, 266.40728759765625, -756.7403564453125))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Graveyard")
            elseif _G.Teleport == "Dark Arena" then
                repeat wait()
                    TP(CFrame.new(3780.0302734375, 22.652164459228516, -3498.5859375))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Dark Arena")
            elseif _G.Teleport == "Snow Mountain" then
                repeat wait()
                    TP(CFrame.new(594.1454467773438, 401.42193603515625, -5651.62744140625))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Snow Mountain")
            elseif _G.Teleport == "Hot and Cold" then
                repeat wait()
                    TP(CFrame.new(-5997.775390625, 15.951759338378906, -4806.2265625))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Hot and Cold")
            elseif _G.Teleport == "Cursed Ship" then
                repeat wait()
                    TP(CFrame.new(-6501.919921875, 86.72026062011719, -124.3010025024414))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Cursed Ship")
            elseif _G.Teleport == "Ice Castle" then
                repeat wait()
                    TP(CFrame.new(5400.40380859375, 28.191171646118164, -6236.9921875))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Ice Castle")
            elseif _G.Teleport == "Forgotten Island" then
                repeat wait()
                    TP(CFrame.new(-3262.99365234375, 239.40667724609375, -10364.916015625))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Forgotten Island")
            elseif _G.Teleport == "Usoap's Island" then
                repeat wait()
                    TP(CFrame.new(4785.087890625, 7.939647197723389, 2919.921630859375))
                until game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == CFrame.new() or (_G.Teleport ~= "Usoap's Island")
            elseif _G.Teleport == true then
                _G.PartNeon = true
            elseif _G.Teleport == false then
                _G.PartNeon = false              
            end
        end)

    end)
    

elseif id == 7449423635 then

    Section3:NewDropdown("Teleport in Third Sea", "กดมาดูอะไรครับ", {"Port Town", "Hydra Island", "Great Tree", "Mansion", "Haunted Castle", "Castle on the Sea", "Sea of Treats", "Tiki Outpost"}, function(c)
        _G.Teleport3 = c
    end)    

    Section3:NewButton("sTarT TeleporT", "กดมาดูอะไรครับ", function()

        pcall(function()
            if _G.Teleport == "Port Town" then
                TP(CFrame.new(-290.7376708984375, 6.729952812194824, 5343.5537109375))
            elseif _G.Teleport == "Hydra Island" then
                TP(CFrame.new(5228.88427734375, 604.2340087890625, 345.0400390625))
            elseif _G.Teleport == "Great Tree" then
                TP(CFrame.new(2192.693115234375, 73.14873504638672, -6894.69189453125))
            elseif _G.Teleport == "Mansion" then
                TP(CFrame.new(-12549.7236328125, 345.4334716796875, -7470.36328125))
            elseif _G.Teleport == "Haunted Castle" then
                TP(CFrame.new(-9515.3720703125, 164.00624084472656, 5786.06103515625))
            elseif _G.Teleport == "Castle on the Sea" then
                TP(CFrame.new(-5074.45556640625, 314.5155334472656, -2991.054443359375))
            elseif _G.Teleport == "Sea of Treats" then
                TP(CFrame.new(215.49046325683594, 126.59195709228516, -12600.3134765625))
            elseif _G.Teleport == "Tiki Outpost" then
                TP(CFrame.new(-16207.6552734375, 9.0863618850708, 407.59539794921875))
            elseif _G.Teleport == true then
                _G.PartNeon = true
            elseif _G.Teleport == false then
                _G.PartNeon = false              
            end
        end)

    end)

end
