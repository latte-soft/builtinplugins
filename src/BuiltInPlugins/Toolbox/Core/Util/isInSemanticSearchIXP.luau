local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
local _ = require(l_Packages_0.Framework);
local v2 = require(l_Packages_0.Dash);
return function(v3, v4, _)
    local v6 = v3:getVariables()[v4];
    if not v6 then
        return false;
    else
        return v2.find(v6, function(v7)
            local l_DomainSearchAlgorithmName_0 = v7.DomainSearchAlgorithmName;
            local v9 = false;
            if l_DomainSearchAlgorithmName_0 ~= nil then
                v9 = string.find(string.lower(l_DomainSearchAlgorithmName_0), "semantic");
            end;
            return v9;
        end) ~= nil;
    end;
end;
