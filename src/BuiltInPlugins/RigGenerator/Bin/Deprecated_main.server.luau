if not game:GetFastFlag("ImprovePluginSpeed_RigGenerator") then
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("RigGenerator", l_Parent_0.Src);
    if not v1.isCli() then
        require(script.Parent.main)(plugin);
        return ;
    else
        return ;
    end;
else
    return ;
end;
