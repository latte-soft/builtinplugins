local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Utility.EditingMode);
local v4 = require(l_Parent_0.Src.Utility.StatusMessage);
local v5 = require(l_Parent_0.Src.Actions.BeginSelectingPivot);
local v6 = require(l_Parent_0.Src.Actions.DoneSelectingPivot);
local v7 = require(l_Parent_0.Src.Actions.SelectObjectForEditing);
local v8 = require(l_Parent_0.Src.Actions.SelectInvalidSelection);
local l_join_0 = v1.join;
return v2.createReducer({
    targetObject = nil, 
    editingMode = v3.None, 
    statusMessage = v4.None
}, {
    [v5.name] = function(v10, v11)
        return l_join_0(v10, {
            editingMode = v11.editingMode, 
            statusMessage = v11.statusMessage
        });
    end, 
    [v6.name] = function(v12, _)
        return l_join_0(v12, {
            editingMode = v3.Transform, 
            statusMessage = v4.None
        });
    end, 
    [v7.name] = function(v14, v15)
        return l_join_0(v14, {
            targetObject = v15.targetObject, 
            editingMode = v3.Transform, 
            statusMessage = v4.None
        });
    end, 
    [v8.name] = function(v16, v17)
        return l_join_0(v16, {
            targetObject = v1.None, 
            editingMode = v3.None, 
            statusMessage = v17.statusMessage
        });
    end
});
