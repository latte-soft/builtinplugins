local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local v2 = require(l_Parent_0.Src.Util.SaveState);
local v3 = 0;
local v4 = 0;
for _, v6 in pairs(v2) do
    v3 = math.min(v3, v6);
    v4 = math.max(v4, v6);
end;
return l_Action_0(script.Name, function(v7)
    local v8 = false;
    if typeof(v7) == "number" then
        v8 = false;
        if v3 <= v7 then
            v8 = v7 <= v4;
        end;
    end;
    assert(v8, string.format(script.Name .. " requires loadState to be a LoadState, not %s", (typeof(v7))));
    return {
        saveState = v7
    };
end);
