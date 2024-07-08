local l_createStyleRule_0 = require(script:FindFirstAncestor("AssetManager").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Explorer", {}, {
    l_createStyleRule_0(">> .Element", {
        Size = UDim2.new(1, -4, 0, 24)
    }, {
        l_createStyleRule_0("> .ScopeIcon", {}, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        })
    })
}, {
    RowHeight = 24
});
