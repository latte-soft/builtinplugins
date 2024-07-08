local v0 = require(script:FindFirstAncestor("AssetImporter").Src.Utility.getWorkspaceInsertPosition);
local function v4(v1)
    for _, v3 in pairs(v1:GetChildren()) do
        if not (not v3:IsA("BasePart") and not v3:IsA("JointInstance")) then
            v3:Destroy();
        end;
    end;
end;
return function(v5, v6)
    local l_Position_0 = v6.WorldPivot.Position;
    local l_v6_ExtentsSize_0 = v6:GetExtentsSize();
    local v9 = math.max(l_v6_ExtentsSize_0.X, l_v6_ExtentsSize_0.Y, l_v6_ExtentsSize_0.Z);
    if not v5.InsertWithScenePosition then
        l_Position_0 = v0();
    end;
    local l_PartBoundsInRadius_0 = game.Workspace:GetPartBoundsInRadius(l_Position_0, (math.max(v9 * 3, 100)));
    local l_Model_0 = Instance.new("Model");
    for _, v13 in l_PartBoundsInRadius_0, nil, nil do
        local v14 = v13:Clone();
        v4(v14);
        v14.Parent = l_Model_0;
    end;
    local v15 = v6:Clone();
    v15.Parent = game.Workspace;
    if not v5.InsertWithScenePosition then
        v15:MoveTo(l_Position_0);
    end;
    local l_v15_BoundingBox_0 = v15:GetBoundingBox();
    v15.Parent = nil;
    l_Model_0.WorldPivot = CFrame.new();
    return l_Model_0, (CFrame.new(-l_v15_BoundingBox_0.Position));
end;
