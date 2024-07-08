local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Container_0 = v1.UI.Container;
local l_RunService_0 = game:GetService("RunService");
local v7 = v2.PureComponent:extend("Spinner");
v7.defaultProps = {
    Size = 28
};
v7.init = function(v8)
    v8.state = {
        leadingBlock = 0
    };
    v8.getStyle = function()
        return v8.props.Stylizer.Spinner;
    end;
    v8.moveToNext = function()
        if v8.isMounted then
            v8:setState(function(v9)
                return {
                    leadingBlock = (v9.leadingBlock + 1) % #v8.getStyle().Colors
                };
            end);
            return ;
        else
            return ;
        end;
    end;
    v8.time = 0;
    v8.onHeartbeat = function(v10)
        v8.time = v8.time + v10;
        local l_TimeBetweenBlocks_0 = v8.getStyle().TimeBetweenBlocks;
        while l_TimeBetweenBlocks_0 < v8.time do
            v8.time = v8.time - l_TimeBetweenBlocks_0;
            v8.moveToNext();
        end;
    end;
end;
v7.didMount = function(v12)
    v12.isMounted = true;
    v12.heartbeatConnection = l_RunService_0.Heartbeat:Connect(v12.onHeartbeat);
end;
v7.willUnmount = function(v13)
    if v13.heartbeatConnection then
        v13.heartbeatConnection:Disconnect();
        v13.heartbeatConnection = nil;
    end;
    v13.isMounted = false;
end;
v7.render = function(v14)
    local l_props_0 = v14.props;
    local l_Size_0 = v14.props.Size;
    local v17 = v14.getStyle();
    local l_BlockWidth_0 = v17.BlockWidth;
    local l_InnerRadius_0 = v17.InnerRadius;
    assert(2 * l_InnerRadius_0 < l_Size_0, "Spinner size is too small for inner radius from theme");
    local v20 = math.floor(l_Size_0 / 2 - l_InnerRadius_0);
    local l_Colors_0 = v17.Colors;
    local v22 = #l_Colors_0;
    local v23 = 360 / v22;
    local v24 = v14.state.leadingBlock * v23;
    local v25 = {};
    for v26 = 1, v22 do
        v25["Block_" .. tostring(v26)] = v2.createElement("Frame", {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 0, 0, 0), 
            Rotation = -v23 * (v26 - 1), 
            BackgroundTransparency = 1
        }, {
            Block = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.new(0, 0, 0, -l_InnerRadius_0), 
                Size = UDim2.fromOffset(l_BlockWidth_0, v20), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Colors_0[v26]
            })
        });
    end;
    return v2.createElement(l_Container_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        AnchorPoint = l_props_0.AnchorPoint, 
        Position = l_props_0.Position, 
        ZIndex = l_props_0.ZIndex, 
        Size = UDim2.fromOffset(l_Size_0, l_Size_0)
    }, {
        Center = v2.createElement("Frame", {
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(0, 0, 0, 0), 
            Rotation = v24, 
            BackgroundTransparency = 1
        }, v25)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
