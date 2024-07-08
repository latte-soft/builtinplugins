local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Util.Constants);
local l_SelectInput_0 = v4.UI.SelectInput;
local l_map_0 = v4.Dash.map;
local v10 = require(l_Parent_0.Src.Thunks.GetMyGroupsRequest);
local v11 = require(l_Parent_0.Src.ContextServices.NetworkContext);
local v12 = v2.PureComponent:extend("ConfigAccess");
local v13 = game:DefineFastFlag("FixConvertToPackageAssert", false);
v12.didMount = function(v14)
    v14.props.getMyGroups(v14.props.Network:get());
end;
v12.init = function(v15)
    v15.createContentForSelectInput = function(v16)
        return {
            creatorId = v16.creatorId, 
            creatorType = v16.creatorType, 
            Id = v16.name, 
            item = v16, 
            Key = v16.Key, 
            Label = v16.name, 
            name = v16.name, 
            Text = v16.Text
        };
    end;
end;
v12.render = function(v17)
    local l_props_0 = v17.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_TotalHeight_0 = l_props_0.TotalHeight;
    local v24 = l_props_0.owner or {};
    local l_onDropDownSelect_0 = l_props_0.onDropDownSelect;
    v17.dropdownContent = v7.getOwnerDropDownContent(l_props_0.groupsArray, l_Localization_0);
    local v26 = nil;
    for v27, v28 in pairs(v17.dropdownContent) do
        if v28.creatorId == v24.creatorId then
            v26 = v27;
        end;
    end;
    if not (not v13 or v26) then
        v26 = 1;
    end;
    assert(v26);
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local _ = nil;
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
            TextSize = v7.FONT_SIZE_TITLE, 
            TextColor3 = l_publishAsset_0.titleTextColor, 
            Font = v7.FONT, 
            LayoutOrder = 1
        }), 
        DropdownMenu = v2.createElement(l_SelectInput_0, {
            Items = l_map_0(v17.dropdownContent, v17.createContentForSelectInput), 
            LayoutOrder = 2, 
            OnItemActivated = l_onDropDownSelect_0, 
            PlaceholderText = (not (#v17.dropdownContent >= v26) or game.CreatorType == Enum.CreatorType.Group and #v17.dropdownContent == 1) and "" or v17.dropdownContent[v26].Text, 
            SelectedIndex = v17.dropdownContent[v26].Key, 
            Size = UDim2.new(0, 220, 0, 38), 
            Width = 220
        })
    });
end;
return v3.connect(function(v31, _)
    return {
        groupsArray = (v31 or {}).GroupReducer.groupsArray or {}
    };
end, function(v33)
    return {
        getMyGroups = function(v34)
            v33(v10(v34));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v11, 
    Stylizer = l_ContextServices_0.Stylizer
})(v12)));
