local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Reducers.MorpherEditorSettings);
local v2 = require(l_Parent_0.Reducers.MorpherEditorTemplates);
return function(v3, v4)
    v3 = v3 or {
        StateMorpher = {}
    };
    return {
        StateMorpher = {
            StateTemplates = v2(v3.StateMorpher.StateTemplates, v4), 
            StateSettings = v1(v3.StateMorpher.StateSettings, v4)
        }
    };
end;
