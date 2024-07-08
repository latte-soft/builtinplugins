local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("MaterialGenerationService");
local v3 = v1.GetService("MaterialService");
local v4 = v1.GetService("ChatbotUIService");
local v5 = require(l_script_FirstAncestor_0.Packages.Promise);
local v6 = require(l_script_FirstAncestor_0.Packages.Dash);
local v7 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Localization.Localization);
local v10 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGenErrorTextFiltered);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewServiceAsyncApi);
local function v18(v13)
    local v16 = v6.collectSet(v3:GetDescendants(), function(_, v15)
        if not v15:IsA("MaterialVariant") then
            return nil;
        else
            return v15.Name;
        end;
    end);
    if v16[v13] then
        local v17 = 1;
        while v16[v13 .. v17] do
            v17 = v17 + 1;
        end;
        return v13 .. v17;
    else
        return v13;
    end;
end;
local function _(v19, v20)
    assert(type(v19) == "string", "Bad materialDescription");
    assert(type(v20) == "number", "Bad amount");
    return v5.try(function()
        if not v12() then
            return v2:DEPRECATED_GenerateMaterialVariantsAync(v19, v20);
        else
            return v2:GenerateMaterialVariantsAsync(v19, v20);
        end;
    end);
end;
local function _(v22)
    assert(type(v22) == "table", "Bad materials");
    return v5.try(function()
        return v2:UploadMaterialVariantsAsync(v22);
    end);
end;
local function _(v24, v25)
    local l_v24_FirstChild_0 = v24:FindFirstChild(v25);
    if not l_v24_FirstChild_0 then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v25;
        l_Folder_0.Parent = v24;
        return l_Folder_0;
    else
        return l_v24_FirstChild_0;
    end;
end;
local function _(v29)
    return string.format("studio://apply_material_variant/%s", v29);
end;
local function _(v31)
    return string.format("//instance/%s) %s", v31.ClassName, v31.Name);
end;
local function v51(v33, v34, v35, v36, v37)
    v7.streamText(v33.requestId, string.format("\n%s\n", (v9:getText("CreateMaterial", "Description", {
        baseMaterial = tostring(v35), 
        description = tostring(v34), 
        materialPattern = tostring(v37)
    }))));
    assert(type(v34) == "string", "Bad materialDescription");
    assert(true, "Bad amount");
    local l_try_0 = v5.try;
    local v39 = 4;
    return l_try_0(function()
        if not v12() then
            return v2:DEPRECATED_GenerateMaterialVariantsAync(v34, v39);
        else
            return v2:GenerateMaterialVariantsAsync(v34, v39);
        end;
    end):andThen(function(v40)
        assert(type(v40) == "table", "Bad materials");
        return v5.try(function()
            return v2:UploadMaterialVariantsAsync(v40);
        end):andThen(function()
            local l_v3_0 = v3;
            local l_AssistantMaterials_0 = l_v3_0:FindFirstChild("AssistantMaterials");
            local v43;
            if not l_AssistantMaterials_0 then
                local l_Folder_1 = Instance.new("Folder");
                l_Folder_1.Name = "AssistantMaterials";
                l_Folder_1.Parent = l_v3_0;
                v43 = l_Folder_1;
            else
                v43 = l_AssistantMaterials_0;
            end;
            l_AssistantMaterials_0 = string.format("Material: %s", v34);
            local l_v43_FirstChild_0 = v43:FindFirstChild(l_AssistantMaterials_0);
            if not l_v43_FirstChild_0 then
                local l_Folder_2 = Instance.new("Folder");
                l_Folder_2.Name = l_AssistantMaterials_0;
                l_Folder_2.Parent = v43;
                l_v3_0 = l_Folder_2;
            else
                l_v3_0 = l_v43_FirstChild_0;
            end;
            l_AssistantMaterials_0 = {};
            l_v43_FirstChild_0 = 0;
            local v47 = false;
            for _, v49 in v40, nil, nil do
                local l_v49_DebugId_0 = v49:GetDebugId(10);
                v49.Name = v18(v36);
                v49.BaseMaterial = v35;
                v49.MaterialPattern = v37;
                v49.Parent = l_v3_0;
                v10.guidToInfo[l_v49_DebugId_0] = {
                    instance = v49
                };
                l_v43_FirstChild_0 = v49.StudsPerTile;
                v47 = v49.MaterialPattern == Enum.MaterialPattern.Organic;
                table.insert(l_AssistantMaterials_0, {
                    guid = l_v49_DebugId_0, 
                    url = v49.ColorMap, 
                    action = string.format("studio://apply_material_variant/%s", l_v49_DebugId_0), 
                    tooltip = v49.Name
                });
            end;
            v4:DisplayContent("Materials", {
                requestId = v33.requestId or "", 
                instanceData = l_AssistantMaterials_0, 
                studsPerTile = l_v43_FirstChild_0, 
                isOrganic = v47
            });
            return v40[1];
        end);
    end);
end;
local function _(v52, v53, v54, v55, v56)
    return v51(v52, v53, v54, v55, v56);
end;
return function(v58)
    local l_arguments_0 = v58.arguments;
    assert(type(l_arguments_0.materialDescription) == "string", "Bad request.materialDescription");
    local v60 = l_arguments_0.materialId or l_arguments_0.instanceId;
    assert(v60, "Bad request.materialId");
    l_arguments_0.materialId = v60;
    v10.StartRecordingActions(v58.requestId);
    local v61, v62 = v51(v58, l_arguments_0.materialDescription, l_arguments_0.baseMaterial, l_arguments_0.materialId, l_arguments_0.materialPattern):await();
    if v61 then
        if l_arguments_0.materialId then
            v10.set(l_arguments_0.materialId, v62);
        end;
        v10.EndRecordingActions(v58.requestId);
        return ;
    else
        local v63 = v9:getText("CreateMaterial", "FailedToCreateMaterialImprovedError", {});
        if not (not v11() or not string.find(tostring(v62), "text is fully filtered")) then
            v63 = v9:getText("CreateMaterial", "FailedToCreateMaterialTextFilteredError", {});
        end;
        v7.streamText(v58.requestId, string.format("\n%s\n", v63));
        v10.EndRecordingActions(v58.requestId);
        return ;
    end;
end;
