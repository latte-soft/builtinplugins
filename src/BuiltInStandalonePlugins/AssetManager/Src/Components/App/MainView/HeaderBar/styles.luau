local l_createStyleRule_0 = require(script:FindFirstAncestor("AssetManager").Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".HeaderBar", {}, {
    l_createStyleRule_0("> .HeaderTitle", {
        Size = UDim2.new(0, 300, 1, 0)
    }, {
        l_createStyleRule_0("> .ScopeThumbnail", {
            Size = UDim2.fromOffset(32, 32)
        }, {
            l_createStyleRule_0("::UICorner", {
                CornerRadius = UDim.new(1, 0)
            })
        })
    }), 
    l_createStyleRule_0("> .HeaderOptions", {
        Size = UDim2.new(1, -300, 1, 0)
    })
}, {});
