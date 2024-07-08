local v0 = require(script:FindFirstAncestor("AttenuationCurveEditor").Packages.Framework);
local l_createStyleRule_0 = v0.Styling.createStyleRule;
local l_createStyleSheet_0 = v0.Styling.createStyleSheet;
local v3 = {
    ColorGridLine = Color3.fromRGB(155, 155, 155), 
    ColorKeypoint = Color3.fromRGB(252, 116, 116), 
    ColorKeypointSelected = Color3.fromRGB(255, 0, 0), 
    CursorOpenedHand = "rbxasset://textures/advCursor-openedHand.png"
};
return l_createStyleSheet_0("AttenuationCurveEditor", {
    l_createStyleRule_0(".GridLine", {
        BorderSizePixel = 0, 
        ZIndex = 2, 
        BackgroundColor3 = "$ColorGridLine"
    }), 
    l_createStyleRule_0(".GridLabel", {
        BackgroundTransparency = 1, 
        TextColor3 = "$ColorGridLine"
    }), 
    l_createStyleRule_0(".SequenceKeypoint", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = "$ColorKeypoint", 
        BackgroundTransparency = 0, 
        Size = UDim2.fromOffset(8, 8), 
        Text = "", 
        ZIndex = 4
    }, {
        l_createStyleRule_0(".Selected", {
            BackgroundColor3 = "$ColorKeypointSelected"
        }, {
            l_createStyleRule_0("::UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = Color3.fromRGB(0, 0, 0), 
                Thickness = 2, 
                Transparency = 0.6
            })
        })
    }), 
    l_createStyleRule_0(".CurveLine", {
        BorderSizePixel = 0, 
        ZIndex = 3, 
        BackgroundTransparency = 0.6, 
        BackgroundColor3 = "$ColorKeypoint"
    }, {
        l_createStyleRule_0(".SelectedStart", {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            l_createStyleRule_0("::UIGradient", {
                Color = ColorSequence.new(v3.ColorKeypointSelected, v3.ColorKeypoint)
            })
        }), 
        l_createStyleRule_0(".SelectedEnd", {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        }, {
            l_createStyleRule_0("::UIGradient", {
                Color = ColorSequence.new(v3.ColorKeypoint, v3.ColorKeypointSelected)
            })
        })
    })
}, v3);
