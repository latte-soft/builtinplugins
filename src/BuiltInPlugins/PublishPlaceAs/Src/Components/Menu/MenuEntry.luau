local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("MenuEntry");
v4.mouseHoverChanged = function(v5, v6)
    v5:setState({
        hovering = v6
    });
end;
v4.render = function(v7)
    local l_Stylizer_0 = v7.props.Stylizer;
    local l_hovering_0 = v7.state.hovering;
    local l_OnClicked_0 = v7.props.OnClicked;
    local l_Title_0 = v7.props.Title;
    local l_ShowError_0 = v7.props.ShowError;
    local l_ShowWarning_0 = v7.props.ShowWarning;
    local l_Selected_0 = v7.props.Selected;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 42), 
        BackgroundColor3 = not not (l_hovering_0 or l_Selected_0) and l_Stylizer_0.menuEntry.hover or l_Stylizer_0.menuBar.backgroundColor, 
        BorderSizePixel = 0, 
        [v1.Event.MouseEnter] = function()
            v7:mouseHoverChanged(true);
        end, 
        [v1.Event.MouseLeave] = function()
            v7:mouseHoverChanged(false);
        end
    }, {
        Highlight = v1.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Stylizer_0.menuEntry.highlight, 
            BackgroundTransparency = not l_Selected_0 and 1 or 0
        }), 
        Title = v1.createElement("TextButton", {
            ZIndex = 2, 
            Size = UDim2.new(1, -15, 1, 0), 
            Position = UDim2.new(0, 15, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Text = l_Title_0, 
            Font = not not l_Selected_0 and l_Stylizer_0.menuEntry.font.selected or l_Stylizer_0.menuEntry.font.unselected, 
            TextSize = 24, 
            TextColor3 = l_Stylizer_0.menuEntry.text, 
            [v1.Event.Activated] = l_OnClicked_0
        }), 
        Error = v1.createElement("ImageLabel", {
            ZIndex = 3, 
            Visible = (l_ShowError_0 or l_ShowWarning_0) or false, 
            Size = UDim2.new(0, 18, 0, 18), 
            Position = UDim2.new(1, -12, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Image = not l_ShowError_0 and "rbxasset://textures/GameSettings/Warning.png" or "rbxasset://textures/GameSettings/ErrorIcon.png"
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
