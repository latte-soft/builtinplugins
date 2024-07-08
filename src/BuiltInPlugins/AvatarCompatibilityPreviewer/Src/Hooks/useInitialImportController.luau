local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useAddInstancesToUserCatalogAndEquip);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedState);
return function(v6)
    local v7 = v4();
    local v8, v9 = v5(v6, "initialImportComplete", false);
    v2.useEffect(function()
        if not v8 then
            v9(true);
            task.defer(function()
                v7(v1.filter(v6:GetChildren(), function(v10)
                    return v10:IsA("Accessory") or v10:IsA("MeshPart") and v10.Name ~= "Head";
                end));
            end);
            return ;
        else
            return ;
        end;
    end, {
        v7, 
        v8, 
        v6
    });
end;
