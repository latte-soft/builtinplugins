local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v8 = v2.PureComponent:extend("ApplyTransformNote");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_ApplyTransformNote_0 = l_props_0.Stylizer.ApplyTransformNote;
    return v2.createElement(v2.Portal, {
        target = game:GetService("CoreGui")
    }, {
        ApplyTransformNote = v2.createElement("ScreenGui", {}, {
            Frame = v2.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.X, 
                BackgroundColor = l_ApplyTransformNote_0.Background, 
                Layout = Enum.FillDirection.Horizontal, 
                Spacing = l_ApplyTransformNote_0.FramePadding, 
                Padding = l_ApplyTransformNote_0.FramePadding, 
                Position = UDim2.new(0.5, 0, 0, l_ApplyTransformNote_0.EdgePadding), 
                Size = UDim2.fromOffset(0, 25)
            }, {
                Enter = v2.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundColor = l_ApplyTransformNote_0.KeyBackground, 
                    Padding = l_ApplyTransformNote_0.TextMargin, 
                    LayoutOrder = 1
                }, {
                    Corner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    Text = v2.createElement(l_TextLabel_0, {
                        Text = l_Localization_0:getText("TransformAction", "PressEnter")
                    })
                }), 
                Apply = v2.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Padding = l_ApplyTransformNote_0.TextMargin, 
                    LayoutOrder = 2
                }, {
                    Text = v2.createElement(l_TextLabel_0, {
                        Text = l_Localization_0:getText("TransformAction", "ApplyStatusTip")
                    })
                })
            })
        })
    });
end;
return l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v8);
