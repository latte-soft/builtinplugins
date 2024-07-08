local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetUserMinimumAge);
local v5 = require(l_Actions_0.SetUserPermission);
local v6 = require(l_Actions_0.SetCurrentUserPermissions);
local v7 = require(l_Parent_0.Src.Util.IsEqualCheck);
local function _()
    return {
        MinimumAge = 0, 
        CurrentPermissions = {}
    };
end;
return v1.createReducer({
    MinimumAge = 0, 
    CurrentPermissions = {}
}, {
    ResetStore = function(_, _)
        return {
            MinimumAge = 0, 
            CurrentPermissions = {}
        };
    end, 
    [v4.name] = function(v11, v12)
        return v2.Dictionary.join(v11, {
            MinimumAge = v12.MinimumAge
        });
    end, 
    [v5.name] = function(v13, v14)
        local l_newPermissions_0 = v14.newPermissions;
        assert(type(l_newPermissions_0) == "table");
        if v7(v13.CurrentPermissions, l_newPermissions_0) then
            l_newPermissions_0 = v2.None;
        end;
        return v2.Dictionary.join(v13, {
            NewPermissions = l_newPermissions_0
        });
    end, 
    [v6.name] = function(v16, v17)
        return v2.Dictionary.join(v16, {
            CurrentPermissions = v17.currentPermissions
        });
    end
});
