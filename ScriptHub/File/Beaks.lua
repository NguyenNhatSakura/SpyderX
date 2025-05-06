local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/UI/SpyderXLib/main.lua"))();
local Notifier = loadstring(game:HttpGet('https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/UI/SpyderXLib/notification.lua'))()
local Window = Library.new({
    Title = "Spyder Hub | Beaks",
})
--------------------------------------------
local GeneralTab = Window:AddTab({
    Title = "Tab General",
    Icon = "home"
});
local GeneralSection = GeneralTab:AddSection({
	Title = "General"
});
local AutoSection = GeneralTab:AddSection({
	Title = "Automatic"
});
local OPSection = GeneralTab:AddSection({
	Title = "OP"
});
local FarmSection = GeneralTab:AddSection({
	Title = "Farming"
});
--------------------------------------------
local TeleportTab = Window:AddTab({
    Title = "Tab Teleport",
    Icon = "cookie"
});
local TeleportSection = TeleportTab:AddSection({
	Title = "General"
});
--------------------------------------------
local MiscellaneousTab = Window:AddTab({
    Title = "Tab Miscellaneous",
    Icon = "box"
});
local GenMicsSection = MiscellaneousTab:AddSection({
	Title = "General"
});
local ESPSection = MiscellaneousTab:AddSection({
	Title = "ESP"
});
--------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local originalProperties = {}
local originalSizes = {}
local originalLighting = {}
local ClientBirds =
    workspace:FindFirstChild("Regions") and workspace.Regions:FindFirstChild("Beakwoods") and
    workspace.Regions.Beakwoods:FindFirstChild("ClientBirds")
local Settings = {
    AutoFarm = {
        Beakwoods = false,
        Deadlands = false,
        MountBeaks = false,
        QuillLake = false,
        Enabled = false,
        AutoShoot = false,
        BirdDuration = 10,
        MovementSpeed = 25,
        MinDistanceForNewTween = 15,
        YOffset = 3,
        OrbitRadius = 5,
        OrbitSpeed = 0.7,
        ApproachSpeed = 0.9,
        MinDistance = 10,
        CameraSmoothness = 1.5,
        ShootVariance = 0.2,
        ZOffset = 8,
        TweenDuration = 1.5,
        EasingStyle = Enum.EasingStyle.Quad,
        EasingDirection = Enum.EasingDirection.Out,
        SmoothAimbot = false,
        FreezeBirds = false
    },
    AutoSell = false,
    SellThreshold = 50,
    AutoDart = false,
    HitboxExpander = false,
    HitboxSize = 15,
    WalkSpeed = 16,
    InfiniteJump = false
}
local ESPColors = {
    ["Beakwoods"] = Color3.fromRGB(0, 255, 0),
    ["Deadlands"] = Color3.fromRGB(255, 0, 0),
    ["Mount Beaks"] = Color3.fromRGB(0, 0, 255),
    ["Quill Lake"] = Color3.fromRGB(255, 255, 0)
}
local ESPEnabled = false
local ESPObjects = {}
function CreateESP(bird, regionName)
    local highlight = Instance.new("Highlight")
    highlight.Name = "ESP_Highlight"
    highlight.Adornee = bird
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = ESPColors[regionName] or Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.OutlineTransparency = 0
    highlight.Parent = bird
    local primary = bird.PrimaryPart or bird:FindFirstChildWhichIsA("BasePart")
    if primary then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ESP_Billboard"
        billboard.Adornee = primary
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = primary
        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "ESP_Text"
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = regionName .. " - " .. bird.Name
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.TextScaled = true
        textLabel.Font = Enum.Font.SourceSansBold
        textLabel.Parent = billboard
        ESPObjects[bird] = { highlight, billboard }
    end
end
function ToggleESP(state)
    ESPEnabled = state
    if ESPEnabled then
        for _, regionName in pairs({ "Beakwoods", "Deadlands", "Mount Beaks", "Quill Lake" }) do
            local region = workspace.Regions:FindFirstChild(regionName)
            if region then
                local clientBirds = region:FindFirstChild("ClientBirds")
                if clientBirds then
                    for _, bird in pairs(clientBirds:GetChildren()) do
                        if bird:IsA("Model") then
                            CreateESP(bird, regionName)
                        end
                    end
                    clientBirds.ChildAdded:Connect(
                        function(bird)
                            if ESPEnabled and bird:IsA("Model") then
                                CreateESP(bird, regionName)
                            end
                        end
                    )
                end
            end
        end
    else
        for bird, _ in pairs(ESPObjects) do
            RemoveESP(bird)
        end
    end
end
local function ExpandHitboxes(enable)
    for _, regionName in pairs({ "Beakwoods", "Deadlands", "Mount Beaks", "Quill Lake" }) do
        local region = workspace.Regions:FindFirstChild(regionName)
        if region then
            local clientBirds = region:FindFirstChild("ClientBirds")
            if clientBirds then
                for _, bird in pairs(clientBirds:GetChildren()) do
                    if bird:IsA("Model") then
                        for _, part in pairs(bird:GetDescendants()) do
                            if part:IsA("BasePart") then
                                if enable then
                                    if not originalSizes[part] then
                                        originalSizes[part] = part.Size
                                    end
                                    part.Size =
                                        Vector3.new(
                                            Settings.HitboxSize,
                                            Settings.HitboxSize,
                                            Settings.HitboxSize
                                        )
                                    part.CanCollide = false
                                else
                                    if originalSizes[part] then
                                        part.Size = originalSizes[part]
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
local function GetRandomBird(region)
    local clientBirds =
        workspace.Regions:FindFirstChild(region) and workspace.Regions[region]:FindFirstChild("ClientBirds")
    if not clientBirds then
        return nil
    end
    local validBirds = {}
    for _, bird in pairs(clientBirds:GetChildren()) do
        if bird:IsA("Model") then
            local primaryPart = bird.PrimaryPart or bird:FindFirstChildWhichIsA("BasePart")
            if primaryPart then
                table.insert(validBirds, bird)
            end
        end
    end
    if #validBirds > 0 then
        return validBirds[math.random(1, #validBirds)]
    end
    return nil
end
local function StartAutoFarm(region)
    local player = game.Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local tweenService = game:GetService("TweenService")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local RunService = game:GetService("RunService")
    local CurrentBird, CurrentTween, LastBirdSwitch = nil, nil, 0
    local originalGravity = workspace.Gravity
    workspace.Gravity = 10
    local clientBirds =
        workspace.Regions:FindFirstChild(region) and workspace.Regions[region]:FindFirstChild("ClientBirds")
    if not clientBirds then
        return
    end
    while Settings.AutoFarm[region:gsub(" ", "")] do
        task.wait(0.05)
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local now = os.clock()
            if not CurrentBird or (now - LastBirdSwitch) > Settings.AutoFarm.BirdDuration then
                CurrentBird = GetRandomBird(region)
                LastBirdSwitch = now
                if CurrentTween then
                    CurrentTween:Cancel()
                end
            end
            if CurrentBird then
                local success, pivot =
                    pcall(
                        function()
                            return CurrentBird:GetPivot()
                        end
                    )
                if success and pivot then
                    local offset = Vector3.new(0, 3, 8)
                    local targetPos = pivot.Position + offset
                    local targetCFrame = CFrame.new(targetPos, pivot.Position)
                    CurrentTween =
                        tweenService:Create(
                            hrp,
                            TweenInfo.new(
                                Settings.AutoFarm.TweenDuration,
                                Settings.AutoFarm.EasingStyle,
                                Settings.AutoFarm.EasingDirection
                            ),
                            { CFrame = targetCFrame }
                        )
                    CurrentTween:Play()
                    local followStart = os.clock()
                    while os.clock() - followStart < Settings.AutoFarm.BirdDuration and
                        Settings.AutoFarm[region:gsub(" ", "")] do
                        local pivotSuccess, pivotUpdate =
                            pcall(
                                function()
                                    return CurrentBird:GetPivot()
                                end
                            )
                        if pivotSuccess then
                            local aimPos = pivotUpdate.Position
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, aimPos)
                            if Settings.AutoFarm.AutoShoot then
                                local screenPoint = Camera:WorldToViewportPoint(aimPos)
                                local shootX =
                                    screenPoint.X +
                                    ((math.random() - 0.5) * Settings.AutoFarm.ShootVariance * 50)
                                local shootY =
                                    screenPoint.Y +
                                    ((math.random() - 0.5) * Settings.AutoFarm.ShootVariance * 30)
                                VirtualInputManager:SendMouseButtonEvent(shootX, shootY, 0, true, game, 1)
                                task.wait(0.02 + math.random() * 0.03)
                                VirtualInputManager:SendMouseButtonEvent(shootX, shootY, 0, false, game, 1)
                            end
                        end
                        task.wait(0.1)
                    end
                end
            end
        end
    end
    if CurrentTween then
        CurrentTween:Cancel()
    end
    workspace.Gravity = originalGravity
end
for _, name in ipairs({ "Beakwoods", "Deadlands", "Mount Beaks", "Quill Lake" }) do
    local cleanName = name:gsub(" ", "")
    FarmSection:AddToggle({
		Title = "Auto Farming ".. name,
		Default = false,
		Callback = function(ChiuMyLy)
			Settings.AutoFarm[cleanName] = ChiuMyLy
                if v then
                    task.spawn(
                        function()
                            StartAutoFarm(name)
                        end
                    )
                end
		end,
	});
end
GeneralSection:AddToggle({
    Title = "Auto Shoot",
    Default = Settings.AutoFarm.AutoShoot,
    Callback = function(ChiuMyLy)
        Settings.AutoFarm.AutoShoot = ChiuMyLy
        Notifier.Notify({
            Title = "Spyder X",
            Description = ChiuMyLy and "Auto Shoot enabled!" or "Auto Shoot disabled!",
            Duration = 5
        })
    end,
});
GeneralSection:AddButton({
    Title = "AIMBOT",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/Addon/Game/Beaks/AIMBOT.lua", true))()
    end,
});
GeneralSection:AddToggle({
    Title = "Hitbox Expander",
    Default = false,
    Callback = function(ChiuMyLy)
        Settings.HitboxExpander = ChiuMyLy
        ExpandHitboxes(ChiuMyLy)
    end,
});
GeneralSection:AddSlider({
    Title = "Hitbox Size",
    Min = 5,
    Max = 80,
    Default = Settings.HitboxSize,
    Rounding = 1,
    Callback = function(ChiuMyLy)
        Settings.HitboxSize = ChiuMyLy
        if Settings.HitboxExpander then
            ExpandHitboxes(true)
        end
    end,
});
GeneralSection:AddToggle({
    Title = "Freeze Birds in Place",
    Default = Settings.AutoFarm.FreezeBirds,
    Callback = function(ChiuMyLy)
        Settings.AutoFarm.FreezeBirds = ChiuMyLy
            if value then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    Settings.AutoFarm.FreezePosition =
                        character.HumanoidRootPart.Position +
                        character.HumanoidRootPart.CFrame.LookVector * 10
                end
                for _, regionName in pairs({ "Beakwoods", "Deadlands", "Mount Beaks", "Quill Lake" }) do
                    local region = workspace.Regions:FindFirstChild(regionName)
                    if region then
                        local clientBirds = region:FindFirstChild("ClientBirds")
                        if clientBirds then
                            for _, bird in pairs(clientBirds:GetChildren()) do
                                if bird:IsA("Model") then
                                    for _, part in pairs(bird:GetDescendants()) do
                                        if part:IsA("BasePart") then
                                            part.Anchored = true
                                            part.CanCollide = false
                                            if not originalProperties[part] then
                                                originalProperties[part] = {
                                                    Anchored = part.Anchored,
                                                    CanCollide = part.CanCollide,
                                                    CFrame = part.CFrame
                                                }
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Birds will be frozen in place.",
                    Duration = 5
                })
            else
                for part, props in pairs(originalProperties) do
                    if part and part.Parent then
                        part.Anchored = props.Anchored
                        part.CanCollide = props.CanCollide
                    end
                end
                originalProperties = {}
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Birds are no longer frozen",
                    Duration = 5
                })
            end
    end,
});
GeneralSection:AddToggle({
    Title = "Auto Sell",
    Default = Settings.AutoSell,
    Callback = function(ChiuMyLy)
        Settings.AutoSell = ChiuMyLy
            if value then
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Auto Sell enabled! Will sell when inventory reaches " .. Settings.SellThreshold,
                    Duration = 5
                })
            end
    end,
});
GeneralSection:AddSlider({
    Title = "Sell Threshold",
    Min = 5,
    Max = 200,
    Default = Settings.SellThreshold,
    Rounding = 1,
    Callback = function(ChiuMyLy)
        Settings.SellThreshold = ChiuMyLy
    end,
});
GeneralSection:AddButton({
    Title = "Sell All Items",
    Callback = function()
        local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")
            local Seller =
                Workspace:FindFirstChild("Regions") and Workspace.Regions:FindFirstChild("Beakwoods") and
                Workspace.Regions.Beakwoods:FindFirstChild("Useable") and
                Workspace.Regions.Beakwoods.Useable:FindFirstChild("NeilBirdCollector")
            local Net =
                ReplicatedStorage:FindFirstChild("Util") and ReplicatedStorage.Util:FindFirstChild("Net")
            if not Seller or not Net then
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Could not find seller or network components.",
                    Duration = 5
                })
                return
            end
            local SellInventory = Net:FindFirstChild("RF/SellInventory")
            if not SellInventory then
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "SellInventory remote function not found.",
                    Duration = 5
                })
                return
            end
            local sellerCFrame = CFrame.new(515.973022, 154.072998, 45.8440018, -1, 0, 0, 0, 1, 0, 0, 0, -1)
            local originalCFrame = hrp.CFrame
            hrp.CFrame = sellerCFrame + Vector3.new(0, 5, 0)
            Notifier.Notify({
                Title = "Spyder X",
                Description = "Selling all items 5 times...",
                Duration = 5
            })
            for _ = 1, 5 do
                SellInventory:InvokeServer("All")
                task.wait(0.1)
            end
            hrp.CFrame = originalCFrame
            Notifier.Notify({
                Title = "Spyder X",
                Description = "Successfully sold all items!",
                Duration = 5
            })
    end,
});
AutoSection:AddToggle({
    Title = "Auto Buy Darts",
    Default = Settings.AutoDart,
    Callback = function(ChiuMyLy)
        Settings.AutoDart = ChiuMyLy
            if ChiuMyLy then
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Auto buying darts enabled!",
                    Duration = 5
                })
                while Settings.AutoDart do
                    ReplicatedStorage:WaitForChild("Util"):WaitForChild("Net"):WaitForChild("RF/DartRoll"):InvokeServer("Beakwoods")
                    task.wait(1)
                end
            else
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Auto buying darts disabled!",
                    Duration = 5
                })
            end
    end,
});
ESPSection:AddToggle({
    Title = "Enable Bird ESP",
    Default = false,
    Callback = function(ChiuMyLy)
        ToggleESP(ChiuMyLy)
    end,
});
ESPSection:AddToggle({
    Title = "Show Name",
    Default = false,
    Callback = function(ChiuMyLy)
        for bird, espData in pairs(ESPObjects) do
            for _, obj in pairs(espData) do
                if obj:IsA("BillboardGui") then
                    obj.Enabled = ChiuMyLy
                end
            end
        end
    end,
});
GeneralSection:AddSlider({
    Title = "ESP Transparency",
    Min = 1,
    Max = 100,
    Default = 0.5,
    Rounding = 1,
    Callback = function(ChiuMyLy)
        for bird, espData in pairs(ESPObjects) do
            for _, obj in pairs(espData) do
                if obj:IsA("Highlight") then
                    obj.FillTransparency = ChiuMyLy
                end
            end
        end
    end,
});
local FullbrightEnabled = false
GenMicsSection:AddToggle({
    Title = "Full Bright",
    Default = false,
    Callback = function(ChiuMyLy)
        FullbrightEnabled = ChiuMyLy
            local Lighting = game:GetService("Lighting")
            if Value then
                originalLighting = {
                    Brightness = Lighting.Brightness,
                    ClockTime = Lighting.ClockTime,
                    FogEnd = Lighting.FogEnd,
                    GlobalShadows = Lighting.GlobalShadows,
                    OutdoorAmbient = Lighting.OutdoorAmbient
                }
                task.spawn(
                    function()
                        while FullbrightEnabled do
                            Lighting.Brightness = 2
                            Lighting.ClockTime = 14
                            Lighting.FogEnd = 100000
                            Lighting.GlobalShadows = false
                            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                            task.wait(0.1)
                        end
                    end
                )
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Full Bright enabled!",
                    Duration = 5
                })
            else
                if originalLighting.Brightness then
                    Lighting.Brightness = originalLighting.Brightness
                    Lighting.ClockTime = originalLighting.ClockTime
                    Lighting.FogEnd = originalLighting.FogEnd
                    Lighting.GlobalShadows = originalLighting.GlobalShadows
                    Lighting.OutdoorAmbient = originalLighting.OutdoorAmbient
                else
                    Lighting.Brightness = 1
                    Lighting.ClockTime = 12
                    Lighting.FogEnd = 100000
                    Lighting.GlobalShadows = true
                    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                end
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Full Bright disabled!",
                    Duration = 5
                })
            end
    end,
});
GenMicsSection:AddToggle({
    Title = "No Fog",
    Default = false,
    Callback = function(ChiuMyLy)
        local Lighting = game:GetService("Lighting")
            if originalLighting.FogEnd == nil then
                originalLighting.FogEnd = Lighting.FogEnd
            end
            if Value then
                Lighting.FogEnd = 100000
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Fog removed!",
                    Duration = 5
                })
            else
                Lighting.FogEnd = originalLighting.FogEnd or 1000
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Fog restored!",
                    Duration = 5
                })
            end
    end,
});
GenMicsSection:AddToggle({
    Title = "Infinite Jump",
    Default = false,
    Callback = function(ChiuMyLy)
        Settings.InfiniteJump = ChiuMyLy
            if Value then
                UserInputService.JumpRequest:Connect(
                    function()
                        if Settings.InfiniteJump then
                            local character = LocalPlayer.Character
                            if character then
                                local humanoid = character:FindFirstChildOfClass("Humanoid")
                                if humanoid then
                                    humanoid:ChangeState("Jumping")
                                end
                            end
                        end
                    end
                )
            end
    end,
});
GenMicsSection:AddSlider({
    Title = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Rounding = 1,
    Callback = function(ChiuMyLy)
        Settings.WalkSpeed = ChiuMyLy
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = Value
                end
            end
    end,
});
local FLYING = false
local flyKeyDown, flyKeyUp
local IYMouse = game:GetService("Players").LocalPlayer:GetMouse()
local QEfly = true
local iyflyspeed = 200
local function getRoot(char)
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or
        char:FindFirstChild("UpperTorso")
end
local function sFLY()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    local root = getRoot(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not root or not humanoid then
        return
    end
    FLYING = true
    humanoid.PlatformStand = true
    local BG = Instance.new("BodyGyro", root)
    local BV = Instance.new("BodyVelocity", root)
    BG.P = 9e4
    BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BG.cframe = root.CFrame
    BV.velocity = Vector3.new(0, 0, 0)
    BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
    local CONTROL = { F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0 }
    local lCONTROL = { F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0 }
    local SPEED = 0
    if flyKeyDown then
        flyKeyDown:Disconnect()
    end
    if flyKeyUp then
        flyKeyUp:Disconnect()
    end
    flyKeyDown =
        IYMouse.KeyDown:Connect(
            function(KEY)
                local key = KEY:lower()
                local speed = iyflyspeed or 200
                if key == "w" then
                    CONTROL.F = speed
                elseif key == "s" then
                    CONTROL.B = -speed
                elseif key == "a" then
                    CONTROL.L = -speed
                elseif key == "d" then
                    CONTROL.R = speed
                elseif QEfly and key == "e" then
                    CONTROL.Q = speed * 2
                elseif QEfly and key == "q" then
                    CONTROL.E = -speed * 2
                end
                workspace.CurrentCamera.CameraType = Enum.CameraType.Track
            end
        )
    flyKeyUp =
        IYMouse.KeyUp:Connect(
            function(KEY)
                local key = KEY:lower()
                if key == "w" then
                    CONTROL.F = 0
                elseif key == "s" then
                    CONTROL.B = 0
                elseif key == "a" then
                    CONTROL.L = 0
                elseif key == "d" then
                    CONTROL.R = 0
                elseif key == "e" then
                    CONTROL.Q = 0
                elseif key == "q" then
                    CONTROL.E = 0
                end
            end
        )
    game:GetService("RunService").Heartbeat:Connect(
        function()
            if FLYING and root then
                if
                    (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or
                    (CONTROL.Q + CONTROL.E) ~= 0
                then
                    SPEED = 50
                    BV.velocity =
                        ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) +
                            ((workspace.CurrentCamera.CoordinateFrame *
                                    CFrame.new(
                                        CONTROL.L + CONTROL.R,
                                        (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2,
                                        0
                                    ).p -
                                    workspace.CurrentCamera.CoordinateFrame.p) *
                                SPEED))
                    lCONTROL = { F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R }
                else
                    BV.velocity = Vector3.new(0, 0, 0)
                end
                BG.cframe = workspace.CurrentCamera.CoordinateFrame
            end
        end
    )
end
local function NOFLY()
    FLYING = false
    local player = game:GetService("Players").LocalPlayer
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
        local root = getRoot(player.Character)
        if root then
            for _, v in pairs(root:GetChildren()) do
                if v:IsA("BodyGyro") or v:IsA("BodyVelocity") then
                    v:Destroy()
                end
            end
        end
    end
    if flyKeyDown then
        flyKeyDown:Disconnect()
    end
    if flyKeyUp then
        flyKeyUp:Disconnect()
    end
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end
GenMicsSection:AddToggle({
    Title = "FLY",
    Default = false,
    Callback = function(ChiuMyLy)
        if ChiuMyLy then
            sFLY()
            Notifier.Notify({
                Title = "Spyder X",
                Description = "Fly enabled! (WASD + Q/E)",
                Duration = 5
            })
        else
            NOFLY()
            Notifier.Notify({
                Title = "Spyder X",
                Description = "Fly disabled!",
                Duration = 5
            })
        end
    end,
});
GenMicsSection:AddSlider({
    Title = "Fly Speed",
    Min = 50,
    Max = 500,
    Default = 200,
    Rounding = 1,
    Callback = function(ChiuMyLy)
        iyflyspeed = ChiuMyLy
    end,
});
local teleportBirdsEnabled = false
local teleportBirdsTargetPos = nil
local function teleportBirds()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end
    local hrp = character.HumanoidRootPart
    local targetPos = hrp.Position + hrp.CFrame.RightVector * 6 + Vector3.new(0, 5, 0)
    local regions = workspace:FindFirstChild("Regions")
    if not regions then
        return
    end
    for _, map in ipairs(regions:GetChildren()) do
        local clientBirds = map:FindFirstChild("ClientBirds")
        if clientBirds then
            for _, bird in ipairs(clientBirds:GetChildren()) do
                if bird:IsA("Model") then
                    for _, part in ipairs(bird:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Anchored = true
                            part.CanCollide = false
                        end
                    end
                    local root = bird.PrimaryPart or bird:FindFirstChildWhichIsA("BasePart")
                    if root then
                        bird:PivotTo(CFrame.new(targetPos))
                    end
                end
            end
        end
    end
end
OPSection:AddToggle({
    Title = "Teleport All Birds to You",
    Default = false,
    Callback = function(ChiuMyLy)
        teleportBirdsEnabled = ChiuMyLy
            if ChiuMyLy then
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Birds will be teleported to you every second and frozen in place",
                    Duration = 5
                })
                task.spawn(
                    function()
                        while teleportBirdsEnabled do
                            teleportBirds()
                            task.wait(1)
                        end
                    end
                )
            else
                for part, props in pairs(originalProperties) do
                    if part and part.Parent then
                        part.Anchored = props.Anchored
                        part.CanCollide = props.CanCollide
                        part.CFrame = props.CFrame
                    end
                end
                originalProperties = {}
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Stopped teleporting birds and restored original properties",
                    Duration = 5
                })
            end
    end,
});
local Locations = {
    ["Beakwoods"] = CFrame.new(520, 160, 68),
    ["Deadlands"] = CFrame.new(-712, 25, -1486),
    ["Mount Beaks"] = CFrame.new(84, 240, 383),
    ["Quill Lake"] = CFrame.new(-303, 160, -488)
}
TeleportSection:AddButton({
    Title = "Teleport to Beakswood",
    Callback = function()
        local destination = Locations["Beakswood"]
            if destination then
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local hrp = character:WaitForChild("HumanoidRootPart")
                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                task.wait(0.1)
                hrp.CFrame = destination + Vector3.new(0, 5, 0)
                task.wait()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Teleported to Beakswood!",
                    Duration = 5
                })
            end
    end,
});
TeleportSection:AddButton({
    Title = "Teleport to Deadlands",
    Callback = function()
        local destination = Locations["Deadlands"]
            if destination then
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local hrp = character:WaitForChild("HumanoidRootPart")
                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                task.wait(0.1)
                hrp.CFrame = destination + Vector3.new(0, 5, 0)
                task.wait()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Teleported to Deadlands!",
                    Duration = 5
                })
            end
    end,
});
GeneralSection:AddButton({
    Title = "Teleport to Quill Lake",
    Callback = function()
        local destination = Locations["Quill Lake"]
            if destination then
                local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local hrp = character:WaitForChild("HumanoidRootPart")
                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                task.wait(0.1)
                hrp.CFrame = destination + Vector3.new(0, 5, 0)
                task.wait()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Teleported to Quill Lake!",
                    Duration = 5
                })
            end
    end,
});
TeleportSection:AddButton({
    Title = "Teleport to Random Bird",
    Callback = function()
        if not ClientBirds then
            Notifier.Notify({
                Title = "Spyder X",
                Description = "Client Birds not found!",
                Duration = 5
            })
            return
        end
        local birds = {}
        for _, bird in ipairs(ClientBirds:GetChildren()) do
            if bird:IsA("Model") then
                local primaryPart = bird.PrimaryPart or bird:FindFirstChildWhichIsA("BasePart")
                if primaryPart then
                    table.insert(birds, bird)
                end
            end
        end
        if #birds > 0 then
            local randomBird = birds[math.random(1, #birds)]
            local primaryPart = randomBird.PrimaryPart or randomBird:FindFirstChildWhichIsA("BasePart")
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")
            if hrp and primaryPart then
                hrp.CFrame = CFrame.new(primaryPart.Position + Vector3.new(0, 5, 0))
                Notifier.Notify({
                    Title = "Spyder X",
                    Description = "Teleported to random bird",
                    Duration = 5
                })
            end
        else
            Notifier.Notify({
                Title = "Spyder X",
                Description = "No birds found in Client Birds!",
                Duration = 5
            })
        end
    end,
});
local function GetRandomBird(region)
    local clientBirds =
        workspace.Regions:FindFirstChild(region) and workspace.Regions[region]:FindFirstChild("ClientBirds")
    if not clientBirds then
        return nil
    end
    local validBirds = {}
    for _, bird in ipairs(clientBirds:GetChildren()) do
        if bird:IsA("Model") then
            local success, pivot =
                pcall(
                    function()
                        return bird:GetPivot()
                    end
                )
            if success and pivot then
                local playerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                if math.abs(pivot.Position.Y - playerPos.Y) <= 40 then
                    table.insert(validBirds, bird)
                end
            end
        end
    end
    if #validBirds > 0 then
        return validBirds[math.random(1, #validBirds)]
    end
    return nil
end
local function StartAutoFarm(region)
    local player = game.Players.LocalPlayer
    local Camera = workspace.CurrentCamera
    local tweenService = game:GetService("TweenService")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local RunService = game:GetService("RunService")
    local CurrentBird, CurrentTween, LastBirdSwitch = nil, nil, 0
    local originalGravity = workspace.Gravity
    workspace.Gravity = 10
    local clientBirds =
        workspace.Regions:FindFirstChild(region) and workspace.Regions[region]:FindFirstChild("ClientBirds")
    if not clientBirds then
        return
    end
    while Settings.AutoFarm[region:gsub(" ", "")] do
        task.wait(0.05)
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local now = os.clock()
            if not CurrentBird or (now - LastBirdSwitch) > Settings.AutoFarm.BirdDuration then
                CurrentBird = GetRandomBird(region)
                LastBirdSwitch = now
                if CurrentTween then
                    CurrentTween:Cancel()
                end
            end
            if CurrentBird then
                local success, pivot =
                    pcall(
                        function()
                            return CurrentBird:GetPivot()
                        end
                    )
                if success and pivot then
                    local offset = Vector3.new(0, 3, 8)
                    local targetPos = pivot.Position + offset
                    local targetCFrame = CFrame.new(targetPos, pivot.Position)
                    CurrentTween =
                        tweenService:Create(
                            hrp,
                            TweenInfo.new(
                                Settings.AutoFarm.TweenDuration,
                                Settings.AutoFarm.EasingStyle,
                                Settings.AutoFarm.EasingDirection
                            ),
                            { CFrame = targetCFrame }
                        )
                    CurrentTween:Play()
                    local followStart = os.clock()
                    while os.clock() - followStart < Settings.AutoFarm.BirdDuration and
                        Settings.AutoFarm[region:gsub(" ", "")] do
                        local pivotSuccess, pivotUpdate =
                            pcall(
                                function()
                                    return CurrentBird:GetPivot()
                                end
                            )
                        if pivotSuccess then
                            local aimPos = pivotUpdate.Position
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, aimPos)
                            if Settings.AutoFarm.AutoShoot then
                                local screenPoint = Camera:WorldToViewportPoint(aimPos)
                                local shootX =
                                    screenPoint.X +
                                    ((math.random() - 0.5) * Settings.AutoFarm.ShootVariance * 50)
                                local shootY =
                                    screenPoint.Y +
                                    ((math.random() - 0.5) * Settings.AutoFarm.ShootVariance * 30)
                                VirtualInputManager:SendMouseButtonEvent(shootX, shootY, 0, true, game, 1)
                                task.wait(0.02 + math.random() * 0.03)
                                VirtualInputManager:SendMouseButtonEvent(shootX, shootY, 0, false, game, 1)
                            end
                        end
                        task.wait(0.1)
                    end
                end
            end
        end
    end
    if CurrentTween then
        CurrentTween:Cancel()
    end
    workspace.Gravity = originalGravity
end
RunService.Heartbeat:Connect(
    function()
        if game:GetService("Workspace").DistributedGameTime then
            StartAutoFarmLoop()
        end
    end
)
LocalPlayer.CharacterAdded:Connect(
    function(character)
        CurrentBird = nil
        if CurrentTween then
            CurrentTween:Cancel()
            CurrentTween = nil
        end
        task.wait(0.5)
    end
)
