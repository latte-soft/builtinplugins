local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local _ = l_Parent_0.Core.Util;
local v5 = require(l_Parent_0.Core.ContextServices.ModalContext);
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("ClickEventDetectFrame");
v7.getScrollBlocker = function(_, v9)
    return v2.createElement("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0), 
        ScrollingEnabled = true, 
        CanvasSize = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ScrollBarThickness = 0
    }, v9);
end;
v7.getClickDetectFrameWithWindow = function(v10, v11, v12)
    local v13 = {
        ScrollBlocker = v10:getScrollBlocker()
    };
    return v2.createElement("Frame", {
        ZIndex = 10, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Top = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v11.Y), 
            [v2.Event.Activated] = v10.props[v2.Event.Activated]
        }, v13), 
        Left = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, v11.Y), 
            Size = UDim2.new(0, v11.X, 0, v12.Y), 
            [v2.Event.Activated] = v10.props[v2.Event.Activated]
        }, v13), 
        Right = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v11.X + v12.X, 0, v11.Y), 
            Size = UDim2.new(1, -(v11.X + v12.X), 0, v12.Y), 
            [v2.Event.Activated] = v10.props[v2.Event.Activated]
        }, v13), 
        Bottom = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, v11.Y + v12.Y), 
            Size = UDim2.new(1, 0, 1, -(v11.Y + v12.Y)), 
            [v2.Event.Activated] = v10.props[v2.Event.Activated]
        }, v13), 
        Content = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, v10.props[v2.Children])
    });
end;
v7.getClickDetectFrame = function(v14)
    return v2.createElement("ImageButton", {
        ZIndex = 10, 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        [v2.Event.Activated] = v14.props[v2.Event.Activated]
    }, {
        ScrollBlocker = v14:getScrollBlocker(v14.props[v2.Children])
    });
end;
v7.render = function(v15)
    local l_props_0 = v15.props;
    local l_modalTarget_0 = l_props_0.Modal.modalTarget;
    local v18 = l_props_0.windowPosition or UDim2.new(0, 0, 0, 0);
    local l_windowSize_0 = l_props_0.windowSize;
    local _ = nil;
    return l_modalTarget_0 and v2.createElement(v2.Portal, {
        target = l_modalTarget_0
    }, {
        ClickEventDetectFrame = if not l_windowSize_0 then v15:getClickDetectFrame() else v15:getClickDetectFrameWithWindow(v18, l_windowSize_0)
    });
end;
return (l_withContext_0({
    Modal = v5
})(v7));
