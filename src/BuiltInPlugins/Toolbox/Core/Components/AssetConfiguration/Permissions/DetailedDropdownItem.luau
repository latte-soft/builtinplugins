local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Button_0 = v3.UI.Button;
local v7 = require(l_Parent_0.Core.Util.Constants);
local v8 = v2.PureComponent:extend("DetailedDropdownItem");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_OnActivated_0 = l_props_0.OnActivated;
    local l_Title_0 = l_props_0.Title;
    local l_Description_0 = l_props_0.Description;
    local l_detailedDropdown_0 = l_props_0.Stylizer.detailedDropdown;
    return v2.createElement(l_Button_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = l_LayoutOrder_0, 
        OnClick = l_OnActivated_0, 
        Size = UDim2.new(1, 0, 0, 60), 
        Style = if not l_props_0.Selected then nil else "SelectedDetailedDropdownItem"
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10), 
            PaddingBottom = UDim.new(0, 10)
        }), 
        MainTextLabel = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            Font = v7.FONT, 
            TextSize = 20, 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = not not l_props_0.IsHovered and l_detailedDropdown_0.hovered.displayText or l_detailedDropdown_0.displayText, 
            TextWrapped = true, 
            LayoutOrder = 0
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10)
            })
        }), 
        DescriptionTextLabel = v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            Font = v7.FONT, 
            TextSize = 18, 
            Text = l_Description_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_detailedDropdown_0.descriptionText, 
            TextWrapped = true, 
            LayoutOrder = 1
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 10), 
                PaddingLeft = UDim.new(0, 10)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
