local l_Parent_0 = script.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
local v2 = require(l_Parent_0.Src.Actions.SetUserPermission);
local v3 = require(l_Parent_0.Src.Actions.SetGroupMetadata);
local v4 = require(l_Parent_0.Src.Util.PermissionsConstants);
return function(v5, v6)
    return function(v7, v8)
        local v9 = v7:getState();
        local l_groupMetadataController_0 = v8.groupMetadataController;
        local v11 = l_deepJoin_0(v9.GroupMetadata.NewGroupMetadata or v9.GroupMetadata.CurrentGroupMetadata, {
            [v5] = {
                Name = l_groupMetadataController_0:getGroupMetadata(v5).name
            }
        });
        local v12 = v9.Permissions.NewPermissions or v9.Permissions.CurrentPermissions;
        for v13, v14 in pairs((l_groupMetadataController_0:getRolesets(v5))) do
            v12 = l_deepJoin_0(v12, {
                [v4.RoleSubjectKey] = {
                    [v13] = {
                        [v4.GroupIdKey] = v5, 
                        [v4.SubjectNameKey] = v14.name, 
                        [v4.SubjectRankKey] = v14.rank, 
                        [v4.ActionKey] = v6
                    }
                }
            });
        end;
        v7:dispatch(v2(v12));
        v7:dispatch(v3(v11));
    end;
end;
