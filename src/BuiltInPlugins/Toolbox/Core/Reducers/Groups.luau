local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Rodux);
local _ = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Dash);
local _ = require(l_script_FirstAncestor_0.Core.Types.GroupTypes);
return v2.createReducer({
    manageableGroups = nil
}, {
    [require(l_script_FirstAncestor_0.Core.Actions.SetManageableGroups).name] = function(v6, v7)
        return v4.join(v6, {
            manageableGroups = v7.manageableGroups
        });
    end
});
