local l_Workspace_0 = game:GetService("Workspace");
local _ = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Src.Components.EditingTools.BodyPointsTool.Types);
return function(v2, _, v4)
    for _, v6 in v4, nil, nil do
        if table.find(v2.hoveredPointNames, v6) ~= nil then
            return v6, nil, 1;
        end;
    end;
    if #v2.hoveredPointNames == 0 then
        return nil, nil, nil;
    elseif #v2.hoveredPointNames == 1 then
        return v2.hoveredPointNames[1], nil, 1;
    else
        local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
        assert(l_CurrentCamera_0 ~= nil, "Camera was set to nil before getMouseTarget");
        local v8 = nil;
        local l_huge_0 = math.huge;
        local v10 = 0;
        for _, v12 in v2.points, nil, nil do
            if table.find(v2.hoveredPointNames, v12.name) ~= nil then
                local l_Magnitude_0 = ((v2.worldModel.PrimaryPart.Position + v12.getCFrame().Position) - l_CurrentCamera_0.CFrame.Position).Magnitude;
                if l_Magnitude_0 < l_huge_0 then
                    l_huge_0 = l_Magnitude_0;
                    v8 = v12.name;
                end;
                v10 = v10 + 1;
                if not (v10 ~= #v2.hoveredPointNames) then
                    break;
                end;
            end;
        end;
        return v8, nil, 1;
    end;
end;
