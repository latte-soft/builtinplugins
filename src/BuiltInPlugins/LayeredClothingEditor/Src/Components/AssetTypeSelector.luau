local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Components_0 = v7.Components;
local _ = l_Components_0.FlowScreenLayout;
local l_RadioButtonListDropdown_0 = l_Components_0.RadioButtonListDropdown;
local l_AccessoryAndBodyToolShared_0 = v7.Util.AccessoryAndBodyToolShared;
local l_AssetTypeAttachmentInfo_0 = l_AccessoryAndBodyToolShared_0.AssetTypeAttachmentInfo;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local _ = l_AccessoryAndBodyToolShared_0.Constants;
local l_UI_0 = v4.UI;
local _ = l_UI_0.Pane;
local _ = l_UI_0.SelectInput;
local _ = l_UI_0.TextLabel;
local v19 = require(l_Parent_0.Src.Actions.SetAccessoryTypeInfo);
local v20 = require(l_Parent_0.Src.Actions.SetAttachmentPoint);
local v21 = require(l_Parent_0.Src.Util.findLocalizedStringKey);
local v22 = require(l_Parent_0.Src.Util.makeDropdownList);
local v23 = require(l_Parent_0.Src.Util.makeRadioButtonList);
local l_EditingItemContext_0 = v7.Contexts.EditingItemContext;
local l_Util_0 = v4.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local _ = l_Util_0.StyleModifier;
local v29 = v1.PureComponent:extend("AssetTypeSelector");
l_Typecheck_0.wrap(v29, script);
local function _(v30)
    return #v3.Dictionary.values(v30.Attachments) > 1;
end;
v29.getInitialRadioButtonListKey = function(v32)
    local l_AccessoryTypeInfo_0 = v32.props.AccessoryTypeInfo;
    if l_AccessoryTypeInfo_0 then
        local l_AssetType_0 = l_AccessoryTypeInfo_0.AssetType;
        if not l_AssetTypeAttachmentInfo_0.Accessory[l_AssetType_0] then
            if l_AssetTypeAttachmentInfo_0.Clothing[l_AssetType_0] then
                v32.initialRadioButtonListKey = "Clothing";
            end;
            return ;
        else
            v32.initialRadioButtonListKey = "Accessory";
            return ;
        end;
    else
        return ;
    end;
end;
v29.setInitialSelectionInfo = function(v35, v36, v37)
    local l_Localization_0 = v35.props.Localization;
    if #v3.Dictionary.values(v37.Attachments) > 1 then
        v35.attachmentListItems = v22(l_Localization_0, "AssetType", v37.Attachments);
        v35.initialMultiAttachmentAsset = {
            [v36] = v37
        };
    end;
end;
v29.initWithPreviousAssetTypeInfo = function(v39)
    local l_props_0 = v39.props;
    local l_AccessoryTypeInfo_1 = l_props_0.AccessoryTypeInfo;
    if l_AccessoryTypeInfo_1 then
        local l_AssetType_1 = l_AccessoryTypeInfo_1.AssetType;
        local v43 = l_props_0.Localization:getText("AssetType", l_AssetType_1);
        local v44 = l_AssetTypeAttachmentInfo_0.Accessory[l_AssetType_1];
        local v45 = l_AssetTypeAttachmentInfo_0.Clothing[l_AssetType_1];
        if not v44 then
            if v45 then
                v39:setInitialSelectionInfo(l_AssetType_1, v45);
                v39.initialSelectedClothingIndex = v3.List.find(v39.clothingItemList, v43);
            end;
        else
            v39:setInitialSelectionInfo(l_AssetType_1, v44);
            v39.initialSelectedAccessoryIndex = v3.List.find(v39.accessoryItemList, v43);
        end;
        if v39.attachmentListItems then
            v39.initialSelectedAttachmentIndex = v3.List.find(v39.attachmentListItems, (l_props_0.Localization:getText("AssetType", l_AccessoryTypeInfo_1.AssetSubType)));
        end;
        return ;
    else
        return ;
    end;
end;
v29.getAssetTypeDropdownProps = function(v46)
    local l_state_0 = v46.state;
    local v48 = {};
    local l_radioButtonListKey_0 = l_state_0.radioButtonListKey;
    local l_selectedAccessoryIndex_0 = l_state_0.selectedAccessoryIndex;
    local l_selectedClothingIndex_0 = l_state_0.selectedClothingIndex;
    if l_radioButtonListKey_0 == "Accessory" then
        v48.Items = v46.accessoryItemList;
        v48.OnItemActivated = v46.onClickAccessoryType;
        v48.SelectedIndex = l_selectedAccessoryIndex_0;
        return v48;
    else
        if l_radioButtonListKey_0 == "Clothing" then
            v48.Items = v46.clothingItemList;
            v48.OnItemActivated = v46.onClickClothingType;
            v48.SelectedIndex = l_selectedClothingIndex_0;
        end;
        return v48;
    end;
end;
v29.getAttachmentDropdownProps = function(v52)
    local l_state_1 = v52.state;
    local l_multiAttachmentAsset_0 = l_state_1.multiAttachmentAsset;
    local l_selectedAttachmentIndex_0 = l_state_1.selectedAttachmentIndex;
    local v56 = {};
    if l_multiAttachmentAsset_0 then
        local v57, v58 = next(l_multiAttachmentAsset_0);
        v56.SubListItems = v52.attachmentListItems;
        v56.OnSubListItemActivated = function(v59, v60)
            v52.onClickAttachment(v57, v59, v58);
            v52:setState({
                selectedAttachmentIndex = v60
            });
        end;
        v56.SubListSelectedIndex = l_selectedAttachmentIndex_0;
    end;
    return v56;
end;
v29.didMount = function(v61)
    local l_Localization_1 = v61.props.Localization;
    v61.accessoryItemList = v22(l_Localization_1, "AssetType", l_AssetTypeAttachmentInfo_0.Accessory);
    v61.clothingItemList = v22(l_Localization_1, "AssetType", l_AssetTypeAttachmentInfo_0.Clothing);
    v61:initWithPreviousAssetTypeInfo();
    v61:setState({
        multiAttachmentAsset = v61.initialMultiAttachmentAsset, 
        selectedAttachmentIndex = v61.initialSelectedAttachmentIndex, 
        selectedAccessoryIndex = v61.initialSelectedAccessoryIndex, 
        selectedClothingIndex = v61.initialSelectedClothingIndex
    });
end;
v29.init = function(v63)
    v63:getInitialRadioButtonListKey();
    v63.state = {
        multiAttachmentAsset = nil, 
        radioButtonListKey = v63.initialRadioButtonListKey, 
        selectedAttachmentIndex = nil, 
        selectedAccessoryIndex = nil, 
        selectedClothingIndex = nil
    };
    v63.onRadioButtonClick = function(v64)
        local l_state_2 = v63.state;
        local l_selectedAccessoryIndex_1 = l_state_2.selectedAccessoryIndex;
        local l_selectedClothingIndex_1 = l_state_2.selectedClothingIndex;
        v63:setState({
            radioButtonListKey = v64 or v1.None, 
            multiAttachmentAsset = v1.None
        });
        if not (v64 == "Accessory") or not l_selectedAccessoryIndex_1 then
            if not (not (v64 == "Clothing") or not l_selectedClothingIndex_1) then
                v63.onClickClothingType(v63.clothingItemList[l_selectedClothingIndex_1], l_selectedClothingIndex_1);
            end;
            return ;
        else
            v63.onClickAccessoryType(v63.accessoryItemList[l_selectedAccessoryIndex_1], l_selectedAccessoryIndex_1);
            return ;
        end;
    end;
    v63.setAttachment = function(v68, v69, v70)
        if v69 then
            local v71 = v63.props.EditingItemContext:getItem();
            if v71 then
                local v72 = v70[v69];
                v63.props.SetAccessoryTypeInfo(v3.Dictionary.join(v72, {
                    AssetType = v68, 
                    AssetSubType = v69
                }));
                local v73 = l_AccessoryUtil_0:getExistingAttachmentPoint(v71, v71.Parent, v72.Name);
                if v73 then
                    v63.props.SetAttachmentPoint(v73);
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v63.onClickAttachment = function(v74, v75, v76)
        local l_props_1 = v63.props;
        if v76 then
            v63.setAttachment(v74, v21(l_props_1.Localization, "AssetType", v75, v76.Attachments), v76.Attachments);
            return ;
        else
            return ;
        end;
    end;
    v63.onClickAssetType = function(v78, v79)
        local l_props_2 = v63.props;
        local l_state_3 = v63.state;
        local l_Localization_2 = l_props_2.Localization;
        if v78 and v79 then
            local v83 = v79[v78];
            if #v3.Dictionary.values(v83.Attachments) > 1 then
                local l_selectedAttachmentIndex_1 = l_state_3.selectedAttachmentIndex;
                v63.attachmentListItems = v22(l_Localization_2, "AssetType", v83.Attachments);
                v63:setState({
                    multiAttachmentAsset = {
                        [v78] = v83
                    }
                });
                if l_selectedAttachmentIndex_1 then
                    v63.onClickAttachment(v78, v63.attachmentListItems[l_selectedAttachmentIndex_1], v83);
                end;
                return ;
            else
                v63.setAttachment(v78, next(v83.Attachments), v83.Attachments);
                v63:setState({
                    multiAttachmentAsset = v1.None
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v63.onClickAccessoryType = function(v85, v86)
        v63.onClickAssetType(v21(v63.props.Localization, "AssetType", v85, l_AssetTypeAttachmentInfo_0.Accessory), l_AssetTypeAttachmentInfo_0.Accessory);
        v63:setState({
            selectedAccessoryIndex = v86
        });
    end;
    v63.onClickClothingType = function(v87, v88)
        v63.onClickAssetType(v21(v63.props.Localization, "AssetType", v87, l_AssetTypeAttachmentInfo_0.Clothing), l_AssetTypeAttachmentInfo_0.Clothing);
        v63:setState({
            selectedClothingIndex = v88
        });
    end;
end;
v29.render = function(v89)
    local l_props_3 = v89.props;
    local l_state_4 = v89.state;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_Localization_3 = l_props_3.Localization;
    local l_radioButtonListKey_1 = l_state_4.radioButtonListKey;
    local _ = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_RadioButtonListDropdown_0, (v3.Dictionary.join({
        LayoutOrder = l_LayoutOrder_0, 
        Buttons = v23(l_Localization_3, "AssetType", l_AssetTypeAttachmentInfo_0), 
        OnRadioButtonClick = v89.onRadioButtonClick, 
        InitialSelectedKey = l_radioButtonListKey_1
    }, v89:getAssetTypeDropdownProps(), (v89:getAttachmentDropdownProps()))));
end;
return v2.connect(function(v96, _)
    return {
        AccessoryTypeInfo = v96.selectItem.accessoryTypeInfo
    };
end, function(v98)
    return {
        SetAccessoryTypeInfo = function(v99)
            v98(v19(v99));
        end, 
        SetAttachmentPoint = function(v100)
            v98(v20(v100));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0
})(v29)));
