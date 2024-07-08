local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v8 = require(l_Parent_0.Src.Components.Dialog.BaseDialog);
local v9 = v1.PureComponent:extend("WarningDialog");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Buttons_0 = l_props_0.Buttons;
    local l_Header_0 = l_props_0.Header;
    local l_Description_0 = l_props_0.Description;
    local v16 = l_LayoutOrderIterator_0.new(-2);
    return v1.createElement(v8, {
        Buttons = l_Buttons_0, 
        OnResult = l_props_0.OnResult
    }, {
        Header = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Title, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, l_Stylizer_0.warningDialog.headerOffset, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            LayoutOrder = v16:getNextOrder(), 
            BackgroundTransparency = 1, 
            Text = l_Header_0, 
            TextXAlignment = Enum.TextXAlignment.Left
        })), 
        WarningDescription = v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v16:getNextOrder()
        }, {
            UILayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, l_Stylizer_0.dialog.spacing), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Warning = v1.createElement("ImageLabel", {
                Image = v7.WARNING_IMAGE, 
                LayoutOrder = v16:getNextOrder(), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_Stylizer_0.warningDialog.icon.size, 0, l_Stylizer_0.warningDialog.icon.size)
            }), 
            Description = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Warning, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v16:getNextOrder(), 
                Size = UDim2.new(0, l_Stylizer_0.warningDialog.description.length, 0, 0), 
                BackgroundTransparency = 1, 
                Text = l_Description_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true
            }))
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
