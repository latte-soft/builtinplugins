local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Actions.SetScriptAnalyticsSent);
return function(v1, v2, v3)
    return function(v4)
        local v5 = v4:getState();
        if not v5.ScriptConversion.analyticsSent then
            v3:getHandler("onInitialScriptAnalysisScan")(v2, #v1, v5.ScriptConversion.completedScripts);
            v4:dispatch(v0(true));
        end;
    end;
end;
