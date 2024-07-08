local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Flags.getFFlagCAP1107);
local v3 = require(l_Parent_0.Src.Flags.getFIntCAP1107TimeoutInMs);
local v4 = require(l_Parent_0.Src.Network.Http);
return function()
    assert(v2());
    return v4.RequestInternal({
        Url = v4.BuildRobloxUrl("apis", "resource-settings/v1/preferences:batchGet?preferenceTypes=Universes"), 
        Method = "GET", 
        Timeout = v3()
    }):andThen(function(v5)
        local v6 = l_HttpService_0:JSONDecode(v5);
        return v6.configurations, v6.isEligible;
    end);
end;
