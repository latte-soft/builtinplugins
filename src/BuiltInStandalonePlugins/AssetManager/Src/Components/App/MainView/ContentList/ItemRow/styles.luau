local l_createStyleRule_0 = require(script:FindFirstAncestor("AssetManager").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".ItemRow", {
    Size = UDim2.new(1, 0, 0, 50), 
    BackgroundColor3 = "$ForegroundMain", 
    BackgroundTransparency = 0
}, {
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = "$ActionHover"
    }), 
    l_createStyleRule_0(".ContrastRow", {
        BackgroundColor3 = "$ForegroundContrast"
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$ActionHover"
        })
    }), 
    l_createStyleRule_0(".SelectedRow", {
        BackgroundColor3 = "$ActionSelected"
    }), 
    l_createStyleRule_0(".FocusedRow ::UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = "$ActionFocusBorder", 
        Thickness = 1
    }), 
    l_createStyleRule_0("> .ThumbnailContainer", {
        Size = UDim2.fromOffset(50, 50)
    }, {
        l_createStyleRule_0("> .Thumbnail", {
            Size = UDim2.fromOffset(30, 30)
        })
    })
}, {
    ThumbnailSize = 50
});
