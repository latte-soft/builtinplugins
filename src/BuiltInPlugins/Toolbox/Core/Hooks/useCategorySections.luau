local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v5 = require(l_script_FirstAncestor_0.Core.Hooks.useHomeConfiguration);
local v6 = require(l_script_FirstAncestor_0.Core.Hooks.useCategorySectionAssets);
local v7 = require(l_script_FirstAncestor_0.Core.Hooks.useContextualAssets);
local v8 = require(l_script_FirstAncestor_0.Core.Hooks.useCachedValue);
local _ = require(l_script_FirstAncestor_0.Core.Requests.fetchCategoryAssets);
local _ = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v12 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v13 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxThrottleContextualRecommendationRequests);
local l_Localization_0 = v2.ContextServices.Localization;
local l_game_FastInt_0 = game:GetFastInt("ToolboxSceneAnalysisPollingSeconds");
return function(v16, v17)
    local v18 = v5(v4.getEngineAssetType(v16.assetType), l_Localization_0:use().locale);
    local v19 = if not v13() then v7() else v8(v7(), l_game_FastInt_0);
    local v23 = v3.useMemo(function()
        local v20 = {};
        if not (not v18 or not v18.sections) then
            for _, v22 in v18.sections, nil, nil do
                if not v22.subcategory then
                    table.insert(v20, v22);
                end;
            end;
        end;
        return v20;
    end, {
        v18
    });
    local v28 = v6(v16.name, (v3.useMemo(function()
        local v24 = {};
        for _, v26 in v23, nil, nil do
            local v27 = {
                pageSize = v17
            };
            if v26.name == v12.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then
                v27 = v1.Dictionary.join(v27, {
                    assetsInCameraVicinity = v19.assetsInCameraVicinity, 
                    assetsInCameraViewport = v19.assetsInCameraViewport
                });
            end;
            table.insert(v24, {
                name = v26.name, 
                fetchArgs = v27
            });
        end;
        return v24;
    end, {
        v23, 
        v19.assetsInCameraVicinity, 
        v19.assetsInCameraViewport
    })));
    return (v3.useMemo(function()
        local v29 = {};
        if v18 then
            for _, v31 in v18.sections, nil, nil do
                table.insert(v29, {
                    Section = v31, 
                    ResultsState = v28[v31.name]
                });
            end;
        end;
        return v29;
    end, {
        v18, 
        v28
    }));
end;
