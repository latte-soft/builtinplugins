local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Slider_0 = l_UI_0.Slider;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_BrushShape_0 = require(l_script_FirstAncestor_0.Src.Types).BrushShape;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local function v15(v14)
    return v2.createElement(l_Slider_0, {
        Max = 64, 
        Min = 1, 
        OnValueChanged = v14.OnChanged, 
        ShowInput = true, 
        Size = UDim2.new(1, 0, 0, v14.Height), 
        SnapIncrement = 1, 
        VerticalDragTolerance = 0, 
        Value = v14.Value
    });
end;
return function(v16)
    local l_Schema_0 = v16.Schema;
    local v18 = l_Stylizer_0:use("BrushSizeRenderer");
    local l_Shape_0 = l_Schema_0.Shape;
    local v20 = l_LayoutOrderIterator_0.new();
    local v24 = l_useCallback_0(function(v21, v22)
        local v23 = table.clone(v16.Value);
        if not v16.Value.Locked then
            if not v21 then
                v23.Height = v22;
                v16.OnChanged(v23);
                return ;
            else
                v23.Size = v21;
                v16.OnChanged(v23);
                return ;
            end;
        else
            v23.Height = v21 or v22;
            v23.Size = v21 or v22;
            v16.OnChanged(v23);
            return ;
        end;
    end, {
        v16.Value.Size, 
        v16.Value.Height, 
        v16.Value.Locked
    });
    local v26 = l_useCallback_0(function(v25)
        v24(v25, nil);
    end, {
        v24
    });
    local v29 = v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Horizontal, 
        Size = UDim2.fromScale(1, 0), 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Inputs = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v20:getNextOrder(), 
            Size = UDim2.new(1, -v18.LockButtonWidth, 0, 0), 
            Spacing = 10, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Size = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v20:getNextOrder()
            }, {
                SizeLabel = v2.createElement(l_TextLabel_0, {
                    LayoutOrder = v20:getNextOrder(), 
                    Size = UDim2.fromOffset(v18.LabelWidth, v18.RowHeight), 
                    Text = l_Shape_0 == l_BrushShape_0.Cylinder and "R" or "W", 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                SizeSliderContainer = v2.createElement(l_Pane_0, {
                    LayoutOrder = v20:getNextOrder(), 
                    Size = UDim2.new(1, -v18.LabelWidth, 0, v18.RowHeight)
                }, {
                    SizeSlider = v2.createElement(v15, {
                        Height = v18.RowHeight, 
                        OnChanged = v26, 
                        Value = v16.Value.Size
                    })
                })
            }), 
            Height = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v20:getNextOrder()
            }, {
                HeightLabel = v2.createElement(l_TextLabel_0, {
                    LayoutOrder = v20:getNextOrder(), 
                    Size = UDim2.fromOffset(v18.LabelWidth, v18.RowHeight), 
                    Text = "H", 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                HeightSliderContainer = v2.createElement(l_Pane_0, {
                    LayoutOrder = v20:getNextOrder(), 
                    Size = UDim2.new(1, -v18.LabelWidth, 0, v18.RowHeight)
                }, {
                    HeightSlider = v2.createElement(v15, {
                        Height = v18.RowHeight, 
                        OnChanged = l_useCallback_0(function(v27)
                            v24(nil, v27);
                        end, {
                            v24
                        }), 
                        Value = v16.Value.Height
                    })
                })
            })
        }), 
        LockingContainer = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v20:getNextOrder(), 
            Size = UDim2.fromOffset(0, v18.RowHeight * 2 + 10), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            Locking = v2.createElement(l_Button_0, {
                LayoutOrder = v20:getNextOrder(), 
                OnClick = l_useCallback_0(function()
                    local v28 = table.clone(v16.Value);
                    v28.Locked = not v28.Locked;
                    v16.OnChanged(v28);
                end, {
                    v16.Value.Size, 
                    v16.Value.Height, 
                    v16.Value.Locked, 
                    v24
                }), 
                Size = UDim2.fromOffset(v18.LockButtonWidth, v18.LockButtonWidth), 
                Style = "RoundSubtle"
            }, {
                ImageContainer = v2.createElement(l_Pane_0, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Layout = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    Icon = v2.createElement(l_Image_0, {
                        Image = if not v16.Value.Locked then v18.Unlocked else v18.Locked, 
                        Size = UDim2.fromOffset(16, 16)
                    })
                })
            })
        })
    });
    local v30 = v2.createElement(v15, {
        Height = v18.RowHeight, 
        OnChanged = v26, 
        Value = v16.Value.Size
    });
    if l_Shape_0 == l_BrushShape_0.Sphere then
        return v30;
    else
        return v29;
    end;
end;
