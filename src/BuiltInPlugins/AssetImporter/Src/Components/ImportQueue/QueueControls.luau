local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_Button_0 = l_UI_0.Button;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local v15 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v16 = require(l_script_FirstAncestor_0.Src.Controllers.QueueController);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetShowWarning);
local v18 = v1.PureComponent:extend("QueueControls");
v18.init = function(v19)
    v19.openFile = function()
        v19.props.FileController:requestFilePicker();
    end;
    v19.cleanUp = function()
        v19.props.QueueController:removeAllQueuedFiles();
    end;
    v19.startImport = function()
        v19.props.QueueController:beginImportQueue();
    end;
    v19.onSearchRequested = function(_)
    end;
end;
v18._createIconButton = function(v21, v22, v23, v24)
    local l_props_0 = v21.props;
    local l_IconButtonSize_0 = l_props_0.Stylizer.ImportQueue.IconButtonSize;
    return v1.createElement(l_IconButton_0, {
        OnClick = v23, 
        LeftIcon = v22, 
        Size = UDim2.fromOffset(l_IconButtonSize_0, l_IconButtonSize_0), 
        LayoutOrder = 2, 
        Disabled = l_props_0.Uploading, 
        TooltipText = v24 or nil, 
        Style = "IconOnly"
    });
end;
v18.render = function(v27)
    local l_props_1 = v27.props;
    local v29 = #l_props_1.SessionQueue;
    local l_ImportQueue_0 = l_props_1.Stylizer.ImportQueue;
    local l_Padding_0 = l_ImportQueue_0.Padding;
    local l_ImportButtonWidth_0 = l_ImportQueue_0.ImportButtonWidth;
    local l_IconButtonSize_1 = l_ImportQueue_0.IconButtonSize;
    local v34 = UDim2.new(0, l_ImportButtonWidth_0, 1, 0);
    local v35 = (l_Padding_0 * 4 + l_IconButtonSize_1 * 2) + l_ImportButtonWidth_0;
    local l_Uploading_0 = l_props_1.Uploading;
    local l_Localization_1 = l_props_1.Localization;
    return v1.createElement(l_Pane_0, {
        Size = l_props_1.Size, 
        LayoutOrder = l_props_1.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = l_Padding_0, 
        Padding = l_Padding_0, 
        Style = "SubtleBox"
    }, {
        OpenFileButton = v27:_createIconButton(l_ImportQueue_0.OpenImage, v27.openFile, (l_Localization_1:getText("ImportQueue", "AddFile"))), 
        CleanupButton = v27:_createIconButton(l_ImportQueue_0.CleanupImage, v27.cleanUp, (l_Localization_1:getText("ImportQueue", "ClearQueue"))), 
        SearchBar = v1.createElement(l_SearchBar_0, {
            Size = UDim2.new(1, -v35, 1, 0), 
            OnSearchRequested = v27.onSearchRequested, 
            LayoutOrder = 3, 
            ShowSearchIcon = true, 
            ShowSearchButton = false, 
            IncrementalTextSearch = true
        }), 
        StartImportButton = v1.createElement(l_Button_0, {
            OnClick = v27.startImport, 
            Style = "RoundPrimary", 
            Text = if not l_Uploading_0 then l_Localization_1:getText("Plugin", "Import") else l_Localization_1:getText("ImportQueue", "StopQueue"), 
            Size = v34, 
            LayoutOrder = 4, 
            StyleModifier = if not l_Uploading_0 then nil else l_StyleModifier_0.Disabled
        }, {
            Tooltip = v1.createElement(l_Tooltip_0, {
                Text = l_Localization_1:getText("ImportQueue", "StartQueue2", {
                    filesImporting = tostring(0), 
                    totalFiles = tostring(v29)
                })
            })
        })
    });
end;
return v2.connect(function(v38)
    return {
        SessionQueue = v38.Sessions.sessionQueue, 
        Uploading = v38.Dialogs.uploading
    };
end, function(v39)
    return {
        SetShowWarning = function(v40)
            v39(v17(v40));
        end
    };
end)((l_withContext_0({
    FileController = v15, 
    QueueController = v16, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v18)));
