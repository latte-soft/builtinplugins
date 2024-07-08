local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Network.Http);
local l_HttpService_0 = game:GetService("HttpService");
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local function v8(v4, v5)
    return v1.Request({
        Url = v1.BuildRobloxUrl("apis", "experience-guidelines-service/v1beta1/multi-creator-eligibility"), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            action = 1, 
            universeId = v4, 
            userIds = {
                v5
            }
        })
    }):andThen(function(v6)
        local v7 = l_HttpService_0:JSONDecode(v6);
        assert(#v7.eligibilityByCreator == 1);
        return {
            userIsEligible = v7.eligibilityByCreator[1].userIsEligible, 
            universeId = v4
        };
    end);
end;
return function(v9, v10)
    local v11 = {};
    for _, v13 in pairs(v9) do
        table.insert(v11, v8(v13, v10));
    end;
    return l_Promise_0.all(v11):andThen(function(v14)
        local v15 = {};
        for _, v17 in pairs(v14) do
            v15[v17.universeId] = v17.userIsEligible;
        end;
        return v15;
    end);
end;
