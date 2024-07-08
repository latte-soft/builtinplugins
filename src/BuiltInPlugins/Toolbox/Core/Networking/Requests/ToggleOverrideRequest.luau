local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.SetAssetConfigTab);
local v3 = require(l_Actions_0.ClearChange);
local v4 = require(l_Parent_0.Core.Types.ConfigTypes);
local v5 = require(l_Parent_0.Core.Util.AssetConfigConstants);
return function(v6)
    return function(v7)
        if not v4:isOverride(v6) then
            v7:dispatch(v2(v4:getOverrideTab()));
            return ;
        else
            v7:dispatch(v2(v4:getGeneralTab()));
            v7:dispatch(v3(v5.OVERRIDE_ASSET_ID));
            return ;
        end;
    end;
end;
