local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Container_0 = l_UI_0.Container;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local v13 = require(l_script_FirstAncestor_0.Src.Utility.trimFilename);
local v14 = require(l_script_FirstAncestor_0.Src.Utility.openInAvatarPreviewer);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.InsertModelInWorkspace);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImporterOpensAvatarPreviewerBetaCheck);
local v17 = v2.PureComponent:extend("UploadStatus");
v17.init = function(v18)
    v18.state = {
        progressValue = 0
    };
end;
v17.didMount = function(v19)
    v19._updateImportProgress = function(v20)
        if v19.state.progressValue < v20 then
            v19:setState({
                progressValue = v20
            });
        end;
    end;
    v19._updateImportComplete = function(v21)
        if v21.Succeeded then
            v19.props.InsertModelInWorkspace(v21, v19.props.RootImportData);
            if v16() then
                v14(v21, v19.props.RootImportData, v19.props.AssetImportSession);
            end;
        end;
        v19.props.OnImportCompleted(v21);
    end;
    v19._updateImportProgressConnection = v19.props.AssetImportSession.UploadProgress:Connect(v19._updateImportProgress);
    v19._updateImportCompleteConnection = v19.props.AssetImportSession.UploadComplete:Connect(v19._updateImportComplete);
end;
v17.willUnmount = function(v22)
    v22._updateImportProgressConnection:Disconnect();
    v22._updateImportCompleteConnection:Disconnect();
end;
v17.render = function(v23)
    local l_props_0 = v23.props;
    local l_state_0 = v23.state;
    local v26 = l_props_0.Localization:getText("Upload", "Uploading");
    local l_UploadWidget_0 = l_props_0.Stylizer.UploadWidget;
    local v28 = v13(l_props_0.Filename);
    local v29 = l_state_0.progressValue or 0;
    return v2.createElement(l_Pane_0, {
        LayoutOrder = 1, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = l_UploadWidget_0.TopPadding
    }, {
        LoadingText = v2.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 30), 
            Text = ("%* %* %*%%"):format(v26, v28, (tostring((math.floor(v29 * 100))))), 
            TextSize = l_UploadWidget_0.SubtextSize, 
            TextXAlignment = l_UploadWidget_0.TextAlignment, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        LoadingBarContainer = v2.createElement(l_Container_0, {
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, l_UploadWidget_0.LoadingBarHeight)
        }, {
            LoadingBar = v2.createElement(l_LoadingBar_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 10), 
                Size = l_UploadWidget_0.LoadingBarContainerSize, 
                Progress = v29
            })
        })
    });
end;
return v3.connect(function(v30)
    return {
        AssetImportSession = v30.Preview.assetImportSession, 
        Filename = v30.Preview.filename, 
        RootImportData = v30.Preview.importTree
    };
end, function(v31)
    return {
        InsertModelInWorkspace = function(v32, v33)
            v31(v15(v32, v33));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v17)));
