local HackerTab = Window:CreateTab("🌐 Global Hackers")

-- 1. Исправленная Jenna (через другой хост)
HackerTab:CreateButton({
   Name = "🎀 Jenna GUI (Fixed)",
   Callback = function()
       -- Эта ссылка обычно работает на мобилках и ПК лучше всего
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Dex-Sripts/Home/main/Jenna%20Hub"))()
   end,
})

-- 2. Guest 666 (Админ-панель)
HackerTab:CreateButton({
   Name = "👹 Guest 666 Admin",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
       -- Это мощный админ, который часто называют "скриптом Гостя 666"
   end,
})

-- 3. Твой 1x1x1x1 с "ЧЕРНЫМ ПЛЮСОМ"
HackerTab:CreateButton({
   Name = "🔴 1x1x1x1 (С большой кнопкой)",
   Callback = function()
       -- Запуск хака
       loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoilet7/1x1x1x1/main/1x1x1x1.lua"))()
       
       -- СОЗДАЕМ ТВОЮ КНОПКУ-ЗАКРЫВАШКУ
       local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
       local BlackButton = Instance.new("TextButton", ScreenGui)
       
       BlackButton.Name = "CloseHackButton"
       BlackButton.Size = UDim2.new(0, 90, 0, 90) -- Очень большая
       BlackButton.Position = UDim2.new(0.02, 0, 0.4, 0) -- Слева
       BlackButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Черная
       BlackButton.Text = "+" -- Твой плюс
       BlackButton.TextColor3 = Color3.new(1, 1, 1) -- Белый текст
       BlackButton.TextSize = 60
       BlackButton.ZIndex = 99999
       
       -- Сделаем её перетаскиваемой (чтобы не мешала)
       BlackButton.Active = true
       BlackButton.Draggable = true 

       BlackButton.MouseButton1Click:Connect(function()
           -- Скрываем все меню, кроме твоего основного хаба
           for _, v in pairs(game.CoreGui:GetChildren()) do
               if v:IsA("ScreenGui") and v.Name ~= "Rayfield" and v ~= ScreenGui then
                   v.Enabled = not v.Enabled
               end
           end
       end)
   end,
})
