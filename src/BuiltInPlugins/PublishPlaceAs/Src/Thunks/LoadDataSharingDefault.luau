local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.AddChange);
local v2 = require(l_Parent_0.Src.Actions.AddErrors);
local v3 = require(l_Parent_0.Src.Flags.getFFlagCAP1107);
local v4 = require(l_Parent_0.Src.Network.Requests.ApiFetchUniverseOptOut);
local v5 = require(l_Parent_0.Src.Types.DataSharingFetchState);
local v6 = require(l_Parent_0.Packages.Cryo);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
return function()
    return function(v8)
        assert(v3());
        v8:dispatch(v1("dataSharingDefault", v5.LOADING));
        v8:dispatch(v1("dataSharingEnabled", v6.None));
        v8:dispatch(v2({
            dataSharingDefault = "Loading"
        }));
        v4():andThen(function(v9, v10)
            if v10 then
                local l_isOptOut_0 = v9[1].isOptOut;
                v8:dispatch(v1("dataSharingDefault", not not l_isOptOut_0 and v5.OPT_OUT or v5.OPT_IN));
                v8:dispatch(v1("dataSharingEnabled", not l_isOptOut_0));
                return ;
            else
                return l_Promise_0.reject();
            end;
        end):catch(function()
            v8:dispatch(v1("dataSharingDefault", v5.INELIGIBLE));
        end);
    end;
end;
