local v0 = UDim.new(0, 6);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v3.UI.Pane;
local v7 = v2.PureComponent:extend("TextBox");
v7.init = function(v8)
    v8.state = {
        Focused = false
    };
    v8.mouseEnter = function()
        if v8.props.Mouse then
            v8.props.Mouse:__pushCursor("IBeam");
        end;
    end;
    v8.mouseLeave = function()
        if v8.props.Mouse then
            v8.props.Mouse:__popCursor();
        end;
    end;
    v8.textBoxRef = v2.createRef();
end;
v7.willUnmount = function(v9)
    v9.props.Mouse:__resetCursor();
    v9.unmounting = true;
end;
v7.didMount = function(v10)
    if not (not v10.props.CaptureFocus or not v10.textBoxRef.current) then
        spawn(function()
            if v10.textBoxRef.current then
                v10.textBoxRef.current:CaptureFocus();
            end;
        end);
    end;
end;
v7.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_state_0 = v11.state;
    local l_Size_0 = l_props_0.Size;
    local l_Text_0 = l_props_0.Text;
    local l_TextXAlignment_0 = l_props_0.TextXAlignment;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Focused_0 = l_state_0.Focused;
    local l_textBox_0 = l_Stylizer_0.textBox;
    local l_TextChanged_0 = l_props_0.TextChanged;
    local l_FocusChanged_0 = l_props_0.FocusChanged;
    local v23 = not l_props_0.ReadOnly;
    local v24 = nil;
    v24 = if not l_Focused_0 then l_textBox_0.defaultBorder else l_textBox_0.focusedBorder;
    local _ = nil;
    return v2.createElement(l_Pane_0, {
        Style = "BorderBox", 
        Size = l_Size_0, 
        BackgroundColor3 = l_textBox_0.backgroundColor, 
        BorderColor3 = v24, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = v0, 
            PaddingRight = v0
        }), 
        Text = v2.createElement("TextBox", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = true, 
            ClearTextOnFocus = not (l_props_0.ClearTextOnFocus ~= nil) or l_props_0.ClearTextOnFocus, 
            Font = l_Stylizer_0.font, 
            TextSize = l_textBox_0.textSize, 
            TextColor3 = l_textBox_0.textColor, 
            Text = l_Text_0, 
            TextXAlignment = l_TextXAlignment_0, 
            TextEditable = v23, 
            [v2.Ref] = v11.textBoxRef, 
            [v2.Change.Text] = not not v23 and function(v26)
                if l_TextChanged_0 then
                    l_TextChanged_0(v26.Text);
                end;
            end or nil, 
            [v2.Event.Focused] = not not v23 and function(v27)
                v11:setState({
                    Focused = true
                });
                l_FocusChanged_0(v27, true);
            end or nil, 
            [v2.Event.FocusLost] = not not v23 and function(v28, v29)
                if not v11.unmounting then
                    v11:setState({
                        Focused = false
                    });
                    l_FocusChanged_0(v28, false, v29);
                end;
            end or nil, 
            [v2.Event.MouseEnter] = not not v23 and v11.mouseEnter or nil, 
            [v2.Event.MouseLeave] = not not v23 and v11.mouseLeave or nil
        }, l_props_0[v2.Children])
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v7));
