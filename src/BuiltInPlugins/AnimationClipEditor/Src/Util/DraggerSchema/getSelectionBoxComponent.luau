local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
return function(v3, v4)
    if not (v4.parent.Name == v1.FOLDERS.Microbones) or not v3.VisualizeBones then
        return "SelectionBox";
    else
        if not (not v4 or not v4:FindFirstChild("Cone")) and v4.Cone.Color3 ~= v1.BONE_COLOR_SELECTED then
            v4.Cone.Color3 = v1.BONE_COLOR_HOVER;
            v4.Cone.Transparency = v1.BONE_TRANSPARENCY_HOVER;
        end;
        if not (not v4 or not v4:FindFirstChild("Sphere")) and v4.Sphere.Color3 ~= v1.BONE_COLOR_SELECTED then
            v4.Sphere.Color3 = v1.BONE_COLOR_HOVER;
            v4.Sphere.Transparency = v1.BONE_TRANSPARENCY_HOVER;
        end;
        return nil;
    end;
end;
