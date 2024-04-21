if not game:IsLoaded() then 
    repeat 
        game.Loaded:Wait() 
    until game:IsLoaded() 
end

local id = game.PlaceId

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

game.StarterGui:SetCore("SendNotification", {
    Icon = "rbxassetid://11915607895"; -- ใส่หน้าพ่อมึงมึง
    Title = "Upper Cut Hub", 
    Text = "loading",
})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("UPPERCUT HUB", "Sentinel")
local Tab1 = Window:NewTab("General")
local Tab2 = Window:NewTab("Teleport")
local Tab3 = Window:NewTab("Misc")
local Section1 = Tab1:NewSection("Main")
local Section2 = Tab2:NewSection("Teleport")
local Section3 = Tab3:NewSection("Visual")

Section1:NewButton("RedeemCodeX2", "Click?", function()
    print("Clicked")
end)

Section1:NewToggle("AuToFarm", "Start?", function(v)

    _G.AUTOFARM = v

function CheckLevel()
    local Level = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Level == 1 or Level <= 9 then -- Bandit
        Mon = "Bandit [Lv. 5]"
        NameQ = "BanditQuest1"
        NumberQ = 1
        CFrameQ = CFrame.new(1060.4088134765625, 16.516624450683594, 1546.447998046875)
        return true
    elseif Level == 10 or Level <= 14 then -- Monkey
        Mon = "Monkey [Lv. 14]"
        NameQ = "JungleQuest"
        NumberQ = 1
        CFrameQ = CFrame.new(-1599.4271240234375, 36.85212707519531, 153.33627319335938)
        return true
    elseif Level == 15 or Level <= 29 then -- Gorilla
        Mon = "Gorilla [Lv. 20]"
        NameQ = "JungleQuest"
        NumberQ = 2
        CFrameQ = CFrame.new(-1599.4271240234375, 36.85212707519531, 153.33627319335938)
        return true
    elseif Level == 30 or Level <= 39 then -- Pirate
        Mon = "Pirate [Lv. 35]"
        NameQ = "BuggyQuest1"
        NumberQ = 1
        CFrameQ = CFrame.new(-1140.73046875, 4.752050399780273, 3829.33447265625)
        return true
    elseif Level == 40 or Level <= 59 then
        Mon = "Brute [Lv. 45]"
        NameQ = "BuggyQuest1"
        NumberQ = 2
        CFrameQ = CFrame.new(-1140.73046875, 4.752050399780273, 3829.33447265625)
        return true
    elseif Level == 60 or Level <= 74 then
        Mon = "Desert Bandit [Lv. 60]"
        NameQ = "DesertQuest"
        NumberQ = 1
        CFrameQ = CFrame.new(896.5406494140625, 6.438462734222412, 4390.4765625)
        return true
    elseif Level == 75 or Level <= 89 then
        Mon = "Desert Officer [Lv. 70]"
        NameQ = "DesertQuest"
        NumberQ = 2
        CFrameQ = CFrame.new(896.5406494140625, 6.438462734222412, 4390.4765625)
        return true
    elseif Level == 90 or Level <= 99 then
        Mon = "Snow Bandit [Lv. 90]"
        NameQ = "SnowQuest"
        NumberQ = 1
        CFrameQ = CFrame.new(1388.0137939453125, 87.27276611328125, -1298.484375)
        return true
    elseif Level == 100 or Level <= 119 then
        Mon = "Snowman [Lv. 100]"
        NameQ = "SnowQuest"
        NumberQ = 2
        CFrameQ = CFrame.new(1388.0137939453125, 87.27276611328125, -1298.484375)
        return true
    elseif Level == 120 or Level <= 149 then
        Mon = "Chief Petty Officer [Lv. 120]"
        NameQ = "MarineQuest2"
        NumberQ = 1
        CFrameQ = CFrame.new(-5038.15966796875, 28.65203285217285, 4325.3427734375)
        return true
    elseif Level == 150 or Level <= 174 then
        Mon = "Sky Bandit [Lv. 150]"
        NameQ = "SkyQuest"
        NumberQ = 1
        CFrameQ = CFrame.new(-4840.48876953125, 717.66943359375, -2620.824951171875)
        return true
    elseif Level == 175 or Level <= 189 then
        Mon = "Dark Master [Lv. 175]"
        NameQ = "SkyQuest"
        NumberQ = 2
        CFrameQ = CFrame.new(-4840.48876953125, 717.66943359375, -2620.824951171875)
        return true
    elseif Level == 190 or Level <= 209 then
        Mon = "Prisoner [Lv. 190]"
        NameQ = "PrisonerQuest"
        NumberQ = 1
        CFrameQ = CFrame.new(5308.328125, 1.655163049697876, 475.0945129394531)
        return true
    elseif Level == 210 or Level <= 249 then
        Mon = "Dangerous Prisoner [Lv. 210]"
        NameQ = "PrisonerQuest"
        NumberQ = 2
        CFrameQ = CFrame.new(5308.328125, 1.655163049697876, 475.0945129394531)
        return true
    end
    return false
end

spawn(function()
    while wait() do
        if _G.AUTOFARM then
            pcall(function()
                local checked = CheckLevel()
                if checked then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        TP(CFrameQ)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(StartQuest,NameQ,NumberQ)
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Mon then
                                repeat wait()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,30,0)
                                until _G.AUTOFARM == false or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                            end
                        end
                    end
                end
            end)
        end
    end
end)

RandomCFrame = 0

spawn(function()
    while wait() do
        if _G.AUTOFARM then
            repeat
                wait()

                if RandomCFrame <= 1 then
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,50))
                elseif RandomCFrame <= 2 then
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(50,20,0))
                elseif RandomCFrame <= 3 then
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,20,-50))
                elseif RandomCFrame <= 4 then
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(-50,20,0))
                elseif RandomCFrame <= 5 then
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                    RandomCFrame = 0
                end

                RandomCFrame = RandomCFrame + 0.1
            until _G.AUTOFARM == false
        end
    end
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            if _G.AUTOFARM then
                if not game.Workspace:FindFirstChild("LOL") then
                    local PartNeon = Instance.new("Part")
                    PartNeon.Name = "LOL"
                    PartNeon.Parent = game.Workspace
                    PartNeon.Anchored = true
                    PartNeon.Transparency = 0
                    PartNeon.Size = Vector3.new(30, 0.5, 30)
                    PartNeon.Material = "Neon"

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
                            PartNeon,
                            TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                            {Color = colors[index]}
                        ):Play()

                        index = index % #colors + 1
                        wait(0.5)
                    end
                else
                    local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    game.Workspace.LOL.CFrame = CFrame.new(playerPos.X, playerPos.Y - 3.92, playerPos.Z)
                end
            else
                if not _G.AUTOFARM then
                    local lol = game.Workspace:FindFirstChild("LOL")
                    if lol then
                        lol:Destroy()
                    end
                end
            end
        end)
    end)
end)

getgenv().BringMobs = function(F, z)
    coroutine.wrap(function()
        pcall(function()
            if _G.AUTOFARM then
                for U, d in pairs(game.Workspace.Enemies:GetChildren()) do
                    if d:FindFirstChild("Humanoid") and d:FindFirstChild("HumanoidRootPart") and (d.Name == z) then
                        if isnetworkowner ~= nil and isnetworkowner(d:FindFirstChild("HumanoidRootPart")) then
                            d:FindFirstChild("HumanoidRootPart").Transparency = 1
                            d:FindFirstChild("Humanoid"):ChangeState(11)
                            d:FindFirstChild("HumanoidRootPart").Size = Vector3.new(60, 60, 60)
                            d:FindFirstChild("Humanoid").WalkSpeed = 0
                            d:FindFirstChild("Humanoid").JumpPower = 0
                            if not d:FindFirstChild("HumanoidRootPart"):FindFirstChild("BV") then
                                local m = Instance.new("BodyVelocity")
                                m.Parent = d:FindFirstChild("HumanoidRootPart")
                                m.Name = "BV"
                                m.MaxForce = Vector3.new(100000, 100000, 100000)
                                m.Velocity = Vector3.new(0, 0, 0)
                            end
                            if d:FindFirstChild("Humanoid"):FindFirstChild("Animator") then
                                d:FindFirstChild("Humanoid"):FindFirstChild("Animator"):Remove()
                            end
                            d:FindFirstChild("HumanoidRootPart").CFrame = F
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        elseif (F.Position - d.HumanoidRootPart.Position).magnitude < 300 then
                            d:FindFirstChild("HumanoidRootPart").Transparency = 1
                            d:FindFirstChild("Humanoid"):ChangeState(11)
                            d:FindFirstChild("HumanoidRootPart").Size = Vector3.new(60, 60, 60)
                            d:FindFirstChild("Humanoid").WalkSpeed = 0
                            d:FindFirstChild("Humanoid").JumpPower = 0
                            if not d:FindFirstChild("HumanoidRootPart"):FindFirstChild("BV") then
                                local u = Instance.new("BodyVelocity")
                                u.Parent = d:FindFirstChild("HumanoidRootPart")
                                u.Name = "BV"
                                u.MaxForce = Vector3.new(100000, 100000, 100000)
                                u.Velocity = Vector3.new(0, 0, 0)
                            end
                            if d:FindFirstChild("Humanoid"):FindFirstChild("Animator") then
                                d:FindFirstChild("Humanoid"):FindFirstChild("Animator"):Remove()
                            end
                            d:FindFirstChild("HumanoidRootPart").CFrame = F
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
            end
        end)
    end)()
end


end)

Section1:NewToggle("FastAttack", "Start?", function(vs)
    local SuperFastMode = false -- เปลี่ยนเป็นจริงถ้าคุณต้องการโจมตี Super Super Super Fast (เช่นการฆ่าทันที) แต่จะทำให้เกมเตะคุณมากกว่าโหมดปกต
_G.FastAttack = vs

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

Section1:NewToggle("Part Neon", "Start?", function(s)

    _G.PartNeon = s

end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.PartNeon then
            if not game.Workspace:FindFirstChild("LOL") then
                local PartNeon = Instance.new("Part")
                PartNeon.Name = "LOL"
                PartNeon.Parent = game.Workspace
                PartNeon.Anchored = true
                PartNeon.Transparency = 0
                PartNeon.Size = Vector3.new(30, 0.5, 30)
                PartNeon.Material = "Neon"

                while wait() do
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

                    for i, color in ipairs(colors) do
                        game:GetService('TweenService'):Create(PartNeon, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Color = color}):Play()
                        wait(0.5)
                    end
                end
            else
                game.Workspace["LOL"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y - 3.92, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
            end
        else
            if game.Workspace:FindFirstChild("LOL") then
                game.Workspace:FindFirstChild("LOL"):Destroy()
            end
        end
    end)
end)

if id == 2753915549 then

    Section2:NewDropdown("Teleport in world 1", "Select", {"Pirate Starter Island", "Marine Starter Island", "Middle Town", "Jungle", "Pirate Village", "Desert", "Frozen Village", "Marine Fortress", "Skylands", "Prison", "Colosseum", "Magma Village", "Underwater City", "Upper Skylands", "Fountain City"}, function(t)

        _G.Teleport = t
    
    end)
    
    Section2:NewButton("Start Teleport", "Click?", function()
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

    Section2:NewDropdown("Teleport in world 2", "Select", {"Cafe", "Mansion", "Kingdom of Rose", "Green Zone", "Graveyard", "Dark Arena", "Snow Mountain", "Hot and Cold", "Cursed Ship", "Ice Castle", "Forgotten Island", "Usoap's Island"}, function(t)

        _G.Teleport = t
    
    end)

    Section2:NewButton("Start Teleport", "Click?", function()

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

    Section2:NewDropdown("Teleport in world 3", "Select", {"Port Town", "Hydra Island", "Great Tree", "Mansion", "Haunted Castle", "Castle on the Sea", "Sea of Treats", "Tiki Outpost"}, function(t)

        _G.Teleport = t
    
    end)

    Section2:NewButton("Start Teleport", "Click?", function()

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

Section1:NewDropdown("Select Upstats", "Select", {"Melee", "Defense", "Sword", "Gun", "Fruit"}, function(t)
    _G.stats = t
end)

Section1:NewToggle("Upstats", "Start?", function(state)

    if _G.stats == "Melee" then

        repeat wait()

            local args = {
                [1] = "AddPoint",
                [2] = "Melee",
                [3] = 1
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

        until _G.stats ~= "Melee"

    elseif _G.stats == "Defense" then

        repeat wait()

            local args = {
                [1] = "AddPoint",
                [2] = "Defense",
                [3] = 1
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

        until _G.stats ~= "Defense"

    elseif _G.stats == "Sword" then

        repeat wait()

            local args = {
                [1] = "AddPoint",
                [2] = "Sword",
                [3] = 1
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

        until _G.stats ~= "Sword"

    elseif _G.stats == "Gun" then

        repeat wait()

            local args = {
                [1] = "AddPoint",
                [2] = "Gun",
                [3] = 1
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

        until _G.stats ~= "Gun"

    elseif _G.stats == "Fruit" then

        repeat wait()

            local args = {
                [1] = "AddPoint",
                [2] = "Demon Fruit",
                [3] = 1
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

        until _G.stats ~= "Fruit"

    end

end)

-- กำหนดค่าสำหรับกำหนดความถี่ของการคลิก (ครั้งต่อวินาที)
local clickFrequency = 100  -- กำหนดความถี่ที่ต้องการ ตัวอย่างเช่น 10 คือ 10 ครั้งต่อวินาที

-- ฟังก์ชันที่จะทำการคลิก
local function autoclick()
    while true do
        wait(0.01) -- รอเวลาตามความถี่ที่ตั้งไว้
        game:GetService("VirtualUser"):CaptureController()
        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672)) -- สำหรับคลิกที่ตำแหน่งนี้
        game:GetService("VirtualUser"):Button1Up(Vector2.new(1280, 672)) -- ปล่อยปุ่ม
    end
end

-- เรียกใช้งานฟังก์ชัน autoclick
autoclick()

local UserInputService = game:GetService("UserInputService")

-- ฟังก์ชันสำหรับลดการสั่นของจอ
local function ReduceScreenShake()
    local camera = game.Workspace.CurrentCamera
    if camera then
        camera.CameraType = Enum.CameraType.Scriptable
        camera.FieldOfView = 70
        camera.Focus = CFrame.new(Vector3.new(0, 0, 0))
    end
end

ReduceScreenShake() -- เรียกใช้ฟังก์ชันเพื่อลดการสั่นของจอ
