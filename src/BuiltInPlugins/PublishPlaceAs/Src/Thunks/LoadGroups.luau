local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetGroupInfo);
local v2 = require(l_Parent_0.Src.Network.Requests.ApiFetchGroupsHavePermission);
local v3 = require(l_Parent_0.Src.Network.Requests.ApiFetchOwnedGroups);
local v4 = require(l_Parent_0.Src.Flags.getFFlagCAP1107);
return function()
    return function(v5)
        v5:dispatch(v1({
            groups = {}
        }));
        local v6 = v2();
        if not v4() then
            v6:andThen(function(v7)
                v5:dispatch(v1(v7));
            end, function(_)
                error("Failed to fetch groups with edit permission");
            end);
            return ;
        else
            v6:andThen(function(v9)
                local v10 = {};
                for _, v12 in pairs(v9.groups) do
                    table.insert(v10, v12.id);
                end;
                v5:dispatch(v1({
                    groups = v9.groups
                }));
                return v3(v10);
            end):andThen(function(v13)
                v5:dispatch(v1({
                    ownedGroups = v13
                }));
            end):catch(function(_)
                error("Failed to fetch groups with edit permission");
            end);
            return ;
        end;
    end;
end;
