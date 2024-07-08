local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_ScrollingFrame_0 = require(l_Parent_0.Packages.Framework).UI.ScrollingFrame;
local v3 = require(l_Parent_0.Src.Components.TokenTable);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
return function(v5)
    return v1.createElement(l_ScrollingFrame_0, {
        [v1.Tag] = "ScrollingAutomaticSize X-ColumnS"
    }, {
        TokenTable = v1.createElement(v3, {
            RootInstance = v5.StyleSheet
        })
    });
end;
