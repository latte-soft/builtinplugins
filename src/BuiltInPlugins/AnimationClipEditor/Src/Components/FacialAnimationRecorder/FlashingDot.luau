local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Typecheck_0 = v2.Util.Typecheck;
local v7 = v3.PureComponent:extend("FlashingDot");
l_Typecheck_0.wrap(v7, script);
v7.init = function(v8)
    v8.state = {
        time = 1.5707963267948966, 
        sinTime = 1, 
        animatingDotIndex = 1
    };
end;
v7.didMount = function(v9)
    v9.animationConnection = l_RunService_0.RenderStepped:connect(function(v10)
        v9:updateAnimation(v10);
    end);
end;
v7.willUnmount = function(v11)
    if v11.animationConnection then
        v11.animationConnection:Disconnect();
    end;
end;
v7.updateAnimation = function(v12, v13)
    v12:setState(function(v14, _)
        local l_sinTime_0 = v14.sinTime;
        local l_animatingDotIndex_0 = v14.animatingDotIndex;
        local v18 = v14.time + v13;
        local v19 = math.sin(v18 * 5);
        if not (not (l_sinTime_0 >= 0) or v19 >= 0) or l_sinTime_0 < 0 and v19 >= 0 then
            l_animatingDotIndex_0 = l_animatingDotIndex_0 % 1 + 1;
        end;
        return {
            time = v18, 
            sinTime = v19, 
            animatingDotIndex = l_animatingDotIndex_0
        };
    end);
end;
lerpNum = function(v20, v21, v22)
    return v20 + (v21 - v20) * v22;
end;
v7.render = function(v23)
    local l_props_0 = v23.props;
    local l_state_0 = v23.state;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Position_0 = l_props_0.Position;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v30 = l_props_0.Size or l_props_0.Stylizer.Size;
    local v31 = l_props_0.PaddingLeft or 0;
    local v32 = Color3.new(1, 1, 1);
    local v33 = {
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(1, 0), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local v34 = math.abs(l_state_0.sinTime);
    local l_animatingDotIndex_1 = l_state_0.animatingDotIndex;
    for v36 = 1, 1 do
        local v37 = 0.5;
        if v36 == l_animatingDotIndex_1 then
            v37 = lerpNum(0.5, 0, v34);
        end;
        v33["Frame" .. v36] = v3.createElement("Frame", {
            Size = UDim2.new(0.6666666666666666, v31, 0.6666666666666666, 0), 
            LayoutOrder = v36, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v32, 
            BackgroundTransparency = 1
        }, {
            Image = v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 8, 0, 8), 
                Position = UDim2.new(0, v31, 0.5, 0), 
                Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png", 
                ImageTransparency = v37, 
                LayoutOrder = 2
            })
        });
    end;
    return v3.createElement("Frame", {
        AnchorPoint = l_AnchorPoint_0, 
        Position = l_Position_0, 
        Size = v30, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, v33);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
