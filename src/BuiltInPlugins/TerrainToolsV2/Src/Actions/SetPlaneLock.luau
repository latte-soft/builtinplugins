local v0 = require(script.Parent.Action);
local _ = require(script.Parent.Parent.Parent.Src.Util.TerrainEnums).PlaneLockType;
return v0(script.Name, function(v2)
    assert(type(v2) == "string", ("Expected planeLock to be a string, received %s"):format((type(v2))));
    return {
        planeLock = v2
    };
end);
