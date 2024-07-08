if plugin then
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
    require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
    local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAssetAccessErrorMessageImprovements);
    local v2 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v2.launch("AssetAccess", l_script_FirstAncestor_0.Src);
    if not v2.isCli() then
        if v1() then
            if plugin.HostDataModelType ~= Enum.StudioDataModelType.Edit then
                return ;
            else
                local v3 = require(l_script_FirstAncestor_0.Src.Util.ShareDialogController).new(plugin);
                plugin.Unloading:Once(function()
                    v3:Destroy();
                end);
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
