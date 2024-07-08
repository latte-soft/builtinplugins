local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Network.Http);
local v3 = require(l_Parent_0.Src.Network.Models.Group);
return function()
    return v2.Request({
        Url = v2.BuildRobloxUrl("develop", "v1/user/groups/canmanage"), 
        Method = "GET"
    }):andThen(function(v4)
        local v5 = l_HttpService_0:JSONDecode(v4);
        local v6 = {
            groups = {}
        };
        for _, v8 in pairs(v5.data) do
            local v9, v10 = v3.fromJsonData(v8);
            if not v9 then
                error("Parsing error for ApiFetchGroupsCanManage: " .. v10);
            else
                table.insert(v6.groups, v10);
            end;
        end;
        return v6;
    end);
end;
