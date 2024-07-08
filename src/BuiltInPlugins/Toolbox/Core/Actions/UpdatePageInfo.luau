local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
return l_Action_0(script.Name, function(v3, v4)
    if ((not (not v2.shouldDebugWarnings() or not v3) and type(v3.creator) == "table") and v3.creator.Id ~= nil) and v3.creator.Type == nil then
        warn("Setting PageInfo.creator without a type");
    end;
    return {
        changes = v3, 
        settings = v4
    };
end);
