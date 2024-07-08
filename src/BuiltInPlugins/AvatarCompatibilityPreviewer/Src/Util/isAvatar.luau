local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerHandleAvatarDeletion);
local function _(v3, v4, v5)
    local l_v3_FirstChild_0 = v3:FindFirstChild(v4);
    if l_v3_FirstChild_0 == nil then
        return nil;
    elseif l_v3_FirstChild_0:IsA(v5) then
        if l_v3_FirstChild_0.Archivable then
            return l_v3_FirstChild_0;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
return function(v8)
    if v8.Archivable then
        if v8:IsA("Model") then
            if not v2() or v8:IsDescendantOf(game) then
                if v8.PrimaryPart ~= nil and v8.PrimaryPart.Archivable then
                    for _, v10 in v1.LIMBS, nil, nil do
                        local l_v8_FirstChild_0 = v8:FindFirstChild(v10);
                        if not if l_v8_FirstChild_0 == nil then nil else if l_v8_FirstChild_0:IsA("BasePart") then if l_v8_FirstChild_0.Archivable then l_v8_FirstChild_0 else nil else nil then
                            return false;
                        end;
                    end;
                    local l_Humanoid_0 = v8:FindFirstChild("Humanoid");
                    if if l_Humanoid_0 == nil then nil else if l_Humanoid_0:IsA("Humanoid") then if l_Humanoid_0.Archivable then l_Humanoid_0 else nil else nil == nil then
                        return false;
                    else
                        return true;
                    end;
                else
                    return false;
                end;
            else
                return false;
            end;
        else
            return false;
        end;
    else
        return false;
    end;
end;
