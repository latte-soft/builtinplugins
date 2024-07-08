local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return (v1.createReducer({
    position = {
        X = 0, 
        Y = 0, 
        Z = 0
    }, 
    size = {
        X = 1024, 
        Y = 512, 
        Z = 1024
    }, 
    planePositionY = 0, 
    heightPicker = false, 
    SelectionTransform = CFrame.new(), 
    SelectionSize = Vector3.new(64, 32, 64), 
    SnapToVoxels = true
}, {
    ChangeSelection = function(v3, v4)
        return v2.Dictionary.join(v3, {
            SelectionTransform = v4.selectionTransform, 
            SelectionSize = v4.selectionSize
        });
    end, 
    ChangePosition = function(v5, v6)
        return v2.Dictionary.join(v5, {
            position = v6.position
        });
    end, 
    ChangeSize = function(v7, v8)
        return v2.Dictionary.join(v7, {
            size = v8.size
        });
    end, 
    ChangePlanePositionY = function(v9, v10)
        return v2.Dictionary.join(v9, {
            planePositionY = v10.planePositionY
        });
    end, 
    SetHeightPicker = function(v11, v12)
        return v2.Dictionary.join(v11, {
            heightPicker = v12.heightPicker
        });
    end, 
    SetSnapToVoxels = function(v13, v14)
        return v2.Dictionary.join(v13, {
            SnapToVoxels = v14.snapToVoxels
        });
    end
}));
