local v0 = require(script.Parent.Parent.Parent.Parent.Src.Network.Http);
local l_HttpService_0 = game:GetService("HttpService");
return function(v2)
    return v0.Request({
        Url = v0.BuildRobloxUrl("apis", "experience-guidelines-service/v1beta1/multi-age-recommendation"), 
        Method = "POST", 
        Body = l_HttpService_0:JSONEncode({
            universeIds = v2
        })
    }):andThen(function(v3)
        local v4 = l_HttpService_0:JSONDecode(v3);
        local v5 = {};
        for _, v7 in pairs(v4.ageRecommendationDetailsByUniverse) do
            local v8 = 0;
            local l_ageRecommendation_0 = v7.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation;
            if l_ageRecommendation_0 then
                v8 = l_ageRecommendation_0.minimumAge;
            end;
            v5[v7.universeId] = v8;
        end;
        return v5;
    end);
end;
