local l_createStyleRule_0 = require(script:FindFirstAncestor("AssetManager").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".ItemCell", {}, {
    l_createStyleRule_0("> .ThumbnailContainer", {
        BackgroundColor3 = "$ForegroundContrast", 
        BackgroundTransparency = 0
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$ActionHover"
        }), 
        l_createStyleRule_0(".SelectedCell", {
            BackgroundColor3 = "$ActionSelected"
        }), 
        l_createStyleRule_0(".FocusedCell ::UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = "$ActionFocusBorder", 
            Thickness = 1
        })
    }, {})
});
