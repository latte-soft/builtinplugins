local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Core.Util.makeTheme);
local v3 = require(l_Parent_0.Core.Components.Toolbox);
local v4 = require(l_Parent_0.Core.Types.Suggestion);
local v5 = require(l_Parent_0.Core.Types.Background);
local v6 = v1.PureComponent:extend("ToolboxTestWrapper");
v6.init = function(v7)
    v7.state = {
        theme = v2()
    };
end;
v6.render = function(v8, _)
    local _ = v8.state.theme;
    return v1.createElement(v3, {
        backgrounds = v5.BACKGROUNDS, 
        suggestions = v4.SUGGESTIONS, 
        Size = UDim2.new(0, 400, 0, 400)
    });
end;
return v6;
