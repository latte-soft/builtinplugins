local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Src.Actions.SelectObjectForEditing);
local v3 = require(l_Parent_0.Src.Actions.SelectInvalidSelection);
return v1.connect(function(v4, _)
    return {
        targetObject = v4.targetObject
    };
end, function(v6)
    return {
        selectObjectForEditing = function(v7)
            v6(v2(v7));
        end, 
        selectInvalidSelection = function(v8)
            v6(v3(v8));
        end
    };
end)((require(l_Parent_0.Src.Components.SelectionUpdater)));
