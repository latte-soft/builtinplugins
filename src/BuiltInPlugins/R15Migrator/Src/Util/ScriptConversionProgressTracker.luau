local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetReplaceProgress);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetProgressBarMessageKey);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6, v7)
    local v8 = setmetatable({}, v4);
    v8._dispatchSetProgress = function(v9)
        v7:dispatch(v2(v9));
    end;
    v8._dispatchSetMessage = function(v10)
        v7:dispatch(v3(v10));
    end;
    v8._dispatchSetMessage(v5);
    v8._progress = -1;
    v8._targetProgress = math.max(v6, 1);
    v8:updateProgress();
    return v8;
end;
v4.updateProgress = function(v11)
    v11._progress = v11._progress + 1;
    v11._dispatchSetProgress(v11._progress / v11._targetProgress);
end;
v4.clearProgressBar = function(v12)
    v12._dispatchSetProgress(v1.None);
end;
return v4;
