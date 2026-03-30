-- [[ DARK HUB | DANYA & LIYA | OFFICIAL LOADER ]] --
local Players = game:GetService("Players")
local LPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Полная очистка перед стартом
for _, v in pairs(CoreGui:GetChildren()) do
    if v.Name == "DarkHub_Danya" or v.Name == "DL_LoadSystem" then v:Destroy() end
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkHub_Danya"

-- [[ 1. ТВОЙ ТЕХНИЧЕСКИЙ ЛОАДЕР ]] --
local LoadFrame = Instance.new("Frame", ScreenGui)
LoadFrame.Name = "DL_LoadSystem"
LoadFrame.Size = UDim2.new(0, 420, 0, 160)
LoadFrame.Position = UDim2.new(0.5, -210, 0.5, -80)
LoadFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LoadFrame.BorderSizePixel = 2
LoadFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", LoadFrame)

local Status = Instance.new("TextLabel", LoadFrame)
Status.Size = UDim2.new(0.9, 0, 0.5, 0)
Status.Position = UDim2.new(0.05, 0, 0.15, 0)
Status.Text = "INITIALIZING D.L HUB..."
Status.TextColor3 = Color3.fromRGB(200, 200, 200)
Status.Font = Enum.Font.Code
Status.TextSize = 13
Status.BackgroundTransparency = 1

local BarBack = Instance.new("Frame", LoadFrame)
BarBack.Size = UDim2.new(0.8, 0, 0, 8)
BarBack.Position = UDim2.new(0.1, 0, 0.75, 0)
BarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
local BarFill = Instance.new("Frame", BarBack)
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", BarFill)

-- [[ 2. ГЛАВНОЕ МЕНЮ (ХАБ) ]] --
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 430, 0, 600)
Main.Position = UDim2.new(0.5, -215, 0.5, -300)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Icon = Instance.new("TextButton", ScreenGui)
Icon.Size = UDim2.new(0, 60, 0, 60); Icon.Position = UDim2.new(0.05, 0, 0.15, 0); Icon.Text = "D.L"; Icon.BackgroundColor3 = Color3.fromRGB(255, 0, 0); Icon.Font = Enum.Font.GothamBold; Icon.Draggable = true; Instance.new("UICorner", Icon).CornerRadius = UDim.new(1, 0)
Icon.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(1, -20, 1, -80); Scroll.Position = UDim2.new(0, 10, 0, 70); Scroll.BackgroundTransparency = 1; Scroll.CanvasSize = UDim2.new(0, 0, 18, 0)
Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 10)

local function NewSec(t)
    local l = Instance.new("TextLabel", Scroll); l.Size = UDim2.new(1, 0, 0, 35); l.Text = "--- " .. t .. " ---"; l.TextColor3 = Color3.fromRGB(255, 0, 0); l.BackgroundTransparency = 1; l.Font = Enum.Font.GothamBold
end
local function NewBtn(t, func)
    local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(0.95, 0, 0, 45); b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.Text = t; b.TextColor3 = Color3.fromRGB(255, 255, 255); b.Font = Enum.Font.GothamBold; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() pcall(func) end)
end

-- --- ВСЕ ТВОИ СКРИПТЫ ВНУТРИ --- --
NewSec("LEGENDS (TOP)")
NewBtn("💀 GUEST 666", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/My-Scripts/refs/heads/main/Guest%20666.lua"))() end)
NewBtn("👤 JOHN DOE FE", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Client-Replication-John-doe-up-by-gojohdkaisenkt-34198"))() end)

NewSec("🎯 AIMBOT SYSTEM")
local AimEnabled = false; local AimRadius = 350
local OnBtn = Instance.new("TextButton", Scroll); OnBtn.Size = UDim2.new(0.95, 0, 0, 45); OnBtn.Text = "ВКЛЮЧИТЬ АИМ"; OnBtn.TextColor3 = Color3.fromRGB(0, 255, 0); OnBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", OnBtn)
local OffBtn = Instance.new("TextButton", Scroll); OffBtn.Size = UDim2.new(0.95, 0, 0, 45); OffBtn.Text = "ВЫКЛЮЧИТЬ АИМ"; OffBtn.TextColor3 = Color3.fromRGB(255, 0, 0); OffBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", OffBtn)
local AimCircle = Instance.new("Frame", ScreenGui); AimCircle.Size = UDim2.new(0, AimRadius*2, 0, AimRadius*2); AimCircle.Position = UDim2.new(0.5, -AimRadius, 0.5, -AimRadius); AimCircle.BackgroundTransparency = 1; AimCircle.Visible = false
local Stroke = Instance.new("UIStroke", AimCircle); Stroke.Thickness = 3; Stroke.Color = Color3.fromRGB(255, 0, 0); Stroke.Transparency = 0.5; Instance.new("UICorner", AimCircle).CornerRadius = UDim.new(1, 0)
OnBtn.MouseButton1Click:Connect(function() AimEnabled = true AimCircle.Visible = true end)
OffBtn.MouseButton1Click:Connect(function() AimEnabled = false AimCircle.Visible = false end)

NewSec("😎 COOLKID SPECIAL")
NewBtn("🔥 c00lkidd REBORN (DEB)", function()
    print("Under Scripting")
    setclipboard("https://c00lkidd.com our website")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-coolkid-gui-15453"))()
end)

NewSec("🔥 DANYA'S LIST 🔥")
local d_list = {
    {"🧩 Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"},
    {"🌀 Mystrix Hub", "https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"},
    {"🌋 Escape Lava", "https://raw.githubusercontent.com/scriptyyz/roblox/refs/heads/main/EscapeRisingLavaForBrainrots.lua"},
    {"🌊 Tsunami Galaxy", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5"},
    {"⚡ 1 Speed Escape", "https://raw.githubusercontent.com/gumanba/Scripts/main/1SpeedEscapeforBrainrots"},
    {"🔪 Murderer VS Sheriff", "https://raw.githubusercontent.com/Rysted/scripts/main/MurderersVSSheriffs.lua"},
    {"⭐ Ace Hub", "https://raw.githubusercontent.com/Totocoems/Ace/main/Ace"},
    {"🚀 Speed Hub X", "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
    {"📦 Lucky Blocks", "https://pastefy.app/6KRkp9XP/raw"},
    {"☢️ Plutonium Loader", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"}
}
for _, v in pairs(d_list) do
    NewBtn(v[1], function() loadstring(game:HttpGet(v[2]))() end)
end

-- Логика Аима и FOV 120
Camera.FieldOfView = 120
RunService.RenderStepped:Connect(function()
    if AimEnabled then
        local target = nil; local mag = AimRadius
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos, onScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if dist < mag then mag = dist; target = v end
                end
            end
        end
        if target then Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.HumanoidRootPart.Position) end
    end
end)

-- [[ 3. ЗАПУСК ЛОАДЕРА ]] --
task.spawn(function()
    local logs = {
        "WARNING: Script not verified!",
        "Injecting Legends...",
        "loadstring(game:HttpGet('GitHub...'))()",
        "D.L HUB READY!"
    }
    for i = 1, #logs do
        Status.Text = logs[i]
        BarFill:TweenSize(UDim2.new(i/#logs, 0, 1, 0), "Out", "Quad", 0.5)
        task.wait(0.7)
    end
    task.wait(0.2)
    LoadFrame:Destroy() -- Лоадер уходит
    Main.Visible = true -- Меню появляется
end)
