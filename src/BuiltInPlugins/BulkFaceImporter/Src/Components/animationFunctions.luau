return {
    attachAnimation = function(v0)
        local l_RunService_0 = game:GetService("RunService");
        local l_Selection_0 = game:GetService("Selection");
        if not l_RunService_0:IsRunning() then
            print("Animation will be played only in Play mode.");
            return ;
        else
            for _, v4 in pairs(l_Selection_0:Get()) do
                local l_Humanoid_0 = v4:FindFirstChild("Humanoid");
                if l_Humanoid_0 ~= nil then
                    local l_Head_0 = v4:FindFirstChild("Head");
                    if not (not (l_Head_0 ~= nil) or not l_Head_0:IsA("MeshPart")) then
                        l_Head_0.Anchored = false;
                    end;
                    local l_Animator_0 = l_Humanoid_0:FindFirstChildOfClass("Animator");
                    if l_Animator_0 then
                        for _, v9 in pairs((l_Animator_0:GetPlayingAnimationTracks())) do
                            v9:Stop();
                        end;
                        local l_Animation_0 = Instance.new("Animation");
                        l_Animation_0.AnimationId = string.format("rbxassetid://%s", v0);
                        local v11 = l_Animator_0:LoadAnimation(l_Animation_0);
                        v11.Looped = true;
                        v11:Play();
                    end;
                end;
            end;
            return ;
        end;
    end
};
