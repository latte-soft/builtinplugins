local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v3.UI.Pane;
local l_TextLabel_0 = v3.UI.TextLabel;
local v6 = require(l_Parent_0.Src.Hooks.useLayoutOrderCounter);
local v7 = require(l_Parent_0.Src.Resources.PluginStyles);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Types);
local v10 = require(script.Parent.attributeValueToString);
local _ = require(script.Parent.Types);
local l_v7_Attribute_0 = v7:GetAttribute("TokenTooltipRowHeight");
return v1.connect(function(v13)
    return {
        Fonts = v13.Asset.Fonts
    };
end)(function(v14)
    local v15 = v6();
    local v16 = typeof(v14.TokenValue);
    return v2.createElement(l_Pane_0, {
        LayoutOrder = v14.LayoutOrder, 
        [v2.Tag] = "X-RowM X-Fit"
    }, {
        LeadingComponent = if not (v16 ~= "Color3") or v16 == "BrickColor" then v2.createElement(l_Pane_0, {
            LayoutOrder = v15(), 
            BackgroundColor3 = if v16 == "Color3" then v14.TokenValue else v14.TokenValue.Color, 
            [v2.Tag] = "X-Corner Icon16"
        }) else if v16 == "ColorSequence" then v2.createElement("Frame", {
            LayoutOrder = v15(), 
            [v2.Tag] = "SequencePreviewButton X-Corner X-Stroke"
        }, {
            Gradient = v2.createElement("UIGradient", {
                Color = v14.TokenValue
            })
        }) else if v16 == "NumberSequence" then v2.createElement("Frame", {
            LayoutOrder = v15(), 
            [v2.Tag] = "SequencePreviewButton X-Corner X-Stroke"
        }, {
            Gradient = v2.createElement("UIGradient", {
                Transparency = v14.TokenValue
            })
        }) else nil, 
        Label = v2.createElement(l_TextLabel_0, {
            LayoutOrder = v15(), 
            FontFace = if v16 == "Font" then v14.TokenValue else nil, 
            Size = UDim2.fromOffset(0, l_v7_Attribute_0), 
            Text = v10(v14.TokenValue, {
                Fonts = v14.Fonts
            }), 
            [v2.Tag] = "X-FitX"
        })
    });
end);
