local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_LocalizationToolsFixLabel_0 = game:GetFastFlag("LocalizationToolsFixLabel");
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextLabel_0 = v3.UI.TextLabel;
local v8 = v1.PureComponent:extend("MessageFrame");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.Height), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.new(0, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        BorderColor3 = l_Stylizer_0.BorderColor
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Stylizer_0.Padding)
        }), 
        MessageTextLabel = v1.createElement(l_TextLabel_0, {
            AutomaticSize = if not l_LocalizationToolsFixLabel_0 then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY, 
            Text = l_props_0.Message, 
            TextWrapped = true
        })
    });
end;
return v2.connect(function(v12, _)
    return {
        Message = v12.Message
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8)));
