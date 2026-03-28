-- [[ CANDY-BOMB: ADVANCED DRAG SYSTEM ]] --
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local function MakeDraggable(frame)
    local dragToggle = nil
    local dragSpeed = 0.15 -- Скорость плавности
    local dragStart = nil
    local startPos = nil

    local function updateInput(input)
        local delta = input.Position - dragStart
        local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        game:GetService("TweenService"):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
    end

    frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    uis.InputChanged:Connect(function(input)
        if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateInput(input)
        end
    end)
end

-- В функции CreateCandyHub найди строку, где создается M (Frame), и добавь:
-- MakeDraggable(M)
