local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Src.Components.HighlightTextLabel);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugStudioShowBrokenVisualizationModes);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useInstanceSetting);
local l_UI_0 = v1.UI;
local l_ContextServices_0 = v1.ContextServices;
local l_Pane_0 = l_UI_0.Pane;
local l_SegmentedButton_0 = l_UI_0.SegmentedButton;
local l_Slider_0 = l_UI_0.Slider;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Tooltip_0 = l_UI_0.Tooltip;
return function(v13)
    local v14 = l_ContextServices_0.Localization:use();
    local v15 = l_LayoutOrderIterator_0.new();
    local v16, v17 = v3.useState(1);
    local v18, v19 = v5(settings().Studio, "Camera Speed", 1.5);
    return v3.createElement(l_Pane_0, {
        [v3.Tag] = "X-Fill X-Column X-Top X-FitY", 
        LayoutOrder = v13.LayoutOrder
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 22), 
            PaddingRight = UDim.new(0, 3)
        }), 
        Container = v3.createElement(l_Pane_0, {
            [v3.Tag] = "X-RowS X-Left X-Middle", 
            LayoutOrder = v15:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 32), 
            Visible = v4()
        }, {
            ViewMode = v3.createElement(l_SegmentedButton_0, {
                Position = UDim2.fromScale(0, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Items = {
                    "Wireframe", 
                    "Shaded"
                }, 
                SelectedIndex = v16, 
                OnItemActivated = v17, 
                Size = UDim2.new(1, 0, 0, 26)
            })
        }), 
        CameraSpeed = v3.createElement(l_Pane_0, {
            [v3.Tag] = "X-Fill X-Column X-Top X-FitY", 
            LayoutOrder = v15:getNextOrder()
        }, {
            Contents = v3.createElement(l_Pane_0, {
                [v3.Tag] = "X-RowM X-Left X-Middle", 
                Size = UDim2.new(1, 0, 0, 32)
            }, {
                TextContainer = v3.createElement(l_Pane_0, {
                    Size = UDim2.new(1, -160, 1, 0)
                }, {
                    VisualizationModeEntryTitle = v3.createElement(v2, {
                        Text = v14:getText("ViewSection", "CameraSpeed")
                    }), 
                    ToolTip = v3.createElement(l_Tooltip_0, {
                        Text = v14:getText("ViewSection", "CameraSpeedToolTip")
                    })
                }), 
                Slider = v3.createElement(l_Slider_0, {
                    Min = math.min(0.1, v18), 
                    Max = math.max(20, v18), 
                    Value = v18, 
                    ShowInput = true, 
                    OnValueChanged = v19, 
                    Size = UDim2.fromOffset(150, 32)
                })
            })
        })
    });
end;
