local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Core.Components.DropdownMenu);
local v8 = v2.PureComponent:extend("AssetTypeSelector");
v8.init = function(v9, _)
    v9.onItemClicked = function(v11)
        v9:setState({
            dropDownIndex = v11
        });
        if not (v9.props.assetTypeEnum ~= Enum.AssetType.Plugin) or v9.props.assetTypeEnum == Enum.AssetType.Animation then
            if v9.props.onAssetTypeSelected then
                v9.props.onAssetTypeSelected(v9.props.assetTypeEnum);
                return ;
            end;
        elseif v9.props.onAssetTypeSelected then
            local v12 = v9.props.items[v11];
            if not (not v12 or not v12.type) then
                v9.props.onAssetTypeSelected(v12.type);
            end;
        end;
    end;
    v9.onItemClicked(v9:getFirstSelectableIndex());
end;
v8.getFirstSelectableIndex = function(v13)
    for v14 = 1, #v13.props.items do
        if v13.props.items[v14].selectable then
            return v14;
        end;
    end;
end;
v8.render = function(v15)
    local l_props_0 = v15.props;
    local l_state_0 = v15.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, l_props_0.width, 0, l_props_0.height), 
        Position = l_props_0.Position, 
        Active = true
    }, {
        Title = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, -28), 
            Size = UDim2.new(1, 0, 0, 24), 
            TextColor3 = l_Stylizer_0.typeSelection.selector.title, 
            TextSize = 16, 
            Font = v4.FONT, 
            Text = "Choose asset type", 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Dropdown = v2.createElement(v7, {
            Position = UDim2.new(0.5, -l_props_0.width / 2, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            selectedDropDownIndex = l_state_0.dropDownIndex, 
            visibleDropDOwnCount = 5, 
            items = v15.props.items, 
            rowHeight = 24, 
            fontSize = 20, 
            onItemClicked = v15.onItemClicked
        }), 
        Description = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, 0), 
            Size = UDim2.new(1, 0, 0, 18), 
            TextColor3 = l_Stylizer_0.typeSelection.selector.description, 
            TextSize = 12, 
            Font = v4.FONT, 
            Text = "Once published, this model can be shared in Marketplace", 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
