local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Network.Http);
local l_StudioService_0 = game:GetService("StudioService");
local v4 = require(l_Parent_0.Src.Flags.getFFlagCAP1107);
return function(_)
    assert(v4());
    return v2.Request({
        Url = v2.BuildRobloxUrl("groups", "v2/users/%d/groups/roles", (l_StudioService_0:GetUserId())), 
        Method = "GET"
    }):andThen(function(v6)
        local v7 = l_HttpService_0:JSONDecode(v6);
        local v8 = {};
        for _, v10 in pairs(v7.data) do
            if v10.role.rank == 255 then
                table.insert(v8, v10.group.id);
            end;
        end;
        return v8;
    end);
end;
