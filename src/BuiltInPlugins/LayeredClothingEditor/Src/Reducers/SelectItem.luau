local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    editingItem = nil, 
    layeredClothingItemsInList = {}, 
    manuallyHiddenLayeredClothingItems = {}, 
    editingCage = nil, 
    cagesTransparency = {}, 
    acessoryTypeInfo = nil, 
    size = Vector3.new(1, 1, 1), 
    meshScale = Vector3.new(1, 1, 1), 
    inBounds = false, 
    attachmentPoint = {
        ItemCFrame = CFrame.new(), 
        AttachmentCFrame = CFrame.new()
    }
}, {
    SetManuallyHiddenLayeredClothingItems = function(v3, v4)
        return v2.Dictionary.join(v3, {
            manuallyHiddenLayeredClothingItems = v4.manuallyHiddenLayeredClothingItems
        });
    end, 
    SetEditingCage = function(v5, v6)
        return v2.Dictionary.join(v5, {
            editingCage = v6.editingCage
        });
    end, 
    SetCagesTransparency = function(v7, v8)
        return v2.Dictionary.join(v7, {
            cagesTransparency = v8.cagesTransparency
        });
    end, 
    SetAccessoryTypeInfo = function(v9, v10)
        return v2.Dictionary.join(v9, {
            accessoryTypeInfo = v10.accessoryTypeInfo
        });
    end, 
    SetAttachmentPoint = function(v11, v12)
        return v2.Dictionary.join(v11, {
            attachmentPoint = v12.attachmentPoint
        });
    end, 
    SetItemSize = function(v13, v14)
        return v2.Dictionary.join(v13, {
            size = v14.size
        });
    end, 
    SetMeshScale = function(v15, v16)
        return v2.Dictionary.join(v15, {
            meshScale = v16.meshScale
        });
    end, 
    SetInBounds = function(v17, v18)
        return v2.Dictionary.join(v17, {
            inBounds = v18.inBounds
        });
    end
});
