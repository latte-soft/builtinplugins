local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local l_UI_0 = require(l_Packages_0.Framework).UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local v7 = v3.Component:extend("LoadingBarWrapper");
v7.init = function(v8, _)
    v8:setState({
        progress = 0, 
        time = 0
    });
end;
v7.loadUntil = function(v10, v11)
    while v10.state.progress < v11 do
        local v12 = l_RunService_0.RenderStepped:Wait();
        if v10.isMounted then
            local v13 = v10.state.time + v12;
            v10:setState({
                time = v13, 
                progress = v13 / v10.props.loadingTime
            });
        else
            break;
        end;
    end;
end;
v7.didMount = function(v14)
    v14.isMounted = true;
    spawn(function()
        v14:loadUntil(v14.props.holdPercent);
        while v14.isMounted and v14.props.onFinish == nil do
            l_RunService_0.RenderStepped:Wait();
        end;
        v14:loadUntil(1);
        v14:loadUntil(1.5);
        if v14.isMounted then
            v14.props.onFinish();
        end;
    end);
end;
v7.willUnmount = function(v15)
    v15.isMounted = false;
end;
v7.render = function(v16)
    local l_props_0 = v16.props;
    local v18 = math.min(math.max(v16.state.progress, 0), 1);
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = l_props_0.Position
    }, {
        LoadingTitle = v3.createElement(l_TextLabel_0, {
            Position = UDim2.new(0, 0, 0, -30), 
            Size = UDim2.new(1, 0, 0, 20), 
            Text = l_props_0.loadingText .. " ( " .. math.floor(v18 * 100 + 0.5) .. "% )", 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        LoadingBar = v3.createElement(l_LoadingBar_0, {
            Progress = v18, 
            Size = UDim2.new(1, 0, 1, 0)
        })
    });
end;
return v7;
