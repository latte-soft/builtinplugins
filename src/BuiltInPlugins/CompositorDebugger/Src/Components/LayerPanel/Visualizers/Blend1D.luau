local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Framework).Dash.join;
local v3 = require(script.Parent.BlendBase);
local v4 = v1.PureComponent:extend("Blend1DVisualization");
v4.render = function(v5)
    return v1.createElement(v3, l_join_0(v5.props, {
        Show2D = false, 
        Stylizer = v5.props.Stylizer.Blend
    }));
end;
return v4;
