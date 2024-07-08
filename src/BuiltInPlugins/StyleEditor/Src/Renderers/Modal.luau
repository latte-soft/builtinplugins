local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local v3 = require(l_Parent_0.Packages.Framework);
local l_CaptureFocus_0 = v3.UI.CaptureFocus;
local l_Pane_0 = v3.UI.Pane;
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local v7 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local _ = require(l_Parent_0.Src.Types);
return function(v9)
    local v10 = v7();
    local v11, v12 = l_useState_0(Vector2.zero);
    return v9.Open and v1.createElement(l_CaptureFocus_0, {
        OnFocusLost = v9.OnFocusLost
    }, {
        Window = v1.createElement(l_Pane_0, {
            Position = (function()
                if v9.ObjectRef and v9.ObjectRef.current then
                    local v13 = v10.Focus:get();
                    local v14 = v9.MinSize or Vector2.zero;
                    local l_current_0 = v9.ObjectRef.current;
                    local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
                    local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
                    local l_AbsoluteSize_1 = v13.AbsoluteSize;
                    local v19 = math.max(math.min(l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y, l_AbsoluteSize_1.Y - v11.Y), 0);
                    local v20 = math.max(v14.X, v11.X);
                    local v21 = math.min(l_AbsoluteSize_1.X, v9.MaxSize.X);
                    if v21 < v20 then
                        local l_v21_0 = v21;
                        v21 = v20;
                        v20 = l_v21_0;
                    end;
                    return UDim2.fromOffset(math.max(math.min((l_AbsolutePosition_0.X + l_AbsoluteSize_0.X / 2) - v21 / 2, l_AbsoluteSize_1.X - v21), 0), v19);
                else
                    return UDim2.fromOffset(0, 0);
                end;
            end)(), 
            [v1.Tag] = "Paper X-Center X-Column X-Fill X-Stroke", 
            [v1.Change.AbsoluteSize] = function(v23)
                if v23 then
                    v12(v23.AbsoluteSize);
                end;
            end
        }, l_join_0(v9.children, {
            UISizeConstraint = v1.createElement("UISizeConstraint", {
                MinSize = v9.MinSize, 
                MaxSize = v9.MaxSize
            })
        }))
    });
end;
