local l_Parent_0 = script.Parent.Parent;
local l_Action_0 = require(script.Parent.Parent.Parent.Parent.Packages.Framework).Util.Action;
local v2 = require(l_Parent_0.Util.StateModelTemplate);
return l_Action_0(script.Name, function()
    return {
        templatesArrayToAdd = {
            v2.new()
        }
    };
end);
