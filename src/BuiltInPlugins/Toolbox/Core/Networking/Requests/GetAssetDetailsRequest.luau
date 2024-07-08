local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.SetAssetConfigData);
local v3 = require(l_Parent_0.Core.Util.firstToUpper);
local v4 = require(l_Parent_0.Core.Actions.NetworkError);
local v5 = require(l_Actions_0.UpdateAssetConfigData);
return function(v6, v7, v8)
    return function(v9)
        v6:getAssetCreationDetails({
            v7
        }):andThen(function(v10)
            local l_responseBody_0 = v10.responseBody;
            if (l_responseBody_0 and #l_responseBody_0 > 0) and l_responseBody_0[1].assetId == v7 then
                local v12 = {};
                for v13, v14 in pairs(l_responseBody_0[1]) do
                    v12[v3(v13)] = v14;
                end;
                if not v8 then
                    v9:dispatch(v2(v12));
                else
                    v9:dispatch(v5(v12));
                    return ;
                end;
            end;
        end, function(v15)
            v9:dispatch(v4(v15));
        end);
    end;
end;
