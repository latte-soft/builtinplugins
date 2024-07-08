local _ = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useContext_0 = v2.useContext;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local v7 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v7.ContextServices;
local l_joinTags_0 = v7.Styling.joinTags;
local l_DragListener_0 = v7.UI.DragListener;
local l_HoverArea_0 = v7.UI.HoverArea;
local l_isInputMainPress_0 = v7.Util.isInputMainPress;
local l_Attribute_0 = require(l_script_FirstAncestor_0.Src.Resources.PluginStyles):GetAttribute("CursorOpenedHand");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v15 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v16)
    local v17 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v18, v19 = l_useState_0(false);
    local v20 = v16.DragTarget == v16.Label;
    local v21 = l_useMemo_0(function()
        return v15.plotToView(v16.Position);
    end, {
        v16.Position
    });
    local v22 = l_useCallback_0(function()
        v19(true);
    end, {});
    local v23 = l_useCallback_0(function()
        v19(false);
    end, {});
    local v25 = l_useCallback_0(function(v24)
        if v16.OnMoved then
            v16.OnMoved((Vector2.new(v24.Position.X, v24.Position.Y)));
        end;
    end, {
        v16.OnMoved
    });
    local v26 = l_useCallback_0(function()
        if v16.OnDragEnd then
            v16.OnDragEnd();
        end;
    end, {
        v16.OnDragEnd
    });
    local v29 = l_useCallback_0(function(_, v28)
        if not (not l_isInputMainPress_0(v28) or not v16.OnDragStart) then
            v16.OnDragStart(v16.Label);
        end;
    end, {
        v16.OnDragStart, 
        v16.Label
    });
    local v30 = "";
    if not v20 then
        if v18 then
            v30 = "Hovered";
        end;
    else
        v30 = "Pressed";
    end;
    return v2.createElement("ImageButton", {
        Position = UDim2.fromScale(v21.X, v21.Y), 
        [v2.Tag] = l_joinTags_0("ControlPoint", v30), 
        [v2.Event.InputBegan] = v29
    }, {
        Inner = v2.createElement("ImageLabel"), 
        Text = v2.createElement("TextLabel", {
            Text = v17:getText("Label", "ControlPoint_" .. v16.Label)
        }), 
        HoverArea = v2.createElement(l_HoverArea_0, {
            Cursor = l_Attribute_0, 
            MouseEnter = v22, 
            MouseLeave = v23
        }), 
        DragListener = v20 and v2.createElement(l_DragListener_0, {
            OnDragMoved = v25, 
            OnDragEnded = v26
        })
    });
end;
