local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local _ = require(l_Parent_0.Core.Types.PublishingRequirementsType);
return l_Action_0(script.Name, function(v3)
    return {
        publishingRequirements = v3
    };
end);
