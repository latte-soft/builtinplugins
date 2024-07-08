local v0 = require(script:FindFirstAncestor("Toolbox").Packages.Roact);
local v1 = v0.PureComponent:extend("ClickToShowInteractiveStoryWrapper");
v1.init = function(v2)
    v2.state = {
        isShowing = not not v2.props.IsShownByDefault and v2.props.IsShownByDefault
    };
    v2.toggleIsShowing = function()
        v2:setState(function(v3)
            return {
                isShowing = not v3.isShowing
            };
        end);
    end;
end;
v1.render = function(v4)
    local l_props_0 = v4.props;
    local l_state_0 = v4.state;
    return v0.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        Button = v0.createElement("TextButton", {
            Size = UDim2.fromOffset(200, 50), 
            Text = "Click to View Component", 
            [v0.Event.Activated] = v4.toggleIsShowing
        }), 
        SearchOption = if not l_state_0.isShowing then nil else l_props_0.OnRender(l_state_0.isShowing, v4.toggleIsShowing)
    });
end;
return v1;
