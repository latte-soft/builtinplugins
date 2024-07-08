local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_script_FirstAncestor_0.Src.Util.RigVisualization);
local _ = require(l_DraggerFramework_0.Utility.Math);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local function _(v8, v9, v10)
    return (v9:IsDescendantOf(v8) and v9:IsA("BasePart")) and v10[v9.Name] ~= nil;
end;
return function(v12, v13, v14)
    if v12.RootInstance then
        local v15 = nil;
        local v16 = nil;
        local v17 = RaycastParams.new();
        v17.FilterType = Enum.RaycastFilterType.Blacklist;
        v17.FilterDescendantsInstances = {
            v4.findRootPart(v12.RootInstance)
        };
        v17.BruteForceAllSlow = true;
        local v18 = l_Workspace_0:Raycast(v13.Origin, v13.Direction, v17);
        if v18 then
            v15 = v18.Instance;
            v16 = v18.Distance;
            v17.FilterType = Enum.RaycastFilterType.Whitelist;
            v17.FilterDescendantsInstances = v14;
            local v19 = l_Workspace_0:raycast(v13.Origin, v13.Direction, v17);
            if not (not v19 or not v19.Position:FuzzyEq(v18.Position)) then
                v15 = v19.Instance;
            end;
        end;
        local v20 = v12:gizmoRaycast(v13.Origin, v13.Direction, RaycastParams.new());
        if v20 and (v12:shouldDrawConstraintsOnTop() or v18 and v20.Distance < v18.Distance) then
            v15 = v20.Instance;
            v16 = v20.Distance;
        end;
        if v12.VisualizeBones then
            local v21, v22 = v5.getBoneHit(v13, v12.RootInstance);
            if v21 then
                return v21, v21, v22;
            end;
        end;
        if not v15 then
            return nil;
        else
            local l_v15_0 = v15;
            local v24 = v4.getRigInfo(v12.RootInstance);
            local l_PartNameToMotor_0 = v24.PartNameToMotor;
            local _ = v24.BoneNameToBone;
            local v27 = (l_v15_0:IsDescendantOf(v12.RootInstance) and l_v15_0:IsA("BasePart")) and l_PartNameToMotor_0[l_v15_0.Name] ~= nil;
            if not l_v15_0 or not v27 then
                return ;
            else
                return l_v15_0, v15, v16;
            end;
        end;
    else
        return nil;
    end;
end;
