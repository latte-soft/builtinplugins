local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_StyledDialog_0 = v3.UI.StyledDialog;
local l_UploadWidgets_0 = l_script_FirstAncestor_0.Src.Components.Dialogs.UploadWidgets;
local v10 = require(l_UploadWidgets_0.SuccessWidget);
local v11 = require(l_UploadWidgets_0.FailureWidget);
local v12 = require(l_UploadWidgets_0.UploadStatus);
local v13 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v14 = require(l_script_FirstAncestor_0.Src.Actions.SetShowProgress);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetUploading);
local v16 = v1.PureComponent:extend("ProgressWidget");
v16.init = function(v17)
    v17.state = {
        uploadResults = {}, 
        progressValue = 0, 
        errorMap = {}
    };
    v17.onClose = function()
        local l_props_0 = v17.props;
        l_props_0.SetShowProgress(false);
        l_props_0.FileController:DEPRECATED_cleanupPreview();
    end;
    v17.onButtonPressed = function(v19)
        if v19 == "Close" then
            v17.onClose();
        end;
    end;
    v17.onImportCompleted = function(v20)
        v17:setState({
            uploadResults = v20
        });
        v17.props.SetUploading(false);
    end;
    v17.getWidgetContent = function()
        local l_props_1 = v17.props;
        local l_state_0 = v17.state;
        if l_props_1.ShowProgress then
            if not l_props_1.Uploading then
                if not l_state_0.uploadResults.Succeeded then
                    if not (not (l_state_0.uploadResults.Succeeded ~= nil) or l_state_0.uploadResults.Succeeded) then
                        return v1.createElement(v11, {
                            LayoutOrder = 1, 
                            ErrorMap = l_state_0.uploadResults.ErrorMessages
                        });
                    end;
                else
                    return v1.createElement(v10, {
                        AddedToInventory = l_props_1.RootImportData.AddModelToInventory
                    });
                end;
            else
                return v1.createElement(v12, {
                    OnImportCompleted = v17.onImportCompleted
                });
            end;
        end;
        return nil;
    end;
end;
v16.render = function(v23)
    local l_props_2 = v23.props;
    local l_Localization_1 = l_props_2.Localization;
    local l_UploadWidget_0 = l_props_2.Stylizer.UploadWidget;
    return v1.createElement(l_StyledDialog_0, {
        Enabled = l_props_2.ShowProgress, 
        MinContentSize = Vector2.new(l_UploadWidget_0.Width, l_UploadWidget_0.Height), 
        Modal = false, 
        Resizable = true, 
        Title = l_props_2.Title, 
        Buttons = if not l_props_2.Uploading then {
            {
                Key = "Close", 
                Text = l_Localization_1:getText("Plugin", "Close")
            }
        } else {}, 
        OnClose = v23.onClose, 
        OnButtonPressed = v23.onButtonPressed, 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center
    }, {
        ContentInfo = v23.getWidgetContent()
    });
end;
return v2.connect(function(v27)
    return {
        RootImportData = v27.Preview.importTree, 
        ShowProgress = v27.Dialogs.showProgress, 
        Uploading = v27.Dialogs.uploading
    };
end, function(v28)
    return {
        SetShowProgress = function(v29)
            v28(v14(v29));
        end, 
        SetUploading = function(v30)
            v28(v15(v30));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    FileController = v13
})(v16)));
