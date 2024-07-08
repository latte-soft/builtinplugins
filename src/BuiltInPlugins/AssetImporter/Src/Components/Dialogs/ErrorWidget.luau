local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_Dash_0 = v1.Dash;
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetShowError);
local v14 = v2.PureComponent:extend("ErrorWidget");
local function _(v15, v16)
    if v16 then
        local v17 = l_Dash_0.values(v16:GetStatuses());
        if #v17 >= 1 then
            return v15:getText("Error", v17[1].Type);
        else
            return v15:getText("Error", "DefaultNoStatus");
        end;
    else
        return "";
    end;
end;
v14.init = function(v19)
    v19.onClose = function()
        v19.props.SetShowError(false);
    end;
end;
v14.render = function(v20)
    local l_Localization_1 = v20.props.Localization;
    local l_props_0 = v20.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_ErrorWidget_0 = l_Stylizer_1.ErrorWidget;
    local l_createElement_0 = v2.createElement;
    local l_l_StyledDialog_0_0 = l_StyledDialog_0;
    local v27 = {
        Buttons = {
            {
                Key = "ok", 
                Text = l_Localization_1:getText("Error", "OK")
            }
        }, 
        Enabled = l_props_0.ShowError, 
        MinContentSize = Vector2.new(l_ErrorWidget_0.Width, l_ErrorWidget_0.Height), 
        Modal = true, 
        OnButtonPressed = v20.onClose, 
        OnClose = v20.onClose, 
        Resizable = false, 
        Style = "Alert", 
        Title = l_props_0.Title
    };
    local v28 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v31 = {
        Layout = Enum.FillDirection.Horizontal, 
        Size = UDim2.new(1, 0, 1, 0), 
        Spacing = l_ErrorWidget_0.IconSpacing
    };
    local v32 = {
        Image = v2.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = l_Stylizer_1.ErrorIcon.Image, 
            Size = UDim2.fromOffset(l_ErrorWidget_0.IconSize, l_ErrorWidget_0.IconSize), 
            LayoutOrder = 1
        })
    };
    local l_createElement_2 = v2.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v35 = {
        Layout = Enum.FillDirection.Vertical, 
        Size = UDim2.new(0.6, 0, 1, 0), 
        LayoutOrder = 2
    };
    local v36 = {
        Header = v2.createElement(l_TextLabel_0, {
            Text = l_Localization_1:getText("Error", "Header"), 
            TextSize = l_ErrorWidget_0.TextSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Size = UDim2.new(1, 0, 0.35, 0), 
            LayoutOrder = 1
        })
    };
    local l_createElement_3 = v2.createElement;
    local l_l_TextLabel_0_0 = l_TextLabel_0;
    local v39 = {};
    local l_AssetImportSession_0 = l_props_0.AssetImportSession;
    local v41;
    if l_AssetImportSession_0 then
        local v42 = l_Dash_0.values(l_AssetImportSession_0:GetStatuses());
        v41 = if #v42 >= 1 then l_Localization_1:getText("Error", v42[1].Type) else l_Localization_1:getText("Error", "DefaultNoStatus");
    else
        v41 = "";
    end;
    v39.Text = v41;
    v39.TextSize = l_ErrorWidget_0.SubtextSize;
    v39.TextXAlignment = Enum.TextXAlignment.Left;
    v39.Size = UDim2.new(1, 0, 0.35, 0);
    v39.LayoutOrder = 2;
    v36.SubtextSize = l_createElement_3(l_l_TextLabel_0_0, v39);
    v32.TextPane = l_createElement_2(l_l_Pane_0_1, v35, v36);
    v28.Content = l_createElement_1(l_l_Pane_0_0, v31, v32);
    return l_createElement_0(l_l_StyledDialog_0_0, v27, v28);
end;
return v3.connect(function(v43)
    return {
        ImportTree = v43.Preview.importTree, 
        AssetImportSession = v43.Preview.assetImportSession, 
        ImportDataCheckedCount = v43.Preview.importDataCheckedCount, 
        ErrorNodeChecked = v43.Preview.errorNodeChecked, 
        HasInvalidPackageId = v43.Preview.hasInvalidPackageId, 
        ShowError = v43.Dialogs.showError
    };
end, function(v44)
    return {
        SetShowError = function(v45)
            v44(v13(v45));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14)));
