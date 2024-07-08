local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
return function()
    return (setmetatable({
        _screenGui = Instance.new("ScreenGui"), 
        _windowFocused = l_Signal_0.new(), 
        _windowFocusReleased = l_Signal_0.new()
    }, {
        __index = function(v1, v2)
            if v2 == "WindowFocused" then
                return v1._windowFocused;
            elseif v2 == "WindowFocusReleased" then
                return v1._windowFocusReleased;
            else
                local v3 = v1._screenGui[v2];
                if typeof(v3) == "function" then
                    return function(...)
                        local v4 = {
                            ...
                        };
                        return v3(v1._screenGui, unpack(v4, 2, #v4));
                    end;
                else
                    return v3;
                end;
            end;
        end, 
        __newIndex = function(v5, v6, v7)
            v5._screenGui[v6] = v7;
        end
    }));
end;
