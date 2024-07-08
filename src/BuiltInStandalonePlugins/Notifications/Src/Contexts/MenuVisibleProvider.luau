local v0 = require(script.Parent.Parent.Parent.Packages.React);
local v1 = require(script.Parent.MenuVisibleContext);
return function(v2)
    local v3, v4 = v0.useState(false);
    return v0.createElement(v1.Provider, {
        value = v0.useMemo(function()
            return {
                menuVisible = v3, 
                setMenuVisible = v4
            };
        end, {
            v3, 
            v4
        })
    }, v2.children);
end;
