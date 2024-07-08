local l_Parent_0 = script.Parent;
local l_l_Parent_0_FirstAncestor_0 = l_Parent_0:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_l_Parent_0_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useContext_0 = v2.useContext;
local l_useEffect_0 = v2.useEffect;
local _ = v2.useRef;
local l_useState_0 = v2.useState;
local v8 = require(l_l_Parent_0_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v8.ContextServices;
local l_Pane_0 = v8.UI.Pane;
local l_Checkbox_0 = v8.UI.Checkbox;
local _ = require(l_l_Parent_0_FirstAncestor_0.Src.Types);
local v13 = require(l_Parent_0.EqAnalyzerCurve);
local v14 = require(l_Parent_0.EqPlot);
local v15 = require(l_Parent_0.useEq);
local v16 = Vector2.new(540, 300);
local v17 = Vector2.new(2000, 2000);
return function(v18)
    local v19 = l_useContext_0(l_ContextServices_0.Context.Consumer)[l_ContextServices_0.Localization.Key];
    local v20, v21 = l_useState_0(Vector2.one);
    local v23 = v15(v18.EqData, (l_useCallback_0(function(v22)
        if v22 ~= v18.EqData then
            v18.OnChanged(v22);
        end;
    end, {
        v18.OnChanged
    })));
    l_useEffect_0(function()
        v23.reset(v18.EqData);
    end, {
        v18.EqData
    });
    return v18.Enabled and v2.createElement(l_Pane_0, {
        Size = UDim2.fromScale(1, 1), 
        [v2.Tag] = "X-Pad X-ColumnM X-FitY"
    }, {
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MinSize = v16, 
            MaxSize = v17
        }), 
        Controls = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, 50), 
            LayoutOrder = 1, 
            [v2.Tag] = "X-RowM"
        }, {
            Bypass = v2.createElement(l_Checkbox_0, {
                Text = v19:getText("Label", "Bypass"), 
                Checked = v23.bypass, 
                OnClick = l_useCallback_0(function()
                    v23.setBypass(not v23.bypass);
                end, {
                    v23
                })
            }), 
            AnalysisEnabled = v2.createElement(l_Checkbox_0, {
                Text = v19:getText("Label", "EnableAnalyzer"), 
                Checked = v18.AnalysisEnabled, 
                OnClick = l_useCallback_0(function()
                    v18.SetAnalysisEnabled(not v18.AnalysisEnabled);
                end, {
                    v18.AnalysisEnabled, 
                    v18.SetAnalysisEnabled
                })
            })
        }), 
        Canvas = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -60), 
            LayoutOrder = 2
        }, {
            Plot = v2.createElement(v14, {
                EqHook = v23, 
                PlotAbsoluteSize = v20, 
                OnSizeChanged = l_useCallback_0(function(v24)
                    if v24 then
                        v21(v24.AbsoluteSize);
                    end;
                end, {})
            }), 
            Analyzer = v2.createElement(v13, {
                Enabled = v18.AnalysisEnabled, 
                PlotAbsoluteSize = v20
            })
        })
    });
end;
