local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

if not _G.JoinSeverID or _G.JoinSeverID == "" then
    StarterGui:SetCore("SendNotification", {
        Title = "Lỗi",
        Text = "Chưa có ID server để dịch chuyển!",
        Duration = 5
    })
else
    StarterGui:SetCore("SendNotification", {
        Title = "Thông báo",
        Text = "Đang dịch chuyển đến server...",
        Duration = 5
    })
    wait(3)
    TeleportService:TeleportToPlaceInstance(game.PlaceId, _G.JoinSeverID, Players.LocalPlayer)
end
