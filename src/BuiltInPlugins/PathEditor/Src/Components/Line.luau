local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v3.ContextServices.withContext;
local l_Stylizer_0 = v3.Style.Stylizer;
local v6 = v2.Component:extend("Line");
v6.defaultProps = {
    Position = UDim2.new(), 
    Transparency = 0
};
v6.init = function(v7)
    v7.pathRefs = {};
    for v8 = 1, 5 do
        v7.pathRefs[v8] = v2.createRef();
    end;
    v7.setControlPoints = function()
        for v9 = 1, 5 do
            local v10 = v7.pathRefs[v9]:getValue();
            if v10 then
                v10:SetControlPoints(v7.props.ControlPoints);
            end;
        end;
    end;
end;
v6.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_1 = v11.props.Stylizer;
    local v14 = not l_props_0.ZIndex and 1 or l_props_0.ZIndex;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        ZIndex = l_props_0.ZIndex, 
        Position = l_props_0.Position
    }, {
        Foreground = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v14
        }, {
            ForegroundLine = v2.createElement("Path2D", {
                Color3 = l_props_0.Color or l_Stylizer_1.Color, 
                Thickness = l_props_0.Thickness or l_Stylizer_1.Thickness, 
                ref = v11.pathRefs[1], 
                Transparency = l_Stylizer_1.Transparency or l_props_0.Transparency
            })
        }), 
        Background = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = v14 - 1
        }, {
            ContrastPath = l_Stylizer_1.ContrastColor and v2.createElement("Path2D", {
                Color3 = l_Stylizer_1.ContrastColor, 
                Thickness = (l_props_0.Thickness or l_Stylizer_1.Thickness) + 1, 
                ref = v11.pathRefs[2], 
                Transparency = l_Stylizer_1.Transparency or l_props_0.Transparency
            })
        })
    });
end;
v6.didMount = function(v15)
    v15.setControlPoints();
end;
v6.didUpdate = function(v16)
    v16.setControlPoints();
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v6));
