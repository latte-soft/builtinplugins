local l_Workspace_0 = game:GetService("Workspace");
local function _(v1, v2)
    v2 = v2 or false;
    return function()
        local l_PlayerEmulatorFlags_0 = l_Workspace_0:FindFirstChild("PlayerEmulatorFlags");
        if l_PlayerEmulatorFlags_0 and l_PlayerEmulatorFlags_0:FindFirstChild(v1) then
            return l_PlayerEmulatorFlags_0[v1].Value;
        else
            return v2;
        end;
    end;
end;
local v5 = {};
local v6 = nil or false;
local v7 = "RunningUnderCLI";
local l_v7_0 = v7 --[[ copy: 5 -> 6 ]];
local v9;
do
    local l_v6_0 = v6;
    v9 = function()
        local l_PlayerEmulatorFlags_1 = l_Workspace_0:FindFirstChild("PlayerEmulatorFlags");
        if l_PlayerEmulatorFlags_1 and l_PlayerEmulatorFlags_1:FindFirstChild(l_v7_0) then
            return l_PlayerEmulatorFlags_1[l_v7_0].Value;
        else
            return l_v6_0;
        end;
    end;
end;
v5.RunningUnderCLI = v9;
v6 = false or false;
v7 = "RunTests";
local l_v7_1 = v7 --[[ copy: 5 -> 7 ]];
do
    local l_v6_1 = v6;
    v9 = function()
        local l_PlayerEmulatorFlags_2 = l_Workspace_0:FindFirstChild("PlayerEmulatorFlags");
        if l_PlayerEmulatorFlags_2 and l_PlayerEmulatorFlags_2:FindFirstChild(l_v7_1) then
            return l_PlayerEmulatorFlags_2[l_v7_1].Value;
        else
            return l_v6_1;
        end;
    end;
end;
v5.RunTests = v9;
v6 = nil or false;
v7 = "LogTestsQuiet";
local l_v7_2 = v7 --[[ copy: 5 -> 8 ]];
do
    local l_v6_2 = v6;
    v9 = function()
        local l_PlayerEmulatorFlags_3 = l_Workspace_0:FindFirstChild("PlayerEmulatorFlags");
        if l_PlayerEmulatorFlags_3 and l_PlayerEmulatorFlags_3:FindFirstChild(l_v7_2) then
            return l_PlayerEmulatorFlags_3[l_v7_2].Value;
        else
            return l_v6_2;
        end;
    end;
end;
v5.LogTestsQuiet = v9;
v6 = nil or false;
v7 = "LogAnalytics";
local l_v7_3 = v7 --[[ copy: 5 -> 9 ]];
do
    local l_v6_3 = v6;
    v9 = function()
        local l_PlayerEmulatorFlags_4 = l_Workspace_0:FindFirstChild("PlayerEmulatorFlags");
        if l_PlayerEmulatorFlags_4 and l_PlayerEmulatorFlags_4:FindFirstChild(l_v7_3) then
            return l_PlayerEmulatorFlags_4[l_v7_3].Value;
        else
            return l_v6_3;
        end;
    end;
end;
v5.LogAnalytics = v9;
v6 = nil or false;
v7 = "RunDeveloperFrameworkTests";
do
    local l_v6_4 = v6;
    v9 = function()
        local l_PlayerEmulatorFlags_5 = l_Workspace_0:FindFirstChild("PlayerEmulatorFlags");
        if l_PlayerEmulatorFlags_5 and l_PlayerEmulatorFlags_5:FindFirstChild(v7) then
            return l_PlayerEmulatorFlags_5[v7].Value;
        else
            return l_v6_4;
        end;
    end;
end;
v5.RunDeveloperFrameworkTests = v9;
return v5;
