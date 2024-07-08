local l_MaterialService_0 = game:GetService("MaterialService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.Constants);
local v5 = require(l_Util_0.GeneratedMaterialsContext);
local v6 = require(l_Util_0.getAllMaterialVariants);
return function()
    local v7 = v2.useContext(v5);
    local l_promptGroups_0 = v7.promptGroups;
    local l_getMaterialStatus_0 = v7.getMaterialStatus;
    v2.useEffect(function()
        local v10 = v6(l_promptGroups_0);
        local v11 = nil;
        if #v10 > 0 then
            local l_MATERIALS_FOLDER_NAME_0 = v4.MATERIALS_FOLDER_NAME;
            v11 = l_MaterialService_0:FindFirstChild(l_MATERIALS_FOLDER_NAME_0, true);
            if not v11 then
                v11 = Instance.new("Folder");
                v11.Archivable = false;
                v11.Parent = l_MaterialService_0;
                v11.Name = l_MATERIALS_FOLDER_NAME_0;
            end;
        end;
        for _, v14 in v10, nil, nil do
            if l_getMaterialStatus_0(v14) == "Uploaded" then
                v14.Parent = l_MaterialService_0;
            else
                v14.Parent = v11 or l_MaterialService_0;
            end;
        end;
        return function()
            for _, v16 in v10, nil, nil do
                if l_getMaterialStatus_0(v16) ~= "Uploaded" then
                    v16.Parent = nil;
                end;
            end;
            if v11 ~= nil then
                v11:Destroy();
            end;
        end;
    end, {
        l_promptGroups_0, 
        l_getMaterialStatus_0
    });
end;
