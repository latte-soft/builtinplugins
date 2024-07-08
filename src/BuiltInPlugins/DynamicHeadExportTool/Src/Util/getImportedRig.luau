local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local l_Workspace_0 = game:GetService("Workspace");
local v2 = require(l_script_FirstAncestor_0.Src.Constants);
return function()
    for _, v4 in l_Workspace_0:GetChildren() do
        if v4:IsA("Model") and v4.Name == "ImportedFbx" then
            local l_R15ArtistIntent_0 = v4:FindFirstChild("R15ArtistIntent");
            if l_R15ArtistIntent_0 then
                return l_R15ArtistIntent_0;
            end;
        elseif not (not v4:IsA("Model") or not v2.AvatarImporterRigNames[v4.Name]) then
            return v4;
        end;
    end;
    return nil;
end;
