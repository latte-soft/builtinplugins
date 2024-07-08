local v0 = require(script.Parent.Parent.Util.ConstantColors);
local v1 = {};
local v2 = nil;
local v3 = nil;
v1.getBackgroundColor = function(v4)
    return not not v2(v4) and v2(v4).backgroundColor or v0.White;
end;
v1.getTitleTextColor = function(v5)
    return not not v2(v5) and v2(v5).titledFrame.text or v0.TitleText;
end;
v1.getBodyTextColor = function(v6)
    return not not v3(v6) and v2(v6).textBox.text or v0.BodyText;
end;
v1.getBodyTextInputColor = function(v7)
    if not v7.PlayerChoice then
        return not not v3(v7) and v2(v7).textBox.text or v0.TitleText;
    else
        return not not v3(v7) and v2(v7).textBox.text or v0.BodyText;
    end;
end;
v1.getButtonPressedTextColor = function(_)
    return v0.White;
end;
v1.getButtonHoveredTextColor = function(v9)
    return v1.getTitleTextColor(v9);
end;
v1.getButtonTextColor = function(v10)
    return v1.getTitleTextColor(v10);
end;
v1.getButtonPressedImageColor = function(_)
    return v0.White;
end;
v1.getButtonHoveredImageColor = function(v12)
    return not not v3(v12) and v0.DarkGrey2 or v0.White;
end;
v1.getButtonImageColor = function(v13)
    return not not v3(v13) and v0.DarkGrey or v0.White;
end;
v1.getDividerColor = function(v14)
    return not not v2(v14) and v2(v14).separator or v0.DefaultColor;
end;
v1.getBorderColor = function(v15)
    return not not v2(v15) and v2(v15).separator or v0.DefaultColor;
end;
v1.getRadioButtonTextColor = function(v16)
    if not v2(v16) or not v2(v16).radioButton then
        return nil;
    else
        return v2(v16).radioButton.title;
    end;
end;
v2 = function(v17)
    return v17.ThemeData and v17.ThemeData.theme;
end;
v3 = function(v18)
    return v2(v18) and v2(v18).isDarkerTheme;
end;
return v1;
