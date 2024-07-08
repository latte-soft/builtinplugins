local l_Selection_0 = game:GetService("Selection");
local v1 = require(script.Parent.Parent.Parent.Src.Utility.RelativeTo);
return function()
    return function(v2)
        local v3 = v2:getState();
        local _ = nil;
        l_Selection_0.ShowActiveInstanceHighlight = not not v3.toolEnabled and v3.relativeTo == v1.Active;
    end;
end;
