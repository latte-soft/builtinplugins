local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerReplicateEditorStateOnWorldModel);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useAddInstancesToUserCatalogAndEquip);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
return function(v7)
    local v8 = v5();
    local v9 = if not v4() then nil else v1.useContext(v3);
    v6(v7.ChildAdded, function(v10)
        if v4() then
            if not v9.isIgnoringChildren then
                if not v10:IsA("Accessory") then
                    return ;
                end;
            else
                return ;
            end;
        end;
        v8({
            v10
        });
    end, {
        v8, 
        v7, 
        if not v4() then nil else v9.isIgnoringChildren
    });
end;
