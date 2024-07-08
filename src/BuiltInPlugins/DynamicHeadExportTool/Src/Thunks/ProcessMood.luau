local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local l_Workspace_0 = game:GetService("Workspace");
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(l_script_FirstAncestor_0.Src.Constants);
return function()
    return function(v4)
        local l_animationId_0 = v4:getState().PluginReducer.animationId;
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "MoodAnimation";
        l_CollectionService_0:AddTag(l_Folder_0, v3.Tag);
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "R15Anim";
        l_Folder_1.Parent = l_Folder_0;
        local l_StringValue_0 = Instance.new("StringValue");
        l_StringValue_0.Name = "mood";
        l_StringValue_0.Parent = l_Folder_1;
        local l_Animation_0 = Instance.new("Animation");
        l_Animation_0.Name = "Animation1";
        l_Animation_0.AnimationId = string.format("rbxassetid://%s", l_animationId_0);
        l_Animation_0.Parent = l_StringValue_0;
        l_Folder_0.Parent = l_Workspace_0;
    end;
end;
