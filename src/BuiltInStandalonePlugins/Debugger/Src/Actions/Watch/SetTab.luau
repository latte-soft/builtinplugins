local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_Action_0 = v1.Util.Action;
local v3 = require(l_Parent_0.Src.Models.Watch.TableTab);
local l_includes_0 = v1.Dash.includes;
return l_Action_0(script.Name, function(v5)
    assert(l_includes_0(v3, v5));
    return {
        currentTab = v5
    };
end);
