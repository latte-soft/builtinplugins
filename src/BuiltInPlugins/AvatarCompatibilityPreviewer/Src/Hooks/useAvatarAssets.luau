local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEquippedHoverMenu);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v5)
    return v1.useMemo(function()
        local v6 = {
            accessories = {}, 
            animation = nil, 
            clothing = {}, 
            emotion = nil, 
            patches = {}, 
            skinTone = nil
        };
        for v7, v8 in v5, nil, nil do
            local l_item_0 = v8.item;
            if l_item_0.source == v3.SOURCE_BUILTIN then
                assert(l_item_0.source == v3.SOURCE_BUILTIN, v3.LUAU_ANALYZE_ERROR);
                if not v2() then
                    v8.palette.WearBuiltin(l_item_0.builtinItem, v6, v7);
                elseif not v8.isHidden then
                    v8.palette.WearBuiltin(l_item_0.builtinItem, v6, v7);
                end;
            end;
        end;
        return v6;
    end, {
        v5
    });
end;
