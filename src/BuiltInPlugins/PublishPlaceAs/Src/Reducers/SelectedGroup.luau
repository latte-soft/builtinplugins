local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    selectedGroup = 0
}, {
    SetSelectedGroup = function(v3, v4)
        return v2.Dictionary.join(v3, {
            selectedGroup = v4.selectedGroup
        });
    end
});
