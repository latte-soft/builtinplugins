local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.FitFrame);
local l_FitFrameVertical_0 = v3.FitFrameVertical;
local l_FitTextLabel_0 = v3.FitTextLabel;
local v6 = v2.Component:extend("FluidFitTextLabel");
v6.init = function(v7)
    v7.state = {
        frameWidth = 0
    };
    v7.resizeContainer = function(v8)
        if v7.state.frameWidth ~= v8.AbsoluteSize.X then
            v7:setState({
                frameWidth = v8.AbsoluteSize.X
            });
        end;
    end;
end;
v6.render = function(v9)
    return v2.createElement(l_FitFrameVertical_0, {
        BackgroundTransparency = 1, 
        LayoutOrder = v9.props.LayoutOrder, 
        width = UDim.new(1, 0), 
        [v2.Change.AbsoluteSize] = v9.resizeContainer
    }, {
        Text = v2.createElement(l_FitTextLabel_0, (v1.Dictionary.join(v9.props, {
            maximumWidth = v9.state.frameWidth, 
            width = UDim.new(1, 0)
        })))
    });
end;
return v6;
