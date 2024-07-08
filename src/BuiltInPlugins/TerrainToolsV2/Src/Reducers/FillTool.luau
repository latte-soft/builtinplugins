local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return (v1.createReducer({
    mergeEmpty = false, 
    material = Enum.Material.Grass
}, {
    SetMergeEmpty = function(v3, v4)
        return v2.Dictionary.join(v3, {
            mergeEmpty = v4.mergeEmpty
        });
    end, 
    SetMaterial = function(v5, v6)
        return v2.Dictionary.join(v5, {
            material = v6.material
        });
    end
}));
