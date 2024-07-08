local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useMemo_0 = v2.useMemo;
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v5.Styling.joinTags;
local l_DragListener_0 = v5.UI.DragListener;
local l_HoverArea_0 = v5.UI.HoverArea;
local l_isInputMainPress_0 = v5.Util.isInputMainPress;
local l_Attribute_0 = require(l_script_FirstAncestor_0.Src.Resources.PluginStyles):GetAttribute("CursorOpenedHand");
local v11 = require(l_Parent_0.PlotRectUtil);
return function(v12)
    local v13 = l_useMemo_0(function()
        return v11.plotToViewPosition(v12.Position, v12.PlotRect);
    end, {
        v12.Position, 
        v12.PlotRect
    });
    local v14 = l_useMemo_0(function()
        return v11.rectContains(v13, Rect.new(0, 0, 1, 1), 0.001);
    end, {
        v13
    });
    local v15 = l_useCallback_0(function()
        if v12.OnHoverStart then
            v12.OnHoverStart();
        end;
    end, {
        v12.OnHoverStart
    });
    local v16 = l_useCallback_0(function()
        if v12.OnHoverEnd then
            v12.OnHoverEnd();
        end;
    end, {
        v12.OnHoverEnd
    });
    local v18 = l_useCallback_0(function(v17)
        if v12.OnMoved then
            v12.OnMoved((Vector2.new(v17.Position.X, v17.Position.Y)));
        end;
    end, {
        v12.OnMoved
    });
    local v19 = l_useCallback_0(function()
        if v12.OnDragEnd then
            v12.OnDragEnd();
        end;
    end, {
        v12.OnDragEnd
    });
    local v22 = l_useCallback_0(function(_, v21)
        if not l_isInputMainPress_0(v21) then
            if not (not (v21.UserInputType == Enum.UserInputType.MouseButton2) or not v12.OnRightClick) then
                v12.OnRightClick();
            end;
        elseif v12.OnDragStart then
            v12.OnDragStart();
            return ;
        end;
    end, {
        v12.OnDragStart, 
        v12.OnRightClick
    });
    local v23 = {
        HoverArea = v2.createElement(l_HoverArea_0, {
            Cursor = l_Attribute_0, 
            MouseEnter = v15, 
            MouseLeave = v16
        })
    };
    if v12.IsDragging then
        v23.DragListener = v2.createElement(l_DragListener_0, {
            OnDragMoved = v18, 
            OnDragEnded = v19
        });
    end;
    return (v14 or v12.IsDragging) and v2.createElement("TextButton", {
        Position = UDim2.fromScale(v13.X, v13.Y), 
        [v2.Tag] = l_joinTags_0("SequenceKeypoint", not v12.Selected and "" or "Selected"), 
        [v2.Event.InputBegan] = v22
    }, v23);
end;
