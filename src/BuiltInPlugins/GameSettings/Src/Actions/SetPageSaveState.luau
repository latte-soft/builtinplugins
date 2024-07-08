local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local v2 = require(l_Parent_0.Src.Util.SaveState);
local v3 = 0;
local v4 = 0;
for _, v6 in pairs(v2) do
    v3 = math.min(v3, v6);
    v4 = math.max(v4, v6);
end;
return l_Action_0(script.Name, function(v7, v8)
    assert(typeof(v7) == "string", string.format(script.Name .. " requires pageId to be a string, not %s", (typeof(v7))));
    local v9 = false;
    if typeof(v8) == "number" then
        v9 = false;
        if v3 <= v8 then
            v9 = v8 <= v4;
        end;
    end;
    assert(v9, string.format(script.Name .. " requires loadState to be a LoadState, not %s", (typeof(v8))));
    return {
        pageId = v7, 
        saveState = v8
    };
end);
