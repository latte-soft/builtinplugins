return function()
    local v0 = {};
    local v1 = {};
    for _, v3 in pairs((game:GetDescendants())) do
        if v3:IsA("Model") then
            local l_PackageLink_0 = v3:FindFirstChildWhichIsA("PackageLink");
            if l_PackageLink_0 then
                local v5 = string.sub(l_PackageLink_0.PackageId, 14);
                if not v1[v5] then
                    v1[v5] = true;
                    local v6 = {
                        AssetId = v5, 
                        Name = v3.Name
                    };
                    v6.Image = string.format("rbxthumb://type=Asset&w=150&h=150&id=%s", v6.AssetId);
                    table.insert(v0, v6);
                end;
            end;
        end;
    end;
    return v0;
end;
