local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_Button_0 = v2.UI.Button;
local v7 = v1.PureComponent:extend("AssetConfigFooter");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_tryPublish_0 = l_props_0.tryPublish;
    local l_tryCancel_0 = l_props_0.tryCancel;
    local l_footer_0 = l_Stylizer_0.footer;
    return v1.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_footer_0.backgroundColor, 
        BorderSizePixel = 1, 
        BorderColor3 = l_footer_0.borderColor, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 35), 
            PaddingRight = UDim.new(0, 35), 
            PaddingTop = UDim.new(0, 0)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 24)
        }), 
        CancelButton = v1.createElement(l_Button_0, {
            LayoutOrder = 2, 
            OnClick = l_tryCancel_0, 
            Size = UDim2.new(0, 120, 0, 35), 
            Style = "Round", 
            Text = l_Localization_0:getText("Action", "Cancel")
        }), 
        PublishButton = v1.createElement(l_Button_0, {
            LayoutOrder = 3, 
            OnClick = l_tryPublish_0, 
            Size = UDim2.new(0, 120, 0, 35), 
            Style = "RoundPrimary", 
            StyleModifier = if l_props_0.CanSave then nil else l_StyleModifier_0.Disabled, 
            Text = l_Localization_0:getText("Action", "Submit")
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
