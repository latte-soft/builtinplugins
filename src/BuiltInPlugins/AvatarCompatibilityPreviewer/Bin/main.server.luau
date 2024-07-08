local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TestService_0 = game:GetService("TestService");
local l_Workspace_0 = game:GetService("Workspace");
if plugin then
    local l_Parent_0 = script.Parent.Parent;
    local l_status_0, l_result_0 = pcall(function()
        return game:GetService("ProcessService");
    end);
    if not l_status_0 then
        local v7 = require(l_Parent_0.Packages.React);
        local v8 = require(l_Parent_0.Packages.ReactRoblox);
        local v9 = require(l_Parent_0.Src.Util.Constants);
        local v10 = require(l_Parent_0.Src.MainPlugin);
        local v11 = require(l_Parent_0.Src.Util.TestInExperienceUtil);
        local v12 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
        local function v17()
            for _, v14 in v9.EDITING_TOOLS_GUI_NAMES, nil, nil do
                local l_l_CoreGui_0_FirstChild_0 = l_CoreGui_0:FindFirstChild(v14);
                if l_l_CoreGui_0_FirstChild_0 ~= nil then
                    l_l_CoreGui_0_FirstChild_0:Destroy();
                end;
            end;
            local l_l_Workspace_0_FirstChild_0 = l_Workspace_0:FindFirstChild(v9.CLONED_DUMMY_NAME);
            if l_l_Workspace_0_FirstChild_0 ~= nil then
                l_l_Workspace_0_FirstChild_0:Destroy();
            end;
        end;
        local v18 = nil;
        local function v20()
            plugin.Name = l_Parent_0.Name;
            if v12() then
                v17();
            end;
            local v19 = v7.createElement(v10, {
                Plugin = plugin
            });
            v18 = v8.createRoot(Instance.new("Frame"));
            v18:render(v19);
            if not l_RunService_0:IsRunning() then
                v11.reset();
            end;
        end;
        plugin.Unloading:Connect(function()
            if v18 then
                v18:render(nil);
                v18 = nil;
            end;
            if v12() then
                v17();
            end;
        end);
        v20();
        return ;
    else
        local l_runCLI_0 = require(l_Parent_0.Packages.Dev.Jest).runCLI;
        _G.__ROACT_17_MOCK_SCHEDULER__ = true;
        _G.__ROACT_17_INLINE_ACT__ = true;
        local v22 = game:DefineFastFlag("DebugAvatarPreviewerUpdateSnapshots", false);
        local v23 = game:DefineFastString("DebugAvatarPreviewerTestPathPattern", "");
        local v24, v25 = l_runCLI_0(l_Parent_0.Src, {
            verbose = true, 
            ci = true, 
            updateSnapshot = v22, 
            testPathPattern = if v23 == "" then nil else v23
        }, {
            l_Parent_0.Src, 
            l_Parent_0.RhodiumTests
        }):awaitStatus();
        if not (v24 == "Resolved" and v25.results.numFailedTestSuites <= 0) or v25.results.numFailedTests > 0 then
            if v24 == "Rejected" then
                print(v25);
            end;
            l_TestService_0:Error("Jest 3 test run failed");
            l_result_0:ExitAsync(1);
            return ;
        else
            l_result_0:ExitAsync(0);
            return ;
        end;
    end;
else
    return ;
end;
