local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Actions.SetGroupRolePermissions);
local function _()
    return {
        PermissionsByRole = {}
    };
end;
return v1.createReducer({
    PermissionsByRole = {}
}, {
    ResetStore = function(_, _)
        return {
            PermissionsByRole = {}
        };
    end, 
    [v3.name] = function(v7, v8)
        return v2.Dictionary.join(v7, {
            PermissionsByRole = v8.groupRolePermissions
        });
    end
});
