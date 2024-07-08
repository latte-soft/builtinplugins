local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
return (v1.createReducer({
    LiveEdit = true, 
    mergeEmpty = false, 
    SelectionTransform = CFrame.new(), 
    SelectionSize = Vector3.one * v3.VOXEL_RESOLUTION, 
    SourceTransform = CFrame.new(), 
    SourceSize = Vector3.one * v3.VOXEL_RESOLUTION, 
    TargetTransform = CFrame.new(), 
    TargetSize = Vector3.one * v3.VOXEL_RESOLUTION, 
    TransformMode = require(l_Parent_0.Src.Util.TerrainEnums).TransformMode.Select
}, {
    ChangeSelection = function(v4, v5)
        local l_selectionTransform_0 = v5.selectionTransform;
        local l_selectionSize_0 = v5.selectionSize;
        return v2.Dictionary.join(v4, {
            SelectionTransform = l_selectionTransform_0, 
            SelectionSize = l_selectionSize_0, 
            SourceTransform = l_selectionTransform_0, 
            SourceSize = l_selectionSize_0
        });
    end, 
    ChangeSource = function(v8, v9)
        local l_sourceTransform_0 = v9.sourceTransform;
        local l_sourceSize_0 = v9.sourceSize;
        return v2.Dictionary.join(v8, {
            SourceTransform = l_sourceTransform_0, 
            SourceSize = l_sourceSize_0, 
            TargetTransform = l_sourceTransform_0, 
            TargetSize = l_sourceSize_0
        });
    end, 
    ChangeTarget = function(v12, v13)
        return v2.Dictionary.join(v12, {
            TargetTransform = v13.targetTransform, 
            TargetSize = v13.targetSize
        });
    end, 
    SetLiveEdit = function(v14, v15)
        return v2.Dictionary.join(v14, {
            LiveEdit = v15.liveEdit
        });
    end, 
    SetMergeEmpty = function(v16, v17)
        return v2.Dictionary.join(v16, {
            mergeEmpty = v17.mergeEmpty
        });
    end, 
    SetTransformMode = function(v18, v19)
        return v2.Dictionary.join(v18, {
            TransformMode = v19.TransformMode
        });
    end
}));
