local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local v2 = require(l_script_FirstAncestor_0.Libs.Http.StatusCodes);
local v3 = require(l_script_FirstAncestor_0.Core.Actions.SetFiatProduct);
local v4 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local v5 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
return function(v6, v7, v8)
    return function(v9)
        v6:getFiatProduct(v7, v8):andThen(function(v10)
            if v5.shouldDebugUrls() then
                print("getFiatProduct Response: ", v10);
            end;
            v9:dispatch(v3(v7, v10.responseBody));
        end, function(v11)
            if v11.responseCode == v2.NOT_FOUND then
                v9:dispatch(v3(v7, (v4.getDefaultFiatProduct())));
                return ;
            else
                v9:dispatch(v1(v11));
                return ;
            end;
        end);
    end;
end;
