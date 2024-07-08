local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local function v10(v4)
    local v5 = {};
    for _, v7 in v4:Get() do
        if v7:IsA("MeshPart") then
            table.insert(v5, v7);
        end;
        for _, v9 in (v7:GetDescendants()), nil, nil do
            if v9:IsA("MeshPart") then
                table.insert(v5, v9);
            end;
        end;
    end;
    return v5;
end;
return function()
    local v11 = v3:use():get();
    local v12, v13 = v2.useState(function()
        return (v10(v11));
    end);
    local v14, v15 = v2.useState(v12);
    v2.useEffect(function()
        local v18 = v11.SelectionChanged:Connect(function()
            local v16 = v10(v11);
            v13(function(v17)
                if not v1.shallowEqual(v17, v16) then
                    return v16;
                else
                    return v17;
                end;
            end);
        end);
        return function()
            v18:Disconnect();
        end;
    end, {});
    v2.useEffect(function()
        v15(v12);
        local v19 = {};
        local v20 = {};
        for _, v22 in v12, nil, nil do
            v20[v22] = v22.Orientation;
            table.insert(v19, v22.Changed:Connect(function()
                if v20[v22] ~= v22.Orientation then
                    v20[v22] = v22.Orientation;
                    v15(table.clone);
                end;
            end));
            table.insert(v19, v22.DescendantAdded:Connect(function(v23)
                if v23:IsA("SurfaceAppearance") then
                    v15(table.clone);
                end;
            end));
            local l_SurfaceAppearance_0 = v22:FindFirstChildOfClass("SurfaceAppearance");
            if l_SurfaceAppearance_0 then
                table.insert(v19, l_SurfaceAppearance_0.Changed:Connect(function(_)
                    v15(table.clone);
                end));
            end;
        end;
        return function()
            for _, v27 in v19, nil, nil do
                v27:Disconnect();
            end;
            v20 = {};
        end;
    end, {
        v12
    });
    if not table.isfrozen(v14) then
        return (table.freeze(v14));
    else
        return v14;
    end;
end;
