local l_Workspace_0 = game:GetService("Workspace");
local v1 = require(script.Parent.hasInternalPermission)();
local v2 = pcall(function()
    return game:GetService("ProcessService");
end);
local function _(v3, v4)
    v4 = v4 or false;
    return function()
        local l_ManageCollaboratorsFlags_0 = l_Workspace_0:FindFirstChild("ManageCollaboratorsFlags");
        if l_ManageCollaboratorsFlags_0 and l_ManageCollaboratorsFlags_0:FindFirstChild(v3) then
            return l_ManageCollaboratorsFlags_0[v3].Value;
        else
            return v4;
        end;
    end;
end;
local v7 = {};
local v8 = v2 or false;
local v9 = "RunningUnderCLI";
local l_v9_0 = v9 --[[ copy: 7 -> 8 ]];
local v11;
do
    local l_v8_0 = v8;
    v11 = function()
        local l_ManageCollaboratorsFlags_1 = l_Workspace_0:FindFirstChild("ManageCollaboratorsFlags");
        if l_ManageCollaboratorsFlags_1 and l_ManageCollaboratorsFlags_1:FindFirstChild(l_v9_0) then
            return l_ManageCollaboratorsFlags_1[l_v9_0].Value;
        else
            return l_v8_0;
        end;
    end;
end;
v7.RunningUnderCLI = v11;
v8 = nil or false;
v9 = "RunTests";
local l_v9_1 = v9 --[[ copy: 7 -> 9 ]];
do
    local l_v8_1 = v8;
    v11 = function()
        local l_ManageCollaboratorsFlags_2 = l_Workspace_0:FindFirstChild("ManageCollaboratorsFlags");
        if l_ManageCollaboratorsFlags_2 and l_ManageCollaboratorsFlags_2:FindFirstChild(l_v9_1) then
            return l_ManageCollaboratorsFlags_2[l_v9_1].Value;
        else
            return l_v8_1;
        end;
    end;
end;
v7.RunTests = v11;
v8 = nil or false;
v9 = "LogTestsQuiet";
local l_v9_2 = v9 --[[ copy: 7 -> 10 ]];
do
    local l_v8_2 = v8;
    v11 = function()
        local l_ManageCollaboratorsFlags_3 = l_Workspace_0:FindFirstChild("ManageCollaboratorsFlags");
        if l_ManageCollaboratorsFlags_3 and l_ManageCollaboratorsFlags_3:FindFirstChild(l_v9_2) then
            return l_ManageCollaboratorsFlags_3[l_v9_2].Value;
        else
            return l_v8_2;
        end;
    end;
end;
v7.LogTestsQuiet = v11;
v8 = nil or false;
v9 = "LogAnalytics";
local l_v9_3 = v9 --[[ copy: 7 -> 11 ]];
do
    local l_v8_3 = v8;
    v11 = function()
        local l_ManageCollaboratorsFlags_4 = l_Workspace_0:FindFirstChild("ManageCollaboratorsFlags");
        if l_ManageCollaboratorsFlags_4 and l_ManageCollaboratorsFlags_4:FindFirstChild(l_v9_3) then
            return l_ManageCollaboratorsFlags_4[l_v9_3].Value;
        else
            return l_v8_3;
        end;
    end;
end;
v7.LogAnalytics = v11;
v8 = nil or false;
v9 = "RunDeveloperFrameworkTests";
local l_v9_4 = v9 --[[ copy: 7 -> 12 ]];
do
    local l_v8_4 = v8;
    v11 = function()
        local l_ManageCollaboratorsFlags_5 = l_Workspace_0:FindFirstChild("ManageCollaboratorsFlags");
        if l_ManageCollaboratorsFlags_5 and l_ManageCollaboratorsFlags_5:FindFirstChild(l_v9_4) then
            return l_ManageCollaboratorsFlags_5[l_v9_4].Value;
        else
            return l_v8_4;
        end;
    end;
end;
v7.RunDeveloperFrameworkTests = v11;
v8 = (v7.RunTests() or v1) or false;
v9 = "EnableRoactConfigs";
do
    local l_v8_5 = v8;
    v11 = function()
        local l_ManageCollaboratorsFlags_6 = l_Workspace_0:FindFirstChild("ManageCollaboratorsFlags");
        if l_ManageCollaboratorsFlags_6 and l_ManageCollaboratorsFlags_6:FindFirstChild(v9) then
            return l_ManageCollaboratorsFlags_6[v9].Value;
        else
            return l_v8_5;
        end;
    end;
end;
v7.EnableRoactConfigs = v11;
return v7;
