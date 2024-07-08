local _ = require(script.Parent.Parent.Parent.Parent.Src.Util.TutorialTypes);
local v1 = {};
local v2 = {
    __index = v1
};
v1.new = function(v3, v4)
    return (setmetatable({
        tutorial = v3, 
        data = v4, 
        completed = false
    }, v2));
end;
v1.bind = function()
end;
v1.unbind = function()
end;
v1.extend = function(v5)
    local v6 = {
        kind = v5
    };
    setmetatable(v6, v2);
    local v7 = {
        __index = v6
    };
    v6.new = function(v8, v9)
        return (setmetatable(v1.new(v8, v9), v7));
    end;
    return v6;
end;
v1.complete = function(v10)
    v10.completed = true;
    if v10.tutorial:getCurrentStep() == v10 then
        v10.tutorial:increment();
    end;
end;
return v1;
