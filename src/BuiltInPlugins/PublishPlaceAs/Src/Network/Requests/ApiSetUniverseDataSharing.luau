local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Network.Http);
local v3 = require(l_Parent_0.Src.Flags.getFFlagCAP1107);
return function(v4)
    assert(v3());
    return v2.Request({
        Url = v2.BuildRobloxUrl("apis", "resource-settings/v1/universes"), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            configurations = {
                {
                    universeId = v4, 
                    dataSharingLicenseTypes = {
                        "RobloxGlobal"
                    }
                }
            }
        })
    }):catch(function(v5)
        warn("Error setting universe data sharing configuration", v5);
        return nil;
    end);
end;
