local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
local v1 = require(l_Packages_0.Roact);
local l_HoverArea_0 = require(l_Packages_0.Framework).UI.HoverArea;
local v3 = v1.PureComponent:extend("CallToActionBanner");
local v4 = game:DefineFastFlag("ToolboxRetireGotham", false);
v3.defaultProps = {
    Gradient = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#0C2859")), 
        ColorSequenceKeypoint.new(1, Color3.fromHex("#B8425f"))
    }), 
    GradientOff = Vector2.new(-0.34, 0)
};
v3.init = function(v5, _)
    v5.ref = v1.createRef();
    v5.state = {
        fontSize = 14, 
        imageWidth = 197, 
        height = 75
    };
    v5.onAbsoluteSizeChange = function(v7)
        if v7.AbsoluteSize.X < 285 then
            v5:setState({
                fontSize = 12, 
                imageWidth = 125, 
                height = 47
            });
            return ;
        elseif v7.AbsoluteSize.X < 350 then
            v5:setState({
                fontSize = 13, 
                imageWidth = 150, 
                height = 57
            });
            return ;
        else
            v5:setState({
                fontSize = 14, 
                imageWidth = 197, 
                height = 75
            });
            return ;
        end;
    end;
end;
v3.render = function(v8)
    local l_props_0 = v8.props;
    local l_state_0 = v8.state;
    local l_Image_0 = l_props_0.Image;
    local l_Gradient_0 = l_props_0.Gradient;
    local l_GradientOff_0 = l_props_0.GradientOff;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Text_0 = l_props_0.Text;
    local l_OnClick_0 = l_props_0.OnClick;
    local l_fontSize_0 = l_state_0.fontSize;
    local l_imageWidth_0 = l_state_0.imageWidth;
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, l_state_0.height), 
        LayoutOrder = l_LayoutOrder_0, 
        [v1.Ref] = v8.ref, 
        [v1.Change.AbsoluteSize] = v8.onAbsoluteSizeChange, 
        [v1.Event.MouseButton1Click] = l_OnClick_0
    }, {
        HoverArea = v1.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        }); 
        v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIGradient = v1.createElement("UIGradient", {
                Color = l_Gradient_0, 
                Offset = l_GradientOff_0
            }), 
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            Text = v1.createElement("TextLabel", {
                Size = UDim2.new(1, -l_imageWidth_0 - 10, 1, 0), 
                BackgroundTransparency = 1, 
                Font = if not v4 then Enum.Font.GothamSemibold else Enum.Font.MontserratBold, 
                Text = l_Text_0 .. "  >", 
                TextColor3 = Color3.fromHex("#FFFFFF"), 
                TextSize = l_fontSize_0, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 14)
                }), 
                Text = v1.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Font = if not v4 then Enum.Font.GothamSemibold else Enum.Font.MontserratBold, 
                    Text = l_Text_0 .. "  >", 
                    TextColor3 = Color3.fromHex("#FFFFFF"), 
                    TextSize = l_fontSize_0, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            Image = v1.createElement("ImageLabel", {
                LayoutOrder = 2, 
                Size = UDim2.new(0, l_imageWidth_0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = l_Image_0
            })
        })
    });
end;
TypedCallToActionBanner = function(v19, v20)
    return v1.createElement(v3, v19, v20);
end;
return {
    Component = v3, 
    Generator = TypedCallToActionBanner
};
