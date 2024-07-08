local l_script_FirstAncestorWhichIsA_0 = script:FindFirstAncestorWhichIsA("Plugin");
local l_status_0, _ = pcall(function()
    return l_script_FirstAncestorWhichIsA_0:GetPluginComponent("FTFUtil");
end);
return function()
    return l_status_0;
end;
