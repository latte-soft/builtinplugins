local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Parent_0.Core.Components.AssetConfiguration.OverrideAssetView);
local v5 = require(l_Parent_0.Core.Components.DropdownMenu);
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.AssetConfigUtil);
local v9 = require(l_Util_0.getUserId);
local v10 = require(l_Util_0.AssetConfigConstants);
local v11 = require(l_Packages_0.Framework);
local l_DEPRECATED_TextInput_0 = v11.UI.DEPRECATED_TextInput;
local l_ContextServices_0 = v11.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v15 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v17 = require(l_Requests_0.GetOverrideAssetRequest);
local v18 = require(l_Requests_0.GetAssetConfigManageableGroupsRequest);
local v19 = require(l_Parent_0.Core.Actions.UpdateAssetConfigStore);
local v20 = v2.PureComponent:extend("OverrideAsset");
v20.init = function(v21, _)
    v21.dropdownContent = {
        {
            name = "Me", 
            creatorType = "User", 
            creatorId = v9()
        }
    };
    v21.groupAdded = false;
    v21.state = {
        selectIndex = 1, 
        selectItem = v21.dropdownContent[1], 
        filterID = ""
    };
    v21.onFilterIDChanged = function(v23)
        v21:setState({
            filterID = v23
        });
    end;
    v21.onDropDownSelect = function(v24)
        local v25 = v21.dropdownContent[v24];
        v21.props.updateStore({
            fetchedAll = false, 
            loadingPage = 0, 
            overrideCursor = ""
        });
        v21.props.getOverrideAssets(v21.props.Network.networkInterface, v21.props.assetTypeEnum, v25.creatorType, v25.creatorId, 1);
        v21:setState({
            selectIndex = v24, 
            selectItem = v25
        });
    end;
    v21.getOverrideAssetsFunc = function(v26)
        local l_selectItem_0 = v21.state.selectItem;
        v21.props.getOverrideAssets(v21.props.Network.networkInterface, v21.props.assetTypeEnum, l_selectItem_0.creatorType, l_selectItem_0.creatorId, v26);
    end;
end;
v20.didMount = function(v28)
    local v29 = v28.dropdownContent[1];
    v28.props.getOverrideAssets(v28.props.Network.networkInterface, v28.props.assetTypeEnum, v29.creatorType, v29.creatorId, 1);
    v28.props.getManageableGroups(v28.props.Network.networkInterface);
end;
v20.render = function(v30)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_assetConfig_0 = l_props_0.Stylizer.assetConfig;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Size_0 = l_props_0.Size;
    local l_assetTypeEnum_0 = l_props_0.assetTypeEnum;
    local l_instances_0 = l_props_0.instances;
    local l_onOverrideAssetSelected_0 = l_props_0.onOverrideAssetSelected;
    local l_resultsArray_0 = l_props_0.resultsArray;
    local l_selectIndex_0 = l_state_0.selectIndex;
    v30.dropdownContent = v8.getOwnerDropDownContent(l_props_0.manageableGroups, l_props_0.Localization);
    local v41 = l_assetTypeEnum_0 == Enum.AssetType.Animation;
    local v42 = v41 and v10.FLOW_TYPE.DOWNLOAD_FLOW == l_props_0.screenFlowType;
    local l_filterID_0 = l_state_0.filterID;
    local v44 = false;
    if l_filterID_0 then
        v44 = utf8.len(l_filterID_0) > 10;
    end;
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 46), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingTop = UDim.new(0, 46)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20)
        }), 
        Title = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 30), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = if not v42 then l_props_0.Localization:getText("AssetConfigFooter", "OverrideTitle") else l_props_0.Localization:getText("AssetConfigFooter", "ImportTitle"), 
            Font = v7.FONT, 
            TextSize = v7.FONT_SIZE_LARGE, 
            TextColor3 = l_assetConfig_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 1
        }), 
        DropdownAndAnimationIdContainer = v41 and v2.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -20, 0, 40)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            }), 
            DropdownMenu = v2.createElement(v5, {
                Size = UDim2.new(0, 336, 0, 40), 
                selectedDropDownIndex = l_selectIndex_0, 
                rowHeight = 40, 
                items = v30.dropdownContent, 
                onItemClicked = v30.onDropDownSelect, 
                LayoutOrder = 1
            }), 
            AnimationIdFilter = not v42 and v2.createElement("Frame", {
                Size = UDim2.new(1, -336, 0, 90), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                TextField = v2.createElement(l_DEPRECATED_TextInput_0, {
                    OnTextChanged = v30.onFilterIDChanged, 
                    PlaceholderText = l_props_0.Localization:getText("AssetConfigAnimation", "FilterID"), 
                    Size = UDim2.new(1, -v10.TITLE_GUTTER_WIDTH, 0, 40), 
                    Style = not v44 and "FilledRoundedBorder" or "FilledRoundedRedBorder", 
                    Text = l_filterID_0
                })
            })
        }), 
        DropdownMenu = not v41 and v2.createElement(v5, {
            Size = UDim2.new(0, 336, 0, 40), 
            selectedDropDownIndex = l_selectIndex_0, 
            rowHeight = 40, 
            items = v30.dropdownContent, 
            onItemClicked = v30.onDropDownSelect, 
            LayoutOrder = 2
        }), 
        ScrollingItems = v2.createElement(v4, {
            Size = UDim2.new(1, 0, 1, -70), 
            assetTypeEnum = l_assetTypeEnum_0, 
            instances = l_instances_0, 
            resultsArray = l_resultsArray_0, 
            onOverrideAssetSelected = l_onOverrideAssetSelected_0, 
            getOverrideAssets = v30.getOverrideAssetsFunc, 
            filterID = l_state_0.filterID, 
            LayoutOrder = 3
        })
    });
end;
return v3.connect(function(v45, _)
    v45 = v45 or {};
    return {
        totalResults = v45.totalResults, 
        resultsArray = v45.resultsArray, 
        manageableGroups = v45.manageableGroups or {}, 
        assetTypeEnum = v45.assetTypeEnum, 
        screenFlowType = v45.screenFlowType
    };
end, function(v47)
    return {
        getOverrideAssets = function(v48, v49, v50, v51, v52)
            v47(v17(v48, v49, v50, v51, v52));
        end, 
        getManageableGroups = function(v53)
            v47(v18(v53));
        end, 
        updateStore = function(v54)
            v47(v19(v54));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v15
})(v20)));
