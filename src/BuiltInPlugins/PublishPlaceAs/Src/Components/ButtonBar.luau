local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_Button_0 = v1.UI.Button;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("ButtonBar");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_HorizontalAlignment_0 = l_props_0.HorizontalAlignment;
    local l_Buttons_0 = l_props_0.Buttons;
    local l_buttonActivated_0 = l_props_0.buttonActivated;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local v15 = l_props_0.LayoutOrder or 1;
    local v16 = l_props_0.AnchorPoint or Vector2.new(0, 0.5);
    local v17 = l_props_0.Position or UDim2.new(0, 0, 0.5, 0);
    local v18 = l_props_0[v2.Children];
    assert(type(l_Buttons_0) == "table", "ButtonBar.Buttons must be a table");
    local v19 = {
        Layout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 25), 
            HorizontalAlignment = l_HorizontalAlignment_0, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }, v18)
    };
    if l_HorizontalAlignment_0 ~= Enum.HorizontalAlignment.Center then
        table.insert(v19, v2.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 35)
        }));
    end;
    for v20, v21 in ipairs(l_Buttons_0) do
        table.insert(v19, v2.createElement(l_Button_0, {
            OnClick = function()
                l_buttonActivated_0(v21.Value);
            end, 
            LayoutOrder = v20, 
            Size = UDim2.new(0, 125, 1, 0), 
            Style = not v21.Default and "Round" or "RoundPrimary", 
            StyleModifier = if v21.Active == false then l_StyleModifier_0.Disabled else nil, 
            Text = l_Localization_0:getText("FooterButton", v21.Name), 
            ZIndex = l_ZIndex_0 or 1
        }));
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 35), 
        LayoutOrder = v15, 
        AnchorPoint = v16, 
        Position = v17, 
        BackgroundTransparency = 1
    }, v19);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v7));
