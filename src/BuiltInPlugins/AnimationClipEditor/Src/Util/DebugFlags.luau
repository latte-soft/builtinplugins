local l_Workspace_0 = game:GetService("Workspace");
local v1 = pcall(function()
    return game:GetService("ProcessService");
end);
local function _(v2, v3)
    v3 = v3 or false;
    return function()
        local l_AnimationClipEditorFlags_0 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if l_AnimationClipEditorFlags_0 and l_AnimationClipEditorFlags_0:FindFirstChild(v2) then
            return l_AnimationClipEditorFlags_0[v2].Value;
        else
            return v3;
        end;
    end;
end;
local v6 = {};
local v7 = nil or false;
local v8 = "RunTests";
local l_v8_0 = v8 --[[ copy: 6 -> 7 ]];
local v10;
do
    local l_v7_0 = v7;
    v10 = function()
        local l_AnimationClipEditorFlags_1 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if l_AnimationClipEditorFlags_1 and l_AnimationClipEditorFlags_1:FindFirstChild(l_v8_0) then
            return l_AnimationClipEditorFlags_1[l_v8_0].Value;
        else
            return l_v7_0;
        end;
    end;
end;
v6.RunTests = v10;
v7 = nil or false;
v8 = "RunRhodiumTests";
local l_v8_1 = v8 --[[ copy: 6 -> 8 ]];
do
    local l_v7_1 = v7;
    v10 = function()
        local l_AnimationClipEditorFlags_2 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if l_AnimationClipEditorFlags_2 and l_AnimationClipEditorFlags_2:FindFirstChild(l_v8_1) then
            return l_AnimationClipEditorFlags_2[l_v8_1].Value;
        else
            return l_v7_1;
        end;
    end;
end;
v6.RunRhodiumTests = v10;
v7 = nil or false;
v8 = "LogRoduxEvents";
local l_v8_2 = v8 --[[ copy: 6 -> 9 ]];
do
    local l_v7_2 = v7;
    v10 = function()
        local l_AnimationClipEditorFlags_3 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if l_AnimationClipEditorFlags_3 and l_AnimationClipEditorFlags_3:FindFirstChild(l_v8_2) then
            return l_AnimationClipEditorFlags_3[l_v8_2].Value;
        else
            return l_v7_2;
        end;
    end;
end;
v6.LogRoduxEvents = v10;
v7 = nil or false;
v8 = "LogAnalytics";
local l_v8_3 = v8 --[[ copy: 6 -> 10 ]];
do
    local l_v7_3 = v7;
    v10 = function()
        local l_AnimationClipEditorFlags_4 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if l_AnimationClipEditorFlags_4 and l_AnimationClipEditorFlags_4:FindFirstChild(l_v8_3) then
            return l_AnimationClipEditorFlags_4[l_v8_3].Value;
        else
            return l_v7_3;
        end;
    end;
end;
v6.LogAnalytics = v10;
v7 = v1 or false;
v8 = "RunningUnderCLI";
do
    local l_v7_4 = v7;
    v10 = function()
        local l_AnimationClipEditorFlags_5 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if l_AnimationClipEditorFlags_5 and l_AnimationClipEditorFlags_5:FindFirstChild(v8) then
            return l_AnimationClipEditorFlags_5[v8].Value;
        else
            return l_v7_4;
        end;
    end;
end;
v6.RunningUnderCLI = v10;
return v6;
