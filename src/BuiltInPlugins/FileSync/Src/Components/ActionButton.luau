local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ModernIcons);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Stylizer_0 = v3.ContextServices.Stylizer;
local l_TextLabel_0 = v3.UI.TextLabel;
return function(v6)
    local v7 = v6.Size or UDim2.fromOffset(100, 100);
    local v8, v9 = v1.useState(false);
    local v10 = l_Stylizer_0:use("ActionButton");
    return v1.createElement("ImageButton", {
        Size = v7, 
        BackgroundTransparency = not v8 and 1 or 0.75, 
        LayoutOrder = v6.LayoutOrder, 
        [v1.Event.Activated] = v6.OnClick, 
        [v1.Event.MouseEnter] = function()
            v9(true);
        end, 
        [v1.Event.MouseLeave] = function()
            v9(false);
        end
    }, {
        UICorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIStroke = v1.createElement("UIStroke", {
            Color = v10.FontColor, 
            Transparency = 0, 
            Thickness = 1
        }), 
        UIAspectRatioConstraint = v1.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ImageButton = v1.createElement("ImageLabel", {
            Size = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.3), 
            BackgroundTransparency = 1, 
            LayoutOrder = 0
        }, {
            ImageButton = v1.createElement("ImageLabel", {
                Size = UDim2.fromScale(0.5, 0.5), 
                Position = UDim2.fromScale(0.25, 0.25), 
                BackgroundTransparency = 1, 
                Image = v6.Image or ""
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 50)
                })
            }), 
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 50)
            }), 
            UIStroke = v1.createElement("UIStroke", {
                Color = v10.FontColor, 
                Transparency = 0, 
                Thickness = 1
            }), 
            ModifiedDot = if not v6.HasChanges then nil else v1.createElement("ImageLabel", {
                Size = UDim2.fromOffset(10, 10), 
                Position = UDim2.fromScale(0.85, 0.15), 
                Image = v2.getIconForCurrentTheme(v2.IconEnums.Notification)
            }, {
                UICorner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 5)
                })
            })
        }), 
        Spacer = v1.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 4), 
            BackgroundTransparency = 1
        }), 
        TextLabel = v1.createElement(l_TextLabel_0, {
            Size = UDim2.new(1, 0, 0.2, 0), 
            BackgroundTransparency = 1, 
            Text = v6.Text or "", 
            Style = "Semibold", 
            TextSize = 18, 
            LayoutOrder = 2
        })
    });
end;
