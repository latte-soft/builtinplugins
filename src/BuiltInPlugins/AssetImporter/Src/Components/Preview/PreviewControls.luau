local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local v12 = require(l_script_FirstAncestor_0.Src.Utility.GetLocalizedString);
local v13 = v1.PureComponent:extend("PreviewControls");
v13.init = function(_)
end;
v13.render = function(v15)
    local l_props_0 = v15.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_Localization_1 = l_props_0.Localization;
    return v1.createElement(l_Pane_0, {
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Layout = Enum.FillDirection.Vertical, 
        Size = l_Stylizer_1.PreviewWindow.PreviewButtonBar.Size, 
        Position = l_Stylizer_1.PreviewWindow.PreviewButtonBar.Position, 
        Spacing = l_Stylizer_1.PreviewWindow.PreviewButtonBar.Spacing, 
        ZIndex = 4
    }, {
        CameraResetButtonContainer = v1.createElement(l_Pane_0, {
            LayoutOrder = 1, 
            Size = l_Stylizer_1.PreviewWindow.OptionIconSize, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            CameraResetButton = v1.createElement(l_Button_0, {
                OnClick = v15.props.ResetCameraCallback, 
                Style = "RoundSubtle"
            }, {
                Icon = v1.createElement(l_Image_0, {
                    Image = l_Stylizer_1.PreviewWindow.ResetCameraImage
                }, {
                    Tooltip = v1.createElement(l_Tooltip_0, {
                        Text = v12(l_Localization_1, "PreviewTooltip", "ResetCam")
                    })
                })
            })
        }), 
        InsertContextToggleButtonContainer = if not l_props_0.ShouldShowWorkspaceToggle then nil else v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            Size = l_Stylizer_1.PreviewWindow.OptionIconSize, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            InsertContextToggleButton = v1.createElement(l_Button_0, {
                OnClick = v15.props.InsertContextCallback, 
                Style = "RoundSubtle"
            }, {
                Icon = v1.createElement(l_Image_0, {
                    Image = l_Stylizer_1.PreviewWindow.ShowWorkspaceImage
                }, {
                    Tooltip = v1.createElement(l_Tooltip_0, {
                        Text = v12(l_Localization_1, "PreviewTooltip", "ToggleInsertContext")
                    })
                })
            })
        }), 
        RigVisualizationButtonContainer = if not l_props_0.ShouldShowRigVisualizationToggle then nil else v1.createElement(l_Pane_0, {
            LayoutOrder = 3, 
            Size = l_Stylizer_1.PreviewWindow.OptionIconSize, 
            AnchorPoint = Vector2.new(1, 0)
        }, {
            RigVisualizationButton = v1.createElement(l_Button_0, {
                OnClick = v15.props.VisualizeRigCallback, 
                Style = "RoundSubtle"
            }, {
                Icon = v1.createElement(l_Image_0, {
                    Image = l_Stylizer_1.PreviewWindow.ShowRigVisualizationImage
                }, {
                    Tooltip = v1.createElement(l_Tooltip_0, {
                        Text = v12(l_Localization_1, "PreviewTooltip", "RigVisualization")
                    })
                })
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v13));
