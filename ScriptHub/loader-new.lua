local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

loadstring([[
	function LPH_NO_VIRTUALIZE(f) return f end;

	function LPH_JIT(f) return f end;

	function LPH_JIT_MAX(f) return f end;
]])();

local player = game.Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

local ScreenGui1 = Instance.new("ScreenGui")
local ImageButton1 = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local sound = Instance.new("Sound")

sound.Parent = ImageButton1
sound.SoundId = "rbxassetid://130785805"

ScreenGui1.Name = "ImageButton"
ScreenGui1.Parent = game.CoreGui
ScreenGui1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton1.Parent = ScreenGui1
ImageButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton1.BorderSizePixel = 0
ImageButton1.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton1.Size = UDim2.new(0, 50, 0, 50)
ImageButton1.Draggable = true
ImageButton1.Image = "rbxassetid://131489183118092"
ImageButton1.MouseButton1Down:connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftAlt, false, game)
    sound:Play()
end)
UICorner.Parent = ImageButton1
UIStroke.Color = Color3.fromRGB(252, 3, 161)
UIStroke.Thickness = 1.5
UIStroke.Parent = ImageButton1

local TARGET_PLACE_IDS = {
    [18192562963] = function()
           loadstring(game:HttpGet('https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/File/CDVN.lua'))()
    end,      -- Cộng Đồng Việt Nam
    [10260193230] = function()
           loadstring(game:HttpGet('https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/File/memesea.lua'))()
    end,      -- Meme Sea
    [122678592501168] = function()
           loadstring(game:HttpGet('https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/File/Beaks.lua'))()
    end,       -- Beaks
    [17334984034] = function()
           loadstring(game:HttpGet('https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/File/AnimeKingdomSimulator.lua'))()
    end        -- Anime Kingdom Simulator
}

local THEME = {
    Dark = Color3.fromRGB(15, 15, 20),
    Medium = Color3.fromRGB(30, 30, 40),
    Light = Color3.fromRGB(50, 50, 65),
    Accent = Color3.fromRGB(0, 255, 170),
    Text = Color3.fromRGB(240, 240, 240),
    Error = Color3.fromRGB(255, 60, 60)
}

local function createLoader()
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    if playerGui:FindFirstChild("SpyderXLoader") then
        playerGui.SpyderXLoader:Destroy()
    end
    
    local loaderGui = Instance.new("ScreenGui")
    loaderGui.Name = "SpyderXLoader"
    loaderGui.ResetOnSpawn = false
    loaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    loaderGui.IgnoreGuiInset = true
    loaderGui.Parent = playerGui
    
    local blurEffect = Instance.new("BlurEffect")
    blurEffect.Size = 0
    blurEffect.Parent = Lighting
    
    local darkOverlay = Instance.new("Frame")
    darkOverlay.Name = "DarkOverlay"
    darkOverlay.Size = UDim2.new(1, 0, 1, 0)
    darkOverlay.BackgroundColor3 = Color3.new(0, 0, 0)
    darkOverlay.BackgroundTransparency = 0.71
    darkOverlay.Parent = loaderGui
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 450, 0, 350)
    mainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
    mainFrame.SizeConstraint = Enum.SizeConstraint.RelativeXY
    mainFrame.AutomaticSize = Enum.AutomaticSize.None
    mainFrame.BackgroundColor3 = THEME.Dark
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = loaderGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 14)
    corner.Parent = mainFrame
    
    local borderGlow = Instance.new("Frame")
    borderGlow.Name = "BorderGlow"
    borderGlow.Size = UDim2.new(1, 10, 1, 10)
    borderGlow.Position = UDim2.new(0, -5, 0, -5)
    borderGlow.BackgroundColor3 = THEME.Accent
    borderGlow.BackgroundTransparency = 0.1
    borderGlow.ZIndex = -1
    borderGlow.Parent = mainFrame
    
    local borderCorner = Instance.new("UICorner")
    borderCorner.CornerRadius = UDim.new(0, 16)
    borderCorner.Parent = borderGlow
    
    coroutine.wrap(function()
        while borderGlow.Parent do
            TweenService:Create(borderGlow, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.7}):Play()
            wait(1.5)
            TweenService:Create(borderGlow, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {BackgroundTransparency = 0.9}):Play()
            wait(1.5)
        end
    end)()
    
    local logo = Instance.new("ImageLabel")
    logo.Name = "Logo"
    logo.Image = "rbxassetid://103733198839928" -- Your logo asset ID
    logo.Size = UDim2.new(0, 100, 0, 100)
    logo.Position = UDim2.new(0.5, -50, 0.2, -50)
    logo.BackgroundTransparency = 1
    logo.Parent = mainFrame
    
    coroutine.wrap(function()
        while logo.Parent do
            TweenService:Create(logo, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Rotation = 5}):Play()
            wait(2)
            TweenService:Create(logo, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Rotation = -5}):Play()
            wait(2)
            TweenService:Create(logo, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Rotation = 0}):Play()
            wait(1)
        end
    end)()
    
    local titleContainer = Instance.new("Frame")
    titleContainer.Name = "TitleContainer"
    titleContainer.Size = UDim2.new(0.8, 0, 0, 40)
    titleContainer.Position = UDim2.new(0.1, 0, 0.45, 0)
    titleContainer.BackgroundTransparency = 1
    titleContainer.Parent = mainFrame
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Text = "SPYDER X SYSTEM"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 24
    title.TextColor3 = THEME.Text
    title.Size = UDim2.new(1, 0, 1, 0)
    title.BackgroundTransparency = 1
    title.Parent = titleContainer
    
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, THEME.Accent),
        ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)),
        ColorSequenceKeypoint.new(1, THEME.Accent)
    })
    gradient.Rotation = 90
    gradient.Parent = title
    
    local progressContainer = Instance.new("Frame")
    progressContainer.Name = "ProgressContainer"
    progressContainer.Size = UDim2.new(0.8, 0, 0, 20)
    progressContainer.Position = UDim2.new(0.1, 0, 0.65, 0)
    progressContainer.BackgroundColor3 = THEME.Medium
    progressContainer.BorderSizePixel = 0
    progressContainer.Parent = mainFrame
    
    local progressFill = Instance.new("Frame")
    progressFill.Name = "ProgressFill"
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = THEME.Accent
    progressFill.BorderSizePixel = 0
    progressFill.Parent = progressContainer
    
    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(0, 10)
    progressCorner.Parent = progressContainer
    progressCorner:Clone().Parent = progressFill
    
    local percentText = Instance.new("TextLabel")
    percentText.Name = "PercentText"
    percentText.Text = "0%"
    percentText.Font = Enum.Font.GothamBold
    percentText.TextSize = 18
    percentText.TextColor3 = THEME.Text
    percentText.Size = UDim2.new(1, 0, 0, 30)
    percentText.Position = UDim2.new(0, 0, 0.75, 0)
    percentText.BackgroundTransparency = 1
    percentText.Parent = mainFrame
    
    local statusText = Instance.new("TextLabel")
    statusText.Name = "StatusText"
    statusText.Text = "Initializing Spyder X system..."
    statusText.Font = Enum.Font.Gotham
    statusText.TextSize = 14
    statusText.TextColor3 = THEME.Text
    statusText.TextTransparency = 0.3
    statusText.Size = UDim2.new(1, 0, 0, 20)
    statusText.Position = UDim2.new(0, 0, 0.85, 0)
    statusText.BackgroundTransparency = 1
    statusText.Parent = mainFrame
    
    local securityBadge = Instance.new("Frame")
    securityBadge.Name = "SecurityBadge"
    securityBadge.Size = UDim2.new(0, 120, 0, 30)
    securityBadge.Position = UDim2.new(0.5, -60, 0.95, -15)
    securityBadge.BackgroundColor3 = THEME.Medium
    securityBadge.Parent = mainFrame
    
    local securityCorner = Instance.new("UICorner")
    securityCorner.CornerRadius = UDim.new(0, 15)
    securityCorner.Parent = securityBadge
    
    local securityText = Instance.new("TextLabel")
    securityText.Name = "SecurityText"
    securityText.Text = "SECURE CONNECTION"
    securityText.Font = Enum.Font.GothamMedium
    securityText.TextSize = 12
    securityText.TextColor3 = THEME.Accent
    securityText.Size = UDim2.new(1, 0, 1, 0)
    securityText.BackgroundTransparency = 1
    securityText.Parent = securityBadge
    
    TweenService:Create(blurEffect, TweenInfo.new(0.5), {Size = 24}):Play()
    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    mainFrame.Visible = true
    TweenService:Create(mainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 450, 0, 350)}):Play()
    
    return {
        Gui = loaderGui,
        Update = function(progress, message)
            progressFill:TweenSize(
                UDim2.new(progress, 0, 1, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.3,
                true
            )
            percentText.Text = math.floor(progress * 100) .. "%"
            statusText.Text = message or "Processing..."
        end,
        Close = function()
            local fadeOutMain = TweenService:Create(mainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1})
            local fadeOutTitle = TweenService:Create(title, TweenInfo.new(0.5), {TextTransparency = 1})
            local fadeOutPercent = TweenService:Create(percentText, TweenInfo.new(0.5), {TextTransparency = 1})
            local fadeOutStatus = TweenService:Create(statusText, TweenInfo.new(0.5), {TextTransparency = 1})
            local fadeOutSecurity = TweenService:Create(securityText, TweenInfo.new(0.5), {TextTransparency = 1})
            fadeOutMain:Play()
            fadeOutTitle:Play()
            fadeOutPercent:Play()
            fadeOutStatus:Play()
            fadeOutSecurity:Play()
            TweenService:Create(Lighting:FindFirstChildOfClass("BlurEffect"), TweenInfo.new(0.5), {Size = 0}):Play()
            task.delay(0.6, function()
                if loaderGui then loaderGui:Destroy() end
                local blur = Lighting:FindFirstChildOfClass("BlurEffect")
                if blur then blur:Destroy() end
                blurEffect:Destroy()
            end)
        end,
        ShowError = function(message)
            statusText.TextColor3 = THEME.Error
            statusText.Text = message
            progressFill.BackgroundColor3 = THEME.Error
            securityText.Text = "SECURITY ALERT"
            securityText.TextColor3 = THEME.Error
        end
    }
end

local loader = createLoader()

local loadSteps = {
    {progress = 0.1, message = "Verifying system integrity..."},
    {progress = 0.3, message = "Checking PlaceID..."},
    {progress = 0.6, message = "Authenticating..."},
    {progress = 0.9, message = "Finalizing setup..."},
    {progress = 1.0, message = "Ready to engage!"}
}

for _, step in ipairs(loadSteps) do
    loader.Update(step.progress, step.message)
    wait(0.5 + math.random() * 0.5)
end

local currentPlaceId = game.PlaceId
if TARGET_PLACE_IDS[currentPlaceId] then
    loader.Update(1.0, "PlaceID Đã Xác Minh: "..currentPlaceId)
    wait(1)
    loader.Close()
    TARGET_PLACE_IDS[currentPlaceId]()
else
    loader.ShowError("Không Hỗ Trợ PlaceID: "..currentPlaceId)
    wait(3)
    loader.Close()
    game.Players.LocalPlayer:Kick("Game Not Support !! | discord.gg/VM7ESrzccs")
end
