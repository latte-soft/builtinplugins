local _ = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Src.Components.EditingTools.BodyPointsTool.Types);
return function(v1)
    if #v1.selectedPoints == 0 then
        return CFrame.new(), Vector3.new(), (Vector3.new());
    else
        local l_huge_0 = math.huge;
        local v3 = -math.huge;
        local l_huge_1 = math.huge;
        local v5 = -math.huge;
        local l_huge_2 = math.huge;
        local v7 = -math.huge;
        local l_PrimaryPart_0 = v1.worldModel.PrimaryPart;
        for _, v10 in v1.selectedPoints, nil, nil do
            local l_Components_0, v12, v13 = v10.getCFrame():GetComponents();
            l_huge_0 = math.min(l_huge_0, l_Components_0);
            v3 = math.max(v3, l_Components_0);
            l_huge_1 = math.min(l_huge_1, v12);
            v5 = math.max(v5, v12);
            l_huge_2 = math.min(l_huge_2, v13);
            v7 = math.max(v7, v13);
        end;
        return l_PrimaryPart_0.CFrame + l_PrimaryPart_0.CFrame.Rotation * Vector3.new(0.5 * (l_huge_0 + v3), 0.5 * (l_huge_1 + v5), 0.5 * (l_huge_2 + v7)), Vector3.new(), (Vector3.new());
    end;
end;
