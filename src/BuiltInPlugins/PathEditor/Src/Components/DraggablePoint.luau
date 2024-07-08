local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local v6 = require(l_Parent_0.Packages.Dash);
local l_withContext_0 = v5.ContextServices.withContext;
local l_Stylizer_0 = v5.Style.Stylizer;
local v9 = require(l_Parent_0.Src.Thunks.MapScreenToSurfacePos);
local l_Util_0 = v5.Util;
local l_DoubleClickDetector_0 = l_Util_0.DoubleClickDetector;
local l_prioritize_0 = l_Util_0.prioritize;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v14 = require(l_Parent_0.Src.Resources.Constants);
local l_Components_0 = l_Parent_0.Src.Components;
local v16 = require(l_Components_0.SignalListener);
local v17 = require(l_Components_0.ControlPointVisual);
local v18 = game:DefineFastFlag("PathEditorControlPointVisualImprovements2", false);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local v20 = game:DefineFastFlag("PathEditorSurfaceGuiInput", false);
local v21 = v3.Component:extend("DraggablePoint");
v21.defaultProps = {
    Style = "ControlPoint", 
    ZIndex = 0, 
    AbsolutePosition = Vector2.new(0, 0), 
    FollowCursorOnDrag = true, 
    OnSelected = function()
    end, 
    OnMouse1Down = function()
    end, 
    OnHover = function()
    end, 
    OnHoverMoved = nil, 
    OnHoverEnd = function()
    end, 
    OnDeselected = function()
    end, 
    OnDragStart = function()
    end, 
    OnDragMoved = function()
    end, 
    OnDragEnd = function()
    end, 
    OnDoubleClicked = function()
    end, 
    OnRightClicked = function()
    end
};
v21.init = function(v22)
    v22.state = {
        isHovered = false, 
        isDragging = false, 
        isDragStarting = false, 
        mouseStart = Vector2.zero, 
        mousePos = Vector2.zero, 
        mouseOffset = Vector2.zero
    };
    v22.DoubleClickDetector = l_DoubleClickDetector_0.new();
    v22.onMouseEnter = function()
        local l_props_0 = v22.props;
        local l_state_0 = v22.state;
        if not l_state_0.isDragging and not l_state_0.isDragStarting then
            v22:setState({
                isHovered = true
            });
            l_props_0.OnHover();
            return ;
        else
            return ;
        end;
    end;
    v22.onMouseLeave = function()
        local l_props_1 = v22.props;
        local l_state_1 = v22.state;
        if not l_state_1.isDragging and not l_state_1.isDragStarting then
            v22:setState({
                isHovered = false
            });
            l_props_1.OnHoverEnd();
            return ;
        else
            return ;
        end;
    end;
    v22.onInputBegan = function(_, v28)
        local l_props_2 = v22.props;
        local l_state_2 = v22.state;
        local v31 = if not l_state_2.isDragging then l_props_2.AbsolutePosition else l_state_2.mousePos + l_state_2.mouseOffset;
        if v28.UserInputType == Enum.UserInputType.MouseButton1 then
            if not l_state_2.isDragging and not l_state_2.isDragStarting then
                v28.UserInputState = Enum.UserInputState.Cancel;
                if not v22.DoubleClickDetector:isDoubleClick() then
                    local v32 = Vector2.new(v28.Position.X, v28.Position.Y);
                    v22:setState({
                        isDragStarting = true, 
                        mouseStart = v32, 
                        mouseOffset = v31 - v32, 
                        mousePos = v32
                    });
                    l_props_2.OnSelected(v32);
                    return ;
                else
                    l_props_2.OnDoubleClicked();
                    return ;
                end;
            else
                return ;
            end;
        elseif v28.UserInputType == Enum.UserInputType.MouseButton2 then
            l_props_2.OnRightClicked();
            v28.UserInputState = Enum.UserInputState.Cancel;
            return ;
        else
            v22:setState({
                mousePos = Vector2.new(v28.Position.X, v28.Position.Y)
            });
            return ;
        end;
    end;
    v22.onInputEnded = function(_, v34)
        local l_props_3 = v22.props;
        local l_state_3 = v22.state;
        local v37 = if not l_state_3.isDragging then l_props_3.AbsolutePosition else l_state_3.mousePos + l_state_3.mouseOffset;
        if v34.UserInputType == Enum.UserInputType.MouseButton1 then
            if l_state_3.isDragging or l_state_3.isDragStarting then
                local _ = Vector2.new(v34.Position.X, v34.Position.Y);
                v22:setState({
                    isDragging = false, 
                    isDragStarting = false, 
                    mouseStart = Vector2.zero, 
                    mouseOffset = Vector2.zero, 
                    mousePos = Vector2.zero
                });
                l_props_3.OnDragEnd(l_props_3.AbsolutePosition, v37);
            else
                return ;
            end;
        end;
    end;
    v22.onInputChanged = function(v39)
        local l_props_4 = v22.props;
        local l_state_4 = v22.state;
        if v39.UserInputType == Enum.UserInputType.MouseMovement then
            local v42 = if not v20 then Vector2.new(v39.Position.X, v39.Position.Y) else l_props_4.dispatchMapScreenToSurfacePos(Vector2.new(v39.Position.X, v39.Position.Y));
            if v42 == nil then
                return ;
            else
                v22:setState({
                    mousePos = v42
                });
                if l_props_4.OnHoverMoved then
                    if not l_PathEditorRotation_0 then
                        l_props_4.OnHoverMoved(v42, false);
                    else
                        l_props_4.OnHoverMoved(v42, l_state_4.isDragging or l_state_4.isDragStarting);
                        return ;
                    end;
                end;
            end;
        end;
    end;
end;
v21.didUpdate = function(v43)
    local l_props_5 = v43.props;
    local l_state_5 = v43.state;
    if l_state_5.isDragStarting and v14.DragEpsilon < (l_state_5.mouseStart - l_state_5.mousePos).Magnitude then
        l_props_5.OnDragStart(l_state_5.mousePos);
        v43:setState({
            isDragStarting = false, 
            isDragging = true
        });
    end;
end;
v21.render = function(v46)
    local l_props_6 = v46.props;
    local l_state_6 = v46.state;
    local l_Stylizer_1 = v46.props.Stylizer;
    local v50 = if not l_state_6.isDragging then if l_props_6.IsSelected then l_StyleModifier_0.Selected else if l_state_6.isHovered then l_StyleModifier_0.Hover else nil else l_StyleModifier_0.Selected;
    if v50 ~= nil and l_Stylizer_1[v50] ~= nil then
        l_Stylizer_1 = v6.join(l_Stylizer_1, l_Stylizer_1[v50]);
    end;
    local v51 = l_prioritize_0(l_Stylizer_1.Disabled, l_props_6.Disabled);
    local l_BackgroundColor_0 = l_Stylizer_1.BackgroundColor;
    local l_AbsolutePosition_0 = l_props_6.AbsolutePosition;
    local l_BackgroundImage_0 = l_Stylizer_1.BackgroundImage;
    local v55 = l_prioritize_0(l_props_6.AbsoluteSize, l_Stylizer_1.PointSize);
    local v56 = l_prioritize_0(l_props_6.Size, UDim2.fromOffset(v55.X, v55.Y));
    local l_StrokeWidth_0 = l_Stylizer_1.StrokeWidth;
    local _ = l_StrokeWidth_0 ~= nil;
    if l_props_6.IsSelected and l_Stylizer_1.SelectedColor ~= nil then
        l_BackgroundColor_0 = l_Stylizer_1.SelectedColor;
    end;
    if l_state_6.isDragging then
        if l_Stylizer_1.DragColor ~= nil then
            l_BackgroundColor_0 = l_Stylizer_1.DragColor;
        end;
        local v59 = l_state_6.mousePos + l_state_6.mouseOffset;
        if l_props_6.FollowCursorOnDrag then
            l_AbsolutePosition_0 = v59;
        end;
        l_props_6.OnDragMoved(l_props_6.AbsolutePosition, v59);
    end;
    local v60 = {};
    if l_props_6.children ~= nil then
        v60 = l_props_6.children;
    end;
    if l_StrokeWidth_0 ~= nil then
        table.insert(v60, v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v56
        }, {
            v3.createElement("UIStroke", {
                Thickness = l_Stylizer_1.StrokeWidth, 
                Color = l_Stylizer_1.StrokeColor
            })
        }));
    end;
    local l_Padding_0 = l_Stylizer_1.Padding;
    local l_v56_0 = v56;
    local v63 = UDim2.new(0, l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y);
    if l_Padding_0 ~= nil then
        l_v56_0 = v56 - UDim2.fromOffset(l_Padding_0, l_Padding_0);
    end;
    if not (not v18 or not l_Stylizer_1.HasControlPointVisual) then
        l_BackgroundImage_0 = nil;
        table.insert(v60, v3.createElement(v17, {
            Style = l_props_6.Style, 
            StyleModifier = v50
        }));
    end;
    if not (not (l_BackgroundImage_0 ~= nil) or v51) then
        table.insert(v60, v3.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = l_v56_0, 
            Image = l_BackgroundImage_0, 
            BackgroundTransparency = l_Stylizer_1.BackgroundTransparency, 
            ImageTransparency = l_Stylizer_1.ImageTransparency, 
            ScaleType = Enum.ScaleType.Crop
        }));
    end;
    local _ = nil;
    if not v51 then
        return (v3.createElement(v3.Fragment, {}, {
            Point = v3.createElement("ImageButton", {
                AnchorPoint = l_Stylizer_1.AnchorPoint, 
                Position = v63, 
                Size = v56, 
                BackgroundColor3 = l_BackgroundColor_0, 
                Active = true, 
                ZIndex = l_props_6.ZIndex, 
                BackgroundTransparency = l_Stylizer_1.BackgroundTransparency, 
                [v3.Event.MouseEnter] = v46.onMouseEnter, 
                [v3.Event.MouseLeave] = v46.onMouseLeave, 
                [v3.Event.InputBegan] = v46.onInputBegan, 
                [v3.Event.InputEnded] = v46.onInputEnded
            }, v60), 
            InputListener = ((l_state_6.isDragging or l_state_6.isDragStarting) or l_props_6.OnHoverMoved) and v3.createElement(v16, {
                signal = l_UserInputService_0.InputChanged, 
                callback = v46.onInputChanged
            })
        }));
    elseif l_BackgroundImage_0 then
        return (v3.createElement("ImageLabel", {
            AnchorPoint = l_Stylizer_1.AnchorPoint, 
            Position = v63, 
            Size = l_v56_0 or v56, 
            BackgroundColor3 = l_BackgroundColor_0, 
            Image = l_BackgroundImage_0, 
            Active = true, 
            ZIndex = l_props_6.ZIndex, 
            BackgroundTransparency = l_Stylizer_1.BackgroundTransparency, 
            ImageTransparency = l_Stylizer_1.ImageTransparency, 
            ScaleType = Enum.ScaleType.Crop
        }, v60));
    else
        return (v3.createElement("Frame", {
            AnchorPoint = l_Stylizer_1.AnchorPoint, 
            Position = v63, 
            Size = v56, 
            BackgroundColor3 = l_BackgroundColor_0, 
            Active = true, 
            ZIndex = l_props_6.ZIndex, 
            BackgroundTransparency = if not v18 then nil else l_Stylizer_1.BackgroundTransparency
        }, v60));
    end;
end;
v21 = l_withContext_0({
    Stylizer = l_Stylizer_0
})(v21);
if not v20 then
    return v21;
else
    return v4.connect(nil, function(v65)
        return {
            dispatchMapScreenToSurfacePos = function(v66)
                return v65(v9(v66));
            end
        };
    end)(v21);
end;
