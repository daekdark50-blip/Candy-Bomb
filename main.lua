local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Mystic Hub (Full)",
   LoadingTitle = "Загрузка скриптов...",
   LoadingSubtitle = "by Your Name",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MysticHubConfig",
      FileName = "MainHub"
   }
})

local Tab = Window:CreateTab("Scripts", 4483362458) -- Иконка списка

-- 1. Mystic Hub (Full)
Tab:CreateButton({
   Name = "1. Mystic Hub (Full)",
   Callback = function()
      loadstring(game:HttpGet("ССЫЛКА_НА_СКРИПТ_1"))()
   end,
})

-- 2. Swing Obby for Brainrot
Tab:CreateButton({
   Name = "2. Swing Obby for Brainrot",
   Callback = function()
      loadstring(game:HttpGet("ССЫЛКА_НА_СКРИПТ_2"))()
   end,
})

-- 3. Be a Lucky Block
Tab:CreateButton({
   Name = "3. Be a Lucky Block",
   Callback = function()
      loadstring(game:HttpGet("ССЫЛКА_НА_СКРИПТ_3"))()
   end,
})

-- 4. Jump for Lucky Block
Tab:CreateButton({
   Name = "4. Jump for Lucky Block",
   Callback = function()
      loadstring(game:HttpGet("ССЫЛКА_НА_СКРИПТ_4"))()
   end,
})

-- 5. Fly for Brainrots
Tab:CreateButton({
   Name = "5. Fly for Brainrots",
   Callback = function()
      loadstring(game:HttpGet("ССЫЛКА_НА_СКРИПТ_5"))()
   end,
})

-- 6. Lucky Block Battle (Fixed)
Tab:CreateButton({
   Name = "6. Lucky Block Battle (Fixed)",
   Callback = function()
      loadstring(game:HttpGet("ССЫЛКА_НА_СКРИПТ_6"))()
   end,
})

-- 7. Popcorn Hub
Tab:CreateButton({
   Name = "7. Popcorn Hub",
   Callback = function()
      loadstring(game:HttpGet("ССЫЛКА_НА_СКРИПТ_7"))()
   end,
})

-- 8. Trolls Hub
Tab:CreateButton({
   Name = "8. Trolls Hub",
   Callback = function()
      loadstring(game:HttpGet("ССЫЛКА_НА_СКРИПТ_8"))()
   end,
})

-- 9. Infinite Yield
Tab:CreateButton({
   Name = "9. Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

-- 10. CMD-X
Tab:CreateButton({
   Name = "10. CMD-X",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/main"))()
   end,
})

-- 11. X-Ray (Walls)
Tab:CreateButton({
   Name = "11. X-Ray (Walls)",
   Callback = function()
      loadstring(game:HttpGet("ССЫЛКА_НА_СКРИПТ_11"))()
   end,
})
