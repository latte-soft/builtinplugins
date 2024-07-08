local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Framework).Util.Promise;
local v3 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v4 = {
    Name = "name", 
    Id = "id"
};
local function v9(v5)
    local v6 = {};
    for _, v8 in pairs(v5) do
        table.insert(v6, {
            [v3.SubjectNameKey] = v8[v4.Name], 
            [v3.SubjectIdKey] = v8[v4.Id]
        });
    end;
    return v6;
end;
return {
    Get = function(v10, v11)
        return v10:getLocalUserFriends(v11):andThen(function(v12)
            return true, (v9(l_HttpService_0:JSONDecode(v12.responseBody).data));
        end, function(_)
            warn("Asset Config, Package Permissions, Could not fetch friends for user.");
            return {};
        end);
    end
};
