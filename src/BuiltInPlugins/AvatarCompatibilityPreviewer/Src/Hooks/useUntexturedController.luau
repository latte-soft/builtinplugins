local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local function v6(v3)
    if not v3:IsA("MeshPart") then
        if not v3:IsA("SurfaceAppearance") then
            return nil;
        else
            local l_ColorMap_0 = v3.ColorMap;
            v3.ColorMap = "";
            return function()
                v3.ColorMap = l_ColorMap_0;
            end;
        end;
    else
        local l_TextureID_0 = v3.TextureID;
        v3.TextureID = "";
        return function()
            v3.TextureID = l_TextureID_0;
        end;
    end;
end;
return function(v7, v8)
    v1.useEffect(function()
        if v7 == nil then
            return nil;
        else
            assert(v7 ~= nil, v2.LUAU_ANALYZE_ERROR);
            if not v8 then
                local v9 = {};
                for _, v11 in v7:GetDescendants() do
                    v9[v11] = v6(v11);
                end;
                local v13 = v7.DescendantAdded:Connect(function(v12)
                    v9[v12] = v6(v12);
                end);
                local v15 = v7.DescendantRemoving:Connect(function(v14)
                    v9[v14] = nil;
                end);
                return function()
                    v13:Disconnect();
                    v15:Disconnect();
                    for _, v17 in v9, nil, nil do
                        v17();
                    end;
                end;
            else
                return nil;
            end;
        end;
    end, {
        v8, 
        v7
    });
end;
