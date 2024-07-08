if plugin then
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("CancellableDialog");
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("CancellableDialog", l_script_FirstAncestor_0.Src);
    if not v1.isCli() then
        if require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableCancellableDialog() then
            local v2 = require(l_script_FirstAncestor_0.Bin.Common.pluginType);
            if v2.get() ~= v2.Asset then
                return ;
            else
                require(l_script_FirstAncestor_0.Bin.Common.setup)(plugin, (require(l_script_FirstAncestor_0.Bin.Common.setupMain)));
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
