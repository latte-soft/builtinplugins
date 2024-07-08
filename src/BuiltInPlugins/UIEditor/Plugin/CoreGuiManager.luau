local l_game_FastFlag_0 = game:GetFastFlag("StudioUIEditorDontClipOutsideSafeArea", false);
local v1 = nil;
local l_CoreGui_0 = game:GetService("CoreGui");
local function _(v3, v4)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = v3;
    l_Folder_0.Parent = v4;
    return l_Folder_0;
end;
local function _(v7, v8)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = v7;
    l_ScreenGui_0.Parent = v8;
    if l_game_FastFlag_0 then
        l_ScreenGui_0.ClipToDeviceSafeArea = false;
        l_ScreenGui_0.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
    end;
    return l_ScreenGui_0;
end;
local function _()
    if not v1 then
        local l_l_CoreGui_0_0 = l_CoreGui_0;
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "RobloxGUIEditor";
        l_Folder_1.Parent = l_l_CoreGui_0_0;
        v1 = l_Folder_1;
    end;
    return v1;
end;
return {
    findOrCreateFolder = function(_, v15)
        if not v1 then
            local l_l_CoreGui_0_1 = l_CoreGui_0;
            local l_Folder_2 = Instance.new("Folder");
            l_Folder_2.Name = "RobloxGUIEditor";
            l_Folder_2.Parent = l_l_CoreGui_0_1;
            v1 = l_Folder_2;
        end;
        local l_v1_FirstChild_0 = v1:FindFirstChild(v15);
        if not l_v1_FirstChild_0 then
            if not v1 then
                local l_l_CoreGui_0_2 = l_CoreGui_0;
                local l_Folder_3 = Instance.new("Folder");
                l_Folder_3.Name = "RobloxGUIEditor";
                l_Folder_3.Parent = l_l_CoreGui_0_2;
                v1 = l_Folder_3;
            end;
            local l_v1_0 = v1;
            local l_Folder_4 = Instance.new("Folder");
            l_Folder_4.Name = v15;
            l_Folder_4.Parent = l_v1_0;
            l_v1_FirstChild_0 = l_Folder_4;
        end;
        return l_v1_FirstChild_0;
    end, 
    findOrCreateScreenGui = function(_, v24)
        if not v1 then
            local l_l_CoreGui_0_3 = l_CoreGui_0;
            local l_Folder_5 = Instance.new("Folder");
            l_Folder_5.Name = "RobloxGUIEditor";
            l_Folder_5.Parent = l_l_CoreGui_0_3;
            v1 = l_Folder_5;
        end;
        local l_v1_FirstChild_1 = v1:FindFirstChild(v24);
        if not l_v1_FirstChild_1 then
            if not v1 then
                local l_l_CoreGui_0_4 = l_CoreGui_0;
                local l_Folder_6 = Instance.new("Folder");
                l_Folder_6.Name = "RobloxGUIEditor";
                l_Folder_6.Parent = l_l_CoreGui_0_4;
                v1 = l_Folder_6;
            end;
            local l_v1_1 = v1;
            local l_ScreenGui_1 = Instance.new("ScreenGui");
            l_ScreenGui_1.Name = v24;
            l_ScreenGui_1.Parent = l_v1_1;
            if l_game_FastFlag_0 then
                l_ScreenGui_1.ClipToDeviceSafeArea = false;
                l_ScreenGui_1.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
            end;
            l_v1_FirstChild_1 = l_ScreenGui_1;
        end;
        return l_v1_FirstChild_1;
    end
};
