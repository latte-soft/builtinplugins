local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_joinTags_0 = v2.Styling.joinTags;
local l_DragListener_0 = v2.UI.DragListener;
local l_HoverArea_0 = v2.UI.HoverArea;
local l_isInputMainPress_0 = v2.Util.isInputMainPress;
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("CursorOpenedHand");
return function(v8)
    local v9, v10 = v1.useState(false);
    local v11 = {
        HoverArea = v1.createElement(l_HoverArea_0, {
            Cursor = l_Attribute_0, 
            MouseEnter = function()
                if v8.OnHoverStart then
                    v8.OnHoverStart();
                end;
            end, 
            MouseLeave = function()
                if v8.OnHoverEnd then
                    v8.OnHoverEnd();
                end;
            end
        })
    };
    if v9 then
        v11.DragListener = v1.createElement(l_DragListener_0, {
            OnDragMoved = function(v12)
                if v8.OnMoved then
                    v8.OnMoved((Vector2.new(v12.Position.X, v12.Position.Y)));
                end;
            end, 
            OnDragEnded = function()
                v10(false);
                if v8.OnDragEnd then
                    v8.OnDragEnd();
                end;
            end
        });
    end;
    return v1.createElement("TextButton", {
        Position = UDim2.fromScale(v8.Position.X, 1 - v8.Position.Y), 
        [v1.Tag] = l_joinTags_0("SequenceKeypoint", not v8.Selected and "" or "Selected", v8.Tag), 
        [v1.Event.InputBegan] = function(_, v14)
            if l_isInputMainPress_0(v14) then
                v10(true);
            end;
        end
    }, v11);
end;
