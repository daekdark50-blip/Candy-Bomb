--[[
    👹 DARK HUB V3 | KILLER MACHINE EDITION
    - Фикс Аимбота (Авто-наводка + Прозрачный FOV)
    - 15+ Лоадеров (Все твои ссылки)
    - Зеленая полоска загрузки
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. [ЗЕЛЕНАЯ ЗАГРУЗКА]
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 380, 0, 120)
    frame.Position = UDim2.new(0.5, -190, 0.5, -60)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)
    local barBg = Instance.new("Frame", frame)
    barBg.Size = UDim2.new(0.85, 0, 0, 8)
    barBg.Position = UDim2.new(0.075, 0, 0.75, 0)
    barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    local bar = Instance.new("Frame", barBg)
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    bar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quart", 2.2)
    task.wait(2.5)
    screen:Destroy()
end
StartLoading()

-- 2. [НАСТРОЙКИ МАШИНЫ]
local AimEnabled = false
local AimSmoothness = 0.15
local AimFOV = 150
local AimTarget = nil

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.NumSides = 100
FOVCircle.Radius = AimFOV
FOVCircle.Filled = false
FOVCircle.Transparency = 0.4
FOVCircle.Color = Color3.fromRGB(0, 255, 255)
FOVCircle.Visible = false

-- Логика Аима и Круга
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
                    if dist < shortestDist then
                        shortestDist = dist
                        target = v
                    end
                end
            end
        end
        if target then
            cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, target.Character.Head.Position), AimSmoothness)
        end
    end
end)

-- 3. [ИНТЕРФЕЙС]
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB | МАШИНА УБИЙСТВА",
   LoadingTitle = "Запуск Систем...",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubMachine" }
})

local MainTab = Window:CreateTab("🏠 Main Hub")
local ScriptTab = Window:CreateTab("📜 Scripts")
local AimTab = Window:CreateTab("🎯 AimBot")
local ExtraTab = Window:CreateTab("⚙️ Extras")

-- [ MAIN HUB ]
MainTab:CreateButton({Name = "🎥 FOV 120", Callback = function() workspace.CurrentCamera.FieldOfView = 120 end})
MainTab:CreateSlider({Name = "⚡ Speed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end})
MainTab:CreateButton({Name = "👻 FE INVISIBLE", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-invisible-script-FE-143835"))() end})

-- [ SCRIPTS - 15 ЛОАДЕРОВ ]
local scripts = {
    ["💎 Bea Lucky Block"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock",
    ["🎡 Swing Obby"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots",
    ["🌌 Mystrix Hub"] = "https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader",
    ["🧪 Luarmor Loader"] = "https://api.jnkie.com/api/v1/luascripts/public/02cc51042a6797b20aeac438cd6b1c60be9a97fbecfc56aff3c2814d0d108a8b/download",
    ["⚡ Speed Escape"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/1SpeedEscapeforBrainrots",
    ["🌊 Escape Tsunami"] = "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5",
    ["🔪 Murderers VS Sheriffs"] = "https://raw.githubusercontent.com/Rysted/scripts/main/MurderersVSSheriffs.lua",
    ["🚀 Speed Hub X"] = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",
    ["🃏 Ace Hub"] = "https://raw.githubusercontent.com/Totocoems/Ace/main/Ace",
    ["💪 Get STRONG"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/GetSTRONGforBrainrots",
    ["🤿 Diving Legends"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/DivingLegends",
    ["💨 Fart Training"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/FartTraining"
}

for name, url in pairs(scripts) do
    ScriptTab:CreateButton({Name = name, Callback = function() loadstring(game:HttpGet(url))() end})
end

-- [ AIMBOT ]
AimTab:CreateToggle({Name = "Включить Авто-наводку", CurrentValue = false, Callback = function(V) AimEnabled = V end})
AimTab:CreateToggle({Name = "Показать Круг", CurrentValue = false, Callback = function(V) FOVCircle.Visible = V end})
AimTab:CreateSlider({Name = "Радиус (FOV)", Range = {50, 600}, Increment = 5, CurrentValue = 150, Callback = function(V) AimFOV = V end})
AimTab:CreateSlider({Name = "Плавность", Range = {0.05, 0.5}, Increment = 0.01, CurrentValue = 0.15, Callback = function(V) AimSmoothness = V end})
AimTab:CreateColorPicker({Name = "Цвет Круга", Color = Color3.fromRGB(0,255,255), Callback = function(V) FOVCircle.Color = V end})

Rayfield:Notify({ Title = "МАШИНА ГОТОВА!", Content = "Все системы DARK HUB V3 запущены ✅", Duration = 5 })
