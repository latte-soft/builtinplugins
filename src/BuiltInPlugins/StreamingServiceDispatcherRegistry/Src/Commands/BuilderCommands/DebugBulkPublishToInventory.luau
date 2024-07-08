local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StudioAssetService");
local v3 = v1.GetService("StudioService");
local v4 = v1.GetService("RunService");
local v5 = v1.GetService("Selection");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCLI88299);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagRunCommandsInCodeAssist);
return function(_)
    if v4:IsStudio() then
        if not v7() then
            local l_status_0, l_result_0 = pcall(function()
                return v3:HasInternalPermission();
            end);
            if not (l_status_0 and l_result_0) then
                return ;
            end;
        end;
        if v8() then
            for _, v13 in v5:Get() do
                local l_status_1, l_result_1 = pcall(function()
                    v2:PublishPackage(v13, {
                        Name = v13.Name, 
                        AssetType = Enum.AssetType.Model.Name, 
                        Description = "", 
                        IsPackage = false, 
                        PublishToMarketplace = false, 
                        AllowComments = false
                    });
                end);
                if not l_status_1 then
                    warn(l_result_1);
                end;
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
