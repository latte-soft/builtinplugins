local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Parent.Parent.Parent.Src.Networking.Http);
local l_webKeys_0 = require(script.Parent.Constants).webKeys;
return {
    Get = function(v3)
        local v4 = {};
        return v1.Request({
            Url = v1.BuildRobloxUrl("groups", "v1/groups/%d/roles", v3), 
            Method = "GET"
        }):andThen(function(v5)
            for _, v7 in pairs(l_HttpService_0:JSONDecode(v5).roles) do
                table.insert(v4, {
                    [l_webKeys_0.RoleName] = v7.name, 
                    [l_webKeys_0.RoleId] = v7.id, 
                    [l_webKeys_0.RoleRank] = v7.rank
                });
            end;
            return v4;
        end);
    end
};
