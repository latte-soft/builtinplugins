local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetUserAddedAssets);
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
return function(v3, v4)
    return function(v5)
        local v6 = l_deepCopy_0(v5:getState().previewStatus.userAddedAssets);
        if not (not v6[v3] or not v6[v3][v4]) then
            v6[v3][v4] = nil;
            v5:dispatch(v1(v6));
        end;
    end;
end;
