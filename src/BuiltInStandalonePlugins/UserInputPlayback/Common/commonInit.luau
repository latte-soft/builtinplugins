local v0 = false;
return function()
    if not v0 then
        v0 = true;
        require(script.Parent.defineLuaFlags);
        local l_Parent_0 = script.Parent.Parent;
        if require(l_Parent_0.Src.Util.DebugFlags).EnableRoactConfigs() then
            require(l_Parent_0.Packages.Roact).setGlobalConfig({
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
