local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v8 = v2.PureComponent:extend("MenuEntry");
v8.mouseHoverChanged = function(v9, v10)
    local l_props_0 = v9.props;
    if not v10 then
        l_props_0.Mouse:__resetCursor();
    else
        l_props_0.Mouse:__pushCursor("PointingHand");
    end;
    v9:setState({
        Hovering = v10
    });
end;
v8.render = function(v12)
    local l_Stylizer_0 = v12.props.Stylizer;
    local l_Hovering_0 = v12.state.Hovering;
    local l_Selected_0 = v12.props.Selected;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v7.MENU_ENTRY_HEIGHT), 
        BackgroundColor3 = not not (l_Hovering_0 or l_Selected_0) and l_Stylizer_0.menuEntry.hover or l_Stylizer_0.menuBar.backgroundColor, 
        BorderSizePixel = 0, 
        [v2.Event.MouseEnter] = function()
            v12:mouseHoverChanged(true);
        end, 
        [v2.Event.MouseLeave] = function()
            v12:mouseHoverChanged(false);
        end
    }, {
        Highlight = v2.createElement("Frame", {
            ZIndex = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Stylizer_0.menuEntry.highlight, 
            BackgroundTransparency = not l_Selected_0 and 1 or 0
        }), 
        Title = v2.createElement("TextButton", v4.Dictionary.join(l_Stylizer_0.fontStyle.Title, {
            ZIndex = 2, 
            Size = UDim2.new(1, -15, 1, 0), 
            Position = UDim2.new(0, 15, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = if not not v1 and l_Selected_0 then l_Stylizer_0.menuEntry.text else nil, 
            Text = v12.props.Title, 
            Font = not not l_Selected_0 and Enum.Font.SourceSansSemibold or Enum.Font.SourceSans, 
            [v2.Event.Activated] = function()
                v12.props.OnClicked(v12.props.Index);
            end
        })), 
        Error = v2.createElement("ImageLabel", {
            ZIndex = 3, 
            Visible = (v12.props.Error or v12.props.Warning) or false, 
            Size = UDim2.new(0, 18, 0, 18), 
            Position = UDim2.new(1, -12, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5), 
            BackgroundTransparency = 1, 
            Image = not not v12.props.Error and v7.ERROR_IMAGE or v7.WARNING_IMAGE
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v8));
