local Players = game:GetService("Players")
local function grabPlayers(plr: Player, dist: number)
    local Close = {}
    local Character = plr.Character
    local HumanoidRootPart: BasePart = Character:FindFirstChild('HumanoidRootPart')
    local rootPos: Vector3 = HumanoidRootPart.Position

    for _,v  in pairs(Players:GetPlayers()) do
        if v.Character and v.Character ~= plr.Character then
            local root = v.Character:FindFirstChild('HumanoidRootPart')
            if root then
                local foundPos: Vector3 = root.Position
                if (rootPos - foundPos).Magnitude < dist then
                    table.insert(Close, v)
                else
                    for i, player in ipairs(Close) do
                        if player == v then
                            table.remove(Close, i)
                        end
                    end
                end
            end
        end
    end
    return Close
end

return grabPlayers