-- [[ РАЗДЕЛ ГЛОБАЛЬНЫХ ХАКЕРОВ ]]
local HackerTab = Window:CreateTab("🌐 Global Hackers")

-- 1. Кнопка для Jenna (Твой новый скрипт)
HackerTab:CreateButton({
   Name = "🎀 Запустить Jenna (Protected)",
   Callback = function()
       -- Твоя ссылка на Дженну
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/manimcool21/roblox-Jenna-script-/main/Protected%20(3).lua'),true))()
       Rayfield:Notify({Title = "Hacker Hub", Content = "Jenna (Protected) запущен!", Duration = 3})
   end,
})

-- 2. Кнопка для 1x1x1x1 с фиксом меню (Черный плюс)
HackerTab:CreateButton({
   Name = "🔴 1x1x1x1 (С кнопкой закрытия)",
   Callback = function()
       -- Запускаем хак
       loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoilet7/1x1x1x1/main/1x1x1x1.lua"))()
       
       -- Создаем тот самый большой черный плюс
       local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
       local CloseBtn = Instance.new("TextButton", ScreenGui)
       
       CloseBtn.Name = "BlackPlusToggle"
       CloseBtn.Size = UDim2.new(0, 80, 0, 80) -- Еще больше, чтоб не промахнуться
       CloseBtn.Position = UDim2.new(0.05, 0, 0.5, 0) -- Слева по центру
       CloseBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Черный
       CloseBtn.BorderSizePixel = 2
       CloseBtn.Text = "+"
       CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
       CloseBtn.TextSize = 60
       CloseBtn.ZIndex = 1000000 -- Поверх всего
       
       -- Скругляем углы (опционально, для стиля)
       local UICorner = Instance.new("UICorner", CloseBtn)
       UICorner.CornerRadius = UDim.new(0, 10)
       
       CloseBtn.MouseButton1Click:Connect(function()
           -- Ищем меню хака 1x1x1x1 и скрываем/показываем его
           local target = game.CoreGui:FindFirstChild("1x1x1x1") or game.Players.LocalPlayer.PlayerGui:FindFirstChild("1x1x1x1")
           if target then
               target.Enabled = not target.Enabled
           else
               Rayfield:Notify({Title = "Инфо", Content = "Меню 1x1x1x1 не найдено в CoreGui", Duration = 2})
           end
       end)
   end,
})

-- 3. Кнопка для Guest 666
HackerTab:CreateButton({
   Name = "👹 Guest 666",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/KvtmH8BX"))()
   end,
})
