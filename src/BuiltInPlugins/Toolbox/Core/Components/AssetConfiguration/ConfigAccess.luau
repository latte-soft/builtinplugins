local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.AssetConfigConstants);
local v8 = require(l_Util_0.getUserId);
local v9 = require(l_Util_0.AssetConfigUtil);
local v10 = require(l_Parent_0.Core.Components.DropdownMenu);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v12 = require(l_Requests_0.GetAssetConfigManageableGroupsRequest);
local v13 = require(l_Requests_0.GetAssetTypeAgentsRequest);
local _ = require(l_Parent_0.Core.Thunks.GetGroupMetadata);
local v15 = require(l_Parent_0.Core.Types.ConfigTypes);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v18 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v19 = v2.PureComponent:extend("ConfigAccess");
v19.init = function(v20, v21)
    v20.allowOwnerEdit = v21.screenFlowType == v7.FLOW_TYPE.UPLOAD_FLOW;
end;
v19.didMount = function(v22)
    if not v9.isCatalogAsset(v22.props.assetTypeEnum) then
        v22.props.getManageableGroups(v22.props.Network.networkInterface);
        return ;
    else
        v22.props.getAssetTypeAgents(v22.props.Network.networkInterface, v22.props.assetTypeEnum);
        return ;
    end;
end;
v19.render = function(v23)
    local l_props_0 = v23.props;
    local _ = v23.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_TotalHeight_0 = l_props_0.TotalHeight;
    local v30 = l_props_0.owner or {};
    local v31 = v30.typeId or 1;
    v23.dropdownContent = v9.getOwnerDropDownContent(not not v9.isCatalogAsset(l_props_0.assetTypeEnum) and l_props_0.assetTypeAgents or l_props_0.manageableGroups, l_props_0.Localization);
    local l_onDropDownSelect_0 = l_props_0.onDropDownSelect;
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local v34 = "";
    if not (v23.allowOwnerEdit or not v30.typeId) then
        if v30.typeId == v15.OWNER_TYPES.User then
            v34 = if v30.targetId ~= v8() then v30.username else l_props_0.Localization:getText("General", "Me");
        elseif l_props_0.assetGroupData then
            v34 = l_props_0.assetGroupData.Name;
        end;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_TotalHeight_0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = Color3.fromRGB(227, 227, 227), 
        BorderSizePixel = 0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Title = v2.createElement("TextLabel", {
            Size = UDim2.new(0, v7.TITLE_GUTTER_WIDTH, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v6.FONT_SIZE_TITLE, 
            TextColor3 = l_publishAsset_0.titleTextColor, 
            Font = v6.FONT, 
            LayoutOrder = 1
        }), 
        DropDown = v23.allowOwnerEdit and v2.createElement(v10, {
            Size = UDim2.new(0, 220, 0, 38), 
            visibleDropDownCount = 5, 
            selectedDropDownIndex = v31, 
            fontSize = v6.FONT_SIZE_LARGE, 
            items = v23.dropdownContent, 
            onItemClicked = l_onDropDownSelect_0, 
            LayoutOrder = 2
        }), 
        OwnerType = not v23.allowOwnerEdit and v2.createElement("TextLabel", {
            Size = UDim2.new(1, -v7.TITLE_GUTTER_WIDTH, 0, v6.FONT_SIZE_TITLE), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = v34, 
            Font = v6.FONT, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextSize = v6.FONT_SIZE_TITLE, 
            TextColor3 = l_publishAsset_0.textColor, 
            LayoutOrder = 2
        })
    });
end;
return v3.connect(function(v35, v36)
    v35 = v35 or {};
    return {
        assetTypeEnum = v35.assetTypeEnum, 
        screenFlowType = v35.screenFlowType, 
        manageableGroups = v35.manageableGroups or {}, 
        assetTypeAgents = v35.assetTypeAgents or {}, 
        assetGroupData = (not not v36.owner and v35[v36.owner.targetId]) and v35[v36.owner.targetId].groupMetadata or v36.assetGroupData, 
        owner = not not v35.assetConfigData and v35.assetConfigData.Creator or v36.owner
    };
end, function(v37)
    return {
        getManageableGroups = function(v38)
            v37(v12(v38));
        end, 
        getAssetTypeAgents = function(v39, v40)
            v37(v13(v39, v40));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v18
})(v19)));
