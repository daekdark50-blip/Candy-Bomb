local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Dark Creator | Candy ESP",
   LoadingTitle = "Загрузка читов...",
   LoadingSubtitle = "by Dark Creator",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false -- Без ключей, сразу в бой!
})

local Tab = Window:CreateTab("Main", 4483362458) -- Красивая иконка

local Section = Tab:CreateSection("Visual Functions")

-- ПЕРЕМЕННАЯ ДЛЯ ПРОВЕРКИ
local espEnabled = false

Tab:CreateButton({
   Name = "Включить Яркий ESP",
   Callback = function()
      espEnabled = true
      Rayfield:Notify({
         Title = "Dark Creator",
         Content = "ESP Активирован! Ищи конфеты.",
         Duration = 5,
         Image = 4483345998,
      })
      
      -- ЦИКЛ ПОДСВЕТКИ
      task.spawn(function()
          while espEnabled do
              for _, v in pairs(workspace:GetDescendants()) do
                  if v:IsA("BasePart") and (v.Name:lower():find("candy") or v.Name:lower():find("bomb")) then
                      if not v:FindFirstChild("BrightESP") then
                          local h = Instance.new("Highlight", v)
                          h.Name = "BrightESP"
                          h.FillColor = Color3.fromRGB(255, 0, 50) -- Ярко-красный
                          h.OutlineColor = Color3.fromRGB(255, 255, 255) -- Белый контур
                          h.FillOpacity = 0.5
                      end
                  end
              end
              task.wait(2) -- Обновляем каждые 2 секунды
          end
      end)
   end,
})

Tab:CreateButton({
   Name = "Выключить ESP",
   Callback = function()
      espEnabled = false
      for _, v in pairs(workspace:GetDescendants()) do
          if
					
