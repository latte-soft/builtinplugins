local l_Workspace_0 = game:GetService("Workspace");
local function _(v1, v2)
    v2 = v2 or false;
    return function()
        local l_GameSettingsFlags_0 = l_Workspace_0:FindFirstChild("GameSettingsFlags");
        if l_GameSettingsFlags_0 and l_GameSettingsFlags_0:FindFirstChild(v1) then
            return l_GameSettingsFlags_0[v1].Value;
        else
            return v2;
        end;
    end;
end;
local v5 = {};
local v6 = nil or false;
local v7 = "EnableRoactConfigs";
local l_v7_0 = v7 --[[ copy: 5 -> 6 ]];
local v9;
do
    local l_v6_0 = v6;
    v9 = function()
        local l_GameSettingsFlags_1 = l_Workspace_0:FindFirstChild("GameSettingsFlags");
        if l_GameSettingsFlags_1 and l_GameSettingsFlags_1:FindFirstChild(l_v7_0) then
            return l_GameSettingsFlags_1[l_v7_0].Value;
        else
            return l_v6_0;
        end;
    end;
end;
v5.EnableRoactConfigs = v9;
v6 = nil or false;
v7 = "RunningUnderCLI";
local l_v7_1 = v7 --[[ copy: 5 -> 7 ]];
do
    local l_v6_1 = v6;
    v9 = function()
        local l_GameSettingsFlags_2 = l_Workspace_0:FindFirstChild("GameSettingsFlags");
        if l_GameSettingsFlags_2 and l_GameSettingsFlags_2:FindFirstChild(l_v7_1) then
            return l_GameSettingsFlags_2[l_v7_1].Value;
        else
            return l_v6_1;
        end;
    end;
end;
v5.RunningUnderCLI = v9;
v6 = nil or false;
v7 = "RunTests";
do
    local l_v6_2 = v6;
    v9 = function()
        local l_GameSettingsFlags_3 = l_Workspace_0:FindFirstChild("GameSettingsFlags");
        if l_GameSettingsFlags_3 and l_GameSettingsFlags_3:FindFirstChild(v7) then
            return l_GameSettingsFlags_3[v7].Value;
        else
            return l_v6_2;
        end;
    end;
end;
v5.RunTests = v9;
return v5;
