local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_UI_0 = v3.UI;
local l_Dialog_0 = l_UI_0.Dialog;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local v12 = require(l_script_FirstAncestor_0.Src.Constants);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetEnabled);
local v14 = require(l_script_FirstAncestor_0.Src.Actions.SetMode);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetScreen);
local v16 = require(l_script_FirstAncestor_0.Src.Actions.SetOwnershipTransferText);
local v17 = require(l_script_FirstAncestor_0.Src.Thunks.Export);
local v18 = require(l_script_FirstAncestor_0.Src.Components.Screens.SelectRigScreen);
local v19 = require(l_script_FirstAncestor_0.Src.Components.Screens.InputSurfaceAppearanceIdsScreen);
local v20 = require(l_script_FirstAncestor_0.Src.Components.Screens.InputAccessoryTypeScreen);
local v21 = require(l_script_FirstAncestor_0.Src.Components.Screens.InputAnimationIdScreen);
local v22 = require(l_script_FirstAncestor_0.Src.Components.Screens.ErrorScreen);
local v23 = require(l_script_FirstAncestor_0.Src.Components.Screens.OwnershipTransferScreen);
local v24 = require(l_script_FirstAncestor_0.Src.Util.getOwnershipTransferAssetIds);
local v25 = v1.PureComponent:extend("MainPlugin");
v25.init = function(v26)
    v26.onClose = function()
        v26.props.setEnabled(false);
    end;
end;
v25.renderButtons = function(v27, v28)
    local l_Localization_1 = v27.props.Localization;
    return {
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "head_button", 
            Title = l_Localization_1:getText("Plugin", "HeadButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function()
                v27.props.setEnabled(true);
                v27.props.setMode(v12.Modes.Head);
                v27.props.setScreen(v12.Screens.SelectRig);
            end
        }), 
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "accessory_button", 
            Title = l_Localization_1:getText("Plugin", "AccessoryButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function()
                v27.props.setEnabled(true);
                v27.props.setMode(v12.Modes.Accessory);
                v27.props.setScreen(v12.Screens.SelectRig);
            end
        }), 
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "mood_button", 
            Title = l_Localization_1:getText("Plugin", "MoodButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function()
                v27.props.setEnabled(true);
                v27.props.setMode(v12.Modes.Mood);
                v27.props.setScreen(v12.Screens.InputAnimationId);
            end
        }), 
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "export_button", 
            Title = l_Localization_1:getText("Plugin", "ExportButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function()
                v27.props.export(v27.props.Plugin:get());
            end
        }), 
        v1.createElement(l_PluginButton_0, {
            Toolbar = v28, 
            Active = false, 
            Id = "ownership_button", 
            Title = l_Localization_1:getText("Plugin", "OwnershipButton"), 
            Icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            ClickableWhenViewportHidden = true, 
            OnClick = function()
                v27.props.setEnabled(true);
                v27.props.setOwnershipTransferText(table.concat(v24(), "\n"));
                v27.props.setScreen(v12.Screens.OwnershipTransfer);
            end
        })
    };
end;
v25.render = function(v30)
    local l_props_0 = v30.props;
    local l_Localization_2 = l_props_0.Localization;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = l_Localization_2:getText("Plugin", "Toolbar"), 
            RenderButtons = function(v33)
                return v30:renderButtons(v33);
            end
        }), 
        MainWidget = not not l_props_0.enabled and v1.createElement(l_Dialog_0, {
            Enabled = l_props_0.enabled, 
            Modal = true, 
            Title = l_Localization_2:getText("Plugin", "Name"), 
            Resizable = false, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            Size = v12.WindowSize, 
            OnClose = v30.onClose, 
            [v1.Change.Enabled] = v30.onClose
        }, {
            SelectRigScreen = if l_props_0.screen == v12.Screens.SelectRig then v1.createElement(v18) else nil, 
            InputSurfaceAppearanceIdsScreen = if l_props_0.screen == v12.Screens.InputSurfaceAppearanceIds then v1.createElement(v19) else nil, 
            InputAccessoryTypeScreen = if l_props_0.screen == v12.Screens.InputAccessoryType then v1.createElement(v20) else nil, 
            InputAnimationIdScreen = if l_props_0.screen == v12.Screens.InputAnimationId then v1.createElement(v21) else nil, 
            ErrorScreen = if l_props_0.screen == v12.Screens.Error then v1.createElement(v22) else nil, 
            OwnershipTransferScreen = if l_props_0.screen == v12.Screens.OwnershipTransfer then v1.createElement(v23) else nil
        }) or nil
    });
end;
return v2.connect(function(v34, _)
    return {
        enabled = v34.PluginReducer.enabled, 
        screen = v34.PluginReducer.screen
    };
end, function(v36)
    return {
        setEnabled = function(v37)
            v36(v13(v37));
        end, 
        setMode = function(v38)
            v36(v14(v38));
        end, 
        setOwnershipTransferText = function(v39)
            v36(v16(v39));
        end, 
        setScreen = function(v40)
            v36(v15(v40));
        end, 
        export = function(v41)
            v36(v17(v41));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Plugin = l_Plugin_0
})(v25)));
