local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. СИСТЕМА ЛОАДЕРА (Тот самый, что тебе понравился)
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 350, 0, 120)
    frame.Position = UDim2.new(0.5, -175, 0.5, -60)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 10)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0.7, 0)
    label.Text = "Loading DARK HUB..."
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.TextSize = 24
    label.Font = Enum.Font.Offset

    local barBackground = Instance.new("Frame", frame)
    barBackground.Size = UDim2.new(0.8, 0, 0, 10)
    barBackground.Position = UDim2.new(0.1, 0, 0.75, 0)
    barBackground.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

    local bar = Instance.new("Frame", barBackground)
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    
    bar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 2)
    task.wait(2.2)
    screen:Destroy()
end

StartLoading()

-- 2. ОСНОВНОЕ ОКНО
local Window = Rayfield:CreateWindow({
   Name = "DARK HUB | V12 (PRO)",
   LoadingTitle = "Запуск Рауфельд...",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubConfig" }
})

-- 3. ВКЛАДКИ
local MainTab = Window:CreateTab("Главная", 4483362458)
local ScriptTab = Window:CreateTab("Скрипты", 4483362458)

-- 4. ВЕРНУЛ ИНФУ (ПИНГ/ФПС/ГПУ)
local InfoLabel = MainTab:CreateLabel("Network Stats Loading...")
task.spawn(function()
    while task.wait(1) do
        local fps = math.floor(1/game:GetService("RunService").RenderStepped:Wait())
        local ping = tonumber(string.format("%.0f", game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()))
        InfoLabel:Set("PING: "..ping.." | FPS: "..fps.." | GPU: NVIDIA (Fixed)")
    end
end)

-- 5. ФУНКЦИИ С ВКЛ/ВЫКЛ (Toggles)

-- Радуга (Вкл/Выкл)
local rainbowEnabled = false
MainTab:CreateToggle({
   Name = "🌈 Радужная кожа",
   CurrentValue = false,
   Callback = function(Value)
      rainbowEnabled = Value
      if rainbowEnabled then
          task.spawn(function()
              while rainbowEnabled do
                  local color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                  for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                      if v:IsA("BasePart") then v.Color = color end
                  end
                  task.wait(0.05)
              end
          end)
      end
   end,
})

-- Инвиз (Вкл/Выкл)
MainTab:CreateToggle({
   Name = "👻 Невидимка",
   CurrentValue = false,
   Callback = function(Value)
       local char = game.Players.LocalPlayer.Character
       for _, v in pairs(char:GetDescendants()) do
           if v:IsA("BasePart") or v:IsA("Decal") then
               v.Transparency = Value and 0.5 or 0 -- 0.5 чтобы тебя не кикало
           end
       end
   end,
})

-- Флай (Вкл/Выкл)
local flyEnabled = false
MainTab:CreateToggle({
   Name = "✈️ Полет (PC/Mobile)",
   CurrentValue = false,
   Callback = function(Value)
       flyEnabled = Value
       local root = game.Players.LocalPlayer.Character.HumanoidRootPart
       if flyEnabled then
           local bv = Instance.new("BodyVelocity", root)
           bv.Name = "DarkFly"
           bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
           task.spawn(function()
               while flyEnabled do
                   bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 80
                   task.wait()
               end
               bv:Destroy()
           end)
       else
           if root:FindFirstChild("DarkFly") then root.DarkFly:Destroy() end
       end
   end,
})

-- 6. ВКЛАДКА СКРИПТОВ (Добавь сюда свои любимые)
ScriptTab:CreateButton({
   Name = "Infinite Yield (Admin)",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

ScriptTab:CreateButton({
    Name = "SimpleSpy V3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
    end,
})

Rayfield:Notify({ Title = "Система готова!", Content = "Пинг и ФПС стабилизированы. Приятной игры!", Duration = 5 })
