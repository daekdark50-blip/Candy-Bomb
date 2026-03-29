local HackerTab = Window:CreateTab("🌐 Global Hackers")

-- 1. Jenna (Проверенный способ загрузки)
HackerTab:CreateButton({
   Name = "🎀 Jenna (Fix)",
   Callback = function()
       local success, err = pcall(function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/manimcool21/roblox-Jenna-script-/main/Protected%20(3).lua"))()
       end)
       if not success then
           Rayfield:Notify({Title = "Ошибка", Content = "Скрипт Jenna не отвечает", Duration = 3})
       end
   end,
})

-- 2. 1x1x1x1 + ТВОЯ КНОПКА ЗАКРЫТИЯ (ЧЕРНЫЙ ПЛЮС)
HackerTab:CreateButton({
   Name = "🔴 1x1x1x1 + Черный Плюс",
   Callback = function()
       -- Запускаем сам хак
       loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoilet7/1x1x1x1/main/1x1x1x1.lua"))()
       
       -- СОЗДАЕМ ТВОЮ КНОПКУ (ЧЕРНЫЙ ПЛЮС)
       local MainGui = Instance.new("ScreenGui")
       local PlusBtn = Instance.new("TextButton")
       
       MainGui.Name = "PlusToggleGui"
       MainGui.Parent = game.CoreGui
       MainGui.DisplayOrder = 999
       
       PlusBtn.Name = "BlackPlus"
       PlusBtn.Parent = MainGui
       PlusBtn.BackgroundColor3 = Color3.new(0, 0, 0) -- ЧЕРНЫЙ
       PlusBtn.Size = UDim2.new(0, 70, 0, 70) -- БОЛЬШОЙ
       PlusBtn.Position = UDim2.new(0.05, 0, 0.4, 0) -- СЛЕВА
       PlusBtn.Text = "+"
       PlusBtn.TextColor3 = Color3.new(1, 1, 1) -- БЕЛЫЙ
       PlusBtn.TextSize = 50
       PlusBtn.Active = true
       PlusBtn.Draggable = true -- Можно двигать!

       -- Функция закрытия/открытия меню 1x1x1x1
       PlusBtn.MouseButton1Click:Connect(function()
           -- Ищем все меню 1x1x1x1 на экране и скрываем их
           for _, v in pairs(game.CoreGui:GetChildren()) do
               if v:IsA("ScreenGui") and v.Name ~= "Rayfield" and v.Name ~= "PlusToggleGui" then
                   v.Enabled = not v.Enabled
               end
           end
           for _, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
                if v:IsA("ScreenGui") and v.Name ~= "Rayfield" then
                    v.Enabled = not v.Enabled
                end
           end
       end)
   end,
})

-- 3. Guest 666 (Прямая ссылка без ошибок)
HackerTab:CreateButton({
   Name = "👹 Guest 666",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/KvtmH8BX"))()
   end,
})
