local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_LuaMeshEditingModule_0 = l_Parent_0.Packages.LuaMeshEditingModule;
local l_AccessoryAndBodyToolShared_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local l_PreviewConstants_0 = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local l_getActivePreviewTabs_0 = l_AccessoryAndBodyToolShared_0.getActivePreviewTabs;
local v9 = require(l_LuaMeshEditingModule_0.MeshEditingContexts.CageEditingContext);
local v10 = require(l_Parent_0.Src.Actions.SetPreviewAssetsSelected);
local v11 = require(l_Parent_0.Src.Util.Constants);
local v12 = require(l_Parent_0.Src.Actions.SetEditingCage);
local v13 = require(l_Parent_0.Src.Actions.SetItemSize);
local v14 = require(l_Parent_0.Src.Actions.SetMeshScale);
local v15 = require(l_Parent_0.Src.Actions.SetAccessoryTypeInfo);
local v16 = require(l_Parent_0.Src.Actions.SetAttachmentPoint);
local v17 = require(l_Parent_0.Src.Actions.SelectPreviewTab);
local v18 = require(l_Parent_0.Src.Actions.SetCagesTransparency);
local v19 = require(l_Parent_0.Src.Actions.SetToolMode);
local v20 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local function v24(v21, v22)
    if not l_ItemCharacteristics_0.isItemEmpty(v22) and l_ItemCharacteristics_0.hasAnyCage(v22) then
        local l_Outer_0 = Enum.CageType.Outer;
        if not (l_ItemCharacteristics_0.hasOuterCage(v22) or not l_ItemCharacteristics_0.hasInnerCage(v22)) then
            l_Outer_0 = Enum.CageType.Inner;
        end;
        v21:dispatch(v12(l_Outer_0));
        return l_Outer_0;
    elseif not l_ItemCharacteristics_0.isClothes(v22) then
        v21:dispatch(v12(v1.None));
        return nil;
    else
        v21:dispatch(v12(v11.EDIT_MODE.Mesh));
        return v11.EDIT_MODE.Mesh;
    end;
end;
local function v30(v25)
    local v26 = nil;
    local v27 = nil;
    for v28, v29 in pairs(v25) do
        if not (v26 ~= nil) or v29.LayoutOrder < v27 then
            v26 = v28;
            v27 = v29.LayoutOrder;
        end;
    end;
    if v26 then
        return v26;
    else
        return l_PreviewConstants_0.TABS_KEYS.None;
    end;
end;
local function v35(v31, v32)
    local l_selectedTab_0 = v32.previewStatus.selectedTab;
    local v34 = l_getActivePreviewTabs_0(v31);
    if l_PreviewConstantsInterface_0.IsValidTabKey(l_selectedTab_0) then
        if not (v1.List.find(v1.Dictionary.keys(v34), l_selectedTab_0) ~= nil) then
            return (v30(v34));
        else
            return l_selectedTab_0;
        end;
    else
        return (v30(v34));
    end;
end;
return function(v36, v37, v38)
    return function(v39)
        local v40 = v39:getState();
        v39:dispatch(v19(v11.TOOL_MODE.None));
        v39:dispatch(v17((v35(v37, v40))));
        v39:dispatch(v15(v1.None));
        v39:dispatch(v16({
            ItemCFrame = CFrame.new(), 
            AttachmentCFrame = CFrame.new()
        }));
        v39:dispatch(v10({}));
        if l_ItemCharacteristics_0.isClothes(v37) then
            v39:dispatch(v13(v37.Size));
            if l_ItemCharacteristics_0.isLegacyAccessory(v37) then
                v39:dispatch(v14(l_AccessoryUtil_0:getSpecialMeshScale(v37)));
            end;
        end;
        local v41 = v24(v39, v37);
        v39:dispatch(v18({
            [Enum.CageType.Inner] = v11.DEFAULT_CAGE_TRANSPARENCY, 
            [Enum.CageType.Outer] = v11.DEFAULT_CAGE_TRANSPARENCY
        }));
        if v41 ~= nil and v41 ~= v11.EDIT_MODE.Mesh then
            local v42 = v9.new();
            local v43 = v9.new();
            v42:initFromCageMesh(Enum.CageType.Inner, v37);
            v43:initFromCageMesh(Enum.CageType.Outer, v37);
            v36:setInnerCageContext(v42);
            v36:setOuterCageContext(v43);
            v20.RigidFlow = false;
            v38:getHandler("LayeredAccessorySelected")();
            return ;
        else
            v36:setInnerCageContext();
            v36:setOuterCageContext();
            v20.RigidFlow = true;
            v38:getHandler("RigidAccessorySelected")();
            return ;
        end;
    end;
end;
