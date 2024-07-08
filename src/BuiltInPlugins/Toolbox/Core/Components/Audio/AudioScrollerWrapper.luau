local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v4 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioScroller);
local _ = require(l_script_FirstAncestor_0.Core.Components.ResultsFetcher);
local v6 = require(l_script_FirstAncestor_0.Core.ContextServices.NavigationContext);
local v7 = require(l_script_FirstAncestor_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v8 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagAddMoreAudioSwimlaneAnalytics);
local l_Pane_0 = v2.UI.Pane;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
return function(v11)
    local l_ResultsState_0 = v11.ResultsState;
    local l_LogAssetImpression_0 = v11.AssetLogicWrapperProps.LogAssetImpression;
    local v14 = nil;
    local v15 = nil;
    if v8() then
        v14 = v6.use();
        v15 = v7.use();
    end;
    local v16, v17 = v1.useState({
        size = Vector2.zero, 
        position = Vector2.zero
    });
    local v23 = v1.useCallback(function(v18, v19, v20, v21)
        if not l_LogAssetImpression_0 then
            return nil;
        else
            local v22 = nil;
            if v8() then
                v22 = v15:get().getNavigationContext(v14:get(), v11.SwimlaneName);
            end;
            return l_LogAssetImpression_0(v18, v21, v19, v20, v16.size, v16.position, v22);
        end;
    end, {
        l_LogAssetImpression_0, 
        v16
    });
    local v25 = v1.useCallback(function(v24)
        v17({
            size = v24.AbsoluteSize, 
            position = v24.AbsolutePosition
        });
    end, {});
    return v1.createElement(l_Pane_0, {
        BackgroundColor = l_Stylizer_0:use().backgroundColor, 
        [v1.Change.AbsoluteSize] = v25, 
        [v1.Change.AbsolutePosition] = v25
    }, {
        AudioScroller = v4.Generator({
            Assets = l_ResultsState_0.assets, 
            RenderTopContent = v11.RenderTopContent, 
            PageSize = v11.PageSize, 
            FetchNextPage = l_ResultsState_0.fetchNextPage, 
            Loading = l_ResultsState_0.loading, 
            ParentAbsoluteSize = v16.size, 
            ParentAbsolutePosition = v16.position, 
            CanInsertAsset = v11.AssetLogicWrapperProps.CanInsertAsset, 
            LogImpression = v23, 
            OnAssetPreviewButtonClicked = v11.AssetLogicWrapperProps.OnAssetPreviewButtonClicked, 
            TryInsert = v11.AssetLogicWrapperProps.TryInsert, 
            TryOpenAssetConfig = v11.AssetLogicWrapperProps.TryOpenAssetConfig, 
            SwimlaneName = v11.SwimlaneName
        })
    });
end;
