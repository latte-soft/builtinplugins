local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Dash);
local _ = v2.join;
local l_Style_0 = v1.Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_DarkTheme_0 = l_Style_0.Themes.DarkTheme;
local l_LightTheme_0 = l_Style_0.Themes.LightTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_BaseTheme_0 = l_Style_0.Themes.BaseTheme;
local v11 = require(l_Parent_0.Src.Resources.Constants);
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
l_ComponentSymbols_0:add("DraggablePoint");
l_ComponentSymbols_0:add("Line");
l_ComponentSymbols_0:add("ControlPointVisual");
local v13 = string.format("rbxasset://studio_svg_textures/Lua/PathEditor/%s/Large/", "Light");
local v14 = string.format("rbxasset://studio_svg_textures/Lua/PathEditor/%s/Large/", "Dark");
local v15 = {
    [l_ComponentSymbols_0.Image] = v2.join(l_BaseTheme_0[l_ComponentSymbols_0.Image], {
        ["&ControlPoint"] = {
            Image = "rbxasset://textures/PathEditor/Control_Point_Selected.png", 
            Size = UDim2.fromOffset(12, 12), 
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, 
        ["&PhantomTangent"] = {
            Image = "rbxasset://textures/PathEditor/Tangent_Handle.png", 
            Size = UDim2.fromOffset(12, 12), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ImageTransparency = 0.5
        }
    }), 
    [l_ComponentSymbols_0.Button] = v2.join(l_BaseTheme_0[l_ComponentSymbols_0.Button], {
        ["&ModeButton"] = v2.join(l_BaseTheme_0[l_ComponentSymbols_0.Button]["&RoundSubtle"], {
            [l_StyleModifier_0.Disabled] = {
                BackgroundStyle = v2.join(l_BaseTheme_0[l_ComponentSymbols_0.RoundBox], {
                    Color = l_StyleKey_0.ActionActivated
                }), 
                TextColor = l_StyleKey_0.ActionFocusBorder
            }
        })
    }), 
    [l_ComponentSymbols_0.Line] = {
        Thickness = 1, 
        Color = Color3.new(0, 0, 0), 
        ["&Tangent"] = {
            Color = Color3.new(250, 250, 250), 
            ContrastColor = l_StyleKey_0.ActionFocusBorder
        }, 
        ["&PhantomTangent"] = {
            Color = Color3.new(250, 250, 250), 
            ContrastColor = l_StyleKey_0.ActionFocusBorder
        }, 
        ["&Visualization"] = {
            Color = Color3.new(250, 250, 250), 
            ContrastColor = l_StyleKey_0.ActionFocusBorder
        }
    }, 
    [l_ComponentSymbols_0.DraggablePoint] = {
        PointSize = v11.PointSize, 
        BackgroundTransparency = 1, 
        HasControlPointVisual = false, 
        ["&AddPoint"] = {
            AnchorPoint = Vector2.new(0, 0)
        }, 
        ["&RubberBand"] = {
            StrokeWidth = 1, 
            StrokeColor = Color3.new(250, 250, 250)
        }, 
        ["&ControlPoint"] = {
            HasControlPointVisual = true, 
            Padding = 6, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundImage = "rbxasset://textures/PathEditor/Control_Point.png", 
            [l_StyleModifier_0.Hover] = {
                BackgroundImage = "rbxasset://textures/PathEditor/Control_Point_Hover.png"
            }, 
            [l_StyleModifier_0.Selected] = {
                BackgroundImage = "rbxasset://textures/PathEditor/Control_Point_Selected.png", 
                Padding = 4
            }
        }, 
        ["&PhantomControlPoint"] = {
            HasControlPointVisual = true, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundImage = "rbxasset://textures/PathEditor/Control_Point.png", 
            PointSize = Vector2.new(6, 6)
        }, 
        ["&Tangent"] = {
            HasControlPointVisual = true, 
            Padding = 4, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            BackgroundImage = "rbxasset://textures/PathEditor/Tangent_Handle.png", 
            [l_StyleModifier_0.Hover] = {
                BackgroundImage = "rbxasset://textures/PathEditor/Tangent_Handle_Hover.png"
            }, 
            [l_StyleModifier_0.Selected] = {
                Padding = 2, 
                BackgroundImage = "rbxasset://textures/PathEditor/Tangent_Handle_Selected.png"
            }
        }, 
        ["&PhantomTangent"] = {
            HasControlPointVisual = true, 
            Padding = 4, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundImage = "rbxasset://textures/PathEditor/Tangent_Handle.png"
        }, 
        ["&HiddenTangent"] = {
            HasControlPointVisual = true, 
            BackgroundImage = "rbxasset://textures/PathEditor/Tangent_Handle.png", 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1
        }, 
        ["&ScaleHandle"] = {
            HasControlPointVisual = true, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            PointSize = Vector2.new(5, 5), 
            BackgroundImage = "rbxasset://textures/PathEditor/Tangent_Handle.png", 
            [l_StyleModifier_0.Selected] = {
                StrokeWidth = 1, 
                StrokeColor = l_StyleKey_0.ActionFocusBorder
            }
        }
    }, 
    [l_ComponentSymbols_0.ControlPointVisual] = {
        PointSize = UDim2.fromOffset(5, 5), 
        BackgroundColor3 = Color3.fromRGB(250, 250, 250), 
        StrokeColor = l_StyleKey_0.ActionFocusBorder, 
        StrokeWidth = 1.5, 
        LineJoinMode = Enum.LineJoinMode.Round, 
        AddPoint = {
            CornerRadius = UDim.new(1, 0)
        }, 
        ControlPoint = {
            CornerRadius = UDim.new(1, 0), 
            [l_StyleModifier_0.Hover] = {
                PointSize = UDim2.fromOffset(7, 7)
            }, 
            [l_StyleModifier_0.Selected] = {
                PointSize = UDim2.fromOffset(7, 7), 
                BackgroundColor3 = l_StyleKey_0.ActionFocusBorder, 
                StrokeColor = Color3.fromRGB(250, 250, 250)
            }
        }, 
        PhantomControlPoint = {
            CornerRadius = UDim.new(1, 0), 
            PointSize = UDim2.fromOffset(2, 2), 
            StrokeWidth = 1
        }, 
        Tangent = {
            LineJoinMode = Enum.LineJoinMode.Miter, 
            CornerRadius = UDim.new(0, 0), 
            Rotation = 45, 
            [l_StyleModifier_0.Hover] = {
                PointSize = UDim2.fromOffset(7, 7)
            }, 
            [l_StyleModifier_0.Selected] = {
                PointSize = UDim2.fromOffset(7, 7), 
                BackgroundColor3 = l_StyleKey_0.ActionFocusBorder, 
                StrokeColor = Color3.fromRGB(250, 250, 250)
            }
        }, 
        PhantomTangent = {
            LineJoinMode = Enum.LineJoinMode.Miter, 
            CornerRadius = UDim.new(0, 0), 
            Rotation = 45
        }
    }, 
    MouseIcons = {
        AddPointCursor = l_StyleKey_0.AddPointCursor, 
        AddTangentCursor = l_StyleKey_0.AddTangentCursor, 
        MoveCursor = l_StyleKey_0.MoveCursor
    }, 
    PathToolbar = {
        DeleteButtonSize = UDim2.fromOffset(100, 30), 
        ModeButtonSize = UDim2.fromOffset(30, 30), 
        DoneButtonSize = UDim2.fromOffset(100, 30), 
        SeparatorSize = UDim2.fromOffset(2, 30), 
        SeparatorPadding = 4, 
        AddPointImage = l_StyleKey_0.AddPoint, 
        AddTangentImage = l_StyleKey_0.AddTangent, 
        MoveImage = l_StyleKey_0.Move
    }
};
local v16 = v2.join(l_DarkTheme_0, {
    [l_StyleKey_0.AddPointCursor] = v14 .. "Path2DAddPoint.png", 
    [l_StyleKey_0.AddTangentCursor] = v14 .. "Path2DAddPoint.png", 
    [l_StyleKey_0.MoveCursor] = v14 .. "Path2DCursor.png", 
    [l_StyleKey_0.AddPoint] = v14 .. "Path2DAddPoint.png", 
    [l_StyleKey_0.AddTangent] = v14 .. "Path2DAddTangent.png", 
    [l_StyleKey_0.Move] = v14 .. "Path2DMove.png"
});
local v17 = v2.join(l_LightTheme_0, {
    [l_StyleKey_0.AddPointCursor] = v13 .. "Path2DAddPoint.png", 
    [l_StyleKey_0.AddTangentCursor] = v13 .. "Path2DAddPoint.png", 
    [l_StyleKey_0.MoveCursor] = v13 .. "Path2DCursor.png", 
    [l_StyleKey_0.AddPoint] = v13 .. "Path2DAddPoint.png", 
    [l_StyleKey_0.AddTangent] = v13 .. "Path2DAddTangent.png", 
    [l_StyleKey_0.Move] = v13 .. "Path2DMove.png"
});
return function(v18)
    local _ = nil;
    return (if not v18 then l_StudioTheme_0.new(v16, v17) else l_StudioTheme_0.mock(v16, v17)):extend(v15);
end;
