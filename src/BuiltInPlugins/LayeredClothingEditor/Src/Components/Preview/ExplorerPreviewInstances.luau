local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v5.Util.AccessoryAndBodyToolShared;
local l_PreviewUtil_0 = l_AccessoryAndBodyToolShared_0.PreviewUtil;
local _ = l_AccessoryAndBodyToolShared_0.AvatarUtil;
local l_PreviewConstants_0 = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_ItemCharacteristics_0 = l_AccessoryAndBodyToolShared_0.ItemCharacteristics;
local l_PreviewItemSelector_0 = v5.Components.PreviewItemSelector;
local l_EditingItemContext_0 = v5.Contexts.EditingItemContext;
local l_PreviewContext_0 = v5.Contexts.PreviewContext;
local l_AssetServiceWrapper_0 = v5.Contexts.AssetServiceWrapper;
local l_StudioServiceWrapper_0 = v5.Contexts.StudioServiceWrapper;
local v16 = require(l_Parent_0.Src.Actions.SelectPreviewTab);
local v17 = require(l_Parent_0.Src.Thunks.UpdatePreviewAssetsSelected);
local v18 = require(l_Parent_0.Src.Thunks.AddUserAddedAssetForPreview);
local v19 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v19.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Typecheck_0 = v19.Util.Typecheck;
local v23 = require(l_Parent_0.Src.Util.Constants);
local v24 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v25 = v2.PureComponent:extend("ExplorerPreviewInstances");
l_Typecheck_0.wrap(v25, script);
local l_GetFFlagAFTSelectHandleOnly_0 = v5.Flags.GetFFlagAFTSelectHandleOnly;
local function v43(v27)
    local l_props_0 = v27.props;
    local l_SelectedAssets_0 = l_props_0.SelectedAssets;
    local l_UserAddedAssets_0 = l_props_0.UserAddedAssets;
    local v31 = l_props_0.AssetServiceWrapper:get();
    local v32 = l_props_0.EditingItemContext:getItem();
    local l_PreviewContext_1 = l_props_0.PreviewContext;
    local l_Avatars_0 = l_PreviewConstants_0.TABS_KEYS.Avatars;
    local l_Clothing_0 = l_PreviewConstants_0.TABS_KEYS.Clothing;
    local v36 = l_SelectedAssets_0[l_Avatars_0] or {};
    local v37 = l_SelectedAssets_0[l_Clothing_0] or {};
    local v38 = l_PreviewUtil_0.createPreviewAvatars(v36, l_UserAddedAssets_0[l_Avatars_0], nil, v31);
    local v39 = l_PreviewUtil_0.createPreviewAvatars(v36, l_UserAddedAssets_0[l_Avatars_0], v27.folderRef.current, v31);
    local l_Archivable_0 = v32.Archivable;
    v32.Archivable = true;
    local v41 = v32:Clone();
    v32.Archivable = l_Archivable_0;
    l_PreviewContext_1:setAvatars(v38);
    l_PreviewContext_1:setStorageAvatars(v39);
    local v42 = l_PreviewContext_1:getAllAvatars();
    l_PreviewUtil_0.addPreviewClothingFromInstances(v42, {
        v41
    }, true);
    l_PreviewUtil_0.addPreviewClothingFromIds(v42, v37, l_UserAddedAssets_0[l_Clothing_0], v31);
    if #l_PreviewContext_1:getAvatars() < l_PreviewContext_1:getCurrentPreviewAvatarIndex() then
        l_PreviewContext_1:setPreviewAvatarIndex(1);
    end;
end;
local function v55(v44, _)
    local l_props_1 = v44.props;
    local l_AttachmentPoint_0 = l_props_1.AttachmentPoint;
    local l_AccessoryTypeInfo_0 = l_props_1.AccessoryTypeInfo;
    local l_PreviewContext_2 = l_props_1.PreviewContext;
    local l_EditingCage_0 = l_props_1.EditingCage;
    local l_ItemSize_0 = l_props_1.ItemSize;
    local l_MeshScale_0 = l_props_1.MeshScale;
    for _, v54 in ipairs((l_PreviewContext_2:getAllAvatars())) do
        if l_EditingCage_0 == v23.EDIT_MODE.Mesh then
            v54:transformLayer(1, l_ItemSize_0, l_AttachmentPoint_0.AttachmentCFrame, l_AttachmentPoint_0.ItemCFrame, l_AccessoryTypeInfo_0.Name, l_MeshScale_0);
        end;
    end;
end;
local function _(v56, v57)
    coroutine.wrap(function()
        while v56.isUpdateInProgress do
            wait();
        end;
        v56.isUpdateInProgress = true;
        if v57 then
            v43(v56);
        end;
        v55(v56, v57);
        if v57 then
            v56.props.PreviewContext:updatePreviewModel();
        end;
        v56.isUpdateInProgress = false;
    end)();
end;
local function v64(v59, v60, v61, v62)
    if v60 then
        v59.props.UpdatePreviewAssetsSelected(v60.uniqueId, not v61);
        if not v61 then
            local l_Analytics_0 = v59.props.Analytics;
            if not v24.FirstAction then
                v24.FirstAction = v23.ACTIONS.Preview;
                l_Analytics_0:getHandler("FirstAction")(v24.FirstAction);
            end;
            l_Analytics_0:getHandler("PreviewAssetSelected")(true, v62, v60.uniqueId, false);
        end;
    end;
end;
local function v71(v65, v66)
    for _, v68 in pairs(v65.props.UserAddedAssets) do
        for _, v70 in pairs(v68) do
            if v70.instance == v66 then
                return v70;
            end;
        end;
    end;
end;
local function _(v72)
    if not l_ItemCharacteristics_0.isClothes(v72) then
        if not l_ItemCharacteristics_0.isAvatar(v72) then
            return nil;
        else
            return l_PreviewConstants_0.TABS_KEYS.Avatars;
        end;
    else
        return l_PreviewConstants_0.TABS_KEYS.Clothing;
    end;
end;
v25.init = function(v74)
    v74.folderRef = v2.createRef();
    v74.isUpdateInProgress = false;
    v74.isSelectedInstanceValid = function(v75)
        local v76 = v74.props.EditingItemContext:getItem();
        if not (not (v75 ~= v76.Parent) or v75:FindFirstAncestor(v76.Parent.Name)) and not v75:FindFirstAncestor(v23.PREVIEW_FOLDER_NAME) then
            return if not l_ItemCharacteristics_0.isClothes(v75) then if l_ItemCharacteristics_0.isAvatar(v75) then l_PreviewConstants_0.TABS_KEYS.Avatars else nil else l_PreviewConstants_0.TABS_KEYS.Clothing ~= nil;
        else
            return false;
        end;
    end;
    v74.isEquipped = function(v77)
        local v78 = v71(v74, v77);
        local v79 = if not l_ItemCharacteristics_0.isClothes(v77) then if l_ItemCharacteristics_0.isAvatar(v77) then l_PreviewConstants_0.TABS_KEYS.Avatars else nil else l_PreviewConstants_0.TABS_KEYS.Clothing;
        if not (not v78 or not v79) then
            local v80 = v74.props.SelectedAssets[v79];
            if not (not v80 or not v3.List.find(v80, v78.uniqueId)) then
                return true;
            end;
        end;
        return false;
    end;
    v74.onValidSelection = function(v81, v82)
        local v83 = if not l_ItemCharacteristics_0.isClothes(v81) then if l_ItemCharacteristics_0.isAvatar(v81) then l_PreviewConstants_0.TABS_KEYS.Avatars else nil else l_PreviewConstants_0.TABS_KEYS.Clothing;
        if v83 then
            v74.props.SelectPreviewTab(v83);
            local v84 = v71(v74, v81);
            if v84 then
                v64(v74, v84, v82, v83);
                return ;
            else
                v74.props.AddUserAddedAssetForPreview(v83, v81, function(v85)
                    v64(v74, v85, v82, v83);
                end);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v25.getOrCreatePreviewFolder = function(v86)
    v86.previewFolder = l_ReplicatedStorage_0:FindFirstChild(v23.PREVIEW_FOLDER_NAME);
    if not v86.previewFolder then
        v86.previewFolder = Instance.new("Folder");
        v86.previewFolder.Name = v23.PREVIEW_FOLDER_NAME;
        v86.previewFolder.Archivable = true;
        v86.previewFolder.Parent = l_ReplicatedStorage_0;
    end;
end;
v25.render = function(v87)
    local l_props_2 = v87.props;
    local l_WorkspacePreviewSelectionEnabled_0 = l_props_2.WorkspacePreviewSelectionEnabled;
    local l_Localization_0 = l_props_2.Localization;
    local v91 = l_props_2.StudioServiceWrapper:get();
    v87:getOrCreatePreviewFolder();
    return v2.createElement(v2.Portal, {
        target = v87.previewFolder
    }, {
        [v91:GetUserId()] = v2.createElement("Folder", {
            [v2.Ref] = v87.folderRef, 
            Archivable = true
        }, {
            PreviewSelector = if not l_GetFFlagAFTSelectHandleOnly_0() or l_WorkspacePreviewSelectionEnabled_0 then v2.createElement(l_PreviewItemSelector_0, {
                IsSelectedInstanceValid = v87.isSelectedInstanceValid, 
                IsEquipped = v87.isEquipped, 
                OnValidSelection = v87.onValidSelection, 
                TooltipText = l_Localization_0:getText("Preview", "Tooltip")
            }) else nil
        })
    });
end;
v25.didUpdate = function(v92, v93)
    if not (v93.SelectedAssets[l_PreviewConstants_0.TABS_KEYS.Avatars] == v92.props.SelectedAssets[l_PreviewConstants_0.TABS_KEYS.Avatars]) or v93.SelectedAssets[l_PreviewConstants_0.TABS_KEYS.Clothing] ~= v92.props.SelectedAssets[l_PreviewConstants_0.TABS_KEYS.Clothing] then
        local l_wrap_0 = coroutine.wrap;
        local v95 = true;
        l_wrap_0(function()
            while v92.isUpdateInProgress do
                wait();
            end;
            v92.isUpdateInProgress = true;
            if v95 then
                v43(v92);
            end;
            v55(v92, v95);
            if v95 then
                v92.props.PreviewContext:updatePreviewModel();
            end;
            v92.isUpdateInProgress = false;
        end)();
        return ;
    else
        local l_wrap_1 = coroutine.wrap;
        local v97 = false;
        l_wrap_1(function()
            while v92.isUpdateInProgress do
                wait();
            end;
            v92.isUpdateInProgress = true;
            if v97 then
                v43(v92);
            end;
            v55(v92, v97);
            if v97 then
                v92.props.PreviewContext:updatePreviewModel();
            end;
            v92.isUpdateInProgress = false;
        end)();
        return ;
    end;
end;
return v4.connect(function(v98, _)
    local l_previewStatus_0 = v98.previewStatus;
    local l_selectItem_0 = v98.selectItem;
    return {
        AttachmentPoint = l_selectItem_0.attachmentPoint, 
        AccessoryTypeInfo = l_selectItem_0.accessoryTypeInfo, 
        ItemSize = l_selectItem_0.size, 
        MeshScale = l_selectItem_0.meshScale, 
        SelectedAssets = l_previewStatus_0.selectedAssets, 
        EditingCage = l_selectItem_0.editingCage, 
        UserAddedAssets = l_previewStatus_0.userAddedAssets, 
        WorkspacePreviewSelectionEnabled = if not l_GetFFlagAFTSelectHandleOnly_0() then nil else l_previewStatus_0.workspacePreviewSelectionEnabled
    };
end, function(v102)
    return {
        UpdatePreviewAssetsSelected = function(v103, v104)
            v102(v17(v103, v104));
        end, 
        AddUserAddedAssetForPreview = function(v105, v106, v107)
            v102(v18(v105, v106, v107));
        end, 
        SelectPreviewTab = function(v108)
            v102(v16(v108));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    EditingItemContext = l_EditingItemContext_0, 
    PreviewContext = l_PreviewContext_0, 
    AssetServiceWrapper = l_AssetServiceWrapper_0, 
    Localization = l_ContextServices_0.Localization, 
    StudioServiceWrapper = l_StudioServiceWrapper_0
})(v25)));
