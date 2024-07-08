local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Util.Constants);
local l_Pane_0 = v3.UI.Pane;
local v9 = v4.Component:extend("LoadingBar");
v9.init = function(v10, _)
    v10:setState({
        progress = 0, 
        time = 0
    });
end;
v9.loadUntil = function(v12, v13)
    while v12.state.progress < v13 do
        local v14 = l_RunService_0.RenderStepped:Wait();
        if v12.isMounted then
            local v15 = v12.state.time + v14;
            v12:setState({
                time = v15, 
                progress = v15 / v12.props.loadingTime
            });
        else
            break;
        end;
    end;
end;
v9.didMount = function(v16)
    v16.isMounted = true;
    spawn(function()
        v16:loadUntil(v16.props.holdPercent);
        while v16.isMounted and v16.props.onFinish == nil do
            l_RunService_0.RenderStepped:Wait();
        end;
        v16:loadUntil(1);
        v16:loadUntil(1.5);
        if v16.isMounted then
            v16.props.onFinish();
        end;
    end);
end;
v9.willUnmount = function(v17)
    v17.isMounted = false;
end;
v9.render = function(v18)
    local l_props_0 = v18.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v21 = math.min(math.max(v18.state.progress, 0), 1);
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = l_props_0.Position
    }, {
        LoadingTitle = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v7.FONT, 
            Position = UDim2.new(0, 0, 0, -30), 
            Size = UDim2.new(1, 0, 0, 20), 
            Text = l_props_0.loadingText .. " ( " .. math.floor(v21 * 100 + 0.5) .. "% )", 
            TextColor3 = l_Stylizer_0.loading.text, 
            TextSize = v7.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        LoadingBackgroundBar = v4.createElement(l_Pane_0, {
            Style = "BorderBox"
        }, {
            LoadingBar = v4.createElement(l_Pane_0, {
                Style = "Box", 
                BackgroundColor = l_Stylizer_0.loading.bar, 
                Size = UDim2.new(v21, 0, 1, 0)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
