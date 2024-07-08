local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local _ = require(l_Parent_0.Src.Types);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetMaterials);
local v5 = require(l_Actions_0.SetSelectedMaterial);
local l_filter_0 = v1.filter;
return function(v7)
    return function(v8)
        local l_MaterialsReducer_0 = v8:getState().MaterialsReducer;
        if l_MaterialsReducer_0.selectedMaterial == v7 then
            v8:dispatch(v5(nil));
        end;
        v8:dispatch(v4((l_filter_0(l_MaterialsReducer_0.materials, function(v10)
            return v10 ~= v7;
        end))));
    end;
end;
