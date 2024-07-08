local l_script_FirstAncestor_0 = script:FindFirstAncestor("ModerationDialog");
if require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableModerationDialog() then
    if not require(l_script_FirstAncestor_0.Packages.TestLoader).isCli() then
        local v1 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
        if v1.get() ~= v1.Standalone then
            return ;
        else
            require(l_script_FirstAncestor_0.Bin.Common.setup)(plugin, (require(l_script_FirstAncestor_0.Bin.Common.setupMain)));
            return ;
        end;
    else
        error("roblox-cli should not be loading standalone plugins");
        return ;
    end;
else
    return ;
end;
