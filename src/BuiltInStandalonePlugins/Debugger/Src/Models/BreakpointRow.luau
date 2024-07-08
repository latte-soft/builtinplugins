local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Models.MetaBreakpoint);
return {
    extractNonChildData = function(v3, v4, v5)
        return {
            id = v3.id, 
            isEnabled = v3.isEnabled, 
            isValid = v3.isValid, 
            lineNumber = v3.lineNumber, 
            scriptName = "", 
            scriptLine = v3.scriptLine, 
            condition = v3.condition, 
            logMessage = v3.logMessage, 
            continueExecution = v3.continueExecution, 
            debugpointType = v3.debugpointType, 
            removeOnHit = v3.removeOnHit, 
            context = v4, 
            scriptGUID = v5
        };
    end
};
