local l_Workspace_0 = game:GetService("Workspace");
local l_StudioService_0 = game:GetService("StudioService");
local function v7(v2)
    assert(typeof(v2.Name) == "string", "DebugFlag name must be a string");
    assert(typeof(v2.Default) == "boolean", "DebugFlag default value must be a boolean");
    local v3 = true;
    if v2.DefaultForInternalUsers ~= nil then
        v3 = typeof(v2.DefaultForInternalUsers) == "boolean";
    end;
    assert(v3, "DebugFlag default value for internal users must be either a boolean or nil");
    return function()
        local v4 = if not not l_StudioService_0:HasInternalPermission() and v2.DefaultForInternalUsers ~= nil then v2.DefaultForInternalUsers else v2.Default;
        local l_StyleEditor_0 = l_Workspace_0:FindFirstChild("StyleEditor");
        if l_StyleEditor_0 and l_StyleEditor_0:IsA("Folder") then
            local l_l_StyleEditor_0_FirstChild_0 = l_StyleEditor_0:FindFirstChild(v2.Name);
            if l_l_StyleEditor_0_FirstChild_0 and l_l_StyleEditor_0_FirstChild_0:IsA("BoolValue") then
                return l_l_StyleEditor_0_FirstChild_0.Value;
            else
                return v4;
            end;
        else
            return v4;
        end;
    end;
end;
return {
    LogNetworkErrors = v7({
        Name = "LogNetworkErrors", 
        Default = false, 
        DefaultForInternalUsers = true
    }), 
    LogTelemetry = v7({
        Name = "LogTelemetry", 
        Default = false
    })
};
