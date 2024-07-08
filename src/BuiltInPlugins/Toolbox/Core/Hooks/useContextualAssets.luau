local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactSceneUnderstanding);
local v4 = require(l_script_FirstAncestor_0.Core.Util.findFirstAncestorSourceAsset);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local function v14(v7, v8)
    local v9 = {};
    for _, v11 in v7, nil, nil do
        local l_status_0, l_result_0 = pcall(function()
            return v11[v8];
        end);
        if l_status_0 then
            table.insert(v9, l_result_0);
        end;
    end;
    return v9;
end;
return function()
    local v15 = v3.useAssetsInView();
    local v16 = v3.useAssetsInRange();
    local v19 = l_useCallback_0(function(v17)
        return v1.List.filter(v17, function(v18)
            return v4(v18) == nil;
        end);
    end, {});
    local v20 = l_useMemo_0(function()
        return (v14(v19(v15), "SourceAssetId"));
    end, {
        v15
    });
    local v21 = l_useMemo_0(function()
        return (v14(v19(v16), "SourceAssetId"));
    end, {
        v16
    });
    return (l_useMemo_0(function()
        return {
            assetsInCameraViewport = v20, 
            assetsInCameraVicinity = v21
        };
    end, {
        v20, 
        v21
    }));
end;
