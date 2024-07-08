local v0 = false;
return function()
    if not v0 then
        v0 = true;
        local l_Parent_0 = script.Parent.Parent;
        local v2 = require(l_Parent_0.Packages.Roact);
        if require(l_Parent_0.Src.Util.DebugFlags).EnableRoactConfigs() then
            v2.setGlobalConfig({
                elementTracing = true, 
                propValidation = true, 
                typeChecks = true
            });
        end;
        return ;
    else
        return ;
    end;
end;
