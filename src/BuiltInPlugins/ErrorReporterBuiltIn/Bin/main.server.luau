require(script.Parent.defineLuaFlags);
local l_DebugErrorReporterTestInStudio_0 = game:GetFastFlag("DebugErrorReporterTestInStudio");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.TestLoader);
v3.launch(l_Parent_0.Name, l_Parent_0.ErrorReporter);
if not v3.isCli() then
    local v4 = require(l_Parent_0.ErrorReporter.StudioPluginErrorReporter);
    local l_ExpectedPrefix_0 = script.Parent:FindFirstChild("ExpectedPrefix");
    assert(l_ExpectedPrefix_0 ~= nil);
    local v6 = v4.new({
        expectedSecurityLevel = 6, 
        expectedPrefix = l_ExpectedPrefix_0.Value, 
        networking = if not l_DebugErrorReporterTestInStudio_0 then nil else v2.Http.Networking.new({
            isInternal = true, 
            loggingLevel = 7, 
            allowYielding = false, 
            httpImpl = {
                ClassName = "ErrorReporter Plugin's HttpImpl", 
                RequestInternal = function()
                    return {
                        Start = function()
                        end
                    };
                end
            }
        }), 
        services = if not l_DebugErrorReporterTestInStudio_0 then nil else {
            RunService = {
                GetRobloxVersion = function()
                    return "0.0.0.2";
                end
            }
        }
    });
    plugin.Unloading:Connect(function()
        v6:stop();
    end);
    if l_DebugErrorReporterTestInStudio_0 then
        error("ErrorReporter test error");
    end;
    return ;
else
    return ;
end;
