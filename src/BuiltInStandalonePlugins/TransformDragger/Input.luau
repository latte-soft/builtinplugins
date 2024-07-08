local v0 = {
    Key = {
        MOUSE_BUTTON1 = 0, 
        MOUSE_BUTTON2 = 1
    }, 
    State = {
        UP = nil, 
        DOWN = true
    }
};
local v1 = {};
local v2 = nil;
return {
    setMouse = function(v3)
        v2 = v3;
    end, 
    getMouse = function()
        return v2;
    end, 
    Enum = v0, 
    getButtonState = function(v4)
        return v1[v4];
    end, 
    setButtonState = function(v5, v6)
        v1[v5] = v6;
    end, 
    getMouseLocation = function()
        if v2 then
            return v2.Origin.p;
        else
            return nil;
        end;
    end
};
