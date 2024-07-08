local v0 = require(script:FindFirstAncestor("SocialPresence").Packages.Framework);
local l_createStyleRule_0 = v0.Styling.createStyleRule;
return v0.Styling.createStyleSheet("SocialPresence", {
    l_createStyleRule_0(".RibbonElement", {
        Size = UDim2.new(0, 24, 0, 24), 
        BackgroundTransparency = 1
    }, {
        l_createStyleRule_0("::UICorner", {
            CornerRadius = UDim.new(0.5, 0)
        })
    }), 
    l_createStyleRule_0(".Button", {
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$BackgroundPaper", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0(":pressed", {
            BackgroundColor3 = "$ActionActivated", 
            BackgroundTransparency = 0
        })
    })
}, {});
