local l_Workspace_0 = game:GetService("Workspace");
local function _()
    return l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
end;
local function _()
    local l_ToolboxDebugFlags_0 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
    if not l_ToolboxDebugFlags_0 then
        l_ToolboxDebugFlags_0 = Instance.new("Folder");
        l_ToolboxDebugFlags_0.Name = "ToolboxDebugFlags";
        l_ToolboxDebugFlags_0.Parent = l_Workspace_0;
    end;
    return l_ToolboxDebugFlags_0;
end;
local function _(v4)
    local l_ToolboxDebugFlags_1 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
    if l_ToolboxDebugFlags_1 then
        local l_l_ToolboxDebugFlags_1_FirstChild_0 = l_ToolboxDebugFlags_1:FindFirstChild(v4);
        if not l_l_ToolboxDebugFlags_1_FirstChild_0 then
            return nil;
        else
            return l_l_ToolboxDebugFlags_1_FirstChild_0.Value;
        end;
    else
        return nil;
    end;
end;
local v8 = {};
game:DefineFastFlag("DebugToolboxRunTests", false);
v8.shouldRunTests = function()
    local l_DebugToolboxRunTests_0 = game:GetFastFlag("DebugToolboxRunTests");
    if not l_DebugToolboxRunTests_0 then
        local l_ToolboxDebugFlags_2 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_2 then
            local l_RunTests_0 = l_ToolboxDebugFlags_2:FindFirstChild("RunTests");
            if not l_RunTests_0 then
                l_DebugToolboxRunTests_0 = nil;
            else
                return l_RunTests_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxRunTests_0;
end;
game:DefineFastFlag("DebugToolboxRunRhodiumTests", false);
v8.shouldRunRhodiumTests = function()
    local l_DebugToolboxRunRhodiumTests_0 = game:GetFastFlag("DebugToolboxRunRhodiumTests");
    if not l_DebugToolboxRunRhodiumTests_0 then
        local l_ToolboxDebugFlags_3 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_3 then
            local l_RunRhodiumTests_0 = l_ToolboxDebugFlags_3:FindFirstChild("RunRhodiumTests");
            if not l_RunRhodiumTests_0 then
                l_DebugToolboxRunRhodiumTests_0 = nil;
            else
                return l_RunRhodiumTests_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxRunRhodiumTests_0;
end;
game:DefineFastFlag("DebugToolboxRunJest3Tests", false);
v8.shouldRunJest3Tests = function()
    local l_DebugToolboxRunJest3Tests_0 = game:GetFastFlag("DebugToolboxRunJest3Tests");
    if not l_DebugToolboxRunJest3Tests_0 then
        local l_ToolboxDebugFlags_4 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_4 then
            local l_RunJest3Tests_0 = l_ToolboxDebugFlags_4:FindFirstChild("RunJest3Tests");
            if not l_RunJest3Tests_0 then
                l_DebugToolboxRunJest3Tests_0 = nil;
            else
                return l_RunJest3Tests_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxRunJest3Tests_0;
end;
game:DefineFastFlag("DebugToolboxLogTestsQuiet", false);
v8.logTestsQuiet = function()
    local l_DebugToolboxLogTestsQuiet_0 = game:GetFastFlag("DebugToolboxLogTestsQuiet");
    if not l_DebugToolboxLogTestsQuiet_0 then
        local l_ToolboxDebugFlags_5 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_5 then
            local l_LogTestsQuiet_0 = l_ToolboxDebugFlags_5:FindFirstChild("LogTestsQuiet");
            if not l_LogTestsQuiet_0 then
                l_DebugToolboxLogTestsQuiet_0 = nil;
            else
                return l_LogTestsQuiet_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxLogTestsQuiet_0;
end;
game:DefineFastFlag("DebugToolboxDisableTooltips", false);
v8.shouldDisableTooltips = function()
    local l_DebugToolboxDisableTooltips_0 = game:GetFastFlag("DebugToolboxDisableTooltips");
    if not l_DebugToolboxDisableTooltips_0 then
        local l_ToolboxDebugFlags_6 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_6 then
            local l_ToolboxDisableTooltips_0 = l_ToolboxDebugFlags_6:FindFirstChild("ToolboxDisableTooltips");
            if not l_ToolboxDisableTooltips_0 then
                l_DebugToolboxDisableTooltips_0 = nil;
            else
                return l_ToolboxDisableTooltips_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxDisableTooltips_0;
end;
game:DefineFastFlag("DebugToolboxDebugUrls", false);
v8.shouldDebugUrls = function()
    local l_DebugToolboxDebugUrls_0 = game:GetFastFlag("DebugToolboxDebugUrls");
    if not l_DebugToolboxDebugUrls_0 then
        local l_ToolboxDebugFlags_7 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_7 then
            local l_ToolboxDebugUrls_0 = l_ToolboxDebugFlags_7:FindFirstChild("ToolboxDebugUrls");
            if not l_ToolboxDebugUrls_0 then
                l_DebugToolboxDebugUrls_0 = nil;
            else
                return l_ToolboxDebugUrls_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxDebugUrls_0;
end;
game:DefineFastFlag("DebugToolboxDebugState", false);
v8.shouldDebugState = function()
    local l_DebugToolboxDebugState_0 = game:GetFastFlag("DebugToolboxDebugState");
    if not l_DebugToolboxDebugState_0 then
        local l_ToolboxDebugFlags_8 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_8 then
            local l_ToolboxDebugState_0 = l_ToolboxDebugFlags_8:FindFirstChild("ToolboxDebugState");
            if not l_ToolboxDebugState_0 then
                l_DebugToolboxDebugState_0 = nil;
            else
                return l_ToolboxDebugState_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxDebugState_0;
end;
game:DefineFastFlag("DebugToolboxLogAnalytics", false);
v8.shouldLogAnalytics = function()
    local l_DebugToolboxLogAnalytics_0 = game:GetFastFlag("DebugToolboxLogAnalytics");
    if not l_DebugToolboxLogAnalytics_0 then
        local l_ToolboxDebugFlags_9 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_9 then
            local l_ToolboxLogAnalytics_0 = l_ToolboxDebugFlags_9:FindFirstChild("ToolboxLogAnalytics");
            if not l_ToolboxLogAnalytics_0 then
                l_DebugToolboxLogAnalytics_0 = nil;
            else
                return l_ToolboxLogAnalytics_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxLogAnalytics_0;
end;
game:DefineFastFlag("DebugToolboxDebugWarnings", false);
v8.shouldDebugWarnings = function()
    local l_DebugToolboxDebugWarnings_0 = game:GetFastFlag("DebugToolboxDebugWarnings");
    if not l_DebugToolboxDebugWarnings_0 then
        local l_ToolboxDebugFlags_10 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_10 then
            local l_ToolboxDebugWarnings_0 = l_ToolboxDebugFlags_10:FindFirstChild("ToolboxDebugWarnings");
            if not l_ToolboxDebugWarnings_0 then
                l_DebugToolboxDebugWarnings_0 = nil;
            else
                return l_ToolboxDebugWarnings_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxDebugWarnings_0;
end;
game:DefineFastFlag("DebugToolboxLogSettings", false);
v8.shouldLogSettings = function()
    local l_DebugToolboxLogSettings_0 = game:GetFastFlag("DebugToolboxLogSettings");
    if not l_DebugToolboxLogSettings_0 then
        local l_ToolboxDebugFlags_11 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_11 then
            local l_ToolboxLogSettings_0 = l_ToolboxDebugFlags_11:FindFirstChild("ToolboxLogSettings");
            if not l_ToolboxLogSettings_0 then
                l_DebugToolboxLogSettings_0 = nil;
            else
                return l_ToolboxLogSettings_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxLogSettings_0;
end;
game:DefineFastFlag("DebugToolboxUseTestCustomLocale", false);
v8.shouldUseTestCustomLocale = function()
    local l_DebugToolboxUseTestCustomLocale_0 = game:GetFastFlag("DebugToolboxUseTestCustomLocale");
    if not l_DebugToolboxUseTestCustomLocale_0 then
        local l_ToolboxDebugFlags_12 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_12 then
            local l_ToolboxUseTestCustomLocale_0 = l_ToolboxDebugFlags_12:FindFirstChild("ToolboxUseTestCustomLocale");
            if not l_ToolboxUseTestCustomLocale_0 then
                l_DebugToolboxUseTestCustomLocale_0 = nil;
            else
                return l_ToolboxUseTestCustomLocale_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxUseTestCustomLocale_0;
end;
game:DefineFastFlag("DebugToolboxUseTestRealLocaleId", false);
v8.shouldUseTestRealLocale = function()
    local l_DebugToolboxUseTestRealLocaleId_0 = game:GetFastFlag("DebugToolboxUseTestRealLocaleId");
    if not l_DebugToolboxUseTestRealLocaleId_0 then
        local l_ToolboxDebugFlags_13 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_13 then
            local l_ToolboxUseTestRealLocaleId_0 = l_ToolboxDebugFlags_13:FindFirstChild("ToolboxUseTestRealLocaleId");
            if not l_ToolboxUseTestRealLocaleId_0 then
                l_DebugToolboxUseTestRealLocaleId_0 = nil;
            else
                return l_ToolboxUseTestRealLocaleId_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxUseTestRealLocaleId_0;
end;
game:DefineFastFlag("DebugToolboxDebugOverrideAssetLoading", false);
v8.shouldDebugOverrideAssetLoading = function()
    local l_DebugToolboxDebugOverrideAssetLoading_0 = game:GetFastFlag("DebugToolboxDebugOverrideAssetLoading");
    if not l_DebugToolboxDebugOverrideAssetLoading_0 then
        local l_ToolboxDebugFlags_14 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_14 then
            local l_ToolboxDebugOverrideAssetLoading_0 = l_ToolboxDebugFlags_14:FindFirstChild("ToolboxDebugOverrideAssetLoading");
            if not l_ToolboxDebugOverrideAssetLoading_0 then
                l_DebugToolboxDebugOverrideAssetLoading_0 = nil;
            else
                return l_ToolboxDebugOverrideAssetLoading_0.Value;
            end;
        else
            return nil;
        end;
    end;
    return l_DebugToolboxDebugOverrideAssetLoading_0;
end;
v8.getOrCreateTestCustomLocale = function()
    local l_ToolboxDebugFlags_15 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
    if not l_ToolboxDebugFlags_15 then
        l_ToolboxDebugFlags_15 = Instance.new("Folder");
        l_ToolboxDebugFlags_15.Name = "ToolboxDebugFlags";
        l_ToolboxDebugFlags_15.Parent = l_Workspace_0;
    end;
    local l_l_ToolboxDebugFlags_15_0 = l_ToolboxDebugFlags_15;
    l_ToolboxDebugFlags_15 = l_l_ToolboxDebugFlags_15_0:FindFirstChild("ToolboxCustomLocale");
    if not l_ToolboxDebugFlags_15 then
        l_ToolboxDebugFlags_15 = Instance.new("StringValue");
        l_ToolboxDebugFlags_15.Name = "ToolboxCustomLocale";
        l_ToolboxDebugFlags_15.Value = "CustomLocale";
        l_ToolboxDebugFlags_15.Parent = l_l_ToolboxDebugFlags_15_0;
    end;
    return l_ToolboxDebugFlags_15;
end;
v8.getOrCreateTestRealLocale = function()
    local l_ToolboxDebugFlags_16 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
    if not l_ToolboxDebugFlags_16 then
        l_ToolboxDebugFlags_16 = Instance.new("Folder");
        l_ToolboxDebugFlags_16.Name = "ToolboxDebugFlags";
        l_ToolboxDebugFlags_16.Parent = l_Workspace_0;
    end;
    local l_l_ToolboxDebugFlags_16_0 = l_ToolboxDebugFlags_16;
    l_ToolboxDebugFlags_16 = l_l_ToolboxDebugFlags_16_0:FindFirstChild("ToolboxRealLocale");
    if not l_ToolboxDebugFlags_16 then
        l_ToolboxDebugFlags_16 = Instance.new("StringValue");
        l_ToolboxDebugFlags_16.Name = "ToolboxRealLocale";
        l_ToolboxDebugFlags_16.Value = "en-us";
        l_ToolboxDebugFlags_16.Parent = l_l_ToolboxDebugFlags_16_0;
    end;
    return l_ToolboxDebugFlags_16;
end;
return v8;
