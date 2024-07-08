local l_Workspace_0 = game:GetService("Workspace");
return function(v1, v2, v3)
    if v1 then
        if not ((v1:IsA("Attachment") or v1:IsA("Constraint")) or v1:IsA("WeldConstraint")) and not v1:IsA("NoCollisionConstraint") then
            local l_Parent_0 = v1.Parent;
            local v5 = v3[l_Parent_0];
            if not v5 then
                if not v1:IsA("BasePart") then
                    if not (v1:IsA("Model") or v1:IsA("Tool")) then
                        return nil;
                    end;
                elseif v1.Locked then
                    return nil;
                end;
                if v1.name == "HumanoidRootPart" then
                    return nil;
                elseif not v2 then
                    local l_v1_0 = v1;
                    local l_l_Parent_0_0 = l_Parent_0;
                    while l_l_Parent_0_0 do
                        if not (not l_l_Parent_0_0:IsA("Model") and not l_l_Parent_0_0:IsA("Tool")) and l_l_Parent_0_0 ~= l_Workspace_0 then
                            l_v1_0 = l_l_Parent_0_0;
                        end;
                        l_l_Parent_0_0 = l_l_Parent_0_0.Parent;
                    end;
                    if l_v1_0 ~= v1 then
                        v3[l_Parent_0] = l_v1_0;
                    end;
                    return l_v1_0;
                else
                    return v1;
                end;
            else
                return v5;
            end;
        else
            return v1;
        end;
    else
        return nil;
    end;
end;
