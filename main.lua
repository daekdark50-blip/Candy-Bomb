--[[
	🍬 CANDY HUB OFFICIAL | REBORN
	- Твой личный хаб обновлен!
	- Черная загрузка + Черная Луна 🌑
	- Все твои новые лоадеры (Swing Obby, Plutonium)
	- Рабочее ВХ и Аимбот
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. [ЧЕРНЫЙ ЛОАДЕР CANDY]
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 400, 0, 100)
    label.Position = UDim2.new(0.5, -200, 0.5, -50)
    label.Text = "🍬 CANDY HUB LOADING..."
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 35
    label.Font = Enum.Font.GothamBold
    label.BackgroundTransparency = 1
    task.wait(2.2)
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

-- 3. [ОКНО ТВОЕГО ХАБА]
local Window = Rayfield:CreateWindow({
   Name = "🌑 CANDY HUB | LAST MACHINE",
   LoadingTitle = "Запуск Твоей Системы...",
   ConfigurationSaving = { Enabled = true, FileName = "CandyHubV3" }
})

local MainTab = Window:CreateTab("🏠 Main Hub")
local ScriptTab = Window:CreateTab("📜 Scripts")
local AimTab = Window:CreateTab("🎯 AimBot")
local VisualTab = Window:CreateTab("👁️ Visuals")

-- [ 🏠 MAIN HUB ]
MainTab:CreateSlider({Name = "⚡ Speed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end})
MainTab:CreateButton({Name = "👻 NEW INVISIBLE (Universal)", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-Script-Universal-109667"))() end})
MainTab:CreateButton({Name = "🎥 Установить FOV 120", Callback = function() workspace.CurrentCamera.FieldOfView = 120 end})

-- [ 📜 SCRIPTS - ТВОИ ФАВОРИТЫ ]
local loaders = {
    ["🎡 Swing Obby"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots",
    ["☢️ Plutonium (Lucky Block)"] = "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua",
    ["🌌 Mystrix Hub"] = "https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader",
    ["🚀 Speed Hub X"] = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",
    ["🔪 Murderers VS Sheriffs"] = "https://raw.githubusercontent.com/Rysted/scripts/main/MurderersVSSheriffs.lua"
}

for name, url in pairs(loaders) do
    ScriptTab:CreateButton({Name = name, Callback = function() loadstring(game:HttpGet(url))() end})
end

-- [ 🎯 AIMBOT ]
AimTab:CreateToggle({Name = "Авто-наводка", CurrentValue = false, Callback = function(V) AimEnabled = V end})
AimTab:CreateToggle({Name = "Показать Круг", CurrentValue = false, Callback = function(V) FOVCircle.Visible = V end})
AimTab:CreateSlider({Name = "Радиус", Range = {10, 600}, Increment = 1, CurrentValue = 150, Callback = function(V) AimFOV = V end})

-- [ 👁️ VISUALS ]
VisualTab:CreateButton({
    Name = "👁️ Включить ESP (ВХ)",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/IratuServices/SkidWare/main/UniversalESP.lua"))() end
})

local FPSLabel = VisualTab:CreateLabel("FPS: ...")
local PingLabel = VisualTab:CreateLabel("Ping: ...")
task.spawn(function()
    while task.wait(1) do
        FPSLabel:Set("FPS: " .. math.floor(workspace:GetRealPhysicsFPS()))
        local p = tonumber(string.format("%.0f", game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()))
        PingLabel:Set("Ping: " .. p .. "ms")
    end
end)

Rayfield:Notify({ Title = "🍬 CANDY HUB", Content = "Твой хаб обновлен и готов! ✅", Duration = 5 })
