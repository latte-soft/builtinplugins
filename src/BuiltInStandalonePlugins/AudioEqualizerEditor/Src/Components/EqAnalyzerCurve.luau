local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v7 = require(l_Parent_0.Path2DWrapper);
local v8 = require(l_script_FirstAncestor_0.Src.Util.AnalyzerUtil);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Path2DUtil);
local v10 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
local v11 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFIntAudioEqualizerEditorAnalyzerResolution();
local function _(v12)
    if v12 < 1.0E-4 then
        return -80;
    else
        return (20 * math.log(v12)) * 0.4342944819;
    end;
end;
local function v16(v14, v15)
    return v9.makeControlPoint((v10.plotToAbs(v14, v15)));
end;
return function(v17)
    local v18, v19 = l_useState_0({});
    l_useEffect_0(function()
        if v17.Enabled then
            v8.startAnalyzing(v19);
            return function()
                v8.stopAnalyzing();
            end;
        else
            return ;
        end;
    end, {
        v17.Enabled
    });
    return v17.Enabled and v2.createElement(l_Pane_0, {
        Position = UDim2.new(0, 50, 0, 50), 
        Size = UDim2.new(1, -100, 1, -100), 
        BackgroundTransparency = 1
    }, {
        Curve = v2.createElement(v7, {
            ControlPoints = not not v17.Enabled and l_useMemo_0(function()
                local v20 = {};
                local v21 = #v18;
                for v22 = 0, v11 do
                    local l_X_0 = v10.viewToPlot(Vector2.new(v22 / v11, 0)).X;
                    local v24 = (v21 * l_X_0) / 24000;
                    local v25 = 0;
                    if v21 > 0 then
                        v25 = v18[v21];
                        if v24 < v21 then
                            v25 = v18[math.floor(v24) + 1] * (1 - v24 % 1) + v18[math.floor(v24) + 2] * (v24 % 1);
                        end;
                        v25 = v25 * 3;
                    end;
                    local l_v25_0 = v25;
                    v25 = l_v25_0 < 1.0E-4 and -80 or (20 * math.log(l_v25_0)) * 0.4342944819;
                    if v10.X_MIN <= l_X_0 and l_X_0 <= v10.X_MAX then
                        table.insert(v20, v16(Vector2.new(l_X_0, v25), v17.PlotAbsoluteSize));
                    end;
                end;
                return v20;
            end, {
                v18
            }) or l_useMemo_0(function()
                return {
                    v9.makeControlPoint((v10.plotToAbs(Vector2.new(v10.X_MIN, v10.Y_MIN), v17.PlotAbsoluteSize))), 
                    v16(Vector2.new(v10.X_MAX, v10.Y_MIN), v17.PlotAbsoluteSize)
                };
            end, {}), 
            Tag = "AnalyzerCurve"
        })
    });
end;
