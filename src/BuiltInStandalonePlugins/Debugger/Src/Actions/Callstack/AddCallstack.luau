local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local _ = require(l_Parent_0.Src.Models.Callstack.CallstackRow);
local _ = require(l_Parent_0.Src.Models.DebuggerStateToken);
local _ = require(l_Parent_0.Src.Types);
return l_Action_0(script.Name, function(v5, v6, v7)
    return {
        threadId = v5, 
        frameList = v6, 
        debuggerStateToken = v7
    };
end);
