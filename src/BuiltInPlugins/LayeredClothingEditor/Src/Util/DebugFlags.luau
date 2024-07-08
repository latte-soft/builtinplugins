local l_Workspace_0 = game:GetService("Workspace");
local v1 = {};
local function _(v2)
    local l_LayeredClothingEditorFlags_0 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if not l_LayeredClothingEditorFlags_0 then
        return false;
    else
        return l_LayeredClothingEditorFlags_0:FindFirstChild(v2) and l_LayeredClothingEditorFlags_0[v2].Value;
    end;
end;
v1.RunTests = function()
    local l_LayeredClothingEditorFlags_1 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if not l_LayeredClothingEditorFlags_1 then
        return false;
    else
        local l_RunTests_0 = l_LayeredClothingEditorFlags_1:FindFirstChild("RunTests");
        if not l_RunTests_0 then
            return l_RunTests_0;
        else
            return l_LayeredClothingEditorFlags_1.RunTests.Value;
        end;
    end;
end;
v1.RunRhodiumTests = function()
    local l_LayeredClothingEditorFlags_2 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if not l_LayeredClothingEditorFlags_2 then
        return false;
    else
        local l_RunRhodiumTests_0 = l_LayeredClothingEditorFlags_2:FindFirstChild("RunRhodiumTests");
        if not l_RunRhodiumTests_0 then
            return l_RunRhodiumTests_0;
        else
            return l_LayeredClothingEditorFlags_2.RunRhodiumTests.Value;
        end;
    end;
end;
v1.LogRoduxEvents = function()
    local l_LayeredClothingEditorFlags_3 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if not l_LayeredClothingEditorFlags_3 then
        return false;
    else
        local l_LogRoduxEvents_0 = l_LayeredClothingEditorFlags_3:FindFirstChild("LogRoduxEvents");
        if not l_LogRoduxEvents_0 then
            return l_LogRoduxEvents_0;
        else
            return l_LayeredClothingEditorFlags_3.LogRoduxEvents.Value;
        end;
    end;
end;
v1.LogAnalytics = function()
    local l_LayeredClothingEditorFlags_4 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if not l_LayeredClothingEditorFlags_4 then
        return false;
    else
        local l_LogAnalytics_0 = l_LayeredClothingEditorFlags_4:FindFirstChild("LogAnalytics");
        if not l_LogAnalytics_0 then
            return l_LogAnalytics_0;
        else
            return l_LayeredClothingEditorFlags_4.LogAnalytics.Value;
        end;
    end;
end;
v1.MockItemHasFullCage = function()
    local l_LayeredClothingEditorFlags_5 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if not l_LayeredClothingEditorFlags_5 then
        return false;
    else
        local l_MockItemHasFullCage_0 = l_LayeredClothingEditorFlags_5:FindFirstChild("MockItemHasFullCage");
        if not l_MockItemHasFullCage_0 then
            return l_MockItemHasFullCage_0;
        else
            return l_LayeredClothingEditorFlags_5.MockItemHasFullCage.Value;
        end;
    end;
end;
v1.UseMockCages = function()
    local l_LayeredClothingEditorFlags_6 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if not l_LayeredClothingEditorFlags_6 then
        return false;
    else
        local l_UseMockCages_0 = l_LayeredClothingEditorFlags_6:FindFirstChild("UseMockCages");
        if not l_UseMockCages_0 then
            return l_UseMockCages_0;
        else
            return l_LayeredClothingEditorFlags_6.UseMockCages.Value;
        end;
    end;
end;
return v1;
