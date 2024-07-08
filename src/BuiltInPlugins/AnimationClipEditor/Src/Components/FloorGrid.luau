local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v6 = require(l_Util_0.Constants);
local _ = require(l_Util_0.RigUtils);
local v8 = require(l_Util_0.RigInfo);
local v9 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagGridSpeed);
local v10 = v2.PureComponent:extend("FloorGrid");
v10.renderLine = function(_, v12, v13, v14, v15)
    return v2.createElement("LineHandleAdornment", {
        Thickness = 2, 
        Color = v12.lineColor, 
        Adornee = v13, 
        Length = v15, 
        CFrame = v14
    });
end;
v10.renderLines = function(v16, v17, v18, v19)
    local l_props_0 = v16.props;
    local l_v18_ExtentsSize_0 = v18:GetExtentsSize();
    local v22 = math.max(l_v18_ExtentsSize_0.X, l_v18_ExtentsSize_0.Z) + 3;
    local v23 = v22 / 10;
    local v24 = Vector3.new(0, -(l_v18_ExtentsSize_0.Y * 0.5 + (v19.Position.Y - v18:GetModelCFrame().p.Y)), 0);
    local v25 = (l_props_0.Speed * l_props_0.Playhead) / v6.TICK_FREQUENCY;
    local v26 = {};
    for v27 = -5, 5 do
        table.insert(v26, v16:renderLine(v17, v19, CFrame.new(v24 + Vector3.new(v27 * v23, 0, if not v9() then v22 / 2 else v22 / 2 + v25 % v23)), v22));
    end;
    for v28 = -5, 5 do
        table.insert(v26, v16:renderLine(v17, v19, CFrame.new(v24 + Vector3.new(v22 / 2, 0, if not v9() then v28 * v23 else v28 * v23 + v25 % v23)) * CFrame.Angles(0, 1.5707963267948966, 0), v22));
    end;
    return v26;
end;
v10.render = function(v29)
    local l_props_1 = v29.props;
    local l_gridTheme_0 = l_props_1.Stylizer.gridTheme;
    local v32 = l_props_1.Container or l_CoreGui_0;
    local l_RootInstance_0 = l_props_1.RootInstance;
    local v34 = l_RootInstance_0 and v8.findRootPart(l_RootInstance_0);
    if not v34 then
        return ;
    else
        return v2.createElement(v2.Portal, {
            target = v32
        }, {
            GridLines = v2.createElement("Folder", {}, (v29:renderLines(l_gridTheme_0, l_RootInstance_0, v34)))
        });
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
