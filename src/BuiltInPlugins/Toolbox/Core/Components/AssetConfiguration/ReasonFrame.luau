local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Util.Constants);
local v4 = require(l_Packages_0.Framework);
local l_GetTextSize_0 = v4.Util.GetTextSize;
local v6 = require(l_Parent_0.Core.Components.StyledScrollingFrame);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = v2.PureComponent:extend("ReasonFrame");
local v10 = Vector2.new(400, 9000);
v9.init = function(v11, _)
    v11.scrollingFrameRef = v2.createRef();
    v11.calibrateCanvas = function()
        local v13 = v11.props.Reasons or {};
        local v14 = 0;
        local v15 = {};
        local l_current_0 = v11.scrollingFrameRef.current;
        for _, v18 in pairs(v13) do
            local l_responseBody_0 = v18.response.responseBody;
            local _ = nil;
            local v21 = l_GetTextSize_0(l_responseBody_0, v3.FONT_SIZE_LARGE, v3.FONT, if not l_current_0 then v10 else Vector2.new(l_current_0.AbsoluteSize.X, 9000));
            table.insert(v15, v21);
            if not v21 then
                v14 = v14 + 10;
            else
                v14 = v14 + v21.Y;
            end;
        end;
        if not v14 then
            v14 = 40;
        end;
        if l_current_0 then
            l_current_0.CanvasSize = UDim2.new(1, 0, 0, v14);
        end;
        return v15;
    end;
    v11.getReasons = function(v22, v23, v24)
        local v25 = {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, v3.ASSET_INNER_PADDING), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            ExplainLabel = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 20), 
                Text = v11.props.Localization:getText("AssetConfigError", "NetworkError"), 
                TextColor3 = v24.textColor, 
                Font = v3.FONT, 
                TextSize = v3.FONT_SIZE_LARGE, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 0
            })
        };
        for v26, v27 in pairs(v22) do
            v25[v27.name] = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v23[v26].Y), 
                Text = v27.response.responseBody, 
                TextColor3 = v24.textColor, 
                Font = v3.FONT, 
                TextSize = v3.FONT_SIZE_LARGE, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v26
            });
        end;
        return v25;
    end;
end;
v9.render = function(v28)
    local l_props_0 = v28.props;
    return v2.createElement(v6, {
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        CanvasSize = UDim2.new(0, 0, 0, 40), 
        ZIndex = 1, 
        [v2.Ref] = v28.scrollingFrameRef, 
        onScroll = v28.onScroll, 
        LayoutOrder = l_props_0.LayoutOrder
    }, (v28.getReasons(l_props_0.Reasons, v28.calibrateCanvas(), l_props_0.Stylizer.assetConfig)));
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v9));
