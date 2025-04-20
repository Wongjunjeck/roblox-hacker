local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.5, -50)
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)

local Text = Instance.new("TextLabel", Frame)
Text.Size = UDim2.new(1, 0, 1, 0)
Text.Text = "脚本正常运行！"
Text.TextColor3 = Color3.new(1, 1, 1)
Text.BackgroundTransparency = 1
