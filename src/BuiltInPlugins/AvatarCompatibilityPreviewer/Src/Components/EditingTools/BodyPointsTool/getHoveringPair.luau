local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.DraggerSchema.getMouseTarget);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v4)
    if v4.generallyEquivalentPointNames == nil then
        return nil;
    else
        assert(v4.generallyEquivalentPointNames ~= nil, v3.LUAU_ANALYZE_ERROR);
        if #v4.hoveredPointNames <= 1 then
            return nil;
        else
            local v5 = v2(v4, Ray.new(Vector3.zero, Vector3.zero), v4.selection:Get());
            if v5 == nil then
                return nil;
            else
                assert(v5 ~= nil, v3.LUAU_ANALYZE_ERROR);
                for _, v7 in v4.generallyEquivalentPointNames, nil, nil do
                    assert(#v7 == 2, "Generally equivalent point names should be in pairs");
                    if not (v7[1] ~= v5) or v7[2] == v5 then
                        for _, v9 in v4.hoveredPointNames, nil, nil do
                            if v9 ~= v5 and (not (v9 ~= v7[1]) or v9 == v7[2]) then
                                return v7;
                            end;
                        end;
                    end;
                end;
                return nil;
            end;
        end;
    end;
end;
