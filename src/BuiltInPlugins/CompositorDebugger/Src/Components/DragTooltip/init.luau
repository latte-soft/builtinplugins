local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_ShowOnTop_0 = l_UI_0.ShowOnTop;
local l_DropShadow_0 = l_UI_0.DropShadow;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Typecheck_0 = v3.Util.Typecheck;
local v12 = v2.PureComponent:extend("DragTooltip");
l_Typecheck_0.wrap(v12, script);
v12.defaultProps = {
    Enabled = true, 
    Priority = 0
};
v12.init = function(v13)
    v13.mouseEnter = function(_, v15, v16)
        if not v13.isTooltipHovered then
            v13.mousePosition = Vector2.new(v15, v16);
        end;
    end;
    v13.mouseMoved = function(_, v18, v19)
        v13.mousePosition = Vector2.new(v18, v19);
    end;
    v13.mouseLeave = function()
        v13.mousePosition = nil;
    end;
end;
v12.render = function(v20)
    local l_props_0 = v20.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Padding_0 = l_Stylizer_0.Padding;
    local v24 = not not l_Stylizer_0.DropShadow and l_Stylizer_0.DropShadow.Radius or 0;
    local l_Offset_0 = l_Stylizer_0.Offset;
    local v26 = l_props_0.MaxWidth or l_Stylizer_0.MaxWidth;
    local l_Text_0 = l_props_0.Text;
    local l_Priority_0 = l_props_0.Priority;
    local l_mousePosition_0 = v20.mousePosition;
    local v30 = {};
    local v31 = l_props_0.Focus:get();
    if not (not l_mousePosition_0 or not v31) then
        local v32 = l_mousePosition_0.X + l_Offset_0.X;
        local v33 = l_mousePosition_0.Y + l_Offset_0.Y;
        local l_X_0 = v31.AbsoluteSize.X;
        local l_Y_0 = v31.AbsoluteSize.Y;
        local v36 = (v24 + l_Padding_0) * 2;
        local v37 = math.max(0, math.min(l_X_0, v26) - v36);
        local v38 = nil;
        local v39 = nil;
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_Text_0, l_Stylizer_0.TextSize, l_Stylizer_0.Font, Vector2.new(v37, math.huge));
        v38 = (l_l_TextService_0_TextSize_0.X + v36) + 1;
        v39 = (l_l_TextService_0_TextSize_0.Y + v36) + 1;
        if l_X_0 <= v32 + v38 then
            v32 = l_X_0 - v38;
        end;
        if l_Y_0 <= v33 + v39 then
            v33 = l_Y_0 - v39;
        end;
        v30.TooltipContainer = v2.createElement(l_ShowOnTop_0, {
            Priority = l_Priority_0
        }, {
            Tooltip = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.fromOffset(v32, v33), 
                Size = UDim2.fromOffset(v38, v39)
            }, {
                DropShadow = v2.createElement(l_DropShadow_0, {
                    Style = l_Stylizer_0.DropShadow
                }, {
                    ContentPane = v2.createElement(l_Pane_0, {
                        Padding = l_Padding_0, 
                        Style = "Box"
                    }, {
                        Label = v2.createElement(l_TextLabel_0, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Text = l_Text_0, 
                            TextWrapped = true, 
                            TextXAlignment = l_props_0.TextXAlignment
                        })
                    })
                })
            })
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        [v2.Event.MouseMoved] = v20.mouseMoved
    }, v30);
end;
return (l_withContext_0({
    Focus = l_ContextServices_0.Focus, 
    Stylizer = l_ContextServices_0.Stylizer
})(v12));
