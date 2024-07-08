return function()
    local l_Parent_0 = script.Parent.Parent;
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("ProcessService");
    end);
    if l_status_0 then
        _G.__DEV__ = true;
        _G.__ROACT_17_MOCK_SCHEDULER__ = true;
        _G.__ROACT_17_INLINE_ACT__ = true;
        local v3, v4 = require(l_Parent_0.Packages.Dev.Jest).runCLI(l_Parent_0.Src, {
            verbose = false, 
            ci = false
        }, {
            l_Parent_0.Src
        }):awaitStatus();
        if v3 == "Rejected" then
            print(v4);
        end;
        if (v3 == "Resolved" and v4.results.numFailedTestSuites == 0) and v4.results.numFailedTests == 0 then
            l_result_0:ExitAsync(0);
        end;
        l_result_0:ExitAsync(1);
        return ;
    else
        return ;
    end;
end;
