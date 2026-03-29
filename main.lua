--[[
	🌑 DARK HUB OFFICIAL | V4 FINAL
	- Черный экран загрузки: "Loading DARK HUB..."
	- Новая вкладка: 💻 Hacker (Coolkid GUI)
	- Исправленное ВХ: Скрипт от scriptrbgod
	- Все твои лоадеры сохранены
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. [ЧЕРНЫЙ ЭКРАН ЗАГРУЗКИ]
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 500, 0, 100)
    label.Position = UDim2.new(0.5, -250, 0.5, -50)
    label.Text = "Loading DARK HUB..."
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 40
    label.Font = Enum.Font.GothamBold
    label.BackgroundTransparency = 1
    task.wait(2.5)
    screen:Destroy()
end
StartLoading()

-- 2. [ЯДРО АИМБОТА]
local AimEnabled, AimSmoothness, AimFOV = false, 0.15, 150
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness, FOVCircle.NumSides, FOVCircle.Radius = 1, 100, AimFOV
FOVCircle.Filled, FOVCircle.Transparency = false, 0.4
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Visible = false

game:GetService("RunService").RenderStepped:Connect(function()
    local cam = workspace.CurrentCamera
    FOVCircle.Position = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    FOVCircle.Radius = AimFOV
    if AimEnabled then
        local target = nil
        local shortestDist = AimFOV
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                local pos, onScreen = cam:WorldToViewportPoint(v.Character.Head.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - FOVCircle.Position).Magnitude
                    if dist < shortestDist then shortestDist = dist; target = v end
                end
            end
        end
        if target then cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, target.Character.Head.Position), AimSmoothness) end
    end
end)

-- 3. [ОКНО ХАБА]
local Window = Rayfield:CreateWindow({
   Name = "🌑 DARK HUB | LAST MACHINE",
   LoadingTitle = "Запуск Рауфельд...",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubV4" }
})

local MainTab = Window:CreateTab("🏠 Main Hub")
local ScriptTab = Window:CreateTab("📜 Scripts")
local AimTab = Window:CreateTab("🎯 AimBot")
local VisualTab = Window:CreateTab("👁️ Visuals")
local HackerTab = Window:CreateTab("💻 Hacker")

-- [ MAIN HUB ]
MainTab:CreateSlider({Name = "⚡ Speed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end})
MainTab:CreateButton({Name = "👻 NEW INVISIBLE", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-Script-Universal-109667"))() end})
MainTab:CreateButton({Name = "🎥 Установить FOV 120", Callback = function() workspace.CurrentCamera.FieldOfView = 120 end})

-- [ SCRIPTS ]
local loaders = {
    ["🎡 Swing Obby"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots",
    ["☢️ Plutonium"] = "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua",
    ["🌌 Mystrix Hub"] = "https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader",
    ["🚀 Speed Hub X"] = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"
}
for name, url in pairs(loaders) do
    ScriptTab:CreateButton({Name = name, Callback = function() loadstring(game:HttpGet(url))() end})
end

-- [ VISUALS - ВХ ОТ SCRIPT RB GOD ]
VisualTab:CreateButton({
    Name = "👁️ Включить ВХ (scriptrbgod)",
    Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))() end
})

-- [ HACKER - COOLKID GUI ]
HackerTab:CreateButton({
    Name = "💀 Запустить Coolkid GUI",
    Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-coolkid-gui-15453"))() end
})

-- [ AIMBOT ]
AimTab:CreateToggle({Name = "Авто-наводка", CurrentValue = false, Callback = function(V) AimEnabled = V end})
AimTab:CreateToggle({Name = "Показать Круг", CurrentValue = false, Callback = function(V) FOVCircle.Visible = V end})
AimTab:CreateSlider({Name = "Радиус", Range = {10, 600}, Increment = 1, CurrentValue = 150, Callback = function(V) AimFOV = V end})

Rayfield:Notify({ Title = "🌑 DARK HUB", Content = "Всё готово! Машина запущена. ✅", Duration = 5 })
