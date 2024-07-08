local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local l_UI_0 = v3.UI;
local l_Separator_0 = l_UI_0.Separator;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local v12 = require(l_script_FirstAncestor_0.Src.Components.AssetImporterUI);
local v13 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v14 = require(l_script_FirstAncestor_0.Src.Controllers.QueueController);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.ClosePreview);
local v16 = require(l_script_FirstAncestor_0.Src.Actions.SetUploading);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v18 = v1.PureComponent:extend("MeshImportDialog");
local function _(v19)
    local v20 = not v19.HasInvalidPackageId;
    if v20 then
        v20 = false;
        if v19.ImportDataCheckedCount ~= 0 then
            v20 = not v19.ErrorNodeChecked;
        end;
    end;
    return v20;
end;
v18.init = function(v22)
    v22.onClose = function()
        v22.props.ClosePreview();
    end;
    v22.onImport = function()
        local l_props_0 = v22.props;
        local v24 = l_props_0.SessionQueue[l_props_0.Filename];
        l_props_0.ClosePreview();
        l_props_0.SetUploading(true);
        l_props_0.QueueController:uploadItem(v24);
        l_props_0.SetUploading(false);
    end;
    v22.onButtonPressed = function(v25)
        if not v17() then
            local l_props_1 = v22.props;
            if v25 == "Cancel" then
                l_props_1.FileController:DEPRECATED_onSessionCanceled(l_props_1.AssetImportSession);
                return ;
            elseif v25 == "Import" then
                local v27 = not l_props_1.HasInvalidPackageId;
                if v27 then
                    v27 = false;
                    if l_props_1.ImportDataCheckedCount ~= 0 then
                        v27 = not l_props_1.ErrorNodeChecked;
                    end;
                end;
                if v27 then
                    l_props_1.FileController:DEPRECATED_onImport(l_props_1.AssetImportSession);
                end;
            end;
        elseif v25 == "Close" then
            v22.onClose();
            return ;
        elseif v25 == "Import" then
            v22.onImport();
            return ;
        end;
    end;
end;
v18.render = function(v28)
    local l_props_2 = v28.props;
    local l_Localization_1 = l_props_2.Localization;
    local v31 = not l_props_2.HasInvalidPackageId;
    if v31 then
        v31 = false;
        if l_props_2.ImportDataCheckedCount ~= 0 then
            v31 = not l_props_2.ErrorNodeChecked;
        end;
    end;
    local v32 = nil;
    v32 = if not v17() then {
        {
            Key = "Cancel", 
            Text = l_Localization_1:getText("Plugin", "Cancel")
        }, 
        {
            Key = "Import", 
            Text = l_Localization_1:getText("Plugin", "Import"), 
            Style = "RoundPrimary", 
            StyleModifier = not v31 and l_StyleModifier_0.Disabled or nil
        }
    } else {
        {
            Key = "Close", 
            Text = l_Localization_1:getText("Plugin", "Close")
        }, 
        {
            Key = "Import", 
            Text = l_Localization_1:getText("Plugin", "Import"), 
            Style = "RoundPrimary", 
            StyleModifier = not v31 and l_StyleModifier_0.Disabled or nil
        }
    };
    local _ = nil;
    return v1.createElement(l_StyledDialog_0, {
        Enabled = l_props_2.ShowPreview, 
        MinContentSize = Vector2.new(800, 650), 
        Modal = false, 
        Resizable = true, 
        Title = l_props_2.Title, 
        Buttons = v32, 
        OnClose = not v17() and function()
            l_props_2.FileController:DEPRECATED_onSessionCanceled(l_props_2.AssetImportSession);
        end or v28.onClose, 
        OnButtonPressed = v28.onButtonPressed, 
        Style = "FullBleed"
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical
        }), 
        AssetImporterUI = if not l_props_2.ShowPreview then nil else v1.createElement(v12, {
            LayoutOrder = 1
        }), 
        Separator = v1.createElement(l_Separator_0, {
            DominantAxis = Enum.DominantAxis.Width, 
            LayoutOrder = 2
        })
    });
end;
return v2.connect(function(v34)
    return {
        ImportTree = v34.Preview.importTree, 
        AssetImportSession = v34.Preview.assetImportSession, 
        ImportDataCheckedCount = v34.Preview.importDataCheckedCount, 
        ErrorNodeChecked = v34.Preview.errorNodeChecked, 
        HasInvalidPackageId = v34.Preview.hasInvalidPackageId, 
        ShowPreview = v34.Dialogs.showPreview, 
        SessionQueue = if not v17() then nil else v34.Sessions.sessionQueue, 
        Filename = if not v17() then nil else v34.Preview.filename
    };
end, function(v35)
    return {
        ClosePreview = function()
            v35(v15());
        end, 
        SetUploading = function(v36)
            v35(v16(v36));
        end
    };
end)((l_withContext_0({
    FileController = v13, 
    QueueController = if not v17() then nil else v14, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v18)));
