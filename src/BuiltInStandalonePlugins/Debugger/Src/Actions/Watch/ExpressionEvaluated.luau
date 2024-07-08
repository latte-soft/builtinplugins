local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local _ = require(l_Parent_0.Src.Models.Watch.WatchRow);
local _ = require(l_Parent_0.Src.Models.StepStateBundle);
return l_Action_0(script.Name, function(v4, v5)
    return {
        stepStateBundle = v4, 
        watchRow = v5
    };
end);
