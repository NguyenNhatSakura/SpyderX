local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BeaksAimBot"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 150)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "Beaks AimBot"
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = mainFrame

local regions = {
    "Beakwoods",
    "Deadlands",
    "Mount Beaks",
    "Quill Lake"
}

local toggles = {}

for i, regionName in ipairs(regions) do
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = regionName .. "Toggle"
    toggleFrame.Size = UDim2.new(1, -10, 0, 25)
    toggleFrame.Position = UDim2.new(0, 5, 0, 30 + (i-1)*30)
    toggleFrame.BackgroundTransparency = 1
    toggleFrame.Parent = mainFrame
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0, 20, 0, 20)
    toggleButton.Position = UDim2.new(0, 0, 0.5, -10)
    toggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    toggleButton.Text = ""
    toggleButton.Parent = toggleFrame
    
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Name = "ToggleLabel"
    toggleLabel.Text = regionName
    toggleLabel.Size = UDim2.new(1, -25, 1, 0)
    toggleLabel.Position = UDim2.new(0, 25, 0, 0)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.Font = Enum.Font.SourceSans
    toggleLabel.TextSize = 14
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    toggleLabel.Parent = toggleFrame
    
    toggles[regionName] = {
        button = toggleButton,
        active = false,
        regionPath = "Workspace.Regions." .. regionName .. ".ClientBirds"
    }
    
    toggleButton.MouseButton1Click:Connect(function()
        toggles[regionName].active = not toggles[regionName].active
        if toggles[regionName].active then
            toggleButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            for otherName, otherToggle in pairs(toggles) do
                if otherName ~= regionName and otherToggle.active then
                    otherToggle.active = false
                    otherToggle.button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                end
            end
        else
            toggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        end
    end)
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local function findNearestBird(regionPath)
    local region = game:GetService("Workspace"):FindFirstChild("Regions")
    if not region then return nil end
    
    local pathParts = string.split(regionPath, ".")
    local current = region
    
    for _, part in ipairs(pathParts) do
        if part == "Regions" then continue end
        current = current:FindFirstChild(part)
        if not current then return nil end
    end
    
    if not current:IsA("Folder") and not current:IsA("Model") then return nil end
    
    local nearestBird = nil
    local nearestDistance = math.huge
    local localCharacter = localPlayer.Character
    if not localCharacter then return nil end
    local localRoot = localCharacter:FindFirstChild("HumanoidRootPart")
    if not localRoot then return nil end
    
    for _, bird in ipairs(current:GetChildren()) do
        if bird:IsA("Model") then
            local birdRoot = bird:FindFirstChild("HumanoidRootPart") or bird:FindFirstChild("Head")
            if birdRoot then
                local distance = (localRoot.Position - birdRoot.Position).Magnitude
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearestBird = birdRoot
                end
            end
        end
    end
    
    return nearestBird
end

RunService.RenderStepped:Connect(function()
    local activeRegion = nil
    for regionName, toggle in pairs(toggles) do
        if toggle.active then
            activeRegion = toggle.regionPath
            break
        end
    end
    
    if activeRegion then
        local nearestBird = findNearestBird(activeRegion)
        if nearestBird then
            camera.CFrame = CFrame.new(camera.CFrame.Position, nearestBird.Position)
        end
    end
end)
