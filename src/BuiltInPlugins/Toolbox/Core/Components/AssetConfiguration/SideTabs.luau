local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.Images);
local v8 = require(l_Parent_0.Core.Localization.getLocalizedSideTabsMap);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = v2.PureComponent:extend("SideTabs");
v11.init = function(v12, _)
    v12.state = {
        hoveredIndex = 0
    };
    v12.onItemEntered = function(v14)
        v12:setState({
            hoveredIndex = v14
        });
    end;
    v12.onItemLeft = function(_)
        v12:setState({
            hoveredIndex = 0
        });
    end;
end;
v11.createSideButtons = function(v16, v17, v18, v19, v20, v21, v22)
    local v23 = v19 * 0.4;
    local v24 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        })
    };
    local l_current_0 = v21.current;
    local v26 = 0;
    if l_current_0 then
        v26 = l_current_0.AbsoluteSize.X;
    end;
    for v27, v28 in pairs(v17) do
        local v29 = v8(v16.props.Localization)[v28.name];
        v24[v29] = v2.createElement("Frame", {
            Size = UDim2.new(0.5, 0, 0, v19), 
            BackgroundTransparency = 1, 
            LayoutOrder = v27
        }, {
            Icon = v2.createElement("ImageButton", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                Size = UDim2.new(0, v23, 0, v23), 
                BackgroundTransparency = 1, 
                ImageColor3 = v20.sideTab.contentColor, 
                Image = v28.image, 
                [v2.Event.Activated] = function(_)
                    v16.props.ItemClickCallBack(v27, v28);
                end, 
                LayoutOrder = 1
            }), 
            Text = v2.createElement("TextButton", {
                Position = UDim2.new(0, v23 * 2, 0, 0), 
                Size = UDim2.new(1, -v23, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v29, 
                Font = v6.FONT, 
                TextSize = v6.FONT_SIZE_LARGE, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = v20.sideTab.textColor, 
                [v2.Event.Activated] = function(_)
                    v16.props.ItemClickCallBack(v27, v28);
                end, 
                LayoutOrder = 2
            }), 
            Selection = v28 == v18 and v2.createElement("Frame", {
                Position = UDim2.new(-0.5, 0, 0, 0), 
                Size = UDim2.new(0, v26, 1, 0), 
                BackgroundTransparency = v22.selecteBarTrans, 
                BackgroundColor3 = v22.selecteBarColor, 
                BorderSizePixel = 0, 
                ZIndex = v22.selecteBarZindex, 
                LayoutOrder = 0
            }, {
                Indicator = v2.createElement("Frame", {
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(0, 4, 1, 0), 
                    BackgroundTransparency = v22.selecteIndicatorTrans, 
                    BackgroundColor3 = v22.selecteIndicatorColor, 
                    BorderSizePixel = 0
                })
            }), 
            Error = v16.props.tabHasErrors(v28.name) and v2.createElement("ImageButton", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 20, 0, 20), 
                Position = UDim2.new(1, -20, 0.5, -10), 
                Image = v7.ERROR_ICON, 
                [v2.Event.Activated] = function(_)
                    v16.props.ItemClickCallBack(v27, v28);
                end, 
                LayoutOrder = 3
            })
        });
    end;
    return v24;
end;
v11.render = function(v33)
    local l_props_0 = v33.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement("Frame", {
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder
    }, (v33:createSideButtons(l_props_0.Items, l_props_0.CurrentTab, l_props_0.ItemHeight, l_Stylizer_0, l_props_0.SelectParentRef, l_Stylizer_0.sideTab)));
end;
return v3.connect(function(v36, _)
    v36 = v36 or {};
    return {
        tabHasErrors = function(v38)
            if v36.tabErrors then
                local v39 = v36.tabErrors[v38];
                if v39 then
                    for _, v41 in pairs(v39) do
                        if v41 == true then
                            return true;
                        end;
                    end;
                end;
            end;
            return false;
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11)));
