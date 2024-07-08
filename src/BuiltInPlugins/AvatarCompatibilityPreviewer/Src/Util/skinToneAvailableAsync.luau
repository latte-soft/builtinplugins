local l_AssetService_0 = game:GetService("AssetService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local function _(v5)
    if v5.TextureID ~= "" then
        return v5.TextureID;
    else
        local l_SurfaceAppearance_0 = v5:FindFirstChildWhichIsA("SurfaceAppearance");
        if l_SurfaceAppearance_0 ~= nil and l_SurfaceAppearance_0.ColorMap ~= "" then
            return l_SurfaceAppearance_0.ColorMap;
        else
            return nil;
        end;
    end;
end;
return function(v8)
    assert(v4(), "FFlagAvatarPreviewerSkinToneAlphaDetection not available");
    local v9 = {};
    for _, v11 in v2.LIMBS, nil, nil do
        local l_v8_FirstChild_0 = v8:FindFirstChild(v11);
        local v13 = false;
        if l_v8_FirstChild_0 ~= nil then
            v13 = l_v8_FirstChild_0:IsA("MeshPart");
        end;
        assert(v13, "Couldn't find limb part");
        local v14;
        if l_v8_FirstChild_0.TextureID ~= "" then
            v14 = l_v8_FirstChild_0.TextureID;
        else
            v13 = l_v8_FirstChild_0:FindFirstChildWhichIsA("SurfaceAppearance");
            v14 = if v13 ~= nil and v13.ColorMap ~= "" then v13.ColorMap else nil;
        end;
        if v14 == nil then
            return true;
        else
            assert(v14 ~= nil, v2.LUAU_ANALYZE_ERROR);
            if not v9[v14] then
                v9[v14] = true;
                v13 = l_AssetService_0:CreateEditableImageAsync(v14);
                local v15 = v13:ReadPixels(Vector2.new(), v13.Size);
                for v16 = 4, #v15, 4 do
                    if v15[v16] ~= 1 then
                        return true;
                    end;
                end;
            end;
        end;
    end;
    return false;
end;
