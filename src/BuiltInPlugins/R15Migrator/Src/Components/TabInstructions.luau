local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local v7 = v2.PureComponent:extend("TabInstructions");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Height_0 = l_props_0.Height;
    local l_LinkMap_0 = l_props_0.LinkMap;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Message_0 = l_props_0.Message;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, l_Height_0), 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Padding = l_Stylizer_0.Padding
    }, {
        InstructionsLabel = v2.createElement(l_TextWithLinks_0, {
            Text = l_Message_0, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextProps = {
                TextSize = l_Stylizer_0.TextSize, 
                Font = l_Stylizer_0.Font
            }, 
            LinkMap = l_LinkMap_0 or {}
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
