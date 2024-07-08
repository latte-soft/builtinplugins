local v0 = require(script.Parent.Parent.Parent.Src.Util.Constants);
return {
    fromMetaBreakpoint = function(v1)
        return {
            id = v1.Id, 
            isEnabled = v1.Enabled, 
            isValid = v1.Valid, 
            lineNumber = v1.Line, 
            scriptName = v1.Script, 
            scriptLine = "", 
            condition = v1.Condition, 
            logMessage = v1.LogMessage, 
            continueExecution = v1.ContinueExecution, 
            debugpointType = not not v1.IsLogpoint and v0.DebugpointType.Logpoint or v0.DebugpointType.Breakpoint, 
            removeOnHit = v1.RemoveOnHit, 
            contextBreakpoints = v1:GetContextBreakpoints()
        };
    end, 
    mockMetaBreakpoint = function(v2, v3)
        if v2.isEnabled == nil then
            v2.isEnabled = math.random() > 0.5;
        end;
        if v2.isValid == nil then
            v2.isValid = true;
        end;
        if v2.continueExecution == nil then
            v2.continueExecution = math.random() > 0.5;
        end;
        if v2.removeOnHit == nil then
            v2.removeOnHit = math.random() > 0.5;
        end;
        return {
            id = v2.id or v3, 
            isEnabled = v2.isEnabled, 
            isValid = v2.isValid, 
            lineNumber = v2.lineNumber or v3, 
            scriptName = v2.scriptName or "script" .. tostring(v3), 
            scriptLine = v2.scriptLine or "local varNum" .. tostring(v3) .. " = 0", 
            condition = v2.condition or "varNum" .. tostring(v3) .. " == 0", 
            logMessage = v2.logMessage or "varNum" .. tostring(v3), 
            continueExecution = v2.continueExecution, 
            debugpointType = (v2.debugpointType or math.fmod(v3, 2) == 0 and v0.DebugpointType.Breakpoint) or v0.DebugpointType.Logpoint, 
            contextBreakpoints = v2.contextBreakpoints or {}, 
            removeOnHit = v2.removeOnHit
        };
    end
};
