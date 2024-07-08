local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Components.UGCAvatarServiceContext);
return function()
    local v3 = v1.useContext(v2);
    local l_Catalog_0 = v3:FindFirstChild("Catalog");
    if l_Catalog_0 ~= nil then
        return l_Catalog_0;
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "Catalog";
        l_Folder_0.Parent = v3;
        return l_Folder_0;
    end;
end;
