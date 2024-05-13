if not game:IsLoaded() then 
    repeat 
        game.Loaded:Wait() 
    until game:IsLoaded() 
end

function TP(P1)
    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local Speed
    if Distance < 300 then
        Speed = 300
    elseif Distance >= 300 then
        Speed = 300
    end
    
    local Tween = game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = P1}
    )
    
    Tween:Play()
    
    if _G.Stop_Tween then
        Tween:Cancel()
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/PeomPokkao/SynapOver/main/.lua"))()
local Window = Library.CreateLib("UPPERCUT HUB", "BloodTheme")
local id = game.PlaceId
local t1 = Window:NewTab("General")
local t2 = Window:NewTab("Teleport")
local t3 = Window:NewTab("Visual")

local Section1 = t1:NewSection("< Main >")
local Section2 = t1:NewSection("< Secondary-Main >")
local Section3 = t2:NewSection("< Teleport >")
local Section4 = t3:NewSection("< Job-Id >")
local Section5 = t3:NewSection("< Additional-Functions >")

local x2Code = {
    "kittgaming",
    "TRIPLEABUSE",
    "KITT_RESET",
    "Fudd10",
    "fudd10_v2",
    "Bignews",
    "Sub2CaptainMaui",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "Magicbus",
    "JCWK",
    "Starcodeheo",
    "Bluxxy",
    "SUB2GAMERROBOT_EXP1",
    "Sub2NoobMaster123",
    "Sub2UncleKizaru",
    "Sub2Daigrock",
    "Axiore",
    "TantaiGaming",
    "StrawHatMaine",
    "Sub2OfficialNoobie ",
    "TheGreatAce "
}
function RedeemCode(value)
   game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(value)
end

Section1:NewButton("ReDeemCodeX2", "กดมาดูอะไรครับ", function()

    for i,v in pairs(x2Code) do
        RedeemCode(v)
    end

end)

Section1:NewToggle("AuToFarm LeveL", "กดมาดูอะไรครับ", function(state)

end)

Section1:NewToggle("FasT aTTack", "กดมาดูอะไรครับ", function(vb)

    _G.FastAttack = vb

    spawn(function()
        while _G.FastAttack do
            game:GetService("Players").LocalPlayer:GetMouse().Button1Down:wait(0.001)
        end    
    end)

    spawn(function()
        while wait() do
            pcall(function()
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
            end)
        end
    end)

    local SeraphFrame = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]
    local VirtualUser = game:GetService('VirtualUser')
    local RigControllerR = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController))[2]
    local Client = game:GetService("Players").LocalPlayer
    local DMG = require(Client.PlayerScripts.CombatFramework.Particle.Damage)

    function SeraphFuckWeapon() 
        local p13 = SeraphFrame.activeController
        local wea = p13.blades[1]
        if not wea then return end
        while wea.Parent ~= game.Players.LocalPlayer.Character do
            wea = wea.Parent
        end
        return wea
    end

    function getHits(Size)
        local Hits = {}
        local Enemies = workspace.Enemies:GetChildren()
        local Characters = workspace.Characters:GetChildren()
        for i = 1, #Enemies do
            local v = Enemies[i]
            local Human = v:FindFirstChildOfClass("Humanoid")
            if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size + 10 then
                table.insert(Hits, Human.RootPart)
            end
        end
        for i = 1, #Characters do
            local v = Characters[i]
            if v ~= game.Players.LocalPlayer.Character then
                local Human = v:FindFirstChildOfClass("Humanoid")
                if Human and Human.RootPart and Human.Health > 0 and game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size + 10 then
                    table.insert(Hits, Human.RootPart)
                end
            end
        end
        return Hits
    end

    task.spawn(function()
        while wait(0.05) do  -- เพิ่มความเร็วในการโจมตี
            if _G.FastAttack then
                if SeraphFrame.activeController then
                    SeraphFrame.activeController.timeToNextAttack = 0.1  -- ปรับเป็นเวลาที่ต้องรอระหว่างการโจมตี
                    SeraphFrame.activeController.focusStart = 0
                    SeraphFrame.activeController.hitboxMagnitude = 40
                    SeraphFrame.activeController.humanoid.AutoRotate = true
                    SeraphFrame.activeController.increment = 1 + 1 / 1
                end
            end
        end
    end)

    function Boost()
        spawn(function()
            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange", tostring(SeraphFuckWeapon()))
        end)
    end

    function Unboost()
        spawn(function()
            game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("unequipWeapon", tostring(SeraphFuckWeapon()))
        end)
    end

    local cdnormal = 0
    local Animation = Instance.new("Animation")
    local CooldownFastAttack = 0

    Attack = function()
        local ac = SeraphFrame.activeController
        if ac and ac.equipped then
            task.spawn(function()
                if tick() - cdnormal > 0.5 then
                    ac:attack()
                    cdnormal = tick()
                else
                    game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", getHits(120), 2, "")
                end
            end)
        end
    end
    
    local b = tick()

    spawn(function()
        while wait(0.059) do
            if _G.FastAttack then
                if b - tick() > 0.75 then
                    wait(0.059)
                    b = tick()
                end
                pcall(function()
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
                                Attack()
                                wait(0.059)
                                Boost()
                            end
                        end
                    end
                end)
            end
        end
    end)

    local k = tick()

    spawn(function()
        while wait(0.059) do
            if _G.FastAttack then
                if k - tick() > 0.75 then
                    wait(0.059)
                    k = tick()
                end
                pcall(function()
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 40 then
                                wait(0.059)
                                Unboost()
                            end
                        end
                    end
                end)
            end
        end
    end)

    tjw1 = true

    task.spawn(function()
        local a = game.Players.LocalPlayer
        local b = require(a.PlayerScripts.CombatFramework.Particle)
        local c = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
        if not shared.orl then
            shared.orl = c.wrapAttackAnimationAsync
        end
        if not shared.cpc then
            shared.cpc = b.play
        end
        if tjw1 then
            pcall(function()
                c.wrapAttackAnimationAsync = function(d, e, f, g, h)
                    local i = c.getBladeHits(e, f, g)
                    if i then
                        b.play = function()
                        end
                        d:Play(0.25, 0.25, 0.25)
                        h(i)
                        b.play = shared.cpc
                        wait(.5)
                        d:Stop()
                    end
                end
            end)
        end
    end)

    local CameRa = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
    CameRa.CameraShakeInstance.CameraShakeState = {FadingIn = 3, FadingOut = 2, Sustained = 0, Inactive = 1}
    
    local Client = game.Players.LocalPlayer
    local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
    local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)

    task.spawn(function()
        pcall(function()
            if not shared.orl then
                shared.orl = STOPRL.wrapAttackAnimationAsync
            end
            if not shared.cpc then
                shared.cpc = STOP.play
            end
            spawn(function()
                game:GetService("RunService").Stepped:Connect(function()
                    STOPRL.wrapAttackAnimationAsync = function(a, b, c, d, func)
                        local Hits = STOPRL.getBladeHits(b, c, d)
                        if Hits then
                            if _G.FastAttack then
                                STOP.play = function() end
                                a:Play(0.1, 0.1, 0.1)
                                func(Hits)
                                STOP.play = shared.cpc
                                wait(a.length * 0.5)
                                a:Stop()
                            else
                                func(Hits)
                                STOP.play = shared.cpc
                                wait(a.length * 0.5)
                                a:Stop()
                            end
                        end
                    end
                end)
            end)
        end)
    end)

end)

Section1:NewToggle("ParT NeoN", "กดมาดูอะไรครับ", function(pno)

    _G.PartNeon = pno

    spawn(function()
        pcall(function()
            game:GetService("RunService").Heartbeat:Connect(function()
                if _G.PartNeon then
                    if not game.Workspace:FindFirstChild("LOL") then
                        local Paertaiteen = Instance.new("Part")
                        Paertaiteen.Name = "LOL"
                        Paertaiteen.Parent = game.Workspace
                        Paertaiteen.Anchored = true
                        Paertaiteen.Transparency = 0
                        Paertaiteen.Size = Vector3.new(30, 0.5, 30)
                        Paertaiteen.Material = "Neon"
    
                        local colors = {
                            Color3.fromRGB(255, 0, 0),
                            Color3.fromRGB(255, 155, 0),
                            Color3.fromRGB(255, 255, 0),
                            Color3.fromRGB(0, 255, 0),
                            Color3.fromRGB(0, 255, 255),
                            Color3.fromRGB(0, 155, 255),
                            Color3.fromRGB(255, 0, 255),
                            Color3.fromRGB(255, 0, 155)
                        }
    
                        local index = 1
    
                        while true do
                            wait(0.1)
                            game:GetService('TweenService'):Create(
                                Paertaiteen,
                                TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                                {Color = colors[index]}
                            ):Play()
    
                            index = index % #colors + 1
                            wait(0.5)
                        end
                    else
                        game.Workspace.LOL.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y - 3.92, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
                    end
                else
                    if _G.PartNeon == false then
                        local lol = game.Workspace:FindFirstChild("LOL")
                        if lol then
                            lol:Destroy()
                        end
                    end
                end
            end)
        end)
    end)

end)

Section2:NewDropdown("Select Weapon", "กดมาดูอะไรครับ", {"Option 1", "Option 2", "Option 3"}, function(currentOption)
    print(currentOption)
end)

Section2:NewToggle("AuTo Equip", "กดมาดูอะไรครับ", function(state)

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

Section3:NewButton("Go To First Sea", "กดมาดูอะไรครับ", function()
    pcall(function()

        while wait() do

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")

        end

    end)
end)

Section3:NewButton("Go To Second Sea", "กดมาดูอะไรครับ", function()
    pcall(function()

        while wait() do

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")

        end

    end)
end)

Section3:NewButton("Go To Third Sea", "กดมาดูอะไรครับ", function()
    pcall(function()

        while wait() do

            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")

        end

    end)
end)

Section5:NewButton("Rejoin", "กดมาดูอะไรครับ", function()

    pcall(function()

        while wait() do

            local ts = game:GetService("TeleportService")
            
            local p = game:GetService("Players").LocalPlayer
            
            
            ts:Teleport(game.PlaceId, p)

        end

    end)

end)

Section5:NewButton("Hop Server", "กดมาดูอะไรครับ", function()

    pcall(function()

        while wait() do
            
            local PlaceID = game.PlaceId
            local AllIDs = {}
            local foundAnything = ""
            local actualHour = os.date("!*t").hour
            local Deleted = false

            function TPReturner()
                local Site;
                if foundAnything == "" then
                   Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                else
                   Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                end
                local ID = ""
                if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                   foundAnything = Site.nextPageCursor
                end
                local num = 0;
                for i,v in pairs(Site.data) do
                   local Possible = true
                   ID = tostring(v.id)
                   if tonumber(v.maxPlayers) > tonumber(v.playing) then
                         for _,Existing in pairs(AllIDs) do
                            if num ~= 0 then
                               if ID == tostring(Existing) then
                                     Possible = false
                               end
                            else
                               if tonumber(actualHour) ~= tonumber(Existing) then
                                     local delFile = pcall(function()
                                        -- delfile("NotSameServers.json")
                                        AllIDs = {}
                                        table.insert(AllIDs, actualHour)
                                     end)
                               end
                            end
                            num = num + 1
                         end
                         if Possible == true then
                            table.insert(AllIDs, ID)
                            wait()
                            pcall(function()
                               -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                               wait()
                               game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                            end)
                            wait(.1)
                         end
                   end
                end
            end

             function Teleport() 
                while wait() do
                   pcall(function()
                         TPReturner()
                         if foundAnything ~= "" then
                            TPReturner()
                         end
                   end)
                end
             end
             
            Teleport()

        end

    end)

end)

Section5:NewButton("Hop Low Server", "กดมาดูอะไรครับ", function()

    pcall(function()

        while wait() do

            local Http = game:GetService("HttpService")
            local TPS = game:GetService("TeleportService")
            local Api = "https://games.roblox.com/v1/games/"
            
            local _place = game.PlaceId
            local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
            function ListServers(cursor)
                local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
                return Http:JSONDecode(Raw)
            end
            
            local Server, Next; repeat
                local Servers = ListServers(Next)
                Server = Servers.data[1]
                Next = Servers.nextPageCursor
            
            until Server
            
            TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)

        end

    end)

end)

Section4:NewButton("Copy Your Job Id", "กดมาดูอะไรครับ", function()

    pcall(function()

        setclipboard(game.JobId)

    end)

end)

Section4:NewTextBox("Place your Job Id", "กดมาดูอะไรครับ", function(txt)

    _G.jid = txt

end)

Section4:NewButton("Join Job Id", "กดมาดูอะไรครับ", function()

    pcall(function()

        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", _G.jid)

    end)

end)
