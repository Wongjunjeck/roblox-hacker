-- 自动刷怪脚本（适合 179 级 Blox Fruits 玩家）
-- 脚本用途：自动接任务、自动刷 “军舰队长” 怪（Captain）

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local function teleportTo(pos)
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end

local function getQuest()
    local quest = workspace:FindFirstChild("QuestBoard") or workspace:FindFirstChild("QuestGiver")
    if quest and quest:FindFirstChild("Head") then
        teleportTo(quest.Head.Position + Vector3.new(0, 3, 0))
        wait(1)
        fireclickdetector(quest.Head:FindFirstChildOfClass("ClickDetector"))
    end
end

local function attackNearby()
    for _, mob in pairs(workspace.Enemies:GetChildren()) do
        if mob.Name:find("Captain") and mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
            teleportTo(mob.HumanoidRootPart.Position + Vector3.new(0, 2, 0))
            wait(0.2)
            -- 自动攻击
            for _, tool in pairs(player.Backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    tool.Parent = char
                    tool:Activate()
                end
            end
        end
    end
end

-- 主循环
while true do
    pcall(function()
        getQuest()
        wait(1)
        attackNearby()
    end)
    wait(2)
end
