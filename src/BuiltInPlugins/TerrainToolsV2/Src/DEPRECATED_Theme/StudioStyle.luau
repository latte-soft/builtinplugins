local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3)
    return {
        font = Enum.Font.SourceSans, 
        backgroundColor = v1(v2.MainBackground), 
        liveBackgroundColor = Color3.new(), 
        textColor = v1(v2.MainText), 
        subTextColor = v1(v2.SubText), 
        dimmerTextColor = v1(v2.DimmedText), 
        itemColor = v1(v2.Item), 
        borderColor = v1(v2.Border), 
        hoveredItemColor = v1(v2.Item, v3.Hover), 
        hoveredTextColor = v1(v2.MainText, v3.Hover), 
        primaryItemColor = v1(v2.DialogMainButton), 
        primaryBorderColor = v1(v2.DialogMainButton), 
        primaryTextColor = v1(v2.DialogMainButtonText), 
        primaryHoveredItemColor = v1(v2.DialogMainButton, v3.Hover), 
        primaryHoveredBorderColor = v1(v2.DialogMainButton, v3.Hover), 
        primaryHoveredTextColor = v1(v2.DialogMainButtonText, v3.Hover), 
        selectionColor = v1(v2.Item, v3.Selected), 
        selectionBorderColor = v1(v2.Border, v3.Selected), 
        selectedTextColor = v1(v2.MainText, v3.Selected), 
        shadowColor = v1(v2.Shadow), 
        shadowTransparency = v1(v2.Shadow, v3.Hover), 
        separationLineColor = v1(v2.Separator), 
        disabledColor = v1(v2.MainText, v3.Disabled), 
        errorColor = v1(v2.ErrorText), 
        hoverColor = v1(v2.MainBackground, v3.Hover), 
        hyperlinkTextColor = v1(v2.LinkText)
    };
end;
return v0;
