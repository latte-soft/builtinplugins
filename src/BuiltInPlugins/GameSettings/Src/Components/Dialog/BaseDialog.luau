local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_Pane_0 = v2.UI.Pane;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Components.ButtonBar);
local v8 = v1.PureComponent:extend("BaseDialog");
local function v10(v9)
    if not v9[2] then
        return {
            {
                Name = v9[1], 
                Default = true, 
                Active = true, 
                Value = true
            }
        };
    else
        return {
            {
                Name = v9[1], 
                Active = true, 
                Value = false
            }, 
            {
                Name = v9[2], 
                Default = true, 
                Active = true, 
                Value = true
            }
        };
    end;
end;
v8.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Layout = Enum.FillDirection.Vertical, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_Stylizer_0.dialog.background, 
        Spacing = l_Stylizer_0.dialog.spacing
    }, v3.Dictionary.join(l_props_0[v1.Children], {
        Buttons = v1.createElement(v7, {
            Position = UDim2.new(0, 0, 1, l_Stylizer_0.buttonBar.offset), 
            AnchorPoint = Vector2.new(0, 1), 
            Buttons = v10(l_props_0.Buttons), 
            LayoutOrder = 100, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            ButtonClicked = l_props_0.OnResult
        })
    }));
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
