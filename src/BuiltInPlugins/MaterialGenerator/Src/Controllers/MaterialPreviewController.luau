local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextItem_0 = v3.ContextServices.ContextItem;
local l_ServiceWrapper_0 = v3.TestHelpers.ServiceWrapper;
local v6 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v7 = l_ContextItem_0:extend("MaterialPreviewController");
v7.new = function(v8, v9)
    assert(not v6(), "Expected FFlagMaterialGeneratorNewUI to be false");
    return (setmetatable({
        _store = v8, 
        _mock = v9, 
        _materialService = l_ServiceWrapper_0.new("MaterialService", v9):asInstance(), 
        _selectionService = l_ServiceWrapper_0.new("Selection", v9):asService(), 
        _partMaterialsToRestore = {}, 
        _previousSelection = {}
    }, v7));
end;
v7.mock = function(v10)
    return v7.new(v10, true);
end;
v7.clear = function(v11)
    if v11._material then
        v11:restoreOriginalPartMaterials();
        if v11._selectionChangedConnection then
            v11._selectionChangedConnection:Disconnect();
            v11._selectionChangedConnection = nil;
        end;
        if v11._materialVariantChangedConnection then
            v11._materialVariantChangedConnection:Disconnect();
            v11._materialVariantChangedConnection = nil;
        end;
        if v11._material.IsTemporary then
            v11._material.MaterialVariant.Parent = nil;
        end;
        v11._material = nil;
        return ;
    else
        return ;
    end;
end;
v7.setMaterial = function(v12, v13)
    if v12._material == v13 then
        return ;
    else
        if v12._materialVariantChangedConnection then
            v12._materialVariantChangedConnection:Disconnect();
        end;
        v12._material = v13;
        local l_MaterialVariant_0 = v12._material.MaterialVariant;
        v12._materialVariantChangedConnection = l_MaterialVariant_0.Changed:Connect(function(v15)
            if not (v15 ~= "Name") or v15 == "BaseMaterial" then
                v12:update();
            end;
        end);
        if not v12._selectionChangedConnection then
            v12._selectionChangedConnection = v12._selectionService.SelectionChanged:Connect(function()
                v12:restoreOriginalPartMaterials();
                v12:savePartMaterialsAndUpdate();
            end);
        end;
        if not l_MaterialVariant_0.Parent then
            l_MaterialVariant_0.Parent = v12._materialService;
        end;
        v12:savePartMaterialsAndUpdate();
        return ;
    end;
end;
v7.restoreOriginalPartMaterials = function(v16)
    for v17, v18 in v16._partMaterialsToRestore, nil, nil do
        v17.Material = v18.OriginalMaterial;
        v17.MaterialVariant = v18.OriginalMaterialVariant;
    end;
    v16._partMaterialsToRestore = {};
end;
v7.savePartMaterialsAndUpdate = function(v19)
    v19._partMaterialsToRestore = {};
    local l_MaterialVariant_1 = v19._material.MaterialVariant;
    for _, v22 in v19._selectionService:Get() do
        if v22:IsA("BasePart") then
            v19._partMaterialsToRestore[v22] = {
                OriginalMaterial = v22.Material, 
                OriginalMaterialVariant = v22.MaterialVariant
            };
            v22.Material = l_MaterialVariant_1.BaseMaterial;
            v22.MaterialVariant = l_MaterialVariant_1.Name;
        end;
    end;
end;
v7.preserveCurrentSelection = function(v23)
    v23._partMaterialsToRestore = {};
end;
v7.plotWaypoint = function(v24)
    v24:restoreOriginalPartMaterials();
    l_ChangeHistoryService_0:SetWaypoint("Original materials before application");
    v24:savePartMaterialsAndUpdate();
end;
v7.update = function(v25)
    local l_MaterialVariant_2 = v25._material.MaterialVariant;
    for _, v28 in v25._selectionService:Get() do
        if v28:IsA("BasePart") then
            v28.Material = l_MaterialVariant_2.BaseMaterial;
            v28.MaterialVariant = l_MaterialVariant_2.Name;
        end;
    end;
end;
v7.destroy = function(v29)
    v29:clear();
end;
return v7;
