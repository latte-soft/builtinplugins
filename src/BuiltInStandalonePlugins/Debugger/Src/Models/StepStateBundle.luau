local _ = require(script.Parent.DebuggerStateToken);
return {
    ctor = function(v1, v2, v3)
        return {
            debuggerStateToken = v1, 
            threadId = v2, 
            frameNumber = v3
        };
    end
};
