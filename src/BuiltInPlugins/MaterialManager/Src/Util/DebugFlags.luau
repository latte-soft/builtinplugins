local l_Workspace_0 = game:GetService("Workspace");
local v1 = script.Parent.Parent.Parent.Name .. "Flags";
local function _(v2, v3)
    v3 = v3 or false;
    return function()
        local l_l_Workspace_0_FirstChild_0 = l_Workspace_0:FindFirstChild(v1);
        if l_l_Workspace_0_FirstChild_0 and l_l_Workspace_0_FirstChild_0:FindFirstChild(v2) then
            return l_l_Workspace_0_FirstChild_0[v2].Value;
        else
            return v3;
        end;
    end;
end;
local v6 = {};
local v7 = nil or false;
local v8 = "RunningUnderCLI";
local l_v8_0 = v8 --[[ copy: 7 -> 8 ]];
local v10;
do
    local l_v7_0 = v7;
    v10 = function()
        local l_l_Workspace_0_FirstChild_1 = l_Workspace_0:FindFirstChild(v1);
        if l_l_Workspace_0_FirstChild_1 and l_l_Workspace_0_FirstChild_1:FindFirstChild(l_v8_0) then
            return l_l_Workspace_0_FirstChild_1[l_v8_0].Value;
        else
            return l_v7_0;
        end;
    end;
end;
v6.RunningUnderCLI = v10;
v7 = false or false;
v8 = "RunTests";
local l_v8_1 = v8 --[[ copy: 7 -> 9 ]];
do
    local l_v7_1 = v7;
    v10 = function()
        local l_l_Workspace_0_FirstChild_2 = l_Workspace_0:FindFirstChild(v1);
        if l_l_Workspace_0_FirstChild_2 and l_l_Workspace_0_FirstChild_2:FindFirstChild(l_v8_1) then
            return l_l_Workspace_0_FirstChild_2[l_v8_1].Value;
        else
            return l_v7_1;
        end;
    end;
end;
v6.RunTests = v10;
v7 = nil or false;
v8 = "LogTestsQuiet";
local l_v8_2 = v8 --[[ copy: 7 -> 10 ]];
do
    local l_v7_2 = v7;
    v10 = function()
        local l_l_Workspace_0_FirstChild_3 = l_Workspace_0:FindFirstChild(v1);
        if l_l_Workspace_0_FirstChild_3 and l_l_Workspace_0_FirstChild_3:FindFirstChild(l_v8_2) then
            return l_l_Workspace_0_FirstChild_3[l_v8_2].Value;
        else
            return l_v7_2;
        end;
    end;
end;
v6.LogTestsQuiet = v10;
v7 = nil or false;
v8 = "LogAnalytics";
do
    local l_v7_3 = v7;
    v10 = function()
        local l_l_Workspace_0_FirstChild_4 = l_Workspace_0:FindFirstChild(v1);
        if l_l_Workspace_0_FirstChild_4 and l_l_Workspace_0_FirstChild_4:FindFirstChild(v8) then
            return l_l_Workspace_0_FirstChild_4[v8].Value;
        else
            return l_v7_3;
        end;
    end;
end;
v6.LogAnalytics = v10;
return v6;
