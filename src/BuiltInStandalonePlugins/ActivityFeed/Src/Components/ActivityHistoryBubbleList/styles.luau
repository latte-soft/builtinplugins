local l_createStyleRule_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".Component-ActivityHistoryBubbleList", {}, {
    l_createStyleRule_0(">> .Component-BubbleFrame", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingTop = UDim.new(0, 4), 
            PaddingLeft = UDim.new(0, 1), 
            PaddingRight = UDim.new(0, 2)
        })
    }), 
    l_createStyleRule_0("> ScrollingFrame", {
        BackgroundTransparency = 1
    }, {
        l_createStyleRule_0("> Frame", {
            BackgroundTransparency = 1
        })
    })
});
