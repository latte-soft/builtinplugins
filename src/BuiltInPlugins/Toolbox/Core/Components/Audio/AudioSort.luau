local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SectionHeader);
local v5 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioTable);
local v6 = require(l_script_FirstAncestor_0.Core.Components.NoSceneSuggestions);
local _ = require(l_script_FirstAncestor_0.Core.Types.AudioTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v9 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local v10 = require(l_script_FirstAncestor_0.Core.ContextServices.NavigationContext);
local v11 = require(l_script_FirstAncestor_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v12 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagAddMoreAudioSwimlaneAnalytics);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_LoadingIndicator_0 = v2.UI.LoadingIndicator;
local l_Pane_0 = v2.UI.Pane;
return function(v16)
    local v17 = v9.new();
    local l_ResultsState_0 = v16.AudioSection.ResultsState;
    local l_name_0 = v16.AudioSection.Section.name;
    local v20 = l_Stylizer_0:use();
    local l_LogAssetImpression_0 = v16.AssetLogicWrapperProps.LogAssetImpression;
    local v22 = v1.useRef(nil);
    local v23 = nil;
    local v24 = nil;
    if v12() then
        v23 = v10.use();
        v24 = v11.use();
    end;
    local v30 = v1.useCallback(function(v25, v26, v27, v28)
        if not l_LogAssetImpression_0 or not v22.current then
            return nil;
        else
            local v29 = nil;
            if v12() then
                v29 = v24:get().getNavigationContext(v23:get(), l_name_0);
            end;
            return l_LogAssetImpression_0(v25, v28, v26, v27, v22.current.AbsoluteSize, v22.current.AbsolutePosition, v29);
        end;
    end, {
        l_LogAssetImpression_0
    });
    local v31 = {
        Header = v1.createElement(v4, {
            LayoutOrder = v17:getNextOrder(), 
            Title = v16.AudioSection.Section.displayName, 
            OnClickSeeAll = v16.OnSeeAllActivated
        })
    };
    if not l_ResultsState_0 or l_ResultsState_0.loading then
        v31.Loading = v1.createElement(l_LoadingIndicator_0, {
            LayoutOrder = v17:getNextOrder()
        });
    elseif #l_ResultsState_0.assets > 0 then
        v31.AudioTable = v5.Generator({
            LayoutOrder = v17:getNextOrder(), 
            Assets = l_ResultsState_0.assets, 
            LogImpression = v30, 
            CanInsertAsset = v16.AssetLogicWrapperProps.CanInsertAsset, 
            OnAssetPreviewButtonClicked = v16.AssetLogicWrapperProps.OnAssetPreviewButtonClicked, 
            TryInsert = v16.AssetLogicWrapperProps.TryInsert, 
            TryOpenAssetConfig = v16.AssetLogicWrapperProps.TryOpenAssetConfig, 
            SwimlaneName = l_name_0
        });
    elseif v16.AudioSection.Section.name == v3.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then
        v31.NoSceneSuggestions = v1.createElement(v6, {
            LayoutOrder = v17:getNextOrder()
        });
    end;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v16.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v20.spacingUnit, 
        ref = v22
    }, v31);
end;
