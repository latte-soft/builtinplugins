local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local _ = require(l_Parent_0.Src.Types);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.SetMaterials);
local v5 = require(l_Actions_0.SetSelectedMaterial);
local l_collectArray_0 = v1.collectArray;
return function(v7)
    return function(v8)
        local l_MaterialsReducer_0 = v8:getState().MaterialsReducer;
        if l_MaterialsReducer_0.selectedMaterial and l_MaterialsReducer_0.selectedMaterial.Id == v7.Id then
            v8:dispatch(v5(nil));
            shouldReselectMaterial = true;
        end;
        v8:dispatch(v4((l_collectArray_0(l_MaterialsReducer_0.materials, function(_, v11)
            if v11.Id == v7.Id then
                return v7;
            else
                return v11;
            end;
        end))));
        if shouldReselectMaterial then
            v8:dispatch(v5(v7));
        end;
    end;
end;
