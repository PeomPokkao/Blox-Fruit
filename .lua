local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Player = game.Players.LocalPlayer

local Window = OrionLib:MakeWindow({Name = "UPPERCUT HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion"})

OrionLib:MakeNotification({
	Name = "Logged in!",
	Content = "Welcome to Uppercut Hub "..Player.Name.." ",
	Image = "rbxassetid://11915607895",
	Time = 5
})

local t1 = Window:MakeTab({
	Name = "General",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local t2 = Window:MakeTab({
	Name = "Visual",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = t1:AddSection({
	Name = "< Main >"
})

t1:AddButton({
	Name = "RedeemCodeX2",
	Callback = function()

  	end    
})

t1:AddToggle({
	Name = "AuToFarm",
	Default = false,
	Callback = function(Value)
	end    
})

t1:AddToggle({
	Name = "FasT ATTack",
	Default = false,
	Callback = function(Value)
	end    
})

t1:AddToggle({
	Name = "ParT NeoN",
	Default = false,
	Callback = function(game)
		_G.PartNeon = game
	end    
})

t1:AddDropdown({
	Name = "Dropdown",
	Default = "1",
	Options = {"1", "2"},
	Callback = function(Value)
		print(Value)
	end    
})

t1:AddToggle({
	Name = "Auto Equip",
	Default = false,
	Callback = function(a)
		print(Value)
	end    
})

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

t2:AddButton({
	Name = "Button!",
	Callback = function()
      		print("button pressed")
  	end    
})

t1:AddButton({
	Name = "Button!",
	Callback = function()
      		print("button pressed")
  	end    
})
