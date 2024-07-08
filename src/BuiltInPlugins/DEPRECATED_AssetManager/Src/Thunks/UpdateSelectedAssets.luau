local l_Parent_0 = script.Parent.Parent.Parent;
local l_shallowEqual_0 = require(l_Parent_0.Packages.Framework).Dash.shallowEqual;
local v2 = require(l_Parent_0.Src.Actions.SetSelectedAssets);
return function(v3)
    return function(v4)
        if not l_shallowEqual_0(v3, v4:getState().AssetManagerReducer.selectedAssets) then
            v4:dispatch(v2(v3));
        end;
    end;
end;
