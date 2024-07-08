local l_createStyleRule_0 = require(script:FindFirstAncestor("AssetManager").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".ContentGrid", {}, {
    l_createStyleRule_0(">> .ItemCell", {}, {
        l_createStyleRule_0("> .ThumbnailContainer", {
            Size = UDim2.new(1, 0, 1, -30)
        }), 
        l_createStyleRule_0("> .TagContainer", {
            Size = UDim2.new(1, 0, 0, 30)
        })
    })
}, {
    CellHeightDiff = 30, 
    CellPadding = UDim2.fromOffset(10, 10)
});
