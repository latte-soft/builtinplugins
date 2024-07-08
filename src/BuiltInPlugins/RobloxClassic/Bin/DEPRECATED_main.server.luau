if not game:GetFastFlag("ImprovePluginSpeed_RobloxClassic") then
    local v0 = require(script.Parent.main);
    if require(script.Parent.Parent.Src.Util.shouldPluginRun)() then
        v0(plugin);
        return ;
    else
        return ;
    end;
else
    return ;
end;
