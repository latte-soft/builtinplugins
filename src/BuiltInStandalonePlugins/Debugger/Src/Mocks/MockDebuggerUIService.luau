local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {
        ExpressionsCleared = l_Signal_0.new()
    };
    setmetatable(v2, v1);
    v2.openScripts = {};
    v2.showingArrow = false;
    v2.currentThreadId = -1;
    return v2;
end;
v1.OpenScriptAtLine = function(v3, v4, _, _, _)
    v3.openScripts[v4] = true;
end;
v1.SetScriptLineMarker = function(v8, _, _, _, v12)
    if v12 then
        v8.showingArrow = true;
    end;
end;
v1.RemoveScriptLineMarkers = function(v13, _, v15)
    if v15 then
        v13.showingArrow = false;
    end;
end;
v1.SetCurrentThreadId = function(v16, v17)
    v16.currentThreadId = v17;
end;
return v1;
