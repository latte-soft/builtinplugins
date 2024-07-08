local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Networking.Requests.ApiFetchGroupsHavePermission);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetManagedGroups);
return function()
    return function(v3)
        v1():andThen(function(v4)
            v3:dispatch(v2(v4.groups));
        end, function(_)
            error("Failed to fetch groups with edit permission");
        end);
    end;
end;
