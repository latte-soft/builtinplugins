local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.AssertType);
local v3 = require(script.Parent.Action);
local v4 = require(l_Parent_0.Src.Flags.getFFlagCAP1107);
return v3(script.Name, function(v5)
    v2.assertNullableType(v5, "table", "SetGroupInfo arg");
    local v6 = v5 or {};
    local l_groups_0 = v6.groups;
    if not v4() then
        v2.assertType(l_groups_0, "table", "SetGroupInfo.groups");
    else
        v2.assertNullableType(l_groups_0, "table", "SetGroupInfo.groups");
    end;
    local v8 = nil;
    if v4() then
        v8 = v6.ownedGroups;
        v2.assertNullableType(v8, "table", "SetGroupInfo.ownedGroups");
    end;
    return {
        groupInfo = {
            groups = l_groups_0, 
            ownedGroups = v8
        }
    };
end);
