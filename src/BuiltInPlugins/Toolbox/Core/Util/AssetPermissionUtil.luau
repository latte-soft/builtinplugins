local l_Parent_0 = script.Parent.Parent.Parent;
local l_webKeys_0 = require(l_Parent_0.Core.Util.Permissions.Constants).webKeys;
local _ = require(l_Parent_0.Core.Types.PermissionTypes);
return {
    isAssetPublic = function(v3)
        local v4 = false;
        if v3 then
            for _, v6 in pairs(v3) do
                if v6[l_webKeys_0.SubjectType] == l_webKeys_0.All and v6[l_webKeys_0.Action] == l_webKeys_0.UseAction then
                    return true;
                end;
            end;
        end;
        return v4;
    end
};
