local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(l_Parent_0.Packages.Framework);
local v6 = if not v2 then v5.Util.FitFrame.FitFrameOnAxis else nil;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v5.UI.Pane;
local v10 = v3.PureComponent:extend("RadioButton");
v10.init = function(v11, _)
    v11.mouseEnter = function()
        if v11.props.Enabled then
            v11:mouseHoverChanged(true);
        end;
    end;
    v11.mouseLeave = function()
        if v11.props.Enabled then
            v11:mouseHoverChanged(false);
        end;
    end;
end;
v10.mouseHoverChanged = function(v13, v14)
    local l_props_0 = v13.props;
    if not v14 then
        l_props_0.Mouse:__resetCursor();
        return ;
    else
        l_props_0.Mouse:__pushCursor("PointingHand");
        return ;
    end;
end;
v10.render = function(v16)
    local l_props_1 = v16.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Title_0 = v16.props.Title;
    local v20 = not not l_props_1.Description and l_props_1.Description or nil;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_Title_0, l_Stylizer_0.fontStyle.Subtext.TextSize, l_Stylizer_0.fontStyle.Subtext.Font, Vector2.new());
    local v22 = l_props_1.Description and l_TextService_0:GetTextSize(v20, l_Stylizer_0.fontStyle.Subtext.TextSize, l_Stylizer_0.fontStyle.Subtext.Font, Vector2.new(l_Stylizer_0.radioButton.descriptionWidth, math.huge));
    local v23 = not not l_props_1.Children and l_props_1.Children or {};
    local v24 = math.max(l_l_TextService_0_TextSize_0.X, not not v22 and v22.X or 0);
    return v3.createElement(if not v2 then v6 else l_Pane_0, if not v2 then {
        axis = v6.Axis.Vertical, 
        minimumSize = UDim2.new(0, v24 + l_Stylizer_0.radioButton.size, 0, 0), 
        BackgroundTransparency = 1, 
        FillDirection = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_1.LayoutOrder or 1
    } else {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_1.LayoutOrder or 1, 
        Spacing = l_Stylizer_0.radioButton.spacing, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Button = v3.createElement("ImageButton", {
            Size = UDim2.new(0, l_Stylizer_0.radioButton.size, 0, l_Stylizer_0.radioButton.size), 
            BackgroundTransparency = 1, 
            ImageTransparency = not v16.props.Enabled and 0.4 or 0, 
            Image = l_Stylizer_0.radioButton.image.background, 
            ImageColor3 = l_Stylizer_0.radioButton.background, 
            LayoutOrder = 1, 
            [v3.Event.MouseEnter] = v16.mouseEnter, 
            [v3.Event.MouseLeave] = v16.mouseLeave, 
            [v3.Event.Activated] = function()
                if v16.props.Enabled then
                    v16.props.OnClicked();
                end;
            end
        }, {
            Highlight = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = not not l_Stylizer_0.isDarkerTheme and UDim2.new(0.4, 0, 0.4, 0) or UDim2.new(0.5, 0, 0.5, 0), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Visible = v16.props.Selected, 
                Image = not not v16.props.Enabled and l_Stylizer_0.radioButton.image.selected or l_Stylizer_0.radioButton.image.selectedDisabled
            })
        }), 
        ContentAndChildren = v3.createElement(if not v2 then v6 else l_Pane_0, if not v2 then {
            axis = v6.Axis.Vertical, 
            minimumSize = UDim2.new(0, v24, 0, 0), 
            contentPadding = UDim.new(0, l_Stylizer_0.radioButton.padding), 
            BackgroundTransparency = 1, 
            FillDirection = Enum.FillDirection.Vertical, 
            LayoutOrder = 2
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2, 
            Spacing = l_Stylizer_0.radioButton.spacing
        }, v4.Dictionary.join({
            TitleLabel = v3.createElement("TextButton", v4.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTransparency = not v16.props.Enabled and 0.5 or 0, 
                Text = l_Title_0, 
                [v3.Event.MouseEnter] = v16.mouseEnter, 
                [v3.Event.MouseLeave] = v16.mouseLeave, 
                [v3.Event.Activated] = function()
                    if v16.props.Enabled then
                        v16.props.OnClicked();
                    end;
                end, 
                LayoutOrder = -2
            })), 
            DescriptionLabel = l_props_1.Description and v3.createElement("TextButton", v4.Dictionary.join(l_Stylizer_0.fontStyle.Subtext, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(0, v22.X, 0, v22.Y), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v20, 
                TextWrapped = true, 
                [v3.Event.MouseEnter] = v16.mouseEnter, 
                [v3.Event.MouseLeave] = v16.mouseLeave, 
                [v3.Event.Activated] = function()
                    if v16.props.Enabled then
                        v16.props.OnClicked();
                    end;
                end, 
                LayoutOrder = -1
            }))
        }, v23))
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v10));
