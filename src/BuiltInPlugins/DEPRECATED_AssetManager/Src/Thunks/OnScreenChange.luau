local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetAssets);
local v2 = require(l_Parent_0.Src.Actions.SetAssetsModerationData);
local v3 = require(l_Parent_0.Src.Actions.SetIsFetchingAssets);
local v4 = require(l_Parent_0.Src.Actions.SetEditingAssets);
local v5 = require(l_Parent_0.Src.Actions.SetSelectedAssets);
local v6 = require(l_Parent_0.Src.Actions.SetSearchTerm);
local v7 = require(l_Parent_0.Src.Thunks.GetAssets);
local v8 = require(l_Parent_0.Src.Util.Screens);
return function(v9, v10)
    return function(v11)
        v11:dispatch(v1({
            assets = {}
        }));
        v11:dispatch(v2({}));
        v11:dispatch(v3(false));
        v11:dispatch(v4({}));
        v11:dispatch(v5({}));
        v11:dispatch(v6(""));
        if v10.Path ~= v8.MAIN.Path then
            v11:dispatch(v7(v9, v10.AssetType));
        end;
    end;
end;
