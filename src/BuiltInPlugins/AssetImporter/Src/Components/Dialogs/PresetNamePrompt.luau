local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local v13 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFIntAssetImportMaxPresetNameLength);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFIntAssetImportMaxPresetCount);
local v16 = v2.PureComponent:extend("PresetNamePrompt");
v16.init = function(v17)
    v17.state = {
        currentText = v17:_getInitialPresetName(), 
        title = ""
    };
    v17.onTextChanged = function(v18)
        v17:setState({
            currentText = v18
        });
    end;
    v17.onButtonPressed = function(v19)
        v17.props.OnButtonPressed(v19, v17.state.currentText);
    end;
end;
v16._getInitialPresetName = function(v20)
    local l_props_0 = v20.props;
    if l_props_0.Intent == "Rename" then
        return l_props_0.CurrentPreset;
    else
        local v22 = l_props_0.PresetController:getAllPresets();
        local v23 = l_props_0.Localization:getText("Templates", "NewPreset");
        if v22[v23] == nil then
            return v23;
        else
            for v24 = 1, v15() + 1 do
                local v25 = ("%* %*"):format(v23, v24);
                if v22[v25] == nil then
                    return v25;
                end;
            end;
            return ;
        end;
    end;
end;
v16._createMessage = function(v26)
    local l_props_1 = v26.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_PresetController_0 = l_props_1.PresetController;
    local l_PresetNamePrompt_0 = l_props_1.Stylizer.PresetNamePrompt;
    local v31 = (l_PresetNamePrompt_0.LabelSize.X.Offset + l_PresetNamePrompt_0.TextboxSize.X.Offset) + l_PresetNamePrompt_0.Padding;
    local l_currentText_0 = v26.state.currentText;
    local v33 = l_PresetController_0:getNumPresetsRemaining();
    local v34 = l_props_1.Intent == "Create";
    local v35 = v33 <= 0;
    local v36 = l_PresetController_0:isLastImport(l_currentText_0) or l_PresetController_0:isStudioDefault(l_currentText_0);
    local v37 = false;
    if l_PresetController_0:getAllPresets()[l_currentText_0] ~= nil then
        v37 = v34 or l_currentText_0 ~= l_props_1.CurrentPreset;
    end;
    local v38 = "";
    local v39 = false;
    local v40 = false;
    if not v36 then
        if not v37 then
            if not v35 or not v34 then
                if v34 then
                    v38 = l_Localization_1:getText("Templates", "PresetsRemaining1", {
                        presetsRemaining = tostring(v33)
                    });
                end;
            else
                v38 = l_Localization_1:getText("Templates", "TooManyPresets");
                v39 = true;
            end;
        else
            v38 = l_Localization_1:getText("Templates", "PresetNameOverwriteWarning");
            v40 = true;
        end;
    else
        v38 = l_Localization_1:getText("Templates", "OverwritingReservedName");
        v39 = true;
    end;
    local v41 = nil;
    if not v39 then
        if v40 then
            v41 = "Warning";
        end;
    else
        v41 = "Error";
    end;
    return v2.createElement(l_TextLabel_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(0, v31, 0, 0), 
        Text = v38, 
        Style = v41, 
        LayoutOrder = 2, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    });
end;
v16.render = function(v42)
    local l_props_2 = v42.props;
    local l_Localization_2 = l_props_2.Localization;
    local l_PresetController_1 = l_props_2.PresetController;
    local l_PresetNamePrompt_1 = l_props_2.Stylizer.PresetNamePrompt;
    local l_RenameMinContentSize_0 = l_PresetNamePrompt_1.RenameMinContentSize;
    local l_Intent_0 = l_props_2.Intent;
    local v49 = if l_Intent_0 == "Create" then l_Localization_2:getText("Templates", "WindowTitleNewPreset") else if l_Intent_0 == "Rename" then l_Localization_2:getText("Templates", "WindowTitleRenamePreset") else nil;
    local l_currentText_1 = v42.state.currentText;
    local v51 = l_PresetController_1:getNumPresetsRemaining() <= 0;
    local v52 = l_PresetController_1:getAllPresets()[l_currentText_1] ~= nil;
    local v53 = false;
    if l_Intent_0 == "Create" then
        v53 = v51;
    end;
    if not ((not (l_Intent_0 == "Create") or not v51) or not v52) then
        v53 = false;
    end;
    if not (not l_PresetController_1:isLastImport(l_currentText_1) and not l_PresetController_1:isStudioDefault(l_currentText_1)) then
        v53 = true;
    end;
    if not (v14() >= utf8.len(l_currentText_1)) or utf8.len(l_currentText_1) < 1 then
        v53 = true;
    end;
    return v2.createElement(l_StyledDialog_0, {
        Title = v49, 
        MinContentSize = l_RenameMinContentSize_0, 
        Buttons = {
            {
                Key = "Cancel", 
                Text = l_Localization_2:getText("Plugin", "Cancel")
            }, 
            {
                Key = "Save", 
                Text = l_Localization_2:getText("Plugin", "Save"), 
                StyleModifier = if not v53 then nil else l_StyleModifier_0.Disabled
            }
        }, 
        OnButtonPressed = v42.onButtonPressed, 
        OnClose = l_props_2.OnClose, 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Modal = true
    }, {
        Pane = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Spacing = l_PresetNamePrompt_1.Padding, 
            Size = UDim2.fromScale(1, 1)
        }, {
            TextBox = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Size = l_PresetNamePrompt_1.TextboxSize, 
                LayoutOrder = 1, 
                Spacing = l_PresetNamePrompt_1.Padding
            }, {
                Label = v2.createElement(l_TextLabel_0, {
                    Text = v42.props.Localization:getText("Properties", "ImportName"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Size = l_PresetNamePrompt_1.LabelSize, 
                    LayoutOrder = 1
                }), 
                Input = v2.createElement(l_TextInput_0, {
                    Text = v42.state.currentText, 
                    MaxLength = v14(), 
                    LayoutOrder = 2, 
                    OnTextChanged = v42.onTextChanged, 
                    Size = l_PresetNamePrompt_1.TextboxSize
                })
            }), 
            Message = v42:_createMessage()
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0, 
    PresetController = v13
})(v16));
