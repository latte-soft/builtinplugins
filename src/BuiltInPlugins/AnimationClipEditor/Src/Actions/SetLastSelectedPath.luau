local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(script.Parent.Action);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
return v1(script.Name, function(v3)
    return {
        lastSelectedPath = v3
    };
end);
