local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
return require(l_Packages_0.Rodux).createReducer({
    permissionsTable = {}
}, {
    [require(l_Parent_0.Core.Actions.SetPackagePermission).name] = function(v3, v4)
        if not v3.permissionsTable then
            v3.permissionsTable = {};
        end;
        v3.permissionsTable = v2.Dictionary.join(v3.permissionsTable, v4.packagePermissions);
        return v3;
    end
});
