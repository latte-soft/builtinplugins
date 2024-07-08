local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v2.UI.Pane;
local l_TextLabel_0 = v2.UI.TextLabel;
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
return function(v6)
    return v1.createElement(l_Pane_0, {}, {
        Label = v1.createElement(l_TextLabel_0, {
            Text = v6.Value, 
            [v1.Tag] = "X-FitX TextXAlignLeft"
        })
    });
end;
