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
            return false;
        else
            return l_l_ToolboxDebugFlags_1_FirstChild_0.Value;
        end;
    else
        return false;
    end;
end;
return {
    shouldRunTests = function()
        wait(0.3);
        local l_ToolboxDebugFlags_2 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_2 then
            local l_RunToolboxTests_0 = l_ToolboxDebugFlags_2:FindFirstChild("RunToolboxTests");
            if not l_RunToolboxTests_0 then
                return false;
            else
                return l_RunToolboxTests_0.Value;
            end;
        else
            return false;
        end;
    end, 
    shouldDisableTooltips = function()
        local l_ToolboxDebugFlags_3 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_3 then
            local l_ToolboxDisableTooltips_0 = l_ToolboxDebugFlags_3:FindFirstChild("ToolboxDisableTooltips");
            if not l_ToolboxDisableTooltips_0 then
                return false;
            else
                return l_ToolboxDisableTooltips_0.Value;
            end;
        else
            return false;
        end;
    end, 
    shouldDebugUrls = function()
        local l_ToolboxDebugFlags_4 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_4 then
            local l_ToolboxDebugUrls_0 = l_ToolboxDebugFlags_4:FindFirstChild("ToolboxDebugUrls");
            if not l_ToolboxDebugUrls_0 then
                return false;
            else
                return l_ToolboxDebugUrls_0.Value;
            end;
        else
            return false;
        end;
    end, 
    shouldDebugState = function()
        local l_ToolboxDebugFlags_5 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_5 then
            local l_ToolboxDebugState_0 = l_ToolboxDebugFlags_5:FindFirstChild("ToolboxDebugState");
            if not l_ToolboxDebugState_0 then
                return false;
            else
                return l_ToolboxDebugState_0.Value;
            end;
        else
            return false;
        end;
    end, 
    shouldDebugWarnings = function()
        local l_ToolboxDebugFlags_6 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_6 then
            local l_ToolboxDebugWarnings_0 = l_ToolboxDebugFlags_6:FindFirstChild("ToolboxDebugWarnings");
            if not l_ToolboxDebugWarnings_0 then
                return false;
            else
                return l_ToolboxDebugWarnings_0.Value;
            end;
        else
            return false;
        end;
    end, 
    shouldLogSettings = function()
        local l_ToolboxDebugFlags_7 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_7 then
            local l_ToolboxLogSettings_0 = l_ToolboxDebugFlags_7:FindFirstChild("ToolboxLogSettings");
            if not l_ToolboxLogSettings_0 then
                return false;
            else
                return l_ToolboxLogSettings_0.Value;
            end;
        else
            return false;
        end;
    end, 
    shouldUseTestCustomLocale = function()
        local l_ToolboxDebugFlags_8 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_8 then
            local l_ToolboxUseTestCustomLocale_0 = l_ToolboxDebugFlags_8:FindFirstChild("ToolboxUseTestCustomLocale");
            if not l_ToolboxUseTestCustomLocale_0 then
                return false;
            else
                return l_ToolboxUseTestCustomLocale_0.Value;
            end;
        else
            return false;
        end;
    end, 
    shouldUseTestRealLocale = function()
        local l_ToolboxDebugFlags_9 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if l_ToolboxDebugFlags_9 then
            local l_ToolboxUseTestRealLocaleId_0 = l_ToolboxDebugFlags_9:FindFirstChild("ToolboxUseTestRealLocaleId");
            if not l_ToolboxUseTestRealLocaleId_0 then
                return false;
            else
                return l_ToolboxUseTestRealLocaleId_0.Value;
            end;
        else
            return false;
        end;
    end, 
    getOrCreateTestCustomLocale = function()
        local l_ToolboxDebugFlags_10 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_10 then
            l_ToolboxDebugFlags_10 = Instance.new("Folder");
            l_ToolboxDebugFlags_10.Name = "ToolboxDebugFlags";
            l_ToolboxDebugFlags_10.Parent = l_Workspace_0;
        end;
        local l_l_ToolboxDebugFlags_10_0 = l_ToolboxDebugFlags_10;
        l_ToolboxDebugFlags_10 = l_l_ToolboxDebugFlags_10_0:FindFirstChild("ToolboxCustomLocale");
        if not l_ToolboxDebugFlags_10 then
            l_ToolboxDebugFlags_10 = Instance.new("StringValue");
            l_ToolboxDebugFlags_10.Name = "ToolboxCustomLocale";
            l_ToolboxDebugFlags_10.Value = "CustomLocale";
            l_ToolboxDebugFlags_10.Parent = l_l_ToolboxDebugFlags_10_0;
        end;
        return l_ToolboxDebugFlags_10;
    end, 
    getOrCreateTestRealLocale = function()
        local l_ToolboxDebugFlags_11 = l_Workspace_0:FindFirstChild("ToolboxDebugFlags");
        if not l_ToolboxDebugFlags_11 then
            l_ToolboxDebugFlags_11 = Instance.new("Folder");
            l_ToolboxDebugFlags_11.Name = "ToolboxDebugFlags";
            l_ToolboxDebugFlags_11.Parent = l_Workspace_0;
        end;
        local l_l_ToolboxDebugFlags_11_0 = l_ToolboxDebugFlags_11;
        l_ToolboxDebugFlags_11 = l_l_ToolboxDebugFlags_11_0:FindFirstChild("ToolboxRealLocale");
        if not l_ToolboxDebugFlags_11 then
            l_ToolboxDebugFlags_11 = Instance.new("StringValue");
            l_ToolboxDebugFlags_11.Name = "ToolboxRealLocale";
            l_ToolboxDebugFlags_11.Value = "en-us";
            l_ToolboxDebugFlags_11.Parent = l_l_ToolboxDebugFlags_11_0;
        end;
        return l_ToolboxDebugFlags_11;
    end
};
