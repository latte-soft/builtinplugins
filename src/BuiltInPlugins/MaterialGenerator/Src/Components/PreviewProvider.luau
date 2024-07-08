local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_LUAU_ANALYZE_ERROR_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).LUAU_ANALYZE_ERROR;
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v5 = require(l_Hooks_0.useMaterialVariants);
local v6 = require(l_Hooks_0.useSelectedParts);
local v7 = require(l_script_FirstAncestor_0.Src.Util.PreviewContext);
return function(v8)
    local v9, v10 = v2.useState(nil);
    local v11 = v6();
    local v12 = v2.useRef(false);
    v5();
    local v13 = v2.useCallback(function()
        v12.current = false;
    end, {});
    v2.useEffect(function()
        if v8.enabled then
            if not v9 or #v11 == 0 then
                return function()
                end;
            else
                assert(v9 ~= nil, l_LUAU_ANALYZE_ERROR_0);
                local v16 = v9:GetPropertyChangedSignal("BaseMaterial"):Connect(function()
                    for _, v15 in v11, nil, nil do
                        v15.Material = v9.BaseMaterial;
                    end;
                end);
                local v19 = v9:GetPropertyChangedSignal("Name"):Connect(function()
                    for _, v18 in v11, nil, nil do
                        v18.MaterialVariant = v9.Name;
                    end;
                end);
                local v22 = v1.map(v11, function(v20)
                    local v21 = {
                        part = v20, 
                        material = v20.Material, 
                        materialVariant = v20.MaterialVariant
                    };
                    v20.Material = v9.BaseMaterial;
                    v20.MaterialVariant = v9.Name;
                    return v21;
                end);
                v12.current = true;
                return function()
                    v16:Disconnect();
                    v19:Disconnect();
                    if not (not v12.current or not v22) and #v22 > 0 then
                        for _, v24 in v22, nil, nil do
                            local l_part_0 = v24.part;
                            l_part_0.Material = v24.material;
                            l_part_0.MaterialVariant = v24.materialVariant;
                        end;
                    end;
                end;
            end;
        else
            return ;
        end;
    end, {
        v8.enabled, 
        v9, 
        v11
    });
    return v2.createElement(v7.Provider, {
        value = {
            selectedMaterial = v9, 
            setSelectedMaterial = v10, 
            applySelectedMaterial = v13
        }
    }, v8.children);
end;
