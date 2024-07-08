local v0 = {};
v0.__index = v0;
v0.new = function(_)
    local v14 = {
        SendGamepadEvent = function(_, _, _, _, _)
        end, 
        GetKeyboardShortcut = function(_, _, _, _)
        end, 
        ConnectGamepad = function(_, _, _)
        end
    };
    setmetatable(v14, {
        __index = v0
    });
    return v14;
end;
return v0;
