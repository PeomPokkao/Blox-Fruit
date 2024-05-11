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
	Name = "Rejoin Server",
	Callback = function()

		pcall(function()
			local ts = game:GetService("TeleportService")
			
			local p = game:GetService("Players").LocalPlayer
			
			ts:Teleport(game.PlaceId, p)
		end)

  	end    
})

t2:AddButton({
	Name = "Hop Low Server",
	Callback = function()

		pcall(function()
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
		end)

  	end    
})

t2:AddButton({
	Name = "Hop Server",
	Callback = function()

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
								pcall(function()
									-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
									game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
								end)
								wait(.1)
							end
						end
					end
				end
		
				function Teleport() 
					while wait() do
						if foundAnything == "" then
							break
						end
						pcall(function()
							TPReturner()
						end)
					end
				end
		
				Teleport()
			end
		end)
		

  	end    
})

t2:AddButton({
	Name = "Copy Your Job Id",
	Callback = function()
      		print("button pressed")
  	end    
})

t2:AddTextbox({
	Name = "Paste The Job Id Number",
	Default = "",
	TextDisappear = true,
	Callback = function(y)
		_G.svid = y
	end	  
})

t2:AddButton({
	Name = "Enter The Server According To The Textbox",
	Callback = function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId,_G.svid,game:GetService'Players'.LocalPlayer)
  	end    
})
