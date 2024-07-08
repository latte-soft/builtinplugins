local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
return (v1.createReducer({
    enabled = false, 
    mode = nil, 
    screen = nil, 
    rig = nil, 
    errorText = nil, 
    accessoryType = Enum.AccessoryType.Unknown, 
    animationId = nil, 
    colorMap = nil, 
    metalnessMap = nil, 
    normalMap = nil, 
    roughnessMap = nil, 
    ownershipTransferText = ""
}, {
    [require(l_Actions_0.SetEnabled).name] = function(v4, v5)
        return v2.Dictionary.join(v4, {
            enabled = v5.enabled
        });
    end, 
    [require(l_Actions_0.SetErrorText).name] = function(v6, v7)
        return v2.Dictionary.join(v6, {
            errorText = v7.errorText
        });
    end, 
    [require(l_Actions_0.SetMode).name] = function(v8, v9)
        return v2.Dictionary.join(v8, {
            mode = v9.mode
        });
    end, 
    [require(l_Actions_0.SetScreen).name] = function(v10, v11)
        return v2.Dictionary.join(v10, {
            screen = v11.screen
        });
    end, 
    [require(l_Actions_0.SetRig).name] = function(v12, v13)
        return v2.Dictionary.join(v12, {
            rig = v13.rig
        });
    end, 
    [require(l_Actions_0.SetSurfaceAppearanceIds).name] = function(v14, v15)
        return v2.Dictionary.join(v14, {
            colorMap = v15.colorMap, 
            metalnessMap = v15.metalnessMap, 
            normalMap = v15.normalMap, 
            roughnessMap = v15.roughnessMap
        });
    end, 
    [require(l_Actions_0.SetAccessoryType).name] = function(v16, v17)
        return v2.Dictionary.join(v16, {
            accessoryType = v17.accessoryType
        });
    end, 
    [require(l_Actions_0.SetAnimationId).name] = function(v18, v19)
        return v2.Dictionary.join(v18, {
            animationId = v19.animationId
        });
    end, 
    [require(l_Actions_0.SetOwnershipTransferText).name] = function(v20, v21)
        return v2.Dictionary.join(v20, {
            ownershipTransferText = v21.ownershipTransferText
        });
    end
}));
