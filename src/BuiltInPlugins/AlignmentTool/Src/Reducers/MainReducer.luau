local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Utility.AlignmentMode);
local v4 = require(l_Parent_0.Src.Utility.AlignmentSpace);
local v5 = require(l_Parent_0.Src.Utility.RelativeTo);
local l_join_0 = v1.join;
return (v2.createReducer({
    toolEnabled = false, 
    alignEnabled = false, 
    disabledReason = {}, 
    alignableObjects = {}, 
    alignmentMode = v3.Center, 
    alignmentSpace = v4.World, 
    enabledAxes = {
        X = false, 
        Y = false, 
        Z = false
    }, 
    relativeTo = v5.Selection, 
    previewVisible = false
}, {
    SetToolEnabled = function(v7, v8)
        return l_join_0(v7, {
            toolEnabled = v8.toolEnabled
        });
    end, 
    SetAlignEnabled = function(v9, v10)
        return l_join_0(v9, {
            alignEnabled = v10.alignEnabled, 
            disabledReason = v10.disabledReason
        });
    end, 
    SetAlignableObjects = function(v11, v12)
        return l_join_0(v11, {
            alignableObjects = v12.alignableObjects
        });
    end, 
    SetAlignmentMode = function(v13, v14)
        return l_join_0(v13, {
            alignmentMode = v14.alignmentMode
        });
    end, 
    SetAlignmentSpace = function(v15, v16)
        return l_join_0(v15, {
            alignmentSpace = v16.alignmentSpace
        });
    end, 
    SetEnabledAxes = function(v17, v18)
        return l_join_0(v17, {
            enabledAxes = v18.enabledAxes
        });
    end, 
    SetRelativeTo = function(v19, v20)
        return l_join_0(v19, {
            relativeTo = v20.relativeTo
        });
    end, 
    SetPreviewVisible = function(v21, v22)
        return l_join_0(v21, {
            previewVisible = v22.visible
        });
    end
}));
