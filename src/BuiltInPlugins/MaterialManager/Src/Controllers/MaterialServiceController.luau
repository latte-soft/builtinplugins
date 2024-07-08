local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextItem_0 = v2.ContextServices.ContextItem;
local l_ServiceWrapper_0 = v2.TestHelpers.ServiceWrapper;
local _ = require(l_Parent_0.Src.Reducers.MaterialBrowserReducer);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v7 = require(l_Actions_0.ClearMaterialWrapper);
local v8 = require(l_Actions_0.SetMaterialOverride);
local v9 = require(l_Actions_0.SetMaterialOverrides);
local v10 = require(l_Actions_0.SetMaterial);
local v11 = require(l_Actions_0.SetMaterialList);
local v12 = require(l_Actions_0.SetMaterialStatus);
local v13 = require(l_Actions_0.SetMaterialWrapper);
local v14 = require(l_Actions_0.SetPath);
local v15 = require(l_Actions_0.SetSearch);
local v16 = require(l_Actions_0.SetUse2022Materials);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v18 = require(l_Constants_0.getCategoryDefault);
local v19 = require(l_Constants_0.getMaterialPath);
local v20 = require(l_Constants_0.getMaterialType);
local v21 = require(l_Constants_0.getMaterialName);
local v22 = require(l_Constants_0.getSupportedMaterials);
local l_Util_0 = l_Parent_0.Src.Util;
local v24 = require(l_Util_0.CheckMaterialName);
local v25 = require(l_Util_0.ContainsPath);
local v26 = require(l_Util_0.getMaterials);
local v27 = require(l_Util_0.getOverrides);
local v28 = v22();
local v29 = l_ContextItem_0:extend("MaterialServiceController");
v29.new = function(v30, v31)
    local v32 = setmetatable({
        _materialChangedListeners = {}, 
        _overrideChangedListeners = {}, 
        _changeHistoryService = l_ServiceWrapper_0.new("ChangeHistoryService", v31), 
        _rootCategory = {
            Categories = {}, 
            CategoryNames = {}, 
            Materials = {}
        }, 
        _materialPaths = {}, 
        _materialWrappers = {}, 
        _materialStatuses = {}, 
        _materialServiceWrapper = l_ServiceWrapper_0.new("MaterialService", v31), 
        _nameToEnum = {}, 
        _store = v30, 
        _mock = v31
    }, v29);
    v32._materialServiceAdded = v32._materialServiceWrapper:asInstance().DescendantAdded:Connect(function(v33)
        if not v33:IsA("MaterialVariant") then
            if not ((not v33:IsA("TerrainDetail") or not v33.Parent) or not v33.Parent:IsA("MaterialVariant")) then
                local l_Parent_1 = v33.Parent;
                local v35 = v32:getMaterialWrapper(l_Parent_1.BaseMaterial, l_Parent_1);
                v32._materialChangedListeners[v33] = v33.Changed:Connect(function(_)
                    v32._store:dispatch(v13((v32:getMaterialWrapper(l_Parent_1.BaseMaterial, l_Parent_1))));
                end);
                v32._store:dispatch(v13(v35));
            end;
            return ;
        else
            v32:addMaterial(v33.BaseMaterial, v33, v19(v33.BaseMaterial));
            return ;
        end;
    end);
    v32._materialServiceRemoved = v32._materialServiceWrapper:asInstance().DescendantRemoving:Connect(function(v37)
        if not v37:IsA("MaterialVariant") then
            if not ((not v37:IsA("TerrainDetail") or not v37.Parent) or not v37.Parent:IsA("MaterialVariant")) then
                local l_Parent_2 = v37.Parent;
                local v39 = v32:getMaterialWrapper(l_Parent_2.BaseMaterial, l_Parent_2);
                v32._materialChangedListeners[v37] = nil;
                v32._store:dispatch(v13(v39));
            end;
            return ;
        else
            v32:removeMaterial(v37);
            return ;
        end;
    end);
    v32._materialServiceChanged = v32._materialServiceWrapper:asInstance().Changed:Connect(function(v40)
        if v32._nameToEnum[v40] then
            v32._overrideChangedSignal:Fire(v32._nameToEnum[v40]);
        end;
    end);
    v32._materialServiceStatus = v32._materialServiceWrapper:asService().OverrideStatusChanged:Connect(function(v41)
        v32._store:dispatch(v12(v41, v32._materialServiceWrapper:asService():GetOverrideStatus(v41)));
    end);
    if not v31 then
        v32._uses2022MaterialsChanged = v32._materialServiceWrapper:asInstance():GetPropertyChangedSignal("Use2022Materials"):Connect(function()
            v32._store:dispatch(v16(v32._materialServiceWrapper:asService().Use2022Materials));
        end);
        v32._store:dispatch(v16(v32._materialServiceWrapper:asService().Use2022Materials));
    end;
    for v42, v43 in pairs(v28) do
        v32:addMaterial(v42, nil, v19(v42));
        if v43 then
            v32._overrideChangedListeners[v42] = v32._materialServiceWrapper:asService():GetMaterialOverrideChanged(v42):Connect(function()
                v32:updateOverrides(v42);
            end);
        end;
    end;
    for _, v45 in ipairs(v32._materialServiceWrapper:asInstance():GetDescendants()) do
        if v45:IsA("MaterialVariant") then
            v32:addMaterial(v45.BaseMaterial, v45, v19(v45.BaseMaterial));
        end;
    end;
    for v46, _ in ipairs(v28) do
        v32._nameToEnum[v21(v46) .. "Name"] = v46;
    end;
    return v32;
end;
v29.mock = function(v48)
    return v29.new(v48, true);
end;
v29.destroy = function(v49)
    v49._materialServiceAdded:Disconnect();
    v49._materialServiceRemoved:Disconnect();
    v49._materialServiceChanged:Disconnect();
    v49._materialServiceStatus:Disconnect();
    if not v49._mock then
        v49._uses2022MaterialsChanged:Disconnect();
    end;
    v49._materialServiceWrapper:destroy();
    for v50, _ in ipairs(v49._materialChangedListeners) do
        v49._materialChangedListeners[v50]:Disconnect();
        v49._materialChangedListeners[v50] = nil;
    end;
end;
v29.getRootCategory = function(v52)
    return v52._rootCategory;
end;
v29.getMaterialWrapper = function(_, v54, v55)
    return {
        Material = v54, 
        MaterialPath = v19(v54), 
        MaterialType = v20(v54), 
        MaterialVariant = v55
    };
end;
v29.addCategory = function(v56, v57, v58)
    return v56:findCategory(v57, v58, true);
end;
v29.findCategory = function(v59, v60, v61, v62)
    local v63 = true;
    if #v60 <= 0 then
        v63 = not v62;
    end;
    assert(v63, "Can't add root category");
    local l__rootCategory_0 = v59._rootCategory;
    for _, v66 in ipairs(v60) do
        if not l__rootCategory_0.Categories[v66] then
            if not v62 then
                return nil;
            else
                l__rootCategory_0.Categories[v66] = {
                    Builtin = v61, 
                    Categories = {}, 
                    CategoryNames = {}, 
                    Materials = {}
                };
                table.insert(l__rootCategory_0.CategoryNames, v66);
                table.sort(l__rootCategory_0.CategoryNames);
                l__rootCategory_0 = l__rootCategory_0.Categories[v66];
            end;
        else
            l__rootCategory_0 = l__rootCategory_0.Categories[v66];
        end;
    end;
    return l__rootCategory_0;
end;
v29.addMaterial = function(v67, v68, v69, _)
    local v71 = v19(v68);
    local v72 = v67:getMaterialWrapper(v68, v69);
    local v73 = v67:addCategory(v71, not v72.MaterialVariant);
    assert(v73, "Category to which a Material is added should exist, or be created");
    table.insert(v73.Materials, v72);
    if not v69 then
        v67._store:dispatch(v12(v68, v67._materialServiceWrapper:asService():GetOverrideStatus(v68)));
    else
        v67._materialPaths[v69] = v71;
        v67._materialWrappers[v69] = v72;
        for _, v75 in ipairs(v69:GetChildren()) do
            assert(not v67._materialChangedListeners[v75], "Already connected to material changed");
            v67._materialChangedListeners[v75] = v75.Changed:Connect(function(_)
                v67._store:dispatch(v13((v67:getMaterialWrapper(v69.BaseMaterial, v69))));
            end);
        end;
        if v67._materialChangedListeners[v69] then
            v67._materialChangedListeners[v69]:disconnect();
        end;
        v67._materialChangedListeners[v69] = v69.Changed:Connect(function(v77)
            local v78 = v67:getMaterialWrapper(v69.BaseMaterial, v69);
            if not (v77 ~= "BaseMaterial") or v77 == "Name" then
                v67:moveMaterial(v78);
            end;
            v67._store:dispatch(v13(v78));
        end);
    end;
    if v28[v68] then
        v67:updateOverrides(v68);
    end;
    v67._store:dispatch(v13(v72));
    if v25(v67._store:getState().MaterialBrowserReducer.Path, v71) then
        v67:updateMaterialList();
    end;
end;
v29.removeMaterial = function(v79, v80, _)
    local v82 = v79._materialPaths[v80];
    assert(v82, "Cannot remove material that does not exist");
    local v83 = v79:findCategory(v82);
    assert(v83, "Cannot remove material from category that does not exist");
    for v84, v85 in ipairs(v83.Materials) do
        if v85.MaterialVariant == v80 then
            table.remove(v83.Materials, v84);
            break;
        end;
    end;
    if v79._materialChangedListeners[v80] then
        v79._materialChangedListeners[v80]:Disconnect();
        v79._materialChangedListeners[v80] = nil;
    end;
    for _, v87 in pairs(v80:GetChildren()) do
        if v79._materialChangedListeners[v87] then
            v79._materialChangedListeners[v87]:Disconnect();
            v79._materialChangedListeners[v87] = nil;
        end;
    end;
    v79._store:dispatch(v7(v79._store:getState().MaterialBrowserReducer.Materials[v80]));
    v79:updateOverrides(v80.BaseMaterial);
    if v25(v79._store:getState().MaterialBrowserReducer.Path, v82) then
        v79:updateMaterialList();
    end;
end;
v29.moveMaterial = function(v88, v89)
    assert(v88._materialPaths[v89.MaterialVariant], "Tried to move material that wasn't registered.");
    local v90 = v88._materialPaths[v89.MaterialVariant];
    assert(v90, "Cannot remove material that does not exist");
    local v91 = v88:findCategory(v90);
    assert(v91, "Cannot remove material from category that does not exist");
    for v92, v93 in ipairs(v91.Materials) do
        if v93.MaterialVariant == v89.MaterialVariant then
            table.remove(v91.Materials, v92);
            v88:updateOverrides(v93.Material);
            break;
        end;
    end;
    v88._materialPaths[v89.MaterialVariant] = v19(v89.Material);
    v91 = v88:addCategory(v88._materialPaths[v89.MaterialVariant], not v89.MaterialVariant);
    assert(v91, "Category to which a Material is added should exist, or be created");
    table.insert(v91.Materials, v89);
    v88:updateOverrides(v89.Material);
    if not (not v25(v88._store:getState().MaterialBrowserReducer.Path, v90) and not v25(v88._materialPaths[v89.MaterialVariant], v89.MaterialPath)) then
        v88:updateMaterialList();
    end;
end;
v29.updateOverrides = function(v94, v95)
    local v96, v97 = v27(v94._materialServiceWrapper:asService():GetBaseMaterialOverride(v95), v94:findCategory({}), v95);
    v94._store:dispatch(v9(v95, v96));
    v94._store:dispatch(v8(v95, v97));
end;
v29.setMaterialOverride = function(v98, v99, v100)
    v98._materialServiceWrapper:asService():SetBaseMaterialOverride(v99, v100 or "");
end;
v29.updateMaterialList = function(v101, v102, v103)
    local l_MaterialBrowserReducer_0 = v101._store:getState().MaterialBrowserReducer;
    local v105 = v102 or l_MaterialBrowserReducer_0.Path;
    v101._store:dispatch(v11((v26(v101:findCategory(v105), v105, v103 or l_MaterialBrowserReducer_0.Search))));
end;
v29.setPath = function(v106, v107)
    v106:updateMaterialList(v107);
    v106._store:dispatch(v14(v107));
end;
v29.setSearch = function(v108, v109)
    v108:updateMaterialList(nil, v109);
    v108._store:dispatch(v15(v109));
end;
v29.setMaterial = function(v110, v111)
    v110._store:dispatch(v10(v110._materialWrappers[v111]));
end;
v29.hasDefaultMaterial = function(v112, v113, v114)
    if v114 == "None" then
        v114 = "";
    end;
    local v115;
    if v21(v113) ~= v114 then
        v115 = false;
        if not (v114 == "") then
            goto label0;
        end;
    end;
    v115 = not v112._materialServiceWrapper:asService():GetMaterialVariant(v113, v114);
    ::label0::;
    return v115;
end;
v29.checkMaterialName = function(v116, v117, v118)
    local v119 = v116:findCategory({});
    assert(v119, "Tried to get materials for path which does not exist");
    return (v24(v119, v117, v118));
end;
v29.getCategoryDefaultMaterial = function(v120, v121)
    local v122 = v18(v121);
    if not v122 then
        local v123 = v120:findCategory(v121);
        if #v123.Materials > 0 then
            return v123.Materials[1].Material;
        else
            v122 = Enum.Material.Plastic;
        end;
    end;
    return v122;
end;
return v29;
