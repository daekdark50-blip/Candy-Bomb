-- [[ DARK PROJECT | LOADER SYSTEM ]]

if not game:IsLoaded() then game.Loaded:Wait() end

-- 1. ЭЛИТНЫЙ МИНИМАЛИСТИЧНЫЙ ВИЗУАЛ
local loaderGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local mainFrame = Instance.new("Frame", loaderGui)
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5) -- Тот самый черный
mainFrame.BorderSizePixel = 0

local barBg = Instance.new("Frame", mainFrame)
barBg.Size = UDim2.new(0, 350, 0, 4)
barBg.Position = UDim2.new(0.5, -175, 0.5, 0)
barBg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
barBg.BorderSizePixel = 0

local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Неоново-красный
barFill.BorderSizePixel = 0

-- 2. ЗАГРУЗКА ТВОЕГО СКРИПТА
task.spawn(function()
    -- Анимация ползунка
    local ts = game:GetService("TweenService")
    local tween = ts:Create(barFill, TweenInfo.new(2.5, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    
    -- ТВОЯ ССЫЛКА НА GITHUB
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/daekdark50-blip/Candy-Bomb/main/main.lua"))()
    end)
    
    if not success then
        warn("Ошибка загрузки основного скрипта: " .. tostring(err))
    end
    
    tween.Completed:Wait()
    task.wait(0.2)
    loaderGui:Destroy()
end)
