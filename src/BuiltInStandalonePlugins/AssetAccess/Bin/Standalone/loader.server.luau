local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
if require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAssetAccessErrorMessageImprovements)() then
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("AssetAccess", l_script_FirstAncestor_0.Src);
    if not v1.isCli() then
        plugin.Name = l_script_FirstAncestor_0.Name;
        require(script.Parent.main)(plugin);
        return ;
    else
        return ;
    end;
else
    return ;
end;
