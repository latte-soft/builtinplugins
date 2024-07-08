local v0 = require(script.Parent.Action);
local v1 = require(script.Parent.Parent.Util.Constants);
return v0(script.Name, function(v2)
    return {
        reduceKeyframesDialogMode = v2 or v1.REDUCE_KEYFRAMES_DIALOG_MODE.Hidden
    };
end);
