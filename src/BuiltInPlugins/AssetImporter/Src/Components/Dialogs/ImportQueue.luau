local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v13 = require(l_Components_0.ImportQueue.AssetList);
local v14 = require(l_Components_0.ImportQueue.QueueControls);
local v15 = require(l_Components_0.ImportQueue.ImportProgressBar);
local v16 = require(l_script_FirstAncestor_0.Src.Actions.SetShowQueue);
local v17 = require(l_script_FirstAncestor_0.Src.Controllers.FileController);
local v18 = v1.PureComponent:extend("ImportQueue");
v18.init = function(v19)
    v19.onClose = function()
        v19.props.SetShowQueue(false);
    end;
end;
v18.render = function(v20)
    local l_props_0 = v20.props;
    local l_ImportQueue_0 = l_props_0.Stylizer.ImportQueue;
    local l_ControlsHeight_0 = l_ImportQueue_0.ControlsHeight;
    local l_ProgressBarHeight_0 = l_ImportQueue_0.ProgressBarHeight;
    return v1.createElement(l_DockWidget_0, {
        Title = l_props_0.Title, 
        Enabled = l_props_0.ShowQueue, 
        Size = l_ImportQueue_0.WindowSize, 
        InitialDockState = Enum.InitialDockState.Bottom, 
        MinSize = l_ImportQueue_0.WindowSize, 
        OnClose = v20.onClose
    }, {
        Queue = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Controls = v1.createElement(v14, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, l_ControlsHeight_0)
            }), 
            AssetList = v1.createElement(v13, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 1, -if not l_props_0.Uploading then l_ControlsHeight_0 else l_ControlsHeight_0 + l_ProgressBarHeight_0)
            }), 
            ImportProgressBar = if not l_props_0.Uploading then nil else v1.createElement(v15, {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, l_ProgressBarHeight_0)
            })
        })
    });
end;
return v2.connect(function(v25)
    return {
        ShowQueue = v25.Dialogs.showQueue, 
        Uploading = v25.Dialogs.uploading
    };
end, function(v26)
    return {
        SetShowQueue = function(v27)
            v26(v16(v27));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    FileController = v17
})(v18)));
