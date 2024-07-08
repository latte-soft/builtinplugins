local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Src.Actions.SetPreviewVisible);
local v6 = v3.PureComponent:extend("HoverPreviewEnabler");
v6.init = function(v7)
    v7.mouseMoved = function()
        if not v7.props.previewVisible then
            v7.props.setPreviewVisible(true);
        end;
    end;
    v7.mouseLeave = function()
        v7.props.setPreviewVisible(false);
    end;
end;
v6.didMount = function(v8)
    local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
    l_RunService_0:BindToRenderStep("getMouseLocation", 1, function()
        local l_l_UserInputService_0_MouseLocation_1 = l_UserInputService_0:GetMouseLocation();
        if not (not (l_l_UserInputService_0_MouseLocation_0 ~= l_l_UserInputService_0_MouseLocation_1) or not v8.props.previewVisible) then
            v8.props.setPreviewVisible(false);
        end;
        l_l_UserInputService_0_MouseLocation_0 = l_l_UserInputService_0_MouseLocation_1;
    end);
end;
v6.willUnmount = function(v11)
    v11.mouseLeave();
    l_RunService_0:UnbindFromRenderStep("getMouseLocation");
end;
v6.render = function(v12)
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        [v3.Event.MouseMoved] = v12.mouseMoved, 
        [v3.Event.MouseLeave] = v12.mouseLeave
    }, v12.props[v3.Children]);
end;
return v4.connect(function(v13, _)
    return {
        previewVisible = v13.previewVisible
    };
end, function(v15)
    return {
        setPreviewVisible = function(v16)
            v15(v5(v16));
        end
    };
end)(v6);
