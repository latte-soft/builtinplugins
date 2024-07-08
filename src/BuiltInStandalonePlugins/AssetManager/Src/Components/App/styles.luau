local l_createStyleRule_0 = require(script:FindFirstAncestor("AssetManager").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".App", {}, {
    l_createStyleRule_0(">> .TopBar", {
        Size = UDim2.new(1, 0, 0, 42)
    }), 
    l_createStyleRule_0(">> .Explorer", {
        Size = UDim2.new(1, 0, 1, -42)
    }), 
    l_createStyleRule_0(">> .MainContents", {
        Size = UDim2.new(1, 0, 1, -42)
    })
}, {
    DefaultSizeSidebar = UDim.new(0.15, 0), 
    MinimumSizeSidebar = UDim.new(0, 100), 
    DefaultSizeMainView = UDim.new(0.85, 0), 
    MinimumSizeMainView = UDim.new(0, 400)
});
