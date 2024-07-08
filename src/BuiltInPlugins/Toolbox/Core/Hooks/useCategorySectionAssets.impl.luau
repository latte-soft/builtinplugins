local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local _ = require(l_script_FirstAncestor_0.Core.Requests.fetchCategoryAssets);
local _ = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local v7 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v8 = require(l_script_FirstAncestor_0.Core.Hooks.usePrevious);
local l_deepEqual_0 = v2.Util.deepEqual;
return function(v10)
    return function(v11, v12)
        local l_networkInterface_0 = v4:use().networkInterface;
        local v14, v15 = v1.useState({});
        local v16 = v1.useRef({});
        local v17 = v1.useRef({});
        local v18 = v1.useRef(0);
        local v22 = v1.useMemo(function()
            local v19 = {};
            for _, v21 in v12, nil, nil do
                v19[v21.name] = v21;
            end;
            return v19;
        end, {
            v12
        });
        local v23 = v8(v22);
        local v32 = v1.useMemo(function()
            local v24 = {};
            local v25 = {};
            if not v23 then
                return {
                    added = v12, 
                    removed = {}
                };
            else
                for _, v27 in v22, nil, nil do
                    local v28 = v23[v27.name];
                    if not (v28 and l_deepEqual_0(v27, v28)) then
                        table.insert(v24, v27);
                    end;
                end;
                for _, v30 in v23, nil, nil do
                    local v31 = v22[v30.name];
                    if not (v31 and l_deepEqual_0(v30, v31)) then
                        table.insert(v25, v30);
                    end;
                end;
                return {
                    added = v24, 
                    removed = v25
                };
            end;
        end, {
            v22, 
            v23, 
            v12
        });
        local v33 = nil;
        v33 = v1.useCallback(function(v34, v35)
            if not v17.current[v34] then
                v17.current[v34] = true;
                v15(function(v36)
                    if not v36[v34] then
                        return v3.Dictionary.join(v36, {
                            [v34] = {
                                loading = true, 
                                assets = {}, 
                                assetMap = {}, 
                                assetIds = {}
                            }
                        });
                    else
                        return v3.Dictionary.join(v36, {
                            [v34] = v3.Dictionary.join(v36[v34], {
                                loading = true
                            })
                        });
                    end;
                end);
                v10.fetchCategoryAssets(l_networkInterface_0, v11, v34, v35):andThen(function(v37)
                    if v17.current[v34] then
                        local l_v18_0 = v18;
                        l_v18_0.current = l_v18_0.current + 1;
                        v17.current[v34] = nil;
                        v16.current[v34] = true;
                        v15(function(v39)
                            local v40 = v39[v34];
                            local v41 = if not not v40 and v40.assets then #v40.assets else 0;
                            local v42 = {};
                            for v43, v44 in v37.assetIds, nil, nil do
                                local v45 = v37.assetMap[v44];
                                if not v45 then
                                    if v7.shouldDebugWarnings() then
                                        warn((("asset with ID %* not found in asset map"):format(v44)));
                                    end;
                                else
                                    v45.Context = {
                                        page = math.round(v41 / v18.current) + 1, 
                                        pagePosition = v43, 
                                        position = v41 + v43
                                    };
                                    table.insert(v42, v45);
                                end;
                            end;
                            return v3.Dictionary.join(v39, {
                                [v34] = v3.Dictionary.join(v40, {
                                    loading = false, 
                                    assets = v3.List.join(v40.assets, v42), 
                                    assetMap = {}, 
                                    assetIds = {}, 
                                    fetchNextPage = function()
                                        v33(v34, (v3.Dictionary.join(v35 or {}, {
                                            nextPageCursor = v37.nextPageCursor
                                        })));
                                    end
                                })
                            });
                        end);
                        return ;
                    else
                        return ;
                    end;
                end):catch(function(v46)
                    if v7.shouldDebugWarnings() then
                        warn(("failed to fetch assets for category \"%*\" and section \"%*\":"):format(v11, v34), v46);
                    end;
                    v17.current[v34] = nil;
                    v15(function(v47)
                        return v3.Dictionary.join(v47, {
                            [v34] = v3.Dictionary.join(v47[v34], {
                                loading = false
                            })
                        });
                    end);
                end);
                return ;
            else
                return ;
            end;
        end, {
            v11, 
            l_networkInterface_0
        });
        local v50 = v1.useCallback(function(v48)
            v17.current[v48] = nil;
            v16.current[v48] = nil;
            v15(function(v49)
                return v3.Dictionary.join(v49, {
                    [v48] = v3.None
                });
            end);
        end, {});
        v1.useEffect(function()
            for _, v52 in v32.removed, nil, nil do
                v50(v52.name);
            end;
            for _, v54 in v32.added, nil, nil do
                v33(v54.name, v54.fetchArgs);
            end;
        end, {
            v32, 
            v33, 
            v50
        });
        return v14;
    end;
end;
