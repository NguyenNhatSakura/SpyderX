--// Script Được Mã Nguồn Mở

local sitinklib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/UI/main.lua"))()
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local userId = player.UserId
local username = player.Name

local StarterGui = game:GetService("StarterGui")

local sitinkgui = sitinklib:Start({
    ["Name"] = "Spyder X",
    ["Description"] = "V1.3",
    ["Info Color"] = Color3.fromRGB(5.000000176951289, 59.00000028312206, 113.00000086426735),
    ["Logo Info"] = "rbxassetid://131489183118092",
    ["Logo Player"] = "rbxassetid://131489183118092",
    ["Name Info"] = "" .. username,
    ["Name Player"] = "" .. username,
    ["Info Description"] = "Join: dsc.gg/spyderx",
    ["Tab Width"] = 135,
    ["Color"] = Color3.fromRGB(255,255,0),
    ["CloseCallBack"] = function()
    end
})

game:GetService("CoreGui").RobloxGui.NotificationFrame.Visible = false

loadstring(game:HttpGet("https://raw.githubusercontent.com/C0RP0RATE/Oblivious/refs/heads/main/Adonis_AntiCheat_Bypass_V2.lua",true))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Anti-Kick/main/Anti-Kick.lua"))()

local old_cac;

old_cac = hookmetamethod(game,"__index", function(self, key)
    if self == game:GetService("ReplicatedStorage") and key == "GetService" then
        return function(service_name)
            if service_name == "DataService" then
                return {
                    KickTuiDi = function(...)
                        return
                    end
                }
            end
            return old_cac(self, key)
        end
    end
    return old_cac(self, key)
end)

local c = Instance.new("Part")
    c.Size = Vector3.new(6, 0.1, 6)
    c.Anchored = true
    c.CanCollide = true
    c.Material = Enum.Material.ForceField
    c.Color = Color3.fromRGB(0, 255, 0)
    c.Parent = workspace
    local d = {
        [1] = game:GetService("Teams")["Khai th\195\161c g\225\187\151"],
        [2] = game:GetService("Teams")["Giao h\195\160ng"]
    }
    local MainTab = sitinkgui:MakeTab("Tab Farm")
    local Section = MainTab:Section({
      ["Title"] = "Farming Job",
    })
    local Toggle = Section:Toggle({
	  ["Title"]= "Auto Farm Chop Wood",
	  ["Default"] = false,
	  ["Callback"] = function(NMN) 
    local Notify = sitinklib:Notify({
	["Title"] = "Spyder X",
	["Description"] = (NMN and "Enabled " or "Disabled ") .. "Toggle",
	["Delay"] = 5
})
        getgenv().AutoChatGo = NMN
      end
    })
    function CheckLog(v)
        for i, v in pairs(v:GetChildren()) do
            return true
        end
    end
    function EquipWeapon(j)
        if not _G.NotAutoEquip then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(j) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(j)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
        if
            not game.Players.LocalPlayer.Backpack:FindFirstChild(j) and
                not game.Players.LocalPlayer.Backpack:FindFirstChild(j)
         then
            local k = {[1] = "eue", [2] = j}
            game:GetService("ReplicatedStorage"):WaitForChild("KnitPackages"):WaitForChild("_Index"):WaitForChild(
                "sleitnick_knit@1.7.0"
            ):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild("RE"):WaitForChild(
                "updateInventory"
            ):FireServer(unpack(k))
            wait(.2)
            if game.Players.LocalPlayer.Backpack:FindFirstChild(j) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(j)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end
    for i, v in pairs(workspace.Jobs.Trees:GetChildren()) do
        if not Tree then
            Tree, Treeline = v, i
        end
    end
    task.spawn(
        function()
            while task.wait() do
                if getgenv().AutoChatGo then
                    if workspace.NPCs:FindFirstChild("Khai th\195\161c g\225\187\151") then
                        if game:GetService("Players").LocalPlayer.Team == d[1] then
                            if
                                game.Players.LocalPlayer.Backpack:FindFirstChild("R\195\172u") or
                                    game.Players.LocalPlayer.Character:FindFirstChild("R\195\172u")
                             then
                                if not avava then
                                    avava = true
                                    local l = Instance.new("Part")
                                    l.Size = Vector3.new(2400, 0.3, 2400)
                                    l.Anchored = true
                                    l.CanCollide = true
                                    l.Material = Enum.Material.ForceField
                                    l.Color = Color3.fromRGB(0, 255, 0)
                                    l.Parent = workspace
                                    l.CFrame =
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame *
                                        CFrame.new(0, -50, 0)
                                end
                                wait(1)
                                v = Tree
                                i = Treeline
                                if getgenv().AutoChatGo then
                                    print("Start Brek Tree " .. i)
                                    if v.Name == "Tree" then
                                        if v.isCutting.Value == false and not CheckLog(v.LogClones) then
                                            repeat
                                                wait()
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                    v.Prompt.CFrame * CFrame.new(0, 0, -3)
                                                if v.Prompt:FindFirstChild("CutWood") then
                                                    EquipWeapon("R\195\172u")
                                                    v.Prompt.CutWood.HoldDuration = 0
                                                    fireproximityprompt(v.Prompt.CutWood)
                                                    wait(2)
                                                    wait(4)
                                                end
                                            until CheckLog(v.LogClones) or not getgenv().AutoChatGo
                                            repeat
                                                wait()
                                                for m, n in pairs(v.LogClones:GetChildren()) do
                                                    if n:FindFirstChild("Trunk") then
                                                        pcall(
                                                            function()
                                                                EquipWeapon("R\195\172u")
                                                                n.Trunk.Anchored = true
                                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                                                    v.Trunk.CFrame * CFrame.new(0, 0, -3)
                                                                if
                                                                    n:FindFirstChild("Trunk") and
                                                                        n.Trunk:FindFirstChild("Collect")
                                                                 then
                                                                    n.Trunk.Collect.HoldDuration = 0
                                                                    print("Claim Trunk")
                                                                    fireproximityprompt(n.Trunk.Collect)
                                                                end
                                                            end
                                                        )
                                                    end
                                                end
                                            until not getgenv().AutoChatGo or not v or not CheckLog(v.LogClones)
                                            print("Wait Cutwood")
                                        end
                                    end
                                end
                            else
                                local k = {[1] = "eue", [2] = "R\195\172u"}
                                game:GetService("ReplicatedStorage"):WaitForChild("KnitPackages"):WaitForChild("_Index"):WaitForChild(
                                    "sleitnick_knit@1.7.0"
                                ):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild(
                                    "RE"
                                ):WaitForChild("updateInventory"):FireServer(unpack(k))
                                wait(4)
                            end
                        else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                workspace.NPCs:FindFirstChild("Khai th\195\161c g\225\187\151").CFrame
                            workspace.NPCs:FindFirstChild("Khai th\195\161c g\225\187\151").ProximityPrompt.HoldDuration =
                                0
                            fireproximityprompt(
                                workspace.NPCs:FindFirstChild("Khai th\195\161c g\225\187\151").ProximityPrompt
                            )
                        end
                    else
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1616, 23, -306)
                    end
                end
            end
        end
    )
    local Toggle = Section:Toggle({
	  ["Title"]= "Auto Farm Grab",
	  ["Default"] = false,
	  ["Callback"] = function(NMN) 
    local Notify = sitinklib:Notify({
	["Title"] = "Spyder X",
	["Description"] = (NMN and "Enabled " or "Disabled ") .. "Toggle",
	["Delay"] = 5
})
        getgenv().AutoGrab = NMN
      end
    })
    function EquipWeapon1(j)
        if not _G.NotAutoEquip then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(j) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(j)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
                return Tool
            end
        end
    end
    for i, v in pairs(workspace.Jobs.Delivery:GetChildren()) do
        if v:IsA("Part") and v.Position - Vector3.new(843, 19, -634).Magnitude < 30 then
            Grabffff = v
            print(Grabffff)
        end
    end
    function topos(o)
        Distance = o.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
        tween =
            game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance / 15, Enum.EasingStyle.Linear),
            {CFrame = o}
        )
        tween:Play()
        if Distance <= 1 then
            tween:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = o
        end
        if _G.StopTween == true then
            tween:Cancel()
            _G.Clip = false
        end
    end
    task.spawn(
        function()
            while task.wait() do
                if getgenv().AutoGrab then
                    if game:GetService("Players").LocalPlayer.Team == d[2] then
                        if
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Box") or
                                game.Players.LocalPlayer.Character:FindFirstChild("Box")
                         then
                            if Grabffff then
                                if not aabgag then
                                    aabgag = true
                                    task.spawn(
                                        function()
                                            repeat
                                                wait()
                                                if
                                                    Grabffff.Position -
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude <
                                                        15
                                                 then
                                                    Grabffff.ProximityPrompt.Enabled = true
                                                    Grabffff.ProximityPrompt.HoldDuration = 0
                                                    fireproximityprompt(Grabffff.ProximityPrompt)
                                                    wait(.5)
                                                end
                                            until avsafvas
                                        end
                                    )
                                end
                                local p =
                                    EquipWeapon1("Box") or game.Players.LocalPlayer.Backpack:FindFirstChild("Box") or
                                    game.Players.LocalPlayer.Character:FindFirstChild("Box")
                                p.Address.Value = Grabffff.Name
                                tween =
                                    game:GetService("TweenService"):Create(
                                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                                    TweenInfo.new(
                                        Vector3.new(798, 20, -507) -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude / 15,
                                        Enum.EasingStyle.Linear
                                    ),
                                    {CFrame = CFrame.new(798, 20, -507)}
                                )
                                tween:Play()
                                for i = 1, 5 do
                                    print("Waits: " .. 5 - i)
                                    wait(1)
                                end
                                tween =
                                    game:GetService("TweenService"):Create(
                                    game.Players.LocalPlayer.Character.HumanoidRootPart,
                                    TweenInfo.new(
                                        Vector3.new(801, 19, -533) -
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Magnitude / 15,
                                        Enum.EasingStyle.Linear
                                    ),
                                    {CFrame = CFrame.new(801, 19, -533)}
                                )
                                tween:Play()
                                for i = 1, 5 do
                                    print("Waits: " .. 5 - i)
                                    wait(1)
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    Grabffff.CFrame * CFrame.new(0, 0, -3)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    Grabffff.CFrame * CFrame.new(0, 0, -3)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    Grabffff.CFrame * CFrame.new(0, 0, -3)
                            else
                                for i, v in pairs(workspace.Jobs.Delivery:GetChildren()) do
                                    if v:IsA("Part") and v.Position - Vector3.new(843, 19, -634).Magnitude < 30 then
                                        Grabffff = v
                                        print(Grabffff)
                                    end
                                end
                            end
                        else
                            if workspace.Jobs.Delivery:FindFirstChild("Box") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    workspace.Jobs.Delivery.Box.Part.CFrame
                                workspace.Jobs.Delivery.Box.Part.ProximityPrompt.HoldDuration = 0
                                fireproximityprompt(workspace.Jobs.Delivery.Box.Part.ProximityPrompt)
                                wait(2)
                            else
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(820, 20, -500)
                            end
                        end
                    else
                        if workspace.NPCs:FindFirstChild("Giao h\195\160ng") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                workspace.NPCs:FindFirstChild("Giao h\195\160ng").CFrame
                            workspace.NPCs:FindFirstChild("Giao h\195\160ng").ProximityPrompt.HoldDuration = 0
                            fireproximityprompt(workspace.NPCs:FindFirstChild("Giao h\195\160ng").ProximityPrompt)
                            wait(2)
                        else
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(820, 20, -500)
                        end
                    end
                end
            end
        end
    )
    function TeleportVongVong(q, r, s)
        local t = game.Players.LocalPlayer
        local u = t.Character and t.Character:FindFirstChild("HumanoidRootPart")
        if not u or not q then
            return
        end
        local w = tick() * s
        local x = q.Position
        local y = x.X + math.cos(w) * r
        local z = x.Z + math.sin(w) * r
        local A = u.Position.Y
        local B = Vector3.new(y, A, z)
        local C = x
        u.CFrame = CFrame.lookAt(B, C)
    end
    local Toggle = Section:Toggle({
	  ["Title"]= "Auto Farm Boss [Dễ Die]",
	  ["Default"] = false,
	  ["Callback"] = function(NMN) 
    local Notify = sitinklib:Notify({
	["Title"] = "Spyder X",
	["Description"] = (NMN and "Enabled " or "Disabled ") .. "Toggle",
	["Delay"] = 5
})
        getgenv().autoboss = NMN
      end
    })
    task.spawn(
        function()
            while wait() do
                if getgenv().autoboss then
                    for i, v in pairs(workspace.GiangHo2.NPCs:GetChildren()) do
                        if v.Name == "NPC2" then
                            if game.Players.LocalPlayer.Character.Humanoid.Health == 100 then
                                TeleportVongVong(v.HumanoidRootPart, 8, 30)
                            else
                                TeleportVongVong(v.HumanoidRootPart, 12, 50)
                            end
                        end
                    end
                end
            end
        end
    )
