local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_withContext_0 = v1.ContextServices.withContext;
local v4 = require(l_Parent_0.Src.ContextItems);
local v5 = v2.PureComponent:extend(script.Name);
v5.init = function(v6)
    v6.state = {
        isHovered = false
    };
    v6.onMouseEnter = function()
        v6:setState({
            isHovered = true
        });
    end;
    v6.onMouseLeave = function()
        v6:setState({
            isHovered = false
        });
    end;
end;
v5.render = function(v7)
    local v8 = v7.props.Theme:get();
    local v9 = v7.props.Locked or false;
    local l_isHovered_0 = v7.state.isHovered;
    return v2.createElement("ImageButton", {
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.new(0, -11, 0, 5), 
        Size = UDim2.new(0, 18, 0, 34), 
        BackgroundColor3 = v8.backgroundColor, 
        BorderSizePixel = 0, 
        AutoButtonColor = false, 
        [v2.Event.MouseEnter] = v7.onMouseEnter, 
        [v2.Event.MouseLeave] = v7.onMouseLeave, 
        [v2.Event.Activated] = v7.props.Clicked
    }, {
        Paperclip = v2.createElement("Frame", {
            Size = UDim2.new(0, 11, 1, 0), 
            BackgroundColor3 = v8.propertyLockTheme.paperclipColor, 
            BorderSizePixel = 0, 
            ZIndex = 10
        }), 
        PaperclipCover = v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 2), 
            Size = UDim2.new(0, 10, 0, 30), 
            BackgroundColor3 = v8.backgroundColor, 
            BorderSizePixel = 0, 
            ZIndex = 11
        }), 
        IconBackgroundPaperclipCover = v2.createElement("Frame", {
            Position = UDim2.new(0, 5, 0, 9), 
            Size = UDim2.new(0, 12, 0, 16), 
            BackgroundColor3 = v8.backgroundColor, 
            BorderSizePixel = 0, 
            ZIndex = 12
        }, {
            IconBackground = v2.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, 2), 
                Size = UDim2.new(0, 12, 0, 12), 
                BackgroundColor3 = not not l_isHovered_0 and v8.propertyLockTheme.iconBackgroundHover or v8.backgroundColor, 
                BorderColor3 = v8.propertyLockTheme.iconBorderHover, 
                BorderSizePixel = not l_isHovered_0 and 0 or 1, 
                BackgroundTransparency = not not l_isHovered_0 and v8.propertyLockTheme.iconBackgroundHoverTransparency or 0, 
                ZIndex = 13
            }, {
                Icon = v2.createElement("ImageLabel", {
                    Position = UDim2.new(0, 2, 0, 1), 
                    Size = UDim2.new(0, not v9 and 10 or 8, 0, 9), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = not not v9 and v8.propertyLockTheme.lockedIcon or v8.propertyLockTheme.unlockedIcon, 
                    ZIndex = 14
                })
            })
        })
    });
end;
return (l_withContext_0({
    Theme = v4.DEPRECATED_Theme
})(v5));
