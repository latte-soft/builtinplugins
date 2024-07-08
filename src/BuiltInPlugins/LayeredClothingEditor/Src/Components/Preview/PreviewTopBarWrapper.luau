local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Components_0 = v4.Components;
local l_ConfirmCancelDialog_0 = l_Components_0.ConfirmCancelDialog;
local l_ConfirmDialog_0 = l_Components_0.ConfirmDialog;
local l_PreviewTopBar_0 = l_Components_0.PreviewTopBar;
local l_AccessoryAndBodyToolShared_0 = v4.Util.AccessoryAndBodyToolShared;
local _ = l_AccessoryAndBodyToolShared_0.Constants;
local _ = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local l_PreviewFolderManager_0 = l_AccessoryAndBodyToolShared_0.PreviewFolderManager;
local v14 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v14.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v14.Util;
local _ = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local v20 = require(l_Parent_0.Src.Actions.SetSearchFilter);
local v21 = require(l_Parent_0.Src.Thunks.StartSelectingFromExplorer);
local v22 = require(l_Parent_0.Src.Thunks.FinishSelectingFromExplorer);
local v23 = require(l_Parent_0.Src.Thunks.DeleteUserAddedAssetForPreview);
local v24 = require(l_Parent_0.Src.Thunks.AddUserAddedAssetForPreview);
local l_EditingItemContext_0 = v4.Contexts.EditingItemContext;
local v26 = require(l_Parent_0.Src.Util.Constants);
local v27 = require(l_Parent_0.Src.Util.ShowDialog);
local v28 = v1.PureComponent:extend("PreviewTopBarWrapper");
l_Typecheck_0.wrap(v28, script);
v28.init = function(v29)
    v29.previewFolder = l_PreviewFolderManager_0.new();
    v29.onSearchRequested = function(v30)
        v29.props.SetSearchFilter(v30);
    end;
    v29.onClickAddNewInstance = function()
        local l_props_0 = v29.props;
        l_props_0.StartSelectingFromExplorer(v26.SELECTOR_MODE.Preview, (l_props_0.Localization:getText("Preview", "PanelBlockerAddItemWithEscape")));
    end;
    v29.getTabForInstance = function(v32)
        for v33, _ in pairs(l_PreviewConstantsInterface_0.getTabs()) do
            if v29.isInstanceValidForTab(v33, v32) then
                return v33;
            end;
        end;
    end;
    v29.isInstanceValidForTab = function(v35, v36)
        local v37 = v29.props.EditingItemContext:getItem();
        local v38 = l_PreviewConstantsInterface_0.getTabInfo(v35);
        if v38 and v38.IsSelectedInstanceValid(v36) then
            return not ((v36:FindFirstAncestor("LayeredClothingEditorPreview") ~= nil or v36 == v37) or v36 == v37.Parent);
        else
            return false;
        end;
    end;
    v29.isSelectedInstanceValid = function(v39)
        if not v29.getTabForInstance(v39) then
            if not v39:IsA("Folder") then
                return false;
            else
                return true;
            end;
        else
            return true;
        end;
    end;
    v29.onInstanceSelectorValidSelection = function(v40)
        local l_props_1 = v29.props;
        local l_FinishSelectingFromExplorer_0 = l_props_1.FinishSelectingFromExplorer;
        v27(l_props_1.Plugin, l_props_1.Localization, l_ConfirmCancelDialog_0, {
            Text = if not v40:IsA("Folder") then v29.props.Localization:getText("Preview", "ConfirmAddTile", {
                itemName = v40.Name
            }) else v29.props.Localization:getText("Preview", "ConfirmAddTiles", {
                itemName = v40.Name
            }), 
            OnClose = l_FinishSelectingFromExplorer_0, 
            OnConfirm = function()
                l_FinishSelectingFromExplorer_0(v40);
                local v43 = v29.getTabForInstance(v40);
                if not v43 then
                    if v40:IsA("Folder") then
                        v29.previewFolder:addFolderPath(v40);
                        v29.previewFolder:addDirtyFolders(v29.props.UserAddedAssets, v29.isInstanceValidForTab, v29.props.AddUserAddedAssetForPreview);
                    end;
                    return ;
                else
                    l_props_1.AddUserAddedAssetForPreview(v43, v40:Clone());
                    return ;
                end;
            end
        });
    end;
    v29.onInstanceSelectorInvalidSelection = function(_)
        local l_props_2 = v29.props;
        v27(l_props_2.Plugin, l_props_2.Localization, l_ConfirmDialog_0, {
            Text = l_props_2.Localization:getText("Preview", "InvalidAdd"), 
            OnClose = l_props_2.FinishSelectingFromExplorer
        });
    end;
end;
v28.render = function(v46)
    return v1.createElement(l_PreviewTopBar_0, {
        LayoutOrder = v46.props.layoutOrder, 
        OnSearchRequested = v46.onSearchRequested, 
        IsSelectedInstanceValid = v46.isSelectedInstanceValid, 
        OnClickAddNewInstance = v46.onClickAddNewInstance, 
        OnInstanceSelectorValidSelection = v46.onInstanceSelectorValidSelection, 
        OnInstanceSelectorInvalidSelection = v46.onInstanceSelectorInvalidSelection
    });
end;
v28.didMount = function(v47)
    local _ = v47.props;
    if not next(v47.props.UserAddedAssets) then
        v47.previewFolder:resetAllFoldersAttributes();
    end;
    v47.previewFolder:cleanDirtyFolders(v47.props.UserAddedAssets, v47.props.DeleteUserAddedAssetForPreview);
    v47.previewFolder:addDirtyFolders(v47.props.UserAddedAssets, v47.isInstanceValidForTab, v47.props.AddUserAddedAssetForPreview);
end;
return v2.connect(function(v49, _)
    return {
        UserAddedAssets = v49.previewStatus.userAddedAssets
    };
end, function(v51)
    return {
        SetSearchFilter = function(v52)
            v51(v20(v52));
        end, 
        StartSelectingFromExplorer = function(v53, v54)
            v51(v21(v53, v54));
        end, 
        FinishSelectingFromExplorer = function(_)
            v51(v22());
        end, 
        DeleteUserAddedAssetForPreview = function(v56, v57)
            v51(v23(v56, v57));
        end, 
        AddUserAddedAssetForPreview = function(v58, v59)
            v51(v24(v58, v59));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    EditingItemContext = l_EditingItemContext_0
})(v28)));
