local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v6 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("ButtonHeight");
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
return function(v9)
    return v1.createElement(l_Pane_0, {
        Size = v9.Size, 
        [v1.Tag] = "DeriveRenderer"
    }, {
        Name = v1.createElement(l_TextLabel_0, {
            Text = v9.Value.Name, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        XButton = v1.createElement(l_IconButton_0, {
            LeftIcon = v6.close(), 
            Cursor = "PointingHand", 
            OnClick = function()
                v9.OnClick(v9.Value);
            end, 
            [v1.Tag] = "IconOnly", 
            Position = UDim2.new(1, -l_Attribute_0, 0, 0)
        })
    });
end;
