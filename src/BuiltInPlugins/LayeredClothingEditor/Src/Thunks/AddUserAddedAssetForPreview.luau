local l_Parent_0 = script.Parent.Parent.Parent;
local l_PreviewUtil_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared.PreviewUtil;
local v2 = require(l_Parent_0.Src.Actions.SetUserAddedAssets);
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
return function(v4, v5, v6)
    return function(v7)
        local l_userAddedAssets_0 = v7:getState().previewStatus.userAddedAssets;
        local v9 = 1;
        if l_userAddedAssets_0[v4] then
            v9 = #l_userAddedAssets_0[v4] + 1;
        end;
        local v10 = l_PreviewUtil_0.createUserAddedAsset(v5);
        v7:dispatch(v2((l_deepJoin_0(l_userAddedAssets_0, {
            [v4] = {
                [v9] = v10
            }
        }))));
        if v6 then
            v6(v10);
        end;
    end;
end;
