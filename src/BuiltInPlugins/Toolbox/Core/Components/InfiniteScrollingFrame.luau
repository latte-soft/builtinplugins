local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Parent_0.Core.Components.StyledScrollingFrame);
local v5 = v2.PureComponent:extend("InfiniteScrollingFrame");
v5.init = function(v6, _)
    v6.state = {
        currentPage = 1
    };
    v6.scrollingFrameRef = v2.createRef();
    v6.checkCanvasAndRequest = function(v8)
        local l_current_0 = v8.scrollingFrameRef.current;
        if l_current_0 then
            if l_current_0.CanvasSize.Y.Offset - (l_current_0.CanvasPosition.Y + l_current_0.AbsoluteWindowSize.Y) <= 0 then
                v8.requestNextPage();
            end;
            return ;
        else
            return ;
        end;
    end;
    v6.onScroll = function()
        v6.checkCanvasAndRequest(v6);
    end;
    v6.requestNextPage = function()
        if v6.props.nextPageFunc then
            v6.props.nextPageFunc(v6.state.currentPage + 1);
        end;
    end;
end;
v5.getDerivedStateFromProps = function(v10, _)
    return {
        currentPage = v10.currentPage
    };
end;
v5.didMount = function(v12)
    v12:checkCanvasAndRequest();
end;
v5.didUpdate = function(v13, _, _)
    v13:checkCanvasAndRequest();
end;
v5.render = function(v16)
    local l_props_0 = v16.props;
    local _ = v16.state;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_current_1 = l_props_0.layouterRef.current;
    local v23 = 900;
    if l_current_1 then
        v23 = l_current_1.AbsoluteContentSize.Y;
    end;
    return v2.createElement(v4, {
        Position = l_Position_0, 
        Size = l_Size_0, 
        CanvasSize = UDim2.new(1, 0, 0, v23), 
        ZIndex = 1, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        scrollingEnabled = true, 
        [v2.Ref] = v16.scrollingFrameRef, 
        onScroll = v16.onScroll, 
        LayoutOrder = l_LayoutOrder_0
    }, l_props_0[v2.Children]);
end;
return v3.connect(function(v24, _)
    return {
        currentPage = (v24 or {}).currentPage or 1
    };
end, nil)(v5);
