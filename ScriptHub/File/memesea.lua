repeat wait() until game:IsLoaded()
pcall(function()
    repeat
        wait()
        for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.PlayBackground.Play.Activated)) do
            v.Function()
        end
    until not game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Enabled
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Spyder X",
    Text = "Loading...",
    Duration = 5
})
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/UI/SpyderXLib/main.lua"))();
local Notifier = loadstring(game:HttpGet('https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/UI/SpyderXLib/notification.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/NguyenNhatSakura/SpyderX/refs/heads/main/ScriptHub/Systems/information.lua'))()

local Window = Library.new({
	Title = "Spyder X | Meme Sea",
})
-------------------------------------------------
local informationTab = Window:AddTab({
	Title = "information",
	Icon = "info"
});

local informationSection = informationTab:AddSection({
	Title = "Developers"
});

local UpdateLogSection = informationTab:AddSection({
	Title = "Update Log"
});

local StatusSection = informationTab:AddSection({
	Title = "Status"
});
-------------------------------------------------
local TabTrangChu = Window:AddTab({
	Title = "Tab General",
});

local GeneralSection = TabTrangChu:AddSection({
	Title = "General"
});

local GeneralAuto = TabTrangChu:AddSection({
	Title = "Automatics"
});

local GeneralStats = TabTrangChu:AddSection({
	Title = "Stats Upgrade"
});
-------------------------------------------
local TabNPC = Window:AddTab({
	Title = "Tab NPC",
});

local NPCSection = TabNPC:AddSection({
	Title = "General"
});
--------------------------------------------
local TabMisc = Window:AddTab({
	Title = "Tab Miscellaneous",
});

local MicsSection = TabMisc:AddSection({
	Title = "General"
});

local GachaSection = TabMisc:AddSection({
	Title = "Gacha (Random)"
});

local ShopSection = TabMisc:AddSection({
	Title = "Shop/Store"
});
----------------------------------------------
informationSection:AddParagraph({
		Title = 'Thông Báo/Notification:',
		Content = "" .._G.ThongBao
	})

informationSection:AddParagraph({
		Title = 'Note:',
        Content = "Join Discord Server To Suggest, Get Announcements, Request Bug Fixes !! (Follow Me On Platforms)."
	})

    informationSection:AddButton({
		Title = "Join Discord Sever",
		Callback = function()
			setclipboard(_G.Discord)
            Notifier.Notify({
                Title = "Spyder X",
                Description = "Copied successfully to clipboard.",
                Duration = 5
            })
		end,
	});

    informationSection:AddButton({
		Title = "Subscribe My Channel",
		Callback = function()
			setclipboard(_G.YouTuBe)
            Notifier.Notify({
                Title = "Spyder X",
                Description = "Copied successfully to clipboard.",
                Duration = 5
            })
		end,
	});

    informationSection:AddButton({
		Title = "Follow Me On TikTok",
		Callback = function()
			setclipboard(_G.TikTok)
            Notifier.Notify({
                Title = "Spyder X",
                Description = "Copied successfully to clipboard.",
                Duration = 5
            })
		end,
	});
-------------------------------------------------
UpdateLogSection:AddParagraph({
    Title = 'Note:',
    Content = "[+] = Update/Add | [-] = Delete/Remove | [#] = Fixing"
})
UpdateLogSection:AddParagraph({
    Title = '[+] New Ui',
    Content = ""
})
UpdateLogSection:AddParagraph({
    Title = '[#] Auto Farming',
    Content = ""
})
UpdateLogSection:AddParagraph({
    Title = '[#] Crash/Kick',
    Content = ""
})
UpdateLogSection:AddParagraph({
    Title = '[#] Fast Attack',
    Content = ""
})
-------------------------------------------------
local fpsParagraph = StatusSection:AddParagraph({ Title = 'FPS:', Content = "N/A" })
local pingParagraph = StatusSection:AddParagraph({ Title = 'PING:', Content = "N/A" })
local playTimeParagraph = StatusSection:AddParagraph({ Title = 'Play Time:', Content = "N/A" })
local playerCountParagraph = StatusSection:AddParagraph({ Title = 'Players:', Content = "N/A" })
local serverAgeParagraph = StatusSection:AddParagraph({ Title = 'Server Age:', Content = "N/A" })
local positionParagraph = StatusSection:AddParagraph({ Title = 'Position:', Content = "N/A" })
local deviceParagraph = StatusSection:AddParagraph({ Title = 'Device:', Content = "N/A" })
local healthParagraph = StatusSection:AddParagraph({ Title = 'Health:', Content = "N/A" })
local walkspeedParagraph = StatusSection:AddParagraph({ Title = 'WalkSpeed:', Content = "N/A" })
local jumppowerParagraph = StatusSection:AddParagraph({ Title = 'JumpPower:', Content = "N/A" })
local gameNameParagraph = StatusSection:AddParagraph({ Title = 'Game Name:', Content = "N/A" })
local placeIdParagraph = StatusSection:AddParagraph({ Title = 'Place ID:', Content = "N/A" })
local jobIdParagraph = StatusSection:AddParagraph({ Title = 'Job ID:', Content = "N/A" })
local ipParagraph = StatusSection:AddParagraph({ Title = 'Server IP:', Content = "N/A" })
local uuidParagraph = StatusSection:AddParagraph({ Title = 'ID:', Content = "N/A" })
------------------------------------------
getgenv().Options = {}
function notify(title, content, time)
    Notifier.Notify({
        Title = title,
        Description = content,
        Duration = time
    })
end

local Config = {
    ["AutoFarm"] = false,
    ["Amount"] = 1,
    ["Stats"] = {
        ["Melee"] = false,
        ["Defense"] = false
    },
    ["Weapon"] = "",
    ["AutoSkillKeyCode"] = {
        ["Z"] = false
    },
    ["Distance"] = 0,
    ["HoldZ"] = 0,
    ["HoldX"] = 0,
    ["HoldC"] = 0,
    ["HoldV"] = 0,
}

function Save(i, v)
    if i ~= nil then
        Config[i] = v
    end
    if not isfolder("Spyder X") then
        makefolder("Spyder X")
    end
    writefile("Spyder X" .. "/" .. "MemeSea-" .. game.Players.LocalPlayer.Name .. ".json",
        game:GetService("HttpService"):JSONEncode(Config))
end

function read()
    if not isfolder("Spyder X") then
        makefolder("Spyder X")
    end
    if not pcall(function() readfile("Spyder X/MemeSea-" .. game.Players.LocalPlayer.Name .. ".json") end) then
        writefile("Spyder X/MemeSea-" .. game.Players.LocalPlayer.Name .. ".json",
            game:GetService("HttpService"):JSONEncode(Config))
    end
    for key, value in pairs(game:GetService("HttpService"):JSONDecode(readfile("Spyder X/MemeSea-" .. game.Players.LocalPlayer.Name .. ".json"))) do
        Config[key] = value
    end
end

read()
function getnamequest()
    local a = require(game:GetService("ReplicatedStorage").ModuleScript.Quest_Settings)
    local level = game:GetService("Players").LocalPlayer.PlayerData.Level.Value

    local closestQuest = nil
    local closestDifference = math.huge

    for i, v in pairs(a) do
        if v.LevelNeed <= level and not v.Special_Quest and v.LevelNeed ~= 1100 and v.LevelNeed ~= 1550 and v.LevelNeed ~= 1400 and string.find(i, "Floppa Quest") then
            local difference = level - v.LevelNeed
            if difference <= closestDifference then
                closestQuest = i
                closestDifference = difference
            end
        end
    end
    return closestQuest
end

function getmob()
    local a = require(game:GetService("ReplicatedStorage").ModuleScript.Quest_Settings)
    local level = game:GetService("Players").LocalPlayer.PlayerData.Level.Value

    local mob = nil
    local closestDifference = math.huge

    for i, v in pairs(a) do
        if v.LevelNeed <= level and not v.Special_Quest and v.LevelNeed ~= 1100 and v.LevelNeed ~= 1550 and v.LevelNeed ~= 1400 and string.find(i, "Floppa Quest") then
            local difference = level - v.LevelNeed
            if difference <= closestDifference then
                mob = v.Target
                closestDifference = difference
            end
        end
    end
    return mob
end

local plr = game.Players.LocalPlayer
function DetectQuest()
    if game.workspace.Location.QuestLocaion:FindFirstChild(getnamequest()) then
        for i, v in pairs(game.workspace.Location.QuestLocaion:GetChildren()) do
            if v.Name == getnamequest() then
                return v.CFrame, v
            end
        end
    else
        for i, v in pairs(workspace.NPCs.Quests_Npc:GetChildren()) do
            if v.Name == getnamequest() then
                return v.WorldPivot, v
            end
        end
    end
end

function getquest()
    local QuestPos, Quest = DetectQuest()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = QuestPos
    local PromptQuest = workspace.NPCs.Quests_Npc:FindFirstChild(Quest.Name)
    if PromptQuest then
        if plr:DistanceFromCharacter(PromptQuest.Block.Position) < 8 then
            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ProximityPrompts") and game:GetService("Players").LocalPlayer.PlayerGui.ProximityPrompts:FindFirstChild("Prompt") and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
                fireproximityprompt(PromptQuest.Block.QuestPrompt)
            end
            wait(0.5)
        end
    end
end

function noclip()
    if plr.Character:FindFirstChild("HumanoidRootPart") and not plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
        local BV = Instance.new("BodyVelocity")
        BV.Parent = plr.Character.HumanoidRootPart
        BV.Name = "EffectsSY"
        BV.MaxForce = Vector3.new(100000, 100000, 100000)
        BV.Velocity = Vector3.new(0, 0, 0)
    end
end

function destroynoclip()
    if plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
        plr.Character.HumanoidRootPart.EffectsSY:Destroy()
    end
end

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if Options["Auto Farm Level"].Value or Options["Auto Raid"].Value then
            noclip()
        end
        if not Options["Auto Farm Level"].Value and not Options["Auto Raid"].Value then
            destroynoclip()
        end
    end)
end)
function function0(a)
    if a:FindFirstChild("Humanoid") and a:FindFirstChild("HumanoidRootPart") then
        return true
    else
        return false
    end
end

function function01(tb)
    tb2 = 0
    for i, v in pairs(tb) do
        if v > tb2 then tb2 = v end
    end
    return tb2
end

function function1()
    local s = {}
    local s3 = false
    for _, t1 in pairs(workspace.Monster:GetChildren()) do
        if function0(t1) then
            for _, t2 in pairs(workspace.Monster:GetChildren()) do
                if function0(t2) and function0(t1) then
                    if (t2.HumanoidRootPart.Position - t1.HumanoidRootPart.Position).Magnitude <= 1000 then
                        if not s[t1.HumanoidRootPart.CFrame] then
                            s[t1.HumanoidRootPart.CFrame] = 1
                        else
                            s[t1.HumanoidRootPart.CFrame] = s[t1.HumanoidRootPart.CFrame] + 1
                        end
                    end
                end
            end
        end
    end
    local s2 = function01(s)
    for i, v in pairs(s) do
        if v == s2 then
            s3 = i
        end
    end
    return s3;
end

function sizepart(v)
    if not v.PrimaryPart:FindFirstChild("vando") and plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 1000 then
        local lock = Instance.new("BodyVelocity")
        lock.Parent = v.PrimaryPart
        lock.Name = "vando"
        lock.MaxForce = Vector3.new(0, 10000, 0)
        lock.Velocity = Vector3.new(0, 0, 0)
    end
end

local TargetBring
local PositionBring
function ValueMob(a)
    local b = 0
    for i, v in pairs(workspace.Monster:GetChildren()) do
        if v.Name == a.Name then
            b = b + 1
        end
    end
    return b
end

function BringMob(a)
    pcall(function()
        if TargetBring ~= a then
            TargetBring = a
            PositionBring = a.PrimaryPart.CFrame
        end
        if ValueMob(a) > 1 then
            for i, v in pairs(workspace.Monster:GetChildren()) do
                if v.Name == a.Name and a:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    v.PrimaryPart.CFrame = PositionBring
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.CFrame.Position).Magnitude <= 1000 then
                        sizepart(v)
                    end
                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                end
            end
        end
    end)
end

local function equiptool(toolname)
    pcall(function()
        if game:GetService('Players').LocalPlayer:WaitForChild('Backpack'):FindFirstChild(toolname) and game:GetService('Players').LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService('Players').LocalPlayer.Character.Humanoid.Health > 0 then
            game:GetService('Players').LocalPlayer.Character:WaitForChild('Humanoid'):EquipTool(game:GetService(
                'Players').LocalPlayer:WaitForChild('Backpack'):FindFirstChild(toolname))
        end
    end)
end
function DetectMob()
    for i, v in pairs(workspace.Monster:GetChildren()) do
        if v.Name == getmob() and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
end

function useskill(weapon, skill)
    if getgenv().posaim then
        local args = {
            [1] = workspace:WaitForChild("Character"):WaitForChild(plr.Name),
            [2] = weapon,
            [3] = skill,
            [4] = "Hold",
            [5] = {
                ["Mouse_Position"] = getgenv().posaim,
                ["Hit_Position"] = getgenv().posaim
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("SkillEvents"):WaitForChild(
            "Server_Skills"):FireServer(unpack(args))
        local args = {
            [1] = workspace:WaitForChild("Character"):WaitForChild(plr.Name),
            [2] = weapon,
            [3] = skill,
            [4] = "Release",
            [5] = {
                ["Mouse_Position"] = getgenv().posaim,
                ["Hit_Position"] = getgenv().posaim
            }
        }

        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("SkillEvents"):WaitForChild(
            "Server_Skills"):FireServer(unpack(args))
    end
end

local VirtualUser = game:GetService("VirtualUser")
function spamskillautofarm()
    if Config["AutoSkill"] then
        spawn(function()
            if Config["AutoSkillKeyCode"]["Z"] then
                spawn(function()
                    useskill(Config.Weapon, "Z")
                end)
            end
        end)
        spawn(function()
            if Config["AutoSkillKeyCode"]["X"] then
                spawn(function()
                    useskill(Config.Weapon, "X")
                end)
            end
        end)
        spawn(function()
            if Config["AutoSkillKeyCode"]["C"] then
                spawn(function()
                    useskill(Config.Weapon, "C")
                end)
            end
        end)
        spawn(function()
            if Config["AutoSkillKeyCode"]["V"] then
                spawn(function()
                    useskill(Config.Weapon, "V")
                end)
            end
        end)
    end
end

function honglampromax()
    if not Config["AutoSkill"] then
        VirtualUser:CaptureController()
        VirtualUser:Button1Down(Vector2.new(1e4, 1e4))
    else
        spamskillautofarm()
    end
end

local click = false
spawn(function()
    while wait() do
        if click then
            VirtualUser:CaptureController()
            VirtualUser:Button1Down(Vector2.new(1e4, 1e4))
        end
    end
end)
function Tp(v)
    if v:FindFirstChild("Humanoid") then
        if v.Humanoid.Health > 0 then
            plr.Character:SetPrimaryPartCFrame(v.PrimaryPart.CFrame *
                CFrame.new(0, Config.Distance, 0) *
                CFrame.Angles(math.rad(-90), 0, 0))
        end
    end
end

spawn(function()
    pcall(function()
        while wait() do
            local a, b = pcall(function()
                if Config["AutoFarm"] then
                    if plr.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
                        getquest()
                    else
                        if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= getnamequest() then
                            for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
                                v.Function()
                            end
                        end
                        local v = DetectMob()
                        if v then
                            click = true
                            repeat
                                task.wait()
                                spawn(function()
                                    equiptool(Config["Weapon"])
                                end)
                                BringMob(v)
                                Tp(v)
                                spawn(function()
                                    honglampromax()
                                end)
                                getgenv().posaim = v.PrimaryPart.CFrame.Position
                            until not v or not v.Parent or not v.PrimaryPart or not v.Humanoid or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false or not Options["Auto Farm Level"].Value or not Config["AutoFarm"]
                            click = false
                        end
                    end
                end
            end)
        end
    end)
end)

spawn(function()
    while wait() do
        if Config["Auto Upgrade Stats"] then
            spawn(function()
                if Config["Stats"]["Defense"] then
                    local args = {
                        [1] = {
                            ["Target"] = "DefenseLevel",
                            ["Action"] = "UpgradeStats",
                            ["Amount"] = Config.Amount
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "StatsFunction"):InvokeServer(unpack(args))
                end
            end)
            spawn(function()
                if Config["Stats"]["Sword"] then
                    local args = {
                        [1] = {
                            ["Target"] = "SwordLevel",
                            ["Action"] = "UpgradeStats",
                            ["Amount"] = Config.Amount
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "StatsFunction"):InvokeServer(unpack(args))
                end
            end)
            spawn(function()
                if Config["Stats"]["Melee"] then
                    local args = {
                        [1] = {
                            ["Target"] = "MeleeLevel",
                            ["Action"] = "UpgradeStats",
                            ["Amount"] = Config.Amount
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "StatsFunction"):InvokeServer(unpack(args))
                end
            end)
            spawn(function()
                if Config["Stats"]["Power"] then
                    local args = {
                        [1] = {
                            ["Target"] = "MemePowerLevel",
                            ["Action"] = "UpgradeStats",
                            ["Amount"] = Config.Amount
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "StatsFunction"):InvokeServer(unpack(args))
                end
            end)
        end
    end
end)
function weapon()
    local save = {}
    for _, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if not table.find(save, v.Name) then
            table.insert(save, v.Name)
        end
    end
    for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if not table.find(save, v.Name) and v:IsA("Tool") then
            table.insert(save, v.Name)
        end
    end
    return save
end

do
    GeneralSection:AddToggle({
		Title = "Auto Farm Level",
		Default = Config["AutoFarm"],
		Callback = function(ChiuMyLy)
			Config["AutoFarm"] = ChiuMyLy
            Save()
		end,
	});

    GeneralSection:AddDropdown({
		Title = "Select Weapon",
		Values = weapon(),
		Default = Config.Weapon,
		Callback = function(ChiuMyLy)
			Config["Weapon"] = ChiuMyLy;
            Save()
		end,
	});

    GeneralAuto:AddToggle({
		Title = "Auto Refresh Weapon When Not Detect In Bag",
		Default = Config["Refresh"],
		Callback = function(ChiuMyLy)
			Config["Refresh"] = ChiuMyLy
            Save()
		end,
	});

    GeneralAuto:AddToggle({
		Title = "Auto Turn On Aura",
		Default = Config["EnableAura"],
		Callback = function(ChiuMyLy)
			Config["EnableAura"] = ChiuMyLy
            Save()
		end,
	});

    spawn(function()
        pcall(function()
            while wait() do
                if Config["EnableAura"] then
                    if #game.Players.LocalPlayer.Character.AuraColor_Folder:GetChildren() < 1 then
                        game.ReplicatedStorage:WaitForChild("OtherEvent").MainEvents.Ability:InvokeServer("Aura")
                    end
                end
            end
        end)
    end)
    spawn(function()
        pcall(function()
            while wait() do
                if Config["Refresh"] then
                    if table.find(weapon(), Config.Weapon) then
                        local args = {
                            [1] = "Weapon",
                            [2] = {
                                ["SelectedItem"] = Config.Weapon
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("ItemEvents")
                            :WaitForChild(
                                "UpdateInventory"):InvokeServer(unpack(args))
                        local args = {
                            [1] = "Weapon",
                            [2] = {
                                ["SelectedItem"] = Config.Weapon
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("ItemEvents")
                            :WaitForChild(
                                "UpdateInventory"):InvokeServer(unpack(args))
                    else
                        local args = {
                            [1] = "Weapon",
                            [2] = {
                                ["SelectedItem"] = Config.Weapon
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("ItemEvents")
                            :WaitForChild(
                                "UpdateInventory"):InvokeServer(unpack(args))
                    end
                    wait(math.random(30, 60))
                end
            end
        end)
    end)
    GeneralSection:AddButton({
		Title = "Refresh Weapon",
		Callback = function()
			Dropdown:Refresh(weapon())
		end,
	});

    GeneralSection:AddTextbox({
		Title = "Input Distance",
		Placeholder = Config.Distance,
        Default = Config.Distance,
		Callback = function(ChiuMyLy)
			Config.Distance = ChiuMyLy
            Save()
		end,
	});
    
    GeneralStats:AddDropdown({
		Title = "Select Auto Skill",
		Values = {"Z", "X", "C", "V"},
		Default = Config.AutoSkillKeyCode,
		Callback = function(ChiuMyLy)
			Config["AutoSkillKeyCode"][ChiuMyLy] = not ChiuMyLy
            Save()
		end,
	});
    
    GeneralStats:AddToggle({
		Title = "Auto Skill",
		Default = Config["AutoSkill"],
		Callback = function(ChiuMyLy)
			Config["AutoSkill"] = ChiuMyLy
            Save()
		end,
	});

    GeneralStats:AddTextbox({
		Title = "Hold Z",
		Placeholder = "Hold Z",
        Default = Config.HoldZ,
		Callback = function(ChiuMyLy)
			Config.HoldZ = ChiuMyLy
            Save()
		end,
	});

    GeneralStats:AddTextbox({
		Title = "Hold X",
		Placeholder = "Hold X",
        Default = Config.HoldX,
		Callback = function(ChiuMyLy)
			Config.HoldX = ChiuMyLy
            Save()
		end,
	});

    GeneralStats:AddTextbox({
		Title = "Hold C",
		Placeholder = "Hold C",
        Default = Config.HoldC,
		Callback = function(ChiuMyLy)
			Config.HoldC = ChiuMyLy
            Save()
		end,
	});
    
    GeneralStats:AddTextbox({
		Title = "Hold V",
		Placeholder = "Hold V",
        Default = Config.HoldV,
		Callback = function(ChiuMyLy)
			Config.HoldV = ChiuMyLy
            Save()
		end,
	});

    GeneralSection:AddButton({
		Title = "Redeem All Code",
		Callback = function()
            local a = require(game:GetService("ReplicatedStorage").ModuleScript.CodeList)
            for i, v in pairs(a) do
                if not game:GetService("Players").LocalPlayer.Code:FindFirstChild(i) then
                    local args = {
                        [1] = i
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild("Code")
                        :InvokeServer(unpack(args))
                else
                    notify("Spyder X Notifcation", "Code: " .. i .. " Used", 10)
                end
            end
        end,
	});

    GeneralSection:AddToggle({
		Title = "Auto Upgrade Stats",
		Default = Config["Auto Upgrade Stats"],
		Callback = function(ChiuMyLy)
			Config["Auto Upgrade Stats"] = ChiuMyLy
            Save()
		end,
	});

    GeneralStats:AddDropdown({
		Title = "Select Auto Stats",
		Values = {"Melee","Defense","Sword","Power"},
		Default = Config.Stats,
		Multi = true,
		Callback = function(ChiuMyLy)
			Config["Stats"][ChiuMyLy] = not ChiuMyLy
            Save()
		end,
	});

    GeneralStats:AddSlider({
		Title = "Amount to upgrade",
		Min = 1,
		Max = 100,
		Default = Config.Amount,
		Rounding = 0,
		Callback = function(ChiuMyLy)
			Config.Amount = ChiuMyLy
            Save()
		end,
	});

    function alibitynpc()
        local save = {}
        local pos = {}
        for i, v in pairs(workspace.NPCs.AbilityTrainer_Npc:GetChildren()) do
            if not table.find(save, v.Name) then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        for i, v in pairs(game:GetService("ReplicatedStorage").NPC_Storage:GetChildren()) do
            if not table.find(save, v.Name) and v:GetAttribute("Old_Parent") == "AbilityTrainer_Npc" then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        return save
    end

    NPCSection:AddDropdown({
		Title = "Teleport Ability NPC",
		Values = alibitynpc(),
		Callback = function(ChiuMyLy)
			if workspace.NPCs.AbilityTrainer_Npc:FindFirstChild(ChiuMyLy) then
                if workspace.NPCs.AbilityTrainer_Npc[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.AbilityTrainer_Npc[ChiuMyLy]
                        .WorldPivot
                elseif workspace.NPCs.AbilityTrainer_Npc:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.AbilityTrainer_Npc[ChiuMyLy]
                        .CFrame
                end
            elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild(ChiuMyLy) then
                if game:GetService("ReplicatedStorage").NPC_Storage[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[ChiuMyLy]
                        .WorldPivot
                elseif game:GetService("ReplicatedStorage").NPC_Storage[ChiuMyLy]:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[ChiuMyLy]
                        .CFrame
                end
            end
		end,
	});

    function Misc()
        local save = {}
        local pos = {}
        for i, v in pairs(workspace.NPCs.Misc_Npc:GetChildren()) do
            if not table.find(save, v.Name) then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        for i, v in pairs(game:GetService("ReplicatedStorage").NPC_Storage:GetChildren()) do
            if not table.find(save, v.Name) and v:GetAttribute("Old_Parent") == "Misc_Npc" then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        return save
    end

    local miscnpc
    NPCSection:AddDropdown({
		Title = "Select Teleport Misc NPC",
		Values = Misc(),
		Callback = function(ChiuMyLy)
			if workspace.NPCs.Misc_Npc:FindFirstChild(ChiuMyLy) then
                if workspace.NPCs.Misc_Npc[ChiuMyLy]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Misc_Npc[ChiuMyLy]
                        .WorldPivot
                elseif workspace.NPCs.Misc_Npc:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Misc_Npc[ChiuMyLy]
                        .CFrame
                end
            elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild(ChiuMyLy) then
                if game:GetService("ReplicatedStorage").NPC_Storage[ChiuMyLy]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[ChiuMyLy]
                        .WorldPivot
                elseif game:GetService("ReplicatedStorage").NPC_Storage[ChiuMyLy]:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[ChiuMyLy]
                        .CFrame
                end
            end
		end,
	});

    function FightingStyle()
        local save = {}
        local pos = {}
        for i, v in pairs(workspace.NPCs.FightingStyle_Npc:GetChildren()) do
            if not table.find(save, v.Name) then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        for i, v in pairs(game:GetService("ReplicatedStorage").NPC_Storage:GetChildren()) do
            if not table.find(save, v.Name) and v:GetAttribute("Old_Parent") == "FightingStyle_Npc" then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        return save
    end

    NPCSection:AddDropdown({
		Title = "Select FightingStyle NPC",
		Values = FightingStyle(),
		Callback = function(ChiuMyLy)
			if workspace.NPCs.FightingStyle_Npc:FindFirstChild(ChiuMyLy) then
                if workspace.NPCs.FightingStyle_Npc[ChiuMyLy]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.FightingStyle_Npc[ChiuMyLy]
                        .WorldPivot
                elseif workspace.NPCs.FightingStyle_Npc:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.FightingStyle_Npc[ChiuMyLy]
                        .CFrame
                end
            elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild(ChiuMyLy) then
                if game:GetService("ReplicatedStorage").NPC_Storage[ChiuMyLy]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[ChiuMyLy]
                        .WorldPivot
                elseif game:GetService("ReplicatedStorage").NPC_Storage[ChiuMyLy]:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[ChiuMyLy]
                        .CFrame
                end
            end
		end,
	});

    function Shop()
        local save = {}
        local pos = {}
        for i, v in pairs(workspace.NPCs.Shop_Npc:GetChildren()) do
            if not table.find(save, v.Name) then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        for i, v in pairs(game:GetService("ReplicatedStorage").NPC_Storage:GetChildren()) do
            if not table.find(save, v.Name) and v:GetAttribute("Old_Parent") == "Shop_Npc" then
                if v:IsA("Part") then
                    table.insert(save, v.Name)
                else
                    if v:IsA("Model") then
                        table.insert(save, v.Name)
                    end
                end
            end
        end
        return save
    end

    NPCSection:AddDropdown({
		Title = "Select NPC Shop",
		Values = Shop(),
		Callback = function(ChiuMyLy)
			if workspace.NPCs.Shop_Npc:FindFirstChild(ChiuMyLy) then
                if workspace.NPCs.Shop_Npc[v]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Shop_Npc[ChiuMyLy]
                        .WorldPivot
                elseif workspace.NPCs.Shop_Npc:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Shop_Npc[ChiuMyLy]
                        .CFrame
                end
            elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild(ChiuMyLy) then
                if game:GetService("ReplicatedStorage").NPC_Storage[ChiuMyLy]:IsA("Model") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[ChiuMyLy]
                        .WorldPivot
                elseif game:GetService("ReplicatedStorage").NPC_Storage[ChiuMyLy]:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("ReplicatedStorage")
                        .NPC_Storage[ChiuMyLy]
                        .CFrame
                end
            end
		end,
	});

    MicsSection:AddToggle({
		Title = "Auto Roll Aura",
		Default = Config.RollAura,
		Callback = function(ChiuMyLy)
			Config.RollAura = ChiuMyLy
            Save()
		end,
	});

    function getaura()
        local aura = {}
        for i, v in next, game:GetService("Players").LocalPlayer.Items.AuraColor:GetChildren() do
            if not table.find(aura, v.Name) then
                table.insert(aura, v.Name)
            end
        end
        return aura
    end

    MicsSection:AddDropdown({
		Title = "Select Aura",
		Values = getaura(),
		Default = Config.Aura,
		Callback = function(ChiuMyLy)
			Config["Aura"] = ChiuMyLy
            Save()
		end,
	});

    function DetectQuestMisc(name)
        if game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild("Cool Floppa Quest") then
            return game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild("Cool Floppa Quest").WorldPivot
                .Position, "Cool Floppa Quest"
        end
        if workspace.NPCs.Quests_Npc:FindFirstChild("Cool Floppa Quest") then
            return workspace.NPCs.Quests_Npc:FindFirstChild("Cool Floppa Quest").WorldPivot.Position, "Cool Floppa Quest"
        end
    end

    local plr = game.Players.LocalPlayer
    function getquestmisc(name)
        local QuestPos, Quest = DetectQuestMisc(name)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(QuestPos)
        local PromptQuest = workspace.NPCs.Quests_Npc:FindFirstChild(name)
        if PromptQuest then
            if plr:DistanceFromCharacter(PromptQuest.Block.Position) < 8 then
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ProximityPrompts") and game:GetService("Players").LocalPlayer.PlayerGui.ProximityPrompts:FindFirstChild("Prompt") and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
                    fireproximityprompt(PromptQuest.Block.QuestPrompt)
                end
                wait(0.5)
            end
        end
        if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.QuestGiver.Text ~= name and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == true then
            for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.CloseFrame.Close.Activated)) do
                v.Function()
            end
        end
    end

    spawn(function()
        while wait() do
            if game:GetService("Players").LocalPlayer.PlayerData.AuraColor.Value ~= Config["Aura"] and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value >= 10 and Config.RollAura then
                local args = {
                    [1] = "Reroll_Color",
                    [2] = "Halfed Sorcerer"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild(
                    "Modules"):FireServer(unpack(args))
            end
        end
    end)

    MicsSection:AddToggle({
		Title = "Cool Floppa Quest",
		Default = Config.CoolQuest,
		Callback = function(ChiuMyLy)
			Config.CoolQuest = ChiuMyLy
            Save()
		end,
	});

    MicsSection:AddToggle({
		Title = "Auto Get Pop Cat Weapon",
		Default = Config.PopCat,
		Callback = function(ChiuMyLy)
			Config.PopCat = ChiuMyLy
            Save()
		end,
	});

    spawn(function()
        while wait() do
            if Config.PopCat then
                if game:GetService("Players").LocalPlayer.Items.Weapon.Popcat.Value == 0 then
                    if plr:DistanceFromCharacter(workspace.Island.FloppaIsland.Popcat_Clickable.Part.Position) < 8 then
                        if workspace.Island.FloppaIsland.Popcat_Clickable.Part.BillboardGui.Textlabel.Text == "Popcat" then
                            repeat
                                wait()
                                fireclickdetector(workspace.Island.FloppaIsland.Popcat_Clickable.Part.ClickDetector)
                            until workspace.Island.FloppaIsland.Popcat_Clickable.Part.BillboardGui.Textlabel.Text ~= "Popcat"
                        end
                        numpop = workspace.Island.FloppaIsland.Popcat_Clickable.Part.BillboardGui.Textlabel.Text:gsub(
                            ",", "")
                        repeat
                            task.wait()
                            fireclickdetector(workspace.Island.FloppaIsland.Popcat_Clickable.Part.ClickDetector)
                            numpop = workspace.Island.FloppaIsland.Popcat_Clickable.Part.BillboardGui.Textlabel.Text
                                :gsub(
                                    ",", "")
                        until tonumber(numpop) > 10000 or not Config.PopCat
                        if workspace.NPCs.Misc_Npc:FindFirstChild("Ohio Popcat") then
                            if workspace.NPCs.Misc_Npc["Ohio Popcat"]:IsA("Model") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Misc_Npc
                                    ["Ohio Popcat"]
                                    .WorldPivot
                            elseif workspace.NPCs.Misc_Npc:IsA("Part") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPCs.Misc_Npc
                                    ["Ohio Popcat"]
                                    .CFrame
                            end
                        elseif game:GetService("ReplicatedStorage").NPC_Storage:FindFirstChild("Ohio Popcat") then
                            if game:GetService("ReplicatedStorage").NPC_Storage["Ohio Popcat"]:IsA("Model") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService(
                                        "ReplicatedStorage")
                                    .NPC_Storage["Ohio Popcat"]
                                    .WorldPivot
                            elseif game:GetService("ReplicatedStorage").NPC_Storage["Ohio Popcat"]:IsA("Part") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService(
                                        "ReplicatedStorage")
                                    .NPC_Storage["Ohio Popcat"]
                                    .CFrame
                            end
                        end
                        local args = {
                            [1] = "Weapon_Seller",
                            [2] = "Ohio Popcat"
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild("Modules"):FireServer(unpack(args))
                    else
                        plr.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Island.FloppaIsland
                            .Popcat_Clickable
                            .Part.Position)
                    end
                else
                    notify("Spyder X Notification", "You Have PopCat Sword", 10)
                    Options["Auto Get Pop Cat Weapon"]:SetValue(false)
                end
            end
        end
    end)
    spawn(function()
        while wait() do
            if Config.CoolQuest then
                if game:GetService("Players").LocalPlayer.Items.Weapon.Floppa.Value == 0 then
                    if game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false then
                        getquestmisc("Cool Floppa Quest")
                    else
                        if workspace.Island.FloppaIsland:FindFirstChild("Lava Floppa") then
                            plr.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.Island.FloppaIsland
                                :FindFirstChild(
                                    "Lava Floppa").WorldPivot.Position)
                            local MobMisc = workspace.Island.FloppaIsland:FindFirstChild("Lava Floppa")
                            if MobMisc then
                                if plr:DistanceFromCharacter(MobMisc.ClickPart.Position) < 8 then
                                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("ProximityPrompts") and game:GetService("Players").LocalPlayer.PlayerGui.ProximityPrompts:FindFirstChild("Prompt") and game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == true then
                                        fireproximityprompt(MobMisc.ClickPart.ProximityPrompt)
                                    end
                                end
                            end
                        end
                    end
                else
                    notify("Spyder X Notification", "You Have Floppa Sword", 10)
                    Options["Cool Floppa Quest"]:SetValue(false)
                end
            end
        end
    end)

    spawn(function()
        while wait() do
            if Config.Store then
                for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
                    if v:FindFirstChild("Script") then
                        equiptool(v.Name)
                        local args = {
                            [1] = "Eatable_Power",
                            [2] = {
                                ["Action"] = "Store",
                                ["Tool"] = workspace.Character[game.Players.LocalPlayer.Name][tostring(v.Name)]
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild(
                                "Modules")
                            :FireServer(unpack(args))
                    end
                end
            end
        end
    end)

    GachaSection:AddToggle({
		Title = "Auto Store",
		Default = Config.Store,
		Callback = function(ChiuMyLy)
			Config.Store = ChiuMyLy
            Save()
		end,
	});

    GachaSection:AddToggle({
		Title = "Random Fruit",
		Default = Config.RandomFruit,
		Callback = function(ChiuMyLy)
			Config.RandomFruit = ChiuMyLy
            Save()
		end,
	});

    GachaSection:AddToggle({
		Title = "Bring Power Fruit",
		Default = Config.Bringpf,
		Callback = function(ChiuMyLy)
			Config.Bringpf = ChiuMyLy
            Save()
		end,
	});

    spawn(function()
        while wait() do
            if Config.Bringpf then
                for i, v in next, workspace.Dropped_Items:GetChildren() do
                    if v and v.ToolTip == "Power" then
                        firetouchinterest(game.Players.LocalPlayer.Character.Head, v.Handle, 0)
                    end
                end
            end
        end
    end)
    local ahihi
    local gemneed
    local belineed
    spawn(function()
        while wait() do
            if Config.Quantity == "x1" then
                ahihi = "Once"
                gemneed = 25
                belineed = 25000
            elseif Config.Quantity == "x3" then
                ahihi = "Triple"
                gemneed = 25 * 3
                belineed = 25000 * 3
            else
                ahihi = "Decuple"
                gemneed = 25 * 10
                belineed = 25000 * 10
            end
        end
    end)
    spawn(function()
        while wait() do
            if Config.RandomFruit then
                if Config["MethodGacha"] == "Gem" then
                    local args = {
                        [1] = "Random_Power",
                        [2] = {
                            ["Type"] = ahihi,
                            ["NPCName"] = "Doge Gacha",
                            ["GachaType"] = "Gem"
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild(
                            "Modules"):FireServer(unpack(args))
                elseif Config["MethodGacha"] == "Money" then
                    local args = {
                        [1] = "Random_Power",
                        [2] = {
                            ["Type"] = ahihi,
                            ["NPCName"] = "Floppa Gacha",
                            ["GachaType"] = "Money"
                        }
                    }

                    game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                        :WaitForChild("Modules"):FireServer(unpack(args))
                else
                    if game:GetService("Players").LocalPlayer.PlayerData.Money.Value >= belineed and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value < gemneed then
                        local args = {
                            [1] = "Random_Power",
                            [2] = {
                                ["Type"] = ahihi,
                                ["NPCName"] = "Doge Gacha",
                                ["GachaType"] = "Gem"
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild(
                                "Modules"):FireServer(unpack(args))
                    elseif game:GetService("Players").LocalPlayer.PlayerData.Money.Value < belineed and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value >= gemneed then
                        local args = {
                            [1] = "Random_Power",
                            [2] = {
                                ["Type"] = ahihi,
                                ["NPCName"] = "Floppa Gacha",
                                ["GachaType"] = "Gem"
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild("Modules"):FireServer(unpack(args))
                    elseif game:GetService("Players").LocalPlayer.PlayerData.Money.Value >= belineed and game:GetService("Players").LocalPlayer.PlayerData.Gem.Value >= gemneed then
                        local args = {
                            [1] = "Random_Power",
                            [2] = {
                                ["Type"] = ahihi,
                                ["NPCName"] = "Floppa Gacha",
                                ["GachaType"] = "Money"
                            }
                        }

                        game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents")
                            :WaitForChild("Modules"):FireServer(unpack(args))
                    end
                end
            end
        end
    end)

    GachaSection:AddDropdown({
		Title = "Select Method Gacha",
		Values = {"Money", "Gem", "Both"},
		Default = Config.MethodGacha,
		Callback = function(ChiuMyLy)
			Config["MethodGacha"] = ChiuMyLy
            Save()
		end,
	});

    GachaSection:AddDropdown({
		Title = "Select Method Gacha",
		Values = {"Money", "Gem", "Both"},
		Default = Config.MethodGacha,
		Callback = function(ChiuMyLy)
			Config["MethodGacha"] = ChiuMyLy
            Save()
		end,
	});

    GachaSection:AddDropdown({
		Title = "Select Quantity (x1, x3, x10)",
		Values = {"x1", "x3", "x10"},
		Default = Config.Quantity,
		Callback = function(ChiuMyLy)
			Config["Quantity"] = ChiuMyLy
            Save()
		end,
	});

    GachaSection:AddToggle({
		Title = "Auto Raid",
		Default = Config.Raid,
		Callback = function(ChiuMyLy)
			Config.Raid = ChiuMyLy
            Save()
		end,
	});

    function getnameraid()
        local distance = math.huge
        local name
        for i, v in next, workspace.Raids:GetChildren() do
            if (v.WorldPivot.Position - plr.Character.HumanoidRootPart.CFrame.Position).Magnitude < distance then
                distance = (v.WorldPivot.Position - plr.Character.HumanoidRootPart.CFrame.Position).Magnitude
                name = v
            end
        end
        return name
    end

    function getmobraid()
        local wave = game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Wave.Text:gsub(" ", "")
        if getnameraid() then
            for i, v in next, workspace.Raids[tostring(getnameraid())].Enemy_Location[tostring(wave)]:GetChildren() do
                return v.Name
            end
        end
    end

    function getweaponraid(type)
        local name = ""
        for _, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.ToolTip == type then
                return v.Name
            end
        end
        for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.ToolTip == type then
                return v.Name
            end
        end
    end

    function spamskill()
        pcall(function()
            spawn(function()
                useskill(getweaponraid("Power"), "Z")
                useskill(getweaponraid("Power"), "X")
                useskill(getweaponraid("Power"), "C")
                useskill(getweaponraid("Power"), "V")
            end)
            spawn(function()
                useskill(getweaponraid("Weapon"), "Z")
                useskill(getweaponraid("Weapon"), "X")
                useskill(getweaponraid("Weapon"), "C")
                useskill(getweaponraid("Weapon"), "V")
            end)
        end)
    end

    spawn(function()
        pcall(function()
            while wait() do
                local a, b = pcall(function()
                    if Config.Raid then
                        if game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Visible == false or not getnameraid() then
                            if plr:DistanceFromCharacter(workspace.Region.RaidArea.CFrame.Position) > 50 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Region.RaidArea
                                    .CFrame
                            end
                        else
                            pcall(function()
                                repeat
                                    wait()
                                    for r, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Start_Button.Activated)) do
                                        v.Function()
                                    end
                                until game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.Start_Button.Visible == false
                            end)
                            if game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.TimeLeft.Visible == true then
                                for i, v in pairs(workspace.Monster:GetChildren()) do
                                    if v:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.CFrame.Position).Magnitude <= 350
                                        and v:FindFirstChild("Humanoid") then
                                        click = true
                                        repeat
                                            task.wait()
                                            BringMob(v)
                                            Tp(v)
                                            spawn(function()
                                                equiptool(Config.Weapon)
                                            end)
                                            spawn(function()
                                                spamskill()
                                            end)
                                            spawn(function()
                                                if v:FindFirstChild("HumanoidRootPart") then
                                                    getgenv().posaim = v.HumanoidRootPart.CFrame.Position
                                                end
                                            end)
                                        until not v or not v.Parent or not v.PrimaryPart or not v.Humanoid or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.Holder.QuestSlot1.Visible == false or not Options["Auto Raid"].Value or not Config["Raid"]
                                        click = false
                                    end
                                end
                            end
                        end
                    end
                end)
                if b then
                    error(b)
                end
            end
        end)
    end)

    MicsSection:AddToggle({
		Title = "Auto Meme Beast",
		Default = Config.MemeBeast,
		Callback = function(ChiuMyLy)
			Config.MemeBeast = ChiuMyLy
            Save()
		end,
	});

    spawn(function()
        while wait() do
            if Config.MemeBeast then
                local MemeBeast = workspace.Monster:FindFirstChild("Meme Beast") or
                    game:GetService("ReplicatedStorage").MonsterSpawn:FindFirstChild("Meme Beast")
                if MemeBeast and not getnameraid() and  game:GetService("Players").LocalPlayer.PlayerGui.RaidGui.RaidFrame.TimeLeft.Visible == false then
                    notify("Spyder X Notifcation", "Meme Beast Spawned", 10)
                    Tp(MemeBeast)
                    click = true
                    repeat
                        task.wait()
                        Tp(MemeBeast)
                        spawn(function()
                            equiptool(Config.Weapon)
                        end)
                        spawn(function()
                            spamskill()
                        end)
                        spawn(function()
                            if MemeBeast:FindFirstChild("HumanoidRootPart") then
                                getgenv().posaim = MemeBeast.HumanoidRootPart.CFrame.Position
                            end
                        end)
                    until not MemeBeast or not MemeBeast.Humanoid or MemeBeast.Humanoid.Health <= 0 or not Options["Auto Meme Beast"].Value or not Config["MemeBeast"]
                    click = false
                end
            end
        end
    end)

    ShopSection:AddButton({
		Title = "Instinct",
		Callback = function()
			local args = {
                [1] = "Ability_Teacher",
                [2] = "Nugget Man"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
		end,
	});

    ShopSection:AddButton({
		Title = "Aura",
		Callback = function()
			local args = {
                [1] = "Ability_Teacher",
                [2] = "Aura Master"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
		end,
	});

    ShopSection:AddButton({
		Title = "Flash Step",
		Callback = function()
			local args = {
                [1] = "Ability_Teacher",
                [2] = "Giga Chad"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
		end,
	});

    ShopSection:AddButton({
		Title = "Pumpkin Weapon",
		Callback = function()
			local args = {
                [1] = "Weapon_Seller",
                [2] = "Gravestone"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
		end,
	});

    ShopSection:AddButton({
		Title = "Katana Weapon",
		Callback = function()
			local args = {
                [1] = "Weapon_Seller",
                [2] = "Doge"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
		end,
	});

    ShopSection:AddButton({
		Title = "Weapon",
		Callback = function()
			local args = {
                [1] = "Weapon_Seller",
                [2] = "Smiling Cat"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
		end,
	});

    ShopSection:AddButton({
		Title = "Bonk Weapon",
		Callback = function()
			local args = {
                [1] = "Weapon_Seller",
                [2] = "Meme Man"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
		end,
	});

    ShopSection:AddButton({
		Title = "Flame Katana Weapon",
		Callback = function()
			local args = {
                [1] = "Weapon_Seller",
                [2] = "Meme Man"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
		end,
	});

    ShopSection:AddButton({
		Title = "Hanger Weapon",
		Callback = function()
			local args = {
                [1] = "Weapon_Seller",
                [2] = "Hanger"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("OtherEvent"):WaitForChild("MainEvents"):WaitForChild("Modules"):FireServer(unpack(args))
		end,
	});
end

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local mainGui = playerGui:WaitForChild("MainGui")
local playerNameLabel = mainGui:WaitForChild("PlayerName")
local playerNameLabel = mainGui:WaitForChild("PlayerName")
playerNameLabel.Text = "Spyder X | discord.gg/VM7ESrzccs"

local joinTime = os.time()
local serverStartTime = os.time() 
local player = game.Players.LocalPlayer
local players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local fps = 0

RunService.RenderStepped:Connect(function(deltaTime)
    fps = math.floor(1 / deltaTime)
end)

local function randomUUID()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    return string.gsub(template, "[xy]", function(c)
        local v = (c == "x") and math.random(0, 15) or math.random(8, 11)
        return string.format("%x", v)
    end)
end

local function randomIP()
    return string.format("%d.%d.%d.%d", math.random(10, 255), math.random(0, 255), math.random(0, 255), math.random(0, 255))
end

local serverIP = randomIP()
local uuidID = randomUUID()

local function updateStatus()
    local ping = math.floor(player:GetNetworkPing() * 1000)

    local currentTime = os.time()
    local elapsedPlayTime = currentTime - joinTime
    local hours = math.floor(elapsedPlayTime / 3600)
    local minutes = math.floor((elapsedPlayTime % 3600) / 60)
    local seconds = elapsedPlayTime % 60

    local elapsedServerTime = currentTime - serverStartTime
    local shours = math.floor(elapsedServerTime / 3600)
    local sminutes = math.floor((elapsedServerTime % 3600) / 60)
    local sseconds = elapsedServerTime % 60

    local playerCount = #players:GetPlayers()

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")

    local position = rootPart and string.format("X: %.0f Y: %.0f Z: %.0f", rootPart.Position.X, rootPart.Position.Y, rootPart.Position.Z) or "N/A"
    local health = humanoid and math.floor(humanoid.Health) or "N/A"
    local walkspeed = humanoid and math.floor(humanoid.WalkSpeed) or "N/A"
    local jumppower = humanoid and math.floor(humanoid.JumpPower) or "N/A"

    local device
    if UserInputService.TouchEnabled then
        device = "Mobile"
    elseif UserInputService.KeyboardEnabled then
        device = "PC"
    elseif UserInputService.GamepadEnabled then
        device = "Console"
    else
        device = "Unknown"
    end

    fpsParagraph:SetContent(tostring(fps))
    pingParagraph:SetContent(tostring(ping) .. " ms")
    playTimeParagraph:SetContent(string.format("%02d:%02d:%02d", hours, minutes, seconds))
    playerCountParagraph:SetContent(tostring(playerCount) .. " Players")
    serverAgeParagraph:SetContent(string.format("%02d:%02d:%02d", shours, sminutes, sseconds))
    positionParagraph:SetContent(position)
    deviceParagraph:SetContent(device)
    healthParagraph:SetContent(tostring(health) .. " HP")
    walkspeedParagraph:SetContent(tostring(walkspeed) .. " Studs/s")
    jumppowerParagraph:SetContent(tostring(jumppower))
    gameNameParagraph:SetContent(game.Name or "Unknown")
    placeIdParagraph:SetContent(tostring(game.PlaceId))
    jobIdParagraph:SetContent(tostring(game.JobId or "Unknown"))
    ipParagraph:SetContent(serverIP)
    uuidParagraph:SetContent(uuidID)
end

while task.wait(1) do
    updateStatus()
end

game.StarterGui:SetCore("SendNotification",{Title = "Spyder X",Text = "Successfully",Duration = 5})
