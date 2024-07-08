local v0 = require(script.Parent.Parent.Parent.Packages.DraggerFramework.Utility.classifyPivot);
return function(v1)
    if not v1:IsA("BasePart") then
        if not v1:IsA("Model") then
            return "None";
        else
            local l_v1_BoundingBox_0, v3 = v1:GetBoundingBox();
            local l_v1_Pivot_0 = v1:GetPivot();
            return v0(l_v1_Pivot_0, l_v1_Pivot_0:ToObjectSpace(l_v1_BoundingBox_0).Position, v3);
        end;
    else
        return v0(v1.CFrame, v1.PivotOffset.Position, v1.Size);
    end;
end;
