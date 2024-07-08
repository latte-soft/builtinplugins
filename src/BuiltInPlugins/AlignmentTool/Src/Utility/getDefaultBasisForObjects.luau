local l_Workspace_0 = game:GetService("Workspace");
return function(v1)
    local l_Terrain_0 = l_Workspace_0.Terrain;
    for v3 = #v1, 1, -1 do
        local v4 = v1[v3];
        if v4:IsA("BasePart") and v4 ~= l_Terrain_0 then
            return v4.CFrame;
        elseif v4:IsA("Model") then
            local l_v4_BoundingBox_0, _ = v4:GetBoundingBox();
            return l_v4_BoundingBox_0;
        end;
    end;
    return nil;
end;
