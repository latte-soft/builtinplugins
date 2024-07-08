local v0 = require(script.Parent.Parent.Parent.Packages.React);
local v1 = require(script.Parent.TrayVisibleContext);
return function(v2)
    return v0.createElement(v1.Provider, {
        value = v0.useMemo(function()
            return {
                trayVisible = v2.trayVisible
            };
        end, {
            v2.trayVisible
        })
    }, v2.children);
end;
