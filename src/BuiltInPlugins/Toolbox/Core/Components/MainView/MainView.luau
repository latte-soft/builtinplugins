local _ = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Cryo);
local v6 = require(l_Packages_0.Framework);
local v7 = require(l_Parent_0.Core.Util.Constants);
local v8 = require(l_Parent_0.Core.Util.Layouter);
local v9 = require(l_Parent_0.Core.Types.Category);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_Parent_0.Core.ContextServices.Settings);
local v13 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v14 = require(l_Parent_0.Core.Components.AssetGridContainer);
local _ = require(l_Parent_0.Core.Components.InfoBanner);
local _ = require(l_Parent_0.Core.Components.NoResultsDetail);
local v17 = require(l_Packages_0.Dash);
local l_LoadingIndicator_0 = v6.UI.LoadingIndicator;
local l_Pane_0 = v6.UI.Pane;
local l_withAbsoluteSizeAndPosition_0 = v6.Wrappers.withAbsoluteSizeAndPosition;
local v21 = require(l_Parent_0.Core.Components.MainView.MainViewHeader);
local _ = require(l_Parent_0.Core.Components.Toast);
local v23 = require(l_Parent_0.Core.Networking.Requests.NextPageRequest);
local v24 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local v25 = require(l_Parent_0.Core.Components.Font.FontView);
local v26 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v27 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v28 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local v29 = v3.PureComponent:extend("MainView");
v29.init = function(v30, _)
    v30.headerHeight = 0;
    v30.containerWidth = 0;
    v30.scrollingFrameRef = v3.createRef();
    v30.requestNextPage = function()
        v30.props.nextPage(v30.props.Network.networkInterface, (v30.props.Settings:get("Plugin")));
    end;
end;
v29.render = function(v32)
    local l_props_0 = v32.props;
    local v34 = l_props_0.Position or UDim2.new(0, 0, 0, 0);
    local v35 = l_props_0.Size or UDim2.new(1, 0, 1, 0);
    local l_categoryName_0 = l_props_0.categoryName;
    local v37 = v9.categoryIsFont(l_categoryName_0);
    local v38 = l_props_0.isLoading or false;
    local v39 = l_props_0.maxWidth or 0;
    local v40 = l_props_0.networkErrors or {};
    local _ = v40[#v40];
    local l_includeUnverifiedCreators_0 = l_props_0.includeUnverifiedCreators;
    local v43 = (v39 - 2 * v7.MAIN_VIEW_PADDING) - v7.SCROLLBAR_PADDING;
    local v44 = l_props_0.creator and l_props_0.creator.Name;
    local l_searchTerm_0 = l_props_0.searchTerm;
    local v46 = false;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    if not v27() then
        local v50 = true;
        if l_includeUnverifiedCreators_0 ~= true then
            v50 = true;
            if v44 == nil then
                if v26() then
                    v50 = true;
                    if not (next(l_props_0.creatorTargetIds) == nil) then
                        goto label0;
                    end;
                end;
                if v26() then
                    v50 = true;
                    if not (next(l_props_0.groupTargetIds) == nil) then
                        goto label0;
                    end;
                end;
                v50 = true;
                if #l_searchTerm_0 <= 0 then
                    v50 = true;
                    if l_props_0.audioSearchInfo == nil then
                        v50 = l_props_0.additionalAudioSearchInfo ~= nil;
                    end;
                end;
            end;
        end;
        ::label0::;
        v49 = v50;
        local v51;
        v50, v51 = v8.calculateMainViewHeaderHeight(v49, nil, nil, nil);
        v47 = v50;
        v48 = v51;
    else
        local v52 = true;
        if l_includeUnverifiedCreators_0 ~= true then
            v52 = true;
            if v44 == nil then
                if v26() then
                    v52 = true;
                    if not (next(l_props_0.creatorTargetIds) == nil) then
                        goto label1;
                    end;
                end;
                if v26() then
                    v52 = true;
                    if not (next(l_props_0.groupTargetIds) == nil) then
                        goto label1;
                    end;
                end;
                v52 = true;
                if l_props_0.audioSearchInfo == nil then
                    v52 = true;
                    if l_props_0.additionalAudioSearchInfo == nil then
                        v52 = l_props_0.uiSortIntent ~= nil;
                    end;
                end;
            end;
        end;
        ::label1::;
        v49 = v52;
        v46 = #l_searchTerm_0 > 0;
        v52 = false;
        if l_props_0.correctionState == v24.AutocorrectResponseState.CorrectionAvailable then
            v52 = l_props_0.correctedQuery ~= "";
        end;
        local v53 = false;
        if l_props_0.correctionState == v24.AutocorrectResponseState.CorrectionAccepted then
            v53 = l_props_0.userQuery ~= "";
        end;
        local v54, v55 = v8.calculateMainViewHeaderHeight(v49, nil, nil, nil, v46, v52 or v53);
        v47 = v54;
        v48 = v55;
    end;
    local l_tryOpenAssetConfig_0 = l_props_0.tryOpenAssetConfig;
    v32.containerWidth = v43;
    v32.headerHeight = v47;
    return v3.createElement(l_Pane_0, v17.join({
        Position = v34, 
        Size = v35, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, l_props_0.WrapperProps), {
        ScrollingFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v7.MAIN_VIEW_PADDING), 
                PaddingLeft = UDim.new(0, v7.MAIN_VIEW_PADDING), 
                PaddingRight = UDim.new(0, v7.MAIN_VIEW_PADDING), 
                PaddingTop = UDim.new(0, v7.MAIN_VIEW_PADDING)
            }), 
            Header = v3.createElement(v21, {
                containerWidth = v43, 
                showTags = v49 or v46, 
                onBackToHome = l_props_0.onBackToHome, 
                headerHeight = v47
            })
        }), 
        AssetGridContainerNew = if not v37 then v3.createElement(v14, {
            NoResultsPosition = UDim2.new(0, 0, 0, if not v26() then 16 + v47 else (16 + v47) + v48), 
            OnSearchByCreator = if not v28() then nil else l_props_0.OnSearchByCreator, 
            ParentAbsoluteSize = l_props_0.AbsoluteSize, 
            ParentAbsolutePosition = l_props_0.AbsolutePosition, 
            Position = UDim2.new(0, 0, 0, v47 + v48), 
            Size = UDim2.new(1, 0, 1, -v47 - v48), 
            TryOpenAssetConfig = l_tryOpenAssetConfig_0
        }) else v3.createElement(v25, {
            CategoryName = l_categoryName_0, 
            IncludeUnverifiedCreators = l_includeUnverifiedCreators_0, 
            NoResultsPosition = UDim2.new(0, 0, 0, if not v26() then 16 + v47 else (16 + v47) + v48), 
            Position = UDim2.new(0, 0, 0, v47 + v48), 
            Size = UDim2.new(1, 0, 1, v47 - v48), 
            TryOpenAssetConfig = l_tryOpenAssetConfig_0
        }), 
        LoadingIndicator = (v38 and not v37) and v3.createElement(l_LoadingIndicator_0, {
            AnchorPoint = Vector2.new(0.5, 1), 
            Position = UDim2.new(0.5, 0, 1, -16), 
            Size = UDim2.new(0, 92, 0, 24), 
            ZIndex = 3
        }), 
        NetworkError = false
    });
end;
return l_withAbsoluteSizeAndPosition_0((v4.connect(function(v57, _)
    v57 = v57 or {};
    local v59 = v57.assets or {};
    local v60 = v57.pageInfo or {};
    return {
        isLoading = v59.isLoading or false, 
        networkErrors = v57.networkErrors or {}, 
        audioSearchInfo = v60.audioSearchInfo, 
        additionalAudioSearchInfo = v60.additionalAudioSearchInfo, 
        categoryName = v60.categoryName or v9.DEFAULT.name, 
        searchTerm = v60.searchTerm or "", 
        creator = v60.creator, 
        creatorTargetIds = if (not not v26() and v60.creatorTargetIds) and v60.creatorTargetIds ~= v5.None then v60.creatorTargetIds else {}, 
        groupTargetIds = if (not not v26() and v60.groupTargetIds) and v60.groupTargetIds ~= v5.None then v60.groupTargetIds else {}, 
        includeUnverifiedCreators = v60.includeUnverifiedCreators, 
        uiSortIntent = v60.uiSortIntent, 
        correctionState = if not v27() then nil else v60.correctionState
    };
end, function(v61)
    return {
        nextPage = function(v62, v63)
            v61(v23(v62, v63));
        end
    };
end)((l_withContext_0({
    Settings = v12, 
    Localization = l_ContextServices_0.Localization, 
    Network = v13
})(v29)))));
