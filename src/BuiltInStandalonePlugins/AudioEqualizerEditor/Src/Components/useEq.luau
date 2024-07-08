local _ = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = v2.join;
local _ = v2.copy;
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v5.useCallback;
local l_useEffect_0 = v5.useEffect;
local _ = v5.useRef;
local l_useState_0 = v5.useState;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
local l_X_MIN_0 = v11.X_MIN;
local l_X_MAX_0 = v11.X_MAX;
local l_Y_MIN_0 = v11.Y_MIN;
local l_Y_MAX_0 = v11.Y_MAX;
return function(v16, v17)
    local v18, v19 = l_useState_0(v16.LowGain);
    local v20, v21 = l_useState_0(v16.MidGain);
    local v22, v23 = l_useState_0(v16.HighGain);
    local v24, v25 = l_useState_0(v16.MidRange.Min);
    local v26, v27 = l_useState_0(v16.MidRange.Max);
    local v28, v29 = l_useState_0(v16.Bypass);
    local v30, v31 = l_useState_0(false);
    l_useEffect_0(function()
        if v30 then
            v17({
                LowGain = v18, 
                MidGain = v20, 
                HighGain = v22, 
                MidRange = NumberRange.new(v24, v26), 
                Bypass = v28
            });
            return ;
        else
            v31(true);
            return ;
        end;
    end, {
        v18, 
        v20, 
        v22, 
        v24, 
        v26, 
        v28
    });
    return {
        lowGain = v18, 
        midGain = v20, 
        highGain = v22, 
        lowThreshold = v24, 
        highThreshold = v26, 
        bypass = v28, 
        setLowGain = l_useCallback_0(function(v32)
            v19((math.clamp(v32, l_Y_MIN_0, l_Y_MAX_0)));
        end, {}), 
        setMidGain = l_useCallback_0(function(v33)
            v21((math.clamp(v33, l_Y_MIN_0, l_Y_MAX_0)));
        end, {}), 
        setHighGain = l_useCallback_0(function(v34)
            v23((math.clamp(v34, l_Y_MIN_0, l_Y_MAX_0)));
        end, {}), 
        setLowThreshold = l_useCallback_0(function(v35)
            v25((math.clamp(v35, l_X_MIN_0, l_X_MAX_0)));
        end, {}), 
        setHighThreshold = l_useCallback_0(function(v36)
            v27((math.clamp(v36, l_X_MIN_0, l_X_MAX_0)));
        end, {}), 
        setBypass = l_useCallback_0(function(v37)
            v29(v37);
        end, {}), 
        reset = l_useCallback_0(function(v38)
            v19(v38.LowGain);
            v21(v38.MidGain);
            v23(v38.HighGain);
            v25(v38.MidRange.Min);
            v27(v38.MidRange.Max);
            v29(v38.Bypass);
        end, {})
    };
end;
