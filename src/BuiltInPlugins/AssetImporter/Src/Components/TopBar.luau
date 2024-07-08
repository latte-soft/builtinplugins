local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local v12 = require(l_script_FirstAncestor_0.Src.Components.Presets.PresetMenu);
local v13 = require(l_script_FirstAncestor_0.Src.Components.Presets.PresetSelector);
local v14 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v15 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v16 = require(l_script_FirstAncestor_0.Src.Actions.SetCurrentPreset);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetSettingsChanged);
local v18 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateChecked);
local v19 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v21 = v1.PureComponent:extend("TopBar");
v21.init = function(v22)
    v22.onBrowse = function()
        v22.props.FileController:requestFilePicker();
    end;
end;
v21.render = function(v23)
    local l_props_0 = v23.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_TopBar_0 = l_props_0.Stylizer.TopBar;
    return v1.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = l_TopBar_0.Padding, 
        Size = l_props_0.Size, 
        Spacing = l_TopBar_0.Spacing
    }, {
        BrowseButton = v1.createElement(l_Button_0, {
            LayoutOrder = 1, 
            Size = l_TopBar_0.ButtonSize, 
            Style = "Round", 
            Text = l_Localization_1:getText("Plugin", "Browse"), 
            OnClick = v23.onBrowse
        }), 
        TextInput = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, -(((l_TopBar_0.ButtonSize.X.Offset + l_TopBar_0.MenuButtonSize.X.Offset) + l_TopBar_0.TemplateDropDown.X.Offset) + l_TopBar_0.Spacing * 3), 1, 0), 
            LayoutOrder = 2
        }, {
            FilePath = v1.createElement(l_TextInput_0, {
                AutomaticSize = Enum.AutomaticSize.None, 
                Disabled = true, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = l_props_0.FileName
            })
        }), 
        PresetDropdown = v1.createElement(v13, {
            LayoutOrder = 3, 
            ActiveQueueItem = if not v20() then nil else l_props_0.ActiveQueueItem, 
            Size = if not v20() then nil else l_TopBar_0.TemplateDropDown
        }), 
        PresetMenu = v1.createElement(v12, {
            LayoutOrder = 4
        })
    });
end;
return v2.connect(function(v27)
    return {
        ActiveQueueItem = if not v20() then nil else v27.Preview.activeQueueItem, 
        AssetImportSession = v27.Preview.assetImportSession, 
        CurrentPreset = if v20() then nil else v27.Preview.currentPreset, 
        SettingsChanged = v27.Preview.settingsChanged, 
        SelectedImportItem = v27.Preview.selectedImportItem, 
        Checked = v27.Preview.importDataChecked or {}
    };
end, function(v28)
    return {
        SetCurrentPreset = if v20() then nil else function(v29)
            v28(v16(v29));
        end, 
        SetSettingsChanged = function(v30)
            v28(v17(v30));
        end, 
        UpdateChecked = function(v31)
            v28(v18(v31));
        end, 
        UpdatePreviewInstance = function(v32)
            v28(v19(v32));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    PresetController = v14, 
    FileController = v15
})(v21)));
