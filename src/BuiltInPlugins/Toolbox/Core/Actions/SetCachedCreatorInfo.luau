local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_Action_0 = require(l_Packages_0.Framework).Util.Action;
local v3 = require(l_Parent_0.Core.Util.CreatorInfoHelper);
local l_t_0 = require(l_Packages_0.Framework).Util.Typecheck.t;
return l_Action_0(script.Name, function(v5)
    assert(l_t_0.union(l_t_0.strictInterface({}), l_t_0.interface({
        Id = l_t_0.number, 
        Name = l_t_0.string, 
        Type = v3.isValidCreatorType
    }))(v5), "CreatorInfo must be either an empty table, or have all keys defined");
    return {
        cachedCreatorInfo = v5
    };
end);
