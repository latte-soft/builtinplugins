local l_createStyleRule_0 = require(script:FindFirstAncestor("AssetManager").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".ContentList", {}, {
    l_createStyleRule_0("> .HeaderRow", {
        Size = UDim2.new(1, 0, 0, 25)
    }), 
    l_createStyleRule_0("> .ItemList", {
        Size = UDim2.new(1, 0, 1, -25)
    })
}, {
    ColumnMinSize = UDim.new(0, 60), 
    RowHeight = 50
});
