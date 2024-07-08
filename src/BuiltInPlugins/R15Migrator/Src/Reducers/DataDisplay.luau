local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetSortSelection);
local function _()
    return {
        sortSelection = nil
    };
end;
return (v1.createReducer({
    sortSelection = nil
}, {
    [v3.name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            sortSelection = v6.sortSelection
        });
    end
}));
