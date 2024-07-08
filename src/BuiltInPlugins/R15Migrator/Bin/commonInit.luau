local v0 = false;
return function()
    if not v0 then
        v0 = true;
        local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
        if require(l_script_FirstAncestor_0.Src.Util.DebugFlags).EnableRoactConfigs() then
            require(l_script_FirstAncestor_0.Packages.Roact).setGlobalConfig({
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
