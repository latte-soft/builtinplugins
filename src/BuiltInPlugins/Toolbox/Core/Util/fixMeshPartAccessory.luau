local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v1)
    if v1 then
        local l_Handle_0 = v1:FindFirstChild("Handle");
        if not (not l_Handle_0 or not l_Handle_0:IsA("MeshPart")) then
            l_UGCValidationService_0:ResetCollisionFidelity(l_Handle_0);
        end;
    end;
end;
