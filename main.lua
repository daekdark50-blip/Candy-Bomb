-- [[ ОБНОВЛЕННЫЙ РАЗДЕЛ ХАКЕРОВ ]]
local HackerTab = Window:CreateTab("🌐 Global Hackers")

-- 1. Дженна (Вариант 2, более стабильный)
HackerTab:CreateButton({
   Name = "🎀 Jenna (Stable Version)",
   Callback = function()
       -- Если прошлая ссылка не сработала, пробуем этот вариант:
       pcall(function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/Secrecy-S/Jenna/main/Main.lua"))()
       end)
       Rayfield:Notify({Title = "Hacker Hub", Content = "Попытка запуска Jenna...", Duration = 3})
   end,
})

-- 2. Guest 666 (Фикс ошибки Callback)
HackerTab:CreateButton({
   Name = "👹 Guest 666 (Fixed)",
   Callback = function()
       -- Прямой запуск через проверенный гитхаб
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Its-Arun/Guest-666/main/Script.lua"))()
   end,
})

-- 3. 1x1x1x1 (С "Железной" кнопкой закрытия)
HackerTab:CreateButton({
   Name = "🔴 1x1x1x1 + Черный Плюс",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoilet7/1x1x1x1/main/1x1x1x1.lua"))()
       
       -- Создаем кнопку, которая принудительно ищет любое GUI на экране
       local sg = Instance.new("ScreenGui", game.CoreGui)
       local btn = Instance.new("TextButton", sg)
       btn.Size = UDim2.new(0, 80, 0, 80)
       btn.Position = UDim2.new(0, 20, 0.5, 0)
       btn.BackgroundColor3 = Color3.new(0,0,0)
       btn.Text = "+"
       btn.TextColor3 = Color3.new(1,1,1)
       btn.TextSize = 50
       btn.Active = true
       btn.Draggable = true -- Можно двигать по экрану!

       btn.MouseButton1Click:Connect(function()
           -- Ищем вообще любое подозрительное меню, если 1x1x1x1 не отзывается
           for _, v in pairs(game.CoreGui:GetChildren()) do
               if v:IsA("ScreenGui") and v ~= sg and v.Name ~= "Rayfield" then
                   v.Enabled = not v.Enabled
               end
           end
       end)
   end,
})
