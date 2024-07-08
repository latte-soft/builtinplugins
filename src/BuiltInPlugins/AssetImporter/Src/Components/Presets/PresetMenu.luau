local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_UI_0 = v1.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local v14 = require(l_script_FirstAncestor_0.Src.Components.Dialogs.PresetNamePrompt);
local v15 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v17 = v2.PureComponent:extend("PresetMenu");
v17.init = function(v18)
    local l_Localization_1 = v18.props.Localization;
    local v20 = l_Localization_1:getText("Templates", "Reset");
    local v21 = l_Localization_1:getText("Templates", "Rename");
    local v22 = l_Localization_1:getText("Templates", "Delete");
    local v23 = l_Localization_1:getText("Templates", "SaveChanges");
    local v24 = l_Localization_1:getText("Templates", "SaveNewPreset");
    local v25 = l_Localization_1:getText("Templates", "SetAsDefault");
    v18.dropdownItems = {
        v20, 
        v23, 
        v24, 
        v25, 
        v21, 
        v22
    };
    v18.state = {
        isFocused = not not v16() and nil, 
        isHovered = not not v16() and nil, 
        showNameDialog = false, 
        promptIntent = 0
    };
    if not v16() then
        v18.focused = function()
            v18:setState({
                isFocused = true
            });
        end;
        v18.unfocused = function()
            v18:setState({
                isFocused = false
            });
        end;
        v18.onHoveredItemChanged = function(_)
            v18:setState({
                isHovered = true
            });
        end;
    end;
    v18.onItemActivated = function(v27, _)
        local l_props_0 = v18.props;
        local v30 = if not v16() then l_props_0.CurrentPreset else l_props_0.ActiveQueueItem.currentPreset;
        local l_PresetController_0 = l_props_0.PresetController;
        if v27 == v20 then
            if not v16() then
                l_PresetController_0:DEPRECATED_resolvePreset(v30);
                return ;
            else
                l_PresetController_0:resolvePreset(v30, l_props_0.ActiveQueueItem);
                return ;
            end;
        elseif v27 == v21 then
            v18:setState({
                showNameDialog = true, 
                promptIntent = "Rename"
            });
            return ;
        elseif v27 == v22 then
            l_props_0.PresetController:delete(v30);
            return ;
        elseif v27 == v23 then
            l_PresetController_0:save(v30);
            return ;
        elseif v27 == v24 then
            v18:setState({
                showNameDialog = true, 
                promptIntent = "Create"
            });
            return ;
        else
            if v27 == v25 then
                l_props_0.PresetController:setDefault(v30);
            end;
            return ;
        end;
    end;
    v18.isItemEnabled = function(v32)
        local l_props_1 = v18.props;
        local v34 = if not v16() then l_props_1.CurrentPreset else l_props_1.ActiveQueueItem.currentPreset;
        local v35 = l_props_1.PresetController:isStudioDefault(v34);
        local v36 = l_props_1.PresetController:isLastImport(v34);
        local v37 = l_props_1.PresetController:isDefault(v34);
        local v38 = not v35 and not v36;
        if v32 == v20 then
            return l_props_1.SettingsChanged;
        elseif v32 == v21 then
            return v38;
        elseif v32 == v22 then
            return v38;
        elseif v32 == v23 then
            return l_props_1.SettingsChanged and v38;
        elseif v32 == v24 then
            return not v35 or l_props_1.SettingsChanged;
        elseif v32 == v25 then
            return not v37;
        else
            return false;
        end;
    end;
    v18.onRenderItem = function(v39, v40, v41, v42)
        local l_TopBar_0 = v18.props.Stylizer.TopBar;
        local v44 = if v18.isItemEnabled(v39) then if v42 then l_StyleModifier_0.Hover else nil else l_StyleModifier_0.Disabled;
        return v2.createElement(l_Button_0, {
            LayoutOrder = v40, 
            OnClick = v41, 
            OnMouseEnter = if v16() then nil else function()
                v18.onHoveredItemChanged(v40);
            end, 
            Size = l_TopBar_0.MenuItemSize, 
            StyleModifier = v44, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            TextLabel = v2.createElement(l_TextLabel_0, {
                Text = v39, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.fromScale(1, 1), 
                StyleModifier = v44, 
                AutomaticSize = Enum.AutomaticSize.X
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_TopBar_0.Padding.Left), 
                    PaddingRight = UDim.new(0, l_TopBar_0.Padding.Right)
                })
            })
        });
    end;
    v18.onNameDialogClose = function()
        v18:setState({
            showNameDialog = false
        });
    end;
    v18.onNameDialogButtonPressed = function(v45, v46)
        local l_PresetController_1 = v18.props.PresetController;
        if v45 == "Save" then
            if v18.state.promptIntent == "Create" then
                l_PresetController_1:save(v46);
            elseif v18.state.promptIntent == "Rename" then
                if not v16() then
                    l_PresetController_1:DEPRECATED_rename(v46);
                else
                    l_PresetController_1:rename(v46, v18.props.ActiveQueueItem.currentPreset);
                end;
            end;
        end;
        v18:setState({
            showNameDialog = false
        });
    end;
end;
v17.render = function(v48)
    local l_props_2 = v48.props;
    local l_state_0 = v48.state;
    local l_TopBar_1 = l_props_2.Stylizer.TopBar;
    return v2.createElement(l_Pane_0, {
        Size = l_TopBar_1.MenuButtonSize, 
        LayoutOrder = l_props_2.LayoutOrder
    }, {
        PresetMenu = v2.createElement(l_SelectInput_0, {
            Items = v48.dropdownItems, 
            HideText = true, 
            OnItemActivated = v48.onItemActivated, 
            OnRenderItem = v48.onRenderItem, 
            OnMouseEnter = v48.focused, 
            OnMouseLeave = v48.unfocused, 
            Size = UDim2.new(1, 0, 1, 0), 
            ExpandIcon = l_TopBar_1.MenuImage, 
            ShowSelection = false, 
            UseAutoWidth = true
        }), 
        PresetNamePrompt = if not l_state_0.showNameDialog then nil else v2.createElement(v14, {
            CurrentPreset = if not v16() then v48.props.CurrentPreset else l_props_2.ActiveQueueItem.currentPreset, 
            Intent = l_state_0.promptIntent, 
            IsHintError = false, 
            OnClose = v48.onNameDialogClose, 
            OnButtonPressed = v48.onNameDialogButtonPressed
        })
    });
end;
return v3.connect(function(v52)
    return {
        ActiveQueueItem = if not v16() then nil else v52.Preview.activeQueueItem, 
        AssetImportSession = if not v16() then nil else v52.Preview.assetImportSession, 
        CurrentPreset = if not v16() then v52.Preview.currentPreset else nil, 
        SettingsChanged = v52.Preview.settingsChanged
    };
end, nil)((l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0, 
    PresetController = v15
})(v17)));
