return function(v0, v1)
    if not v0:IsA("BasePart") then
        if not v0:IsA("Model") then
            error("Unexpected instance type: " .. v0.ClassName);
            return ;
        else
            if v0.PrimaryPart then
                v0.PrimaryPart.PivotOffset = v0.PrimaryPart.CFrame:ToObjectSpace(v1);
            end;
            v0.WorldPivot = v1;
            return ;
        end;
    else
        v0.PivotOffset = v0.CFrame:ToObjectSpace(v1);
        return ;
    end;
end;
