local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local l_LUAU_ANALYZE_ERROR_0 = v3.LUAU_ANALYZE_ERROR;
local l_useHistory_0 = v3.useHistory;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v7 = require(l_Util_0.GeneratedMaterialsContext);
local v8 = require(l_Util_0.addMaterials);
local v9 = require(l_Util_0.getAllMaterialVariants);
local v10 = require(l_Util_0.removeMaterial);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v12)
    local v13, v14 = v2.useState({});
    local v15, v16 = v2.useState({});
    local v17 = v2.useRef({});
    assert(v17.current ~= nil, l_LUAU_ANALYZE_ERROR_0);
    local function v22(v18)
        local l_current_0 = v17.current;
        for _, v21 in v18, nil, nil do
            assert(l_current_0[v21] == nil);
            l_current_0[v21] = v21.Destroying:Connect(function()
            end);
        end;
    end;
    local _ = function()
        for _, v24 in v17.current, nil, nil do
            v24:Disconnect();
        end;
        v17.current = {};
    end;
    v2.useEffect(function()
        return function()
            for _, v27 in v17.current, nil, nil do
                v27:Disconnect();
            end;
            v17.current = {};
        end;
    end, {});
    local v31 = l_useHistory_0(v13, function(v28)
        for _, v30 in v17.current, nil, nil do
            v30:Disconnect();
        end;
        v17.current = {};
        v14(v28);
        v22(v9(v28));
    end, {});
    return v2.createElement(v7.Provider, {
        value = {
            promptGroups = v13, 
            materialStates = v15, 
            addMaterials = v2.useCallback(function(v32, v33, v34, v35)
                if #v32 == 0 then
                    return ;
                else
                    v22(v32);
                    local v36 = table.clone(v15);
                    for _, v38 in v32, nil, nil do
                        v36[v38] = {
                            generationId = v35, 
                            hasBaseMaterial = false, 
                            status = "None"
                        };
                    end;
                    local v39 = v8(v32, v33, v34, v13);
                    v14(v39);
                    v16(v36);
                    v31("Update Materials", v39);
                    return ;
                end;
            end, {
                v13, 
                v15, 
                v31
            }), 
            removeMaterial = v2.useCallback(function(v40)
                local v41 = v10(v40, v13);
                local l_current_1 = v17.current;
                if l_current_1[v40] then
                    l_current_1[v40]:Disconnect();
                    l_current_1[v40] = nil;
                end;
                v14(v41);
                v31("Update Materials", v41);
            end, {
                v13, 
                v31
            }), 
            removeAllMaterials = v2.useCallback(function()
                for _, v44 in v17.current, nil, nil do
                    v44:Disconnect();
                end;
                v17.current = {};
                v14({});
                v31("Update Materials", {});
            end, {
                v13, 
                v31
            }), 
            hasBaseMaterial = v2.useCallback(function(v45)
                local v46 = v15[v45];
                assert(v46);
                return v46.hasBaseMaterial;
            end, {
                v15
            }), 
            markHasBaseMaterial = v2.useCallback(function(v47)
                local v48 = v15[v47];
                assert(v48);
                if not v48.hasBaseMaterial then
                    local v49 = table.clone(v15);
                    v49[v47] = v1.join(v49[v47], {
                        hasBaseMaterial = true
                    });
                    v16(v49);
                end;
            end, {
                v15
            }), 
            getMaterialStatus = v2.useCallback(function(v50)
                local v51 = v15[v50];
                assert(v51);
                return v51.status;
            end, {
                v15
            }), 
            setMaterialStatus = v2.useCallback(function(v52, v53)
                local v54 = v15[v52];
                assert(v54);
                if v54.status ~= v53 then
                    local v55 = table.clone(v15);
                    v55[v52] = v1.join(v54, {
                        status = v53
                    });
                    v16(v55);
                end;
            end, {
                v15
            })
        }
    }, v12.children);
end;
