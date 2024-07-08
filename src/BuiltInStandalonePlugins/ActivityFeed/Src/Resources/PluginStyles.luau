local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Src.Resources.StyleTips);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
return v1.Styling.createStyleSheet("ActivityHistoryPlugin", {
    l_createStyleRule_0(".CX-Invisible", {
        BackgroundTransparency = 1
    }), 
    l_createStyleRule_0(".CX-Divider", {
        Size = UDim2.new(1, 0, 0, 1), 
        BackgroundColor3 = "$Divider"
    }), 
    l_createStyleRule_0("Frame", {
        BorderSizePixel = 0
    }), 
    l_createStyleRule_0("TextLabel", {
        Font = v2.defaultFont, 
        TextSize = v2.normalFontSize, 
        TextColor = "$TextPrimary"
    }), 
    l_createStyleRule_0("TextButton", {
        Font = v2.defaultFont, 
        TextSize = v2.buttonFontSize, 
        TextColor = "$TextPrimary"
    })
}, {});
