local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v9(v6)
    local v7 = v6:FindFirstChildWhichIsA("Humanoid") or v6:FindFirstChildWhichIsA("AnimationController");
    assert(v7 ~= nil, "AnimateTarget must have either a Humanoid or an AnimationController");
    local l_Animator_0 = v7:FindFirstChildWhichIsA("Animator");
    if l_Animator_0 == nil then
        l_Animator_0 = Instance.new("Animator");
        l_Animator_0.Parent = v7;
    end;
    return l_Animator_0;
end;
local function v15(v10)
    for _, v12 in v10:GetDescendants() do
        if not v12:IsA("Motor6D") then
            if v12:IsA("FaceControls") then
                for _, v14 in v4.FACE_CONTROLS_PROPERTIES, nil, nil do
                    v12[v14] = 0;
                end;
            end;
        else
            v12.CurrentAngle = 0;
            v12.Transform = CFrame.new();
        end;
    end;
end;
local function _(v16, v17)
    if not l_RunService_0:IsRunning() then
        v16:StepAnimations(v17);
        return ;
    else
        return ;
    end;
end;
return function(v19, v20, v21, v22)
    local v23, v24 = v3.useState(nil);
    local v25, v26 = v3.useState(nil);
    v3.useEffect(function()
        if v19 == nil then
            v26(nil);
            return nil;
        else
            assert(v19 ~= nil, v4.LUAU_ANALYZE_ERROR);
            if not v19:IsDescendantOf(game) then
                local v27 = v19.AncestryChanged:Connect(function()
                    if not v19:IsDescendantOf(game) then
                        v26(nil);
                        return ;
                    else
                        v26(v19);
                        return ;
                    end;
                end);
                return function()
                    v27:Disconnect();
                end;
            else
                v26(v19);
                return nil;
            end;
        end;
    end, {
        v19
    });
    v3.useEffect(function()
        v24(nil);
        if v25 == nil then
            return nil;
        else
            assert(v25 ~= nil, v4.LUAU_ANALYZE_ERROR);
            if v25:IsDescendantOf(game) then
                local l_Animation_0 = Instance.new("Animation");
                l_Animation_0.AnimationId = ("rbxassetid://%*"):format(v20);
                local v29 = v9(v25);
                local v30 = nil;
                local v31 = task.spawn(function()
                    l_ContentProvider_0:PreloadAsync({
                        l_Animation_0
                    });
                    v30 = v29:LoadAnimation(l_Animation_0);
                    v30.Looped = true;
                    v30:Play();
                    v24(v30);
                end);
                return function()
                    task.cancel(v31);
                    if v30 ~= nil then
                        v30:Stop(0);
                        v30:Destroy();
                    end;
                    local l_v29_0 = v29;
                    if not l_RunService_0:IsRunning() then
                        l_v29_0:StepAnimations(0);
                    end;
                    v15(v25);
                end;
            else
                return nil;
            end;
        end;
    end, {
        v25 or 0, 
        v20 or 0
    });
    v3.useEffect(function()
        if not (v19 ~= nil) or v23 == nil then
            return ;
        else
            assert(v19 ~= nil, v4.LUAU_ANALYZE_ERROR);
            local v33 = v9(v19);
            if v22 == nil then
                local v36 = l_RunService_0.Heartbeat:Connect(function(v34)
                    local l_v33_0 = v33;
                    if not l_RunService_0:IsRunning() then
                        l_v33_0:StepAnimations(v34);
                    end;
                    if v21 ~= nil then
                        v21(v23.TimePosition / v23.Length);
                    end;
                end);
                return function()
                    v36:Disconnect();
                end;
            else
                v23:Stop(0);
                v23:Play();
                local v37 = v22 * v23.Length;
                if not l_RunService_0:IsRunning() then
                    v33:StepAnimations(v37);
                end;
                return nil;
            end;
        end;
    end, {
        v19, 
        v23, 
        v22, 
        v21
    });
    return v23;
end;
