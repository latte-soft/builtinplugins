local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return (v1.createReducer({
    Material = Enum.Material.Grass, 
    ReplaceMaterial = false, 
    SourceMaterial = Enum.Material.Grass, 
    TargetMaterial = Enum.Material.Brick, 
    TargetTransform = CFrame.new(), 
    TargetSize = Vector3.one * require(l_Parent_0.Src.Util.Constants).VOXEL_RESOLUTION
}, {
    SetMaterial = function(v3, v4)
        return v2.Dictionary.join(v3, {
            Material = v4.material
        });
    end, 
    SetReplaceMaterial = function(v5, v6)
        return v2.Dictionary.join(v5, {
            ReplaceMaterial = v6.replaceMaterial
        });
    end, 
    SetSourceMaterial = function(v7, v8)
        return v2.Dictionary.join(v7, {
            SourceMaterial = v8.SourceMaterial
        });
    end, 
    SetTargetMaterial = function(v9, v10)
        return v2.Dictionary.join(v9, {
            TargetMaterial = v10.TargetMaterial
        });
    end, 
    ChangeTarget = function(v11, v12)
        return v2.Dictionary.join(v11, {
            TargetTransform = v12.targetTransform, 
            TargetSize = v12.targetSize
        });
    end
}));
