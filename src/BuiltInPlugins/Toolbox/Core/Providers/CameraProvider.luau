local v0 = require(script.Parent.Parent.Parent.Packages.Roact);
local v1 = v0.PureComponent:extend("CameraProvider");
v1.render = function(v2)
    return v0.oneChild(v2.props[v0.Children]);
end;
return v1;
