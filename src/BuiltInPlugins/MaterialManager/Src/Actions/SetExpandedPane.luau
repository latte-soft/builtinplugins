local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v2, v3)
    assert(type(v2) == "string", ("Expected paneName to be a string, received %s"):format((type(v2))));
    assert(type(v3) == "boolean", ("Expected expandedPaneState to be a boolean, received %s"):format((type(v3))));
    return {
        PaneName = v2, 
        ExpandedPaneState = v3
    };
end);
