local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local _ = require(l_script_FirstAncestor_0.Core.Util.multiLanguageUtils);
local l_ContextServices_0 = v2.ContextServices;
local l_HoverArea_0 = v2.UI.HoverArea;
local l_Pane_0 = v2.UI.Pane;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = v3.PureComponent:extend("IconTile");
v11.defaultProps = {
    Size = UDim2.fromScale(0, 0), 
    AutomaticSize = Enum.AutomaticSize.XY
};
v11.init = function(v12)
    v12.state = {
        isHovered = false
    };
    v12.onMouseEnter = function()
        v12:setState(function(v13)
            if v13.isHovered then
                return ;
            else
                return {
                    isHovered = true
                };
            end;
        end);
    end;
    v12.onMouseLeave = function()
        v12:setState(function(v14)
            if not v14.isHovered then
                return ;
            else
                return {
                    isHovered = false
                };
            end;
        end);
    end;
    v12.onClick = function()
        local l_props_0 = v12.props;
        if l_props_0.OnClick ~= nil then
            l_props_0.OnClick(l_props_0.Key);
        end;
    end;
    v12.onAbsoluteSizeChanged = function(v16)
        local l_props_1 = v12.props;
        if l_props_1.OnAbsoluteSizeChanged then
            l_props_1.OnAbsoluteSizeChanged(v16.AbsoluteSize);
        end;
    end;
end;
v11.render = function(v18)
    local l_props_2 = v18.props;
    local l_state_0 = v18.state;
    local l_iconTile_0 = l_props_2.Stylizer.iconTile;
    local v22 = v4.new();
    return v3.createElement(l_Pane_0, {
        BackgroundColor = l_props_2.BackgroundColor, 
        LayoutOrder = l_props_2.LayoutOrder, 
        AutomaticSize = l_props_2.AutomaticSize, 
        Size = l_props_2.Size, 
        OnClick = v18.onClick, 
        [v3.Event.MouseEnter] = v18.onMouseEnter, 
        [v3.Event.MouseLeave] = v18.onMouseLeave, 
        [v3.Change.AbsoluteSize] = v18.onAbsoluteSizeChanged
    }, {
        UICorner = v3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        }), 
        DarkOverlay = l_state_0.isHovered and v3.createElement(l_Pane_0, {
            BackgroundTransparency = l_iconTile_0.overlayTransparency, 
            BackgroundColor = l_iconTile_0.overlayColor, 
            ZIndex = 2
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            })
        }), 
        Contents = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            Padding = l_iconTile_0.padding, 
            Spacing = l_iconTile_0.spacing
        }, {
            Title = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = l_iconTile_0.font, 
                LayoutOrder = v22:getNextOrder(), 
                Text = l_props_2.Title, 
                TextColor = l_iconTile_0.textColor, 
                TextSize = l_iconTile_0.textSize, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            ImageIcon = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = l_props_2.Image, 
                LayoutOrder = v22:getNextOrder(), 
                Size = UDim2.fromOffset(63, 63)
            })
        }), 
        UIGradientContainer = v3.createElement("Frame", {
            BackgroundColor3 = l_props_2.BackgroundColor, 
            BackgroundTransparency = 0.7, 
            ClipsDescendants = true, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = -1
        }, {
            UIGradient = v3.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0), 
                    NumberSequenceKeypoint.new(1, 1)
                }), 
                Rotation = -90, 
                Color = if not l_props_2.BackgroundColor then nil else ColorSequence.new({
                    ColorSequenceKeypoint.new(0, l_iconTile_0.gradientColor), 
                    ColorSequenceKeypoint.new(1, l_props_2.BackgroundColor)
                })
            })
        }), 
        HoverArea = l_props_2.OnClick and v3.createElement(l_HoverArea_0, {
            Cursor = "PointingHand", 
            Size = UDim2.fromScale(1, 1)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
