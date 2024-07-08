local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local v1 = require(l_script_FirstAncestor_0.Src.Util.applyToSelectionByIdentifier);
local v2 = require(l_script_FirstAncestor_0.Src.Util.isMaterialVariantByIdentifier);
local v3 = require(l_script_FirstAncestor_0.Src.Constants.MATERIAL_VARIANT_APPEARANCE_PROPERTIES);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v6 = require(l_script_FirstAncestor_0.Packages.React);
local v7 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_UI_0 = v4.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_Popup_0 = l_UI_0.Popup;
local l_ContextServices_0 = v4.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local l_StudioServices_0 = v5.Context.StudioServices;
local l_ViewType_0 = v5.Enums.ViewType;
local l_parseMaterial_0 = v5.Util.parseMaterial;
local l_getSerializedMaterialIdentifier_0 = v5.Util.getSerializedMaterialIdentifier;
local v19 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v20 = require(l_script_FirstAncestor_0.Src.Resources.createAnalyticsHandlers);
local v21 = require(l_script_FirstAncestor_0.Src.Resources.createThemeTable);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDropdownIconCanOpenPlugin);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialActionAsTool);
local v26 = require(l_script_FirstAncestor_0.Src.Components.MainView);
local v27 = v6.PureComponent:extend("MainPlugin");
local v28 = string.format("rbxasset://textures/MaterialFramework/%s/Material.png", "Light");
local v29 = string.format("rbxasset://textures/MaterialFramework/%s/Material.png", "Dark");
local function _()
    if settings().Studio.Theme.Name == "Light" then
        return v28;
    else
        return v29;
    end;
end;
v27.init = function(v31, _)
    v31.pluginButtonRef = v6.createRef();
    v31.savedFilterChips = {
        recents = false, 
        appliedInPlace = false, 
        customMaterials = false
    };
    v31.savedListCanvasPosition = Vector2.new(0, 0);
    v31.savedGridCanvasPosition = Vector2.new(0, 0);
    v31.selectedMaterialConnection = nil;
    v31:setState({
        enabled = false, 
        viewType = l_ViewType_0.Grid, 
        selectedMaterialIdentifier = if not v24() then Enum.Material.Plastic.Name else nil, 
        isMaterialFillToolEnabled = if not v25() then nil else false
    });
    v31.toggleEnabled = function()
        if not v31.state.enabled then
            v31.analytics:report("PopupOpened");
        end;
        v31:setState(function(v33)
            return {
                enabled = not v33.enabled
            };
        end);
    end;
    v31.openPopup = function(v34)
        v31:setState({
            enabled = v34
        });
        v31.analytics:report("PopupOpened");
    end;
    v31.setButtonIcon = function(v35)
        v31.pluginButtonRef:getValue().button.Icon = v35;
    end;
    v31.DEPRECATED_setSelectedMaterial = function(v36)
        v31:setState({
            selectedMaterialIdentifier = v36
        });
    end;
    v31.setSelectedMaterial = function(v37)
        local v38, v39 = l_parseMaterial_0(v37);
        local v40 = l_getSerializedMaterialIdentifier_0(v37);
        local v41 = v31.studioServices:getService("MaterialService");
        v31:setState({
            selectedMaterialIdentifier = v40
        });
        if v31.selectedMaterialConnection then
            v31.selectedMaterialConnection:Disconnect();
        end;
        if not v39 then
            v31.selectedMaterialConnection = v41:GetMaterialOverrideChanged(v37):Connect(function()
                v31.clearSelectedMaterial();
            end);
            return ;
        else
            v31.selectedMaterialConnection = v37.Changed:Connect(function(v42)
                if not (v41:getMaterialVariant(v38, (tostring(v39))) and not v3[v42]) then
                    v31.clearSelectedMaterial();
                end;
            end);
            return ;
        end;
    end;
    v31.clearSelectedMaterial = function()
        if v31.selectedMaterialConnection then
            v31.selectedMaterialConnection:Disconnect();
            v31.selectedMaterialConnection = nil;
        end;
        v31.state.selectedMaterialIdentifier = nil;
        v31.setButtonIcon(if settings().Studio.Theme.Name == "Light" then v28 else v29);
    end;
    v31.onClose = function()
        v31:setState({
            enabled = false
        });
    end;
    v31.onWidgetEnabledChanged = function(v43)
        v31:setState({
            enabled = v43.Enabled
        });
    end;
    v31.setViewType = function(v44)
        v31:setState({
            viewType = v44
        });
    end;
    v31.onFilterChipsUpdate = function(v45)
        v31.savedFilterChips = v45;
    end;
    v31.createOnScrollUpdate = function(v46)
        return function(v47)
            if v46 == l_ViewType_0.List then
                v31.savedListCanvasPosition = v47;
                return ;
            else
                if v46 == l_ViewType_0.Grid then
                    v31.savedGridCanvasPosition = v47;
                end;
                return ;
            end;
        end;
    end;
    v31.store = v7.Store.new(v19, nil, {
        v7.thunkMiddleware
    }, nil);
    v31.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "MaterialPicker", 
        libraries = {
            [v5.Resources.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = v5.Resources.SourceStrings, 
                translationResourceTable = v5.Resources.LocalizedStrings
            }
        }
    });
    v31.analytics = l_ContextServices_0.Analytics.new(v20);
    v31.studioServices = l_StudioServices_0.new();
    if v24() then
        v31.themeChangedConnection = settings().Studio.ThemeChanged:Connect(function()
            if v31.state.selectedMaterialIdentifier == nil then
                v31.setButtonIcon(if settings().Studio.Theme.Name == "Light" then v28 else v29);
            end;
        end);
    end;
    if v25() then
        v31.materialActionAsToolConnection = v31.studioServices:getService("MaterialService").MaterialFillToolEnabledChanged:Connect(function(v48)
            v31:setState({
                isMaterialFillToolEnabled = v48
            });
        end);
    end;
    v31.themeTable = v21();
end;
v27.willUnmount = function(v49)
    if v24() then
        v49.themeChangedConnection:Disconnect();
        if v49.selectedMaterialConnection then
            v49.selectedMaterialConnection:Disconnect();
            v49.selectedMaterialConnection = nil;
        end;
    end;
    if v25() then
        v49.materialActionAsToolConnection:Disconnect();
    end;
end;
v27.renderButtons = function(v50, v51)
    local l_enabled_0 = v50.state.enabled;
    local v53 = v50.studioServices:getService("Selection");
    local v54 = v50.studioServices:getService("ChangeHistoryService");
    return {
        Toggle = v6.createElement(l_PluginButton_0, {
            Toolbar = v51, 
            Active = if not v25() then l_enabled_0 else l_enabled_0 or v50.state.isMaterialFillToolEnabled, 
            DropdownActive = if not v25() then nil else l_enabled_0, 
            Id = "MaterialPicker", 
            Title = v50.localization:getText("Plugin", "Button"), 
            Tooltip = v50.localization:getText("Plugin", "Description"), 
            Icon = not v24() and "rbxasset://textures/MaterialFramework/PlasticWithBorder.png" or if settings().Studio.Theme.Name == "Light" then v28 else v29, 
            OnClick = function()
                if v25() then
                    local v55 = v50.studioServices:getService("MaterialService");
                    if v55:GetIsMaterialActionAsToolEnabled() then
                        v55:ToggleMaterialFillToolEnabled();
                        v50:setState({
                            isMaterialFillToolEnabled = not v50.state.isMaterialFillToolEnabled
                        });
                        return ;
                    end;
                end;
                if not v24() then
                    v50.pluginButtonRef:getValue().button:SetActive(true);
                    local l_selectedMaterialIdentifier_0 = v50.state.selectedMaterialIdentifier;
                    v1(l_selectedMaterialIdentifier_0, v53);
                    v54:SetWaypoint((("Applied %* Material to Selection"):format(l_selectedMaterialIdentifier_0)));
                    local v57 = #v53:Get();
                    if v57 > 0 then
                        v50.analytics:report("MaterialApplied", "IconButton", v57, l_selectedMaterialIdentifier_0, not v2(l_selectedMaterialIdentifier_0) and "BaseMaterial" or "MaterialVariant");
                    end;
                elseif v50.state.selectedMaterialIdentifier == nil then
                    v50.openPopup(true);
                    return ;
                else
                    v50.pluginButtonRef:getValue().button:SetActive(true);
                    local l_selectedMaterialIdentifier_1 = v50.state.selectedMaterialIdentifier;
                    v1(l_selectedMaterialIdentifier_1, v53);
                    v54:SetWaypoint((("Applied %* Material to Selection"):format(l_selectedMaterialIdentifier_1)));
                    local v59 = #v53:Get();
                    if v59 > 0 then
                        v50.analytics:report("MaterialApplied", "IconButton", v59, l_selectedMaterialIdentifier_1, not v2(l_selectedMaterialIdentifier_1) and "BaseMaterial" or "MaterialVariant");
                        return ;
                    end;
                end;
            end, 
            OnDropdownClick = v50.toggleEnabled, 
            ButtonType = "Dropdown", 
            ClickableWhenViewportHidden = false, 
            ref = v50.pluginButtonRef
        })
    };
end;
v27.renderPopup = function(v60, v61)
    local v62 = v60.pluginButtonRef:getValue();
    assert(v62, "PluginButton not initialized");
    return v6.createElement(l_Popup_0, {
        CreateWidgetImmediately = false, 
        Enabled = v60.state.enabled, 
        Modal = false, 
        Title = v60.localization:getText("Plugin", "Title"), 
        Size = v60.themeTable.Popup.Size, 
        OnClose = v60.onClose, 
        PopupTarget = v62.button
    }, {
        MainView = v6.createElement(v26, {
            plugin = v61, 
            onClose = v60.onClose, 
            onFilterChipsUpdate = v60.onFilterChipsUpdate, 
            onMaterialSelected = if not v24() then v60.DEPRECATED_setSelectedMaterial else v60.setSelectedMaterial, 
            onScrollUpdate = v60.createOnScrollUpdate(v60.state.viewType), 
            onSnapshotTaken = function(v63)
                v60.setButtonIcon(v63);
                v60.onClose();
            end, 
            savedFilterChips = v60.savedFilterChips, 
            savedListCanvasPosition = v60.savedListCanvasPosition, 
            savedGridCanvasPosition = v60.savedGridCanvasPosition, 
            setViewType = v60.setViewType, 
            selectedMaterialIdentifier = v60.state.selectedMaterialIdentifier, 
            viewType = v60.state.viewType
        })
    });
end;
v27.render = function(v64)
    local l_props_0 = v64.props;
    local l_state_0 = v64.state;
    local l_Plugin_0 = l_props_0.Plugin;
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(l_Plugin_0), 
        l_Store_0.new(v64.store), 
        l_Mouse_0.new(l_Plugin_0:getMouse()), 
        v64.themeTable.createTheme(), 
        v64.localization, 
        v64.analytics, 
        v64.studioServices
    }, {
        Toolbar = v6.createElement(l_PluginToolbar_0, {
            Title = "Edit", 
            RenderButtons = function(v68)
                return v64:renderButtons(v68);
            end
        }), 
        Popup = if not l_state_0.enabled then nil else v64:renderPopup(l_Plugin_0)
    });
end;
return v27;
