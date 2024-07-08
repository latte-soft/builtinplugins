local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local v2 = require(l_Parent_0.Core.Util.AssetConfigConstants);
return function()
    return function(v3)
        if v3:getState().screenFlowType == v2.FLOW_TYPE.UPLOAD_FLOW then
            v3:dispatch(v1(v2.SCREENS.ASSET_VALIDATION));
            return ;
        else
            v3:dispatch(v1(v2.SCREENS.CONFIGURE_ASSET));
            return ;
        end;
    end;
end;
