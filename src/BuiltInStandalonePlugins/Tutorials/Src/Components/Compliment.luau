local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_UI_0 = require(l_Parent_0.Packages.Framework).UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v6 = require(l_Parent_0.Src.Util.counter);
return function(v7)
    local v8 = v6();
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = v7.LayoutOrder, 
        Padding = 20, 
        Spacing = 10, 
        ref = v7.PaneRef, 
        [v1.Change.AbsoluteSize] = v7[v1.Change.AbsoluteSize]
    }, {
        Image = v1.createElement(l_Image_0, {
            LayoutOrder = v8(), 
            Image = v7.Image, 
            Size = v7.IconSize
        }), 
        Text = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v8(), 
            Style = "Bold", 
            Text = v7.Text
        })
    });
end;
