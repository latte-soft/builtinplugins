local l_Workspace_0 = game:GetService("Workspace");
local v1 = require(script.Parent.Parent.Parent.Packages.TestLoader);
local v2 = v1.hasInternalPermission();
local v3 = v1.isCli();
local function _(v4, v5)
    local v6 = v5 or false;
    return function()
        local l_TerrainEditorFlags_0 = l_Workspace_0:FindFirstChild("TerrainEditorFlags");
        if l_TerrainEditorFlags_0 and l_TerrainEditorFlags_0:FindFirstChild(v4) then
            return l_TerrainEditorFlags_0[v4].Value;
        else
            return v6;
        end;
    end;
end;
local v9 = {};
local v10 = v3 or false;
local v11 = "RunningUnderCLI";
local l_v11_0 = v11 --[[ copy: 9 -> 11 ]];
local l_v10_0 = v10 --[[ copy: 8 -> 12 ]];
v9.RunningUnderCLI = function()
    local l_TerrainEditorFlags_1 = l_Workspace_0:FindFirstChild("TerrainEditorFlags");
    if l_TerrainEditorFlags_1 and l_TerrainEditorFlags_1:FindFirstChild(l_v11_0) then
        return l_TerrainEditorFlags_1[l_v11_0].Value;
    else
        return l_v10_0;
    end;
end;
v10 = "RunTests";
v11 = false;
local l_v10_1 = v10 --[[ copy: 8 -> 13 ]];
local l_v11_1 = v11 --[[ copy: 9 -> 14 ]];
v9.RunTests = function()
    local l_TerrainEditorFlags_2 = l_Workspace_0:FindFirstChild("TerrainEditorFlags");
    if l_TerrainEditorFlags_2 and l_TerrainEditorFlags_2:FindFirstChild(l_v10_1) then
        return l_TerrainEditorFlags_2[l_v10_1].Value;
    else
        return l_v11_1;
    end;
end;
v10 = "LogTestsQuiet";
v11 = false;
local l_v10_2 = v10 --[[ copy: 8 -> 15 ]];
local l_v11_2 = v11 --[[ copy: 9 -> 16 ]];
v9.LogTestsQuiet = function()
    local l_TerrainEditorFlags_3 = l_Workspace_0:FindFirstChild("TerrainEditorFlags");
    if l_TerrainEditorFlags_3 and l_TerrainEditorFlags_3:FindFirstChild(l_v10_2) then
        return l_TerrainEditorFlags_3[l_v10_2].Value;
    else
        return l_v11_2;
    end;
end;
v10 = "LogAnalytics";
v11 = false;
local l_v10_3 = v10 --[[ copy: 8 -> 17 ]];
local l_v11_3 = v11 --[[ copy: 9 -> 18 ]];
v9.LogAnalytics = function()
    local l_TerrainEditorFlags_4 = l_Workspace_0:FindFirstChild("TerrainEditorFlags");
    if l_TerrainEditorFlags_4 and l_TerrainEditorFlags_4:FindFirstChild(l_v10_3) then
        return l_TerrainEditorFlags_4[l_v10_3].Value;
    else
        return l_v11_3;
    end;
end;
v10 = "ProfileTools";
v11 = true;
local l_v10_4 = v10 --[[ copy: 8 -> 19 ]];
local l_v11_4 = v11 --[[ copy: 9 -> 20 ]];
v9.ProfileTools = function()
    local l_TerrainEditorFlags_5 = l_Workspace_0:FindFirstChild("TerrainEditorFlags");
    if l_TerrainEditorFlags_5 and l_TerrainEditorFlags_5:FindFirstChild(l_v10_4) then
        return l_TerrainEditorFlags_5[l_v10_4].Value;
    else
        return l_v11_4;
    end;
end;
v10 = "RunDeveloperFrameworkTests";
v11 = false;
local l_v11_5 = v11 --[[ copy: 9 -> 21 ]];
v9.RunDeveloperFrameworkTests = function()
    local l_TerrainEditorFlags_6 = l_Workspace_0:FindFirstChild("TerrainEditorFlags");
    if l_TerrainEditorFlags_6 and l_TerrainEditorFlags_6:FindFirstChild(v10) then
        return l_TerrainEditorFlags_6[v10].Value;
    else
        return l_v11_5;
    end;
end;
v11 = (v3 or v2) or false;
local v29 = "EnableRoactConfigs";
v9.EnableRoactConfigs = function()
    local l_TerrainEditorFlags_7 = l_Workspace_0:FindFirstChild("TerrainEditorFlags");
    if l_TerrainEditorFlags_7 and l_TerrainEditorFlags_7:FindFirstChild(v29) then
        return l_TerrainEditorFlags_7[v29].Value;
    else
        return v11;
    end;
end;
return v9;
