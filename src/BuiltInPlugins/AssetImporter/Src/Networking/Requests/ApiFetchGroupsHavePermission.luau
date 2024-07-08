local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v2 = require(l_script_FirstAncestor_0.Src.Networking.Http);
local v3 = require(l_script_FirstAncestor_0.Src.Networking.Models.Group);
return function()
    return v2.Request({
        Url = v2.BuildRobloxUrl("develop", "v1/user/groups/canmanage"), 
        Method = "GET"
    }):andThen(function(v4)
        local v5 = l_HttpService_0:JSONDecode(v4);
        local v6 = {
            groups = {}
        };
        for _, v8 in v5.data, nil, nil do
            local v9, v10 = v3.fromJsonData(v8);
            if not v9 then
                error((("Parsing error for ApiFetchGroupsCanManage: %*"):format(v10)));
            else
                table.insert(v6.groups, v10);
            end;
        end;
        return v6;
    end);
end;
