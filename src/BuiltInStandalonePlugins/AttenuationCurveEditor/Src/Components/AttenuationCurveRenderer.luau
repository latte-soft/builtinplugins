local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v6 = require(l_Parent_0.CurveRenderer.useCurve);
local v7 = require(l_Parent_0.CurveRenderer.CurvePlot);
local v8 = require(l_Parent_0.KeypointControls);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = require(l_script_FirstAncestor_0.Src.Util.SerializationUtil);
local v11 = Vector2.new(540, 300);
local v12 = Vector2.new(2000, 2000);
return function(v13)
    local v14, v15 = l_useState_0(Vector2.one);
    local v16 = v6(v10.tableToCurve(v13.CurveData));
    local v18 = l_useCallback_0(function(v17)
        if v17 then
            v15(v17.AbsoluteSize);
        end;
    end, {});
    local v21 = l_useCallback_0(function()
        v16.save(function(v19)
            local v20 = v10.curveToTable(v19);
            if v20 ~= v13.CurveData then
                v13.OnChanged(v20);
            end;
        end);
    end, {
        v13.CurveData, 
        v13.OnChanged, 
        v16
    });
    return v13.Enabled and v2.createElement(l_Pane_0, {
        [v2.Tag] = "X-Pad X-ColumnM X-FitY"
    }, {
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MinSize = v11, 
            MaxSize = v12
        }), 
        Plot = v2.createElement(v7, {
            CurveHook = v16, 
            PlotAbsoluteSize = v14, 
            OnSizeChanged = v18, 
            OnChanged = v21
        }), 
        KeypointControls = v2.createElement(v8, {
            Keypoint = v16.getSelectedKeypoint(), 
            OnEdit = l_useCallback_0(function(v22)
                v16.update(v22, true);
                v21();
            end, {
                v16
            }), 
            OnDelete = l_useCallback_0(function()
                v16.remove();
                v21();
            end, {
                v16
            }), 
            OnReset = l_useCallback_0(function()
                v16.reset(v10.tableToCurve(v13.CurveData));
                v16.select(-1);
                v13.OnChanged(v13.CurveData);
            end, {
                v13.CurveData, 
                v13.OnChanged, 
                v16
            }), 
            OnSave = l_useCallback_0(function()
                v21();
                v16.select(1);
                v13.OnSave();
            end, {
                v13.OnSave, 
                v16
            })
        })
    });
end;
