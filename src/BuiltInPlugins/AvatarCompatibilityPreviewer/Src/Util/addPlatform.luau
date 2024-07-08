local l_InsertService_0 = game:GetService("InsertService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
return function(v5, v6, v7, v8)
    local v9 = l_InsertService_0:LoadLocalAsset(v2.PEDESTAL_PATH);
    local function v14()
        local l_v6_Pivot_0 = v6:GetPivot();
        local v11 = CFrame.new(l_v6_Pivot_0.Position - v6.PrimaryPart.Position) * l_v6_Pivot_0.Rotation;
        if not l_v6_Pivot_0.Position:FuzzyEq(v11.Position) then
            v6:PivotTo(v11);
        end;
        if not v4() then
            v9.CFrame = CFrame.new(v6.PrimaryPart.Position.X, (0 - (v6.Humanoid.HipHeight + v6.PrimaryPart.Size.Y * 0.5)) - v7 * 0.5, v6.PrimaryPart.Position.Z);
            return ;
        else
            local l_Humanoid_0 = v6:FindFirstChildWhichIsA("Humanoid");
            local v13 = 0;
            if l_Humanoid_0 ~= nil then
                assert(l_Humanoid_0:IsA("Humanoid"), v2.LUAU_ANALYZE_ERROR);
                v13 = v13 - l_Humanoid_0.HipHeight;
            end;
            v9.CFrame = CFrame.new(v6.PrimaryPart.Position.X, (v13 - v6.PrimaryPart.Size.Y * 0.5) - v7 * 0.5, v6.PrimaryPart.Position.Z);
            return ;
        end;
    end;
    v9.Size = Vector3.new(v8, v7, v8);
    v14();
    v9.Parent = v5;
    local v15 = task.spawn(function()
        while true do
            v14();
            task.wait();
        end;
    end);
    local v16 = nil;
    local function v17()
        v16:Disconnect();
        task.cancel(v15);
    end;
    v16 = v6.Destroying:Connect(v17);
    return v17;
end;
