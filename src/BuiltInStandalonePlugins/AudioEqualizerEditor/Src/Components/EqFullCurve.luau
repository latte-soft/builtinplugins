local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_Parent_0.Path2DWrapper);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Path2DUtil);
local v7 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v8)
    return v2.createElement("CanvasGroup", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Curve = v2.createElement(v5, {
            ControlPoints = l_useMemo_0(function()
                local v9 = {};
                local function _(v10, v11)
                    return v7.plotToAbs(Vector2.new(v10, v11), v8.PlotAbsoluteSize);
                end;
                local function _(v13, v14, v15)
                    table.insert(v9, v6.makeControlPoint(v13, v14, v15));
                end;
                local v17 = v7.plotToAbs(Vector2.new(v7.X_MIN, v8.EqHook.lowGain), v8.PlotAbsoluteSize);
                local v18 = v7.plotToAbs(Vector2.new(v8.EqHook.lowThreshold / 1.5, v8.EqHook.lowGain), v8.PlotAbsoluteSize);
                local v19 = v7.plotToAbs(Vector2.new(v8.EqHook.lowThreshold * 1.5, v8.EqHook.midGain), v8.PlotAbsoluteSize);
                local v20 = v7.plotToAbs(Vector2.new(v8.EqHook.highThreshold / 1.5, v8.EqHook.midGain), v8.PlotAbsoluteSize);
                local v21 = v7.plotToAbs(Vector2.new(v8.EqHook.highThreshold * 1.5, v8.EqHook.highGain), v8.PlotAbsoluteSize);
                local v22 = v7.plotToAbs(Vector2.new(v7.X_MAX, v8.EqHook.highGain), v8.PlotAbsoluteSize);
                local v23 = Vector2.new((v19.X - v18.X) / 2, 0);
                local v24 = Vector2.new(-(v19.X - v18.X) / 2, 0);
                local v25 = Vector2.new((v21.X - v20.X) / 2, 0);
                local v26 = Vector2.new(-(v21.X - v20.X) / 2, 0);
                if v17.X < v18.X then
                    table.insert(v9, v6.makeControlPoint(v17, nil, nil));
                end;
                table.insert(v9, v6.makeControlPoint(v18, Vector2.new(0, 0), v23));
                if v20.X < v19.X then
                    local v27 = (v19.X - v20.X) / (v19.X - v18.X);
                    local v28 = (v18 + v21) / 2;
                    local v29 = 0.25 * ((v21 + v26) - v28);
                    local v30 = Vector2.new(v28.X, v19.Y) * (1 - v27) + v28 * v27;
                    local v31 = v25 * (1 - v27) + v29 * v27;
                    table.insert(v9, v6.makeControlPoint(v30, -v31, v31));
                else
                    table.insert(v9, v6.makeControlPoint(v19, v24, (Vector2.new(0, 0))));
                    table.insert(v9, v6.makeControlPoint(v20, Vector2.new(0, 0), v25));
                end;
                table.insert(v9, v6.makeControlPoint(v21, v26, (Vector2.new(0, 0))));
                if v21.X < v22.X then
                    table.insert(v9, v6.makeControlPoint(v22, nil, nil));
                end;
                return v9;
            end, {
                v8.EqHook, 
                v8.PlotAbsoluteSize
            }), 
            Tag = not v8.Enabled and "FullCurveDisabled" or "FullCurve"
        })
    });
end;
