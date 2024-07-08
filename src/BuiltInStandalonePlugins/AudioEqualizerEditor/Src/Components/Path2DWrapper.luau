local _ = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Pane_0 = v3.UI.Pane;
local _ = v3.Styling.joinTags;
local v6 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
local _ = require(l_script_FirstAncestor_0.Src.Util.Path2DUtil);
local v8 = v2.Component:extend("Path2DWrapper");
v8.init = function(v9)
    v9.pathContainerRef = v2.createRef();
    v9.setControlPoints = function()
        if v6.getFFlagPath2DEnabled() then
            local v10 = v6.getFIntPath2DMaxControlPointLimit() - 1;
            local v11 = v9.pathContainerRef:getValue();
            if v11 then
                local v12 = 1;
                for _, v14 in v11:GetChildren() do
                    local v15 = {};
                    local v16 = #v9.props.ControlPoints;
                    for v17 = v12, (v12 + v10) - 1 do
                        if v16 >= v17 then
                            table.insert(v15, v9.props.ControlPoints[v17]);
                        else
                            break;
                        end;
                    end;
                    v14:SetControlPoints(v15);
                    v12 = v12 + (v10 - 1);
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v8.render = function(v18)
    local v19 = v6.getFIntPath2DMaxControlPointLimit() - 1;
    local v20 = "";
    if v18.props.Tag then
        v20 = v18.props.Tag;
    end;
    local v21 = {};
    for _ = 2, #v18.props.ControlPoints, v19 - 1 do
        table.insert(v21, v2.createElement("Path2D", {
            [v2.Tag] = v20
        }));
    end;
    return v6.getFFlagPath2DEnabled() and v2.createElement(l_Pane_0, {
        ref = v18.pathContainerRef, 
        Size = UDim2.fromScale(1, 1)
    }, v21);
end;
v8.didMount = function(v23)
    v23.setControlPoints();
end;
v8.didUpdate = function(v24)
    v24.setControlPoints();
end;
return v8;
