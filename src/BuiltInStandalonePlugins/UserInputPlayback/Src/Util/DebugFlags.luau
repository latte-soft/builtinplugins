local l_Workspace_0 = game:GetService("Workspace");
local l_UserInputPlaybackPluginDeferPackageLoading_0 = game:GetFastFlag("UserInputPlaybackPluginDeferPackageLoading");
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("StudioService"):HasInternalPermission();
end);
local function _(v4, v5)
    v5 = v5 or false;
    return function()
        local l_UserInputPlaybackFlags_0 = l_Workspace_0:FindFirstChild("UserInputPlaybackFlags");
        if l_UserInputPlaybackFlags_0 and l_UserInputPlaybackFlags_0:FindFirstChild(v4) then
            return l_UserInputPlaybackFlags_0[v4].Value;
        else
            return v5;
        end;
    end;
end;
local v8 = {};
local v9 = nil or false;
local v10 = "RunningUnderCLI";
local l_v10_0 = v10 --[[ copy: 8 -> 9 ]];
local v12;
do
    local l_v9_0 = v9;
    v12 = function()
        local l_UserInputPlaybackFlags_1 = l_Workspace_0:FindFirstChild("UserInputPlaybackFlags");
        if l_UserInputPlaybackFlags_1 and l_UserInputPlaybackFlags_1:FindFirstChild(l_v10_0) then
            return l_UserInputPlaybackFlags_1[l_v10_0].Value;
        else
            return l_v9_0;
        end;
    end;
end;
v8.RunningUnderCLI = v12;
v9 = false or false;
v10 = "RunTests";
local l_v10_1 = v10 --[[ copy: 8 -> 10 ]];
do
    local l_v9_1 = v9;
    v12 = function()
        local l_UserInputPlaybackFlags_2 = l_Workspace_0:FindFirstChild("UserInputPlaybackFlags");
        if l_UserInputPlaybackFlags_2 and l_UserInputPlaybackFlags_2:FindFirstChild(l_v10_1) then
            return l_UserInputPlaybackFlags_2[l_v10_1].Value;
        else
            return l_v9_1;
        end;
    end;
end;
v8.RunTests = v12;
v9 = nil or false;
v10 = "LogTestsQuiet";
local l_v10_2 = v10 --[[ copy: 8 -> 11 ]];
do
    local l_v9_2 = v9;
    v12 = function()
        local l_UserInputPlaybackFlags_3 = l_Workspace_0:FindFirstChild("UserInputPlaybackFlags");
        if l_UserInputPlaybackFlags_3 and l_UserInputPlaybackFlags_3:FindFirstChild(l_v10_2) then
            return l_UserInputPlaybackFlags_3[l_v10_2].Value;
        else
            return l_v9_2;
        end;
    end;
end;
v8.LogTestsQuiet = v12;
v9 = nil or false;
v10 = "LogAnalytics";
local l_v10_3 = v10 --[[ copy: 8 -> 12 ]];
do
    local l_v9_3 = v9;
    v12 = function()
        local l_UserInputPlaybackFlags_4 = l_Workspace_0:FindFirstChild("UserInputPlaybackFlags");
        if l_UserInputPlaybackFlags_4 and l_UserInputPlaybackFlags_4:FindFirstChild(l_v10_3) then
            return l_UserInputPlaybackFlags_4[l_v10_3].Value;
        else
            return l_v9_3;
        end;
    end;
end;
v8.LogAnalytics = v12;
v9 = nil or false;
v10 = "RunDeveloperFrameworkTests";
local l_v10_4 = v10 --[[ copy: 8 -> 13 ]];
do
    local l_v9_4 = v9;
    v12 = function()
        local l_UserInputPlaybackFlags_5 = l_Workspace_0:FindFirstChild("UserInputPlaybackFlags");
        if l_UserInputPlaybackFlags_5 and l_UserInputPlaybackFlags_5:FindFirstChild(l_v10_4) then
            return l_UserInputPlaybackFlags_5[l_v10_4].Value;
        else
            return l_v9_4;
        end;
    end;
end;
v8.RunDeveloperFrameworkTests = v12;
v9 = if not l_UserInputPlaybackPluginDeferPackageLoading_0 then l_status_0 and l_result_0 else nil or false;
v10 = "EnableRoactConfigs";
local l_v10_5 = v10 --[[ copy: 8 -> 14 ]];
do
    local l_v9_5 = v9;
    v12 = function()
        local l_UserInputPlaybackFlags_6 = l_Workspace_0:FindFirstChild("UserInputPlaybackFlags");
        if l_UserInputPlaybackFlags_6 and l_UserInputPlaybackFlags_6:FindFirstChild(l_v10_5) then
            return l_UserInputPlaybackFlags_6[l_v10_5].Value;
        else
            return l_v9_5;
        end;
    end;
end;
v8.EnableRoactConfigs = v12;
if l_UserInputPlaybackPluginDeferPackageLoading_0 then
    v9 = nil or false;
    v10 = "EnableDeveloperTools";
    do
        local l_v9_6 = v9;
        v12 = function()
            local l_UserInputPlaybackFlags_7 = l_Workspace_0:FindFirstChild("UserInputPlaybackFlags");
            if l_UserInputPlaybackFlags_7 and l_UserInputPlaybackFlags_7:FindFirstChild(v10) then
                return l_UserInputPlaybackFlags_7[v10].Value;
            else
                return l_v9_6;
            end;
        end;
    end;
    v8.EnableDeveloperTools = v12;
end;
return v8;
