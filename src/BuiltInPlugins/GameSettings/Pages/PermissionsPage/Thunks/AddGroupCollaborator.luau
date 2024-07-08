local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local l_deepJoin_0 = require(l_Parent_1.Packages.Framework).Util.deepJoin;
local v3 = require(l_Parent_1.Src.Actions.AddChange);
local v4 = require(l_Parent_0.Util.PermissionsConstants);
return function(v5, v6)
    return function(v7, v8)
        local v9 = v7:getState();
        local l_groupMetadataController_0 = v8.groupMetadataController;
        local v11 = l_deepJoin_0(v9.Settings.Changed.groupMetadata or v9.Settings.Current.groupMetadata, {
            [v5] = {
                Name = l_groupMetadataController_0:getGroupMetadata(v5).name
            }
        });
        local v12 = v9.Settings.Changed.permissions or v9.Settings.Current.permissions;
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
        v7:dispatch(v3("permissions", v12));
        v7:dispatch(v3("groupMetadata", v11));
    end;
end;
