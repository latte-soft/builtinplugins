local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    groupInfo = {
        groups = {}, 
        ownedGroups = {}
    }
}, {
    SetGroupInfo = function(v3, v4)
        return v2.Dictionary.join(v3, {
            groupInfo = v2.Dictionary.join(v3.groupInfo, v4.groupInfo)
        });
    end, 
    ResetInfo = function(v5, v6)
        return v2.Dictionary.join(v5, {
            groupInfo = v2.Dictionary.join(v5.groupInfo, v6.groupInfo)
        });
    end
});
