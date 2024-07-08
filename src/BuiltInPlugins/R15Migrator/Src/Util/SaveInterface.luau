local v0 = {};
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local l_Attributes_0 = v5.Attributes;
local v7 = require(l_script_FirstAncestor_0.Src.Util.PublishTagging);
local v8 = require(l_script_FirstAncestor_0.Src.Util.QuickAccessTagging);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.AnimationConversionManager);
local v10 = v5.AttributePrefix .. "R15MigratorConversionId";
local v11 = v5.AttributePrefix .. "ScriptConversionRules";
local v12 = nil;
local v13 = nil;
local function _(v14)
    local l_l_ServerStorage_0_FirstChild_0 = l_ServerStorage_0:FindFirstChild(v14);
    if not l_l_ServerStorage_0_FirstChild_0 or not l_l_ServerStorage_0_FirstChild_0:IsA("Folder") then
        return nil;
    else
        return l_l_ServerStorage_0_FirstChild_0;
    end;
end;
local function _(v17, v18)
    local l_v18_FirstChild_0 = v18:FindFirstChild(v17);
    if not l_v18_FirstChild_0 or not l_v18_FirstChild_0:IsA("Folder") then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v17;
        l_Folder_0.Parent = v18;
        return l_Folder_0;
    else
        return l_v18_FirstChild_0;
    end;
end;
local function _(v22)
    if not v12 then
        local l_l_ServerStorage_0_0 = l_ServerStorage_0;
        local l_R15MigratorProgress_0 = l_l_ServerStorage_0_0:FindFirstChild("R15MigratorProgress");
        local v25;
        if not l_R15MigratorProgress_0 or not l_R15MigratorProgress_0:IsA("Folder") then
            local l_Folder_1 = Instance.new("Folder");
            l_Folder_1.Name = "R15MigratorProgress";
            l_Folder_1.Parent = l_l_ServerStorage_0_0;
            v25 = l_Folder_1;
        else
            v25 = l_R15MigratorProgress_0;
        end;
        v12 = v25;
    end;
    if not v22 then
        return v12;
    else
        local l_v12_0 = v12;
        local l_l_v12_0_FirstChild_0 = l_v12_0:FindFirstChild(v22);
        if not l_l_v12_0_FirstChild_0 or not l_l_v12_0_FirstChild_0:IsA("Folder") then
            local l_Folder_2 = Instance.new("Folder");
            l_Folder_2.Name = v22;
            l_Folder_2.Parent = l_v12_0;
            return l_Folder_2;
        else
            return l_l_v12_0_FirstChild_0;
        end;
    end;
end;
local function _(v31)
    if not v13 then
        local l_l_ServerStorage_0_1 = l_ServerStorage_0;
        local l_R15MigratorPostPublish_0 = l_l_ServerStorage_0_1:FindFirstChild("R15MigratorPostPublish");
        local v34;
        if not l_R15MigratorPostPublish_0 or not l_R15MigratorPostPublish_0:IsA("Folder") then
            local l_Folder_3 = Instance.new("Folder");
            l_Folder_3.Name = "R15MigratorPostPublish";
            l_Folder_3.Parent = l_l_ServerStorage_0_1;
            v34 = l_Folder_3;
        else
            v34 = l_R15MigratorPostPublish_0;
        end;
        v13 = v34;
    end;
    if not v31 then
        return v13;
    else
        local l_v13_0 = v13;
        local l_l_v13_0_FirstChild_0 = l_v13_0:FindFirstChild(v31);
        if not l_l_v13_0_FirstChild_0 or not l_l_v13_0_FirstChild_0:IsA("Folder") then
            local l_Folder_4 = Instance.new("Folder");
            l_Folder_4.Name = v31;
            l_Folder_4.Parent = l_v13_0;
            return l_Folder_4;
        else
            return l_l_v13_0_FirstChild_0;
        end;
    end;
end;
local function _(v40)
    if not v12 then
        local l_R15MigratorProgress_1 = l_ServerStorage_0:FindFirstChild("R15MigratorProgress");
        v12 = if not not l_R15MigratorProgress_1 and l_R15MigratorProgress_1:IsA("Folder") then l_R15MigratorProgress_1 else nil;
    end;
    if not v12 or not v40 then
        return v12;
    else
        return (v12:FindFirstChild(v40));
    end;
end;
local function _(v43)
    if not v13 then
        local l_R15MigratorPostPublish_1 = l_ServerStorage_0:FindFirstChild("R15MigratorPostPublish");
        v13 = if not not l_R15MigratorPostPublish_1 and l_R15MigratorPostPublish_1:IsA("Folder") then l_R15MigratorPostPublish_1 else nil;
    end;
    if not v13 or not v43 then
        return v13;
    else
        return (v13:FindFirstChild(v43));
    end;
end;
local function _(v46)
    v7:clearPublishTags(v46);
    v8.clearTags(v46);
end;
v0.isRootSaveFolderChildOf = function(v48)
    if not v12 then
        local l_l_ServerStorage_0_2 = l_ServerStorage_0;
        local l_R15MigratorProgress_2 = l_l_ServerStorage_0_2:FindFirstChild("R15MigratorProgress");
        local v51;
        if not l_R15MigratorProgress_2 or not l_R15MigratorProgress_2:IsA("Folder") then
            local l_Folder_5 = Instance.new("Folder");
            l_Folder_5.Name = "R15MigratorProgress";
            l_Folder_5.Parent = l_l_ServerStorage_0_2;
            v51 = l_Folder_5;
        else
            v51 = l_R15MigratorProgress_2;
        end;
        v12 = v51;
    end;
    return v12.Parent == v48;
end;
v0.isRootSaveFolderDescendantOf = function(v53)
    if not v12 then
        local l_l_ServerStorage_0_3 = l_ServerStorage_0;
        local l_R15MigratorProgress_3 = l_l_ServerStorage_0_3:FindFirstChild("R15MigratorProgress");
        local v56;
        if not l_R15MigratorProgress_3 or not l_R15MigratorProgress_3:IsA("Folder") then
            local l_Folder_6 = Instance.new("Folder");
            l_Folder_6.Name = "R15MigratorProgress";
            l_Folder_6.Parent = l_l_ServerStorage_0_3;
            v56 = l_Folder_6;
        else
            v56 = l_R15MigratorProgress_3;
        end;
        v12 = v56;
    end;
    return v12:IsDescendantOf(v53);
end;
v0.isRootSaveFolder = function(v58)
    if not v12 then
        local l_l_ServerStorage_0_4 = l_ServerStorage_0;
        local l_R15MigratorProgress_4 = l_l_ServerStorage_0_4:FindFirstChild("R15MigratorProgress");
        local v61;
        if not l_R15MigratorProgress_4 or not l_R15MigratorProgress_4:IsA("Folder") then
            local l_Folder_7 = Instance.new("Folder");
            l_Folder_7.Name = "R15MigratorProgress";
            l_Folder_7.Parent = l_l_ServerStorage_0_4;
            v61 = l_Folder_7;
        else
            v61 = l_R15MigratorProgress_4;
        end;
        v12 = v61;
    end;
    return v12 == v58;
end;
v0.isDescendantOfSaveFolder = function(v63)
    if not v12 then
        local l_l_ServerStorage_0_5 = l_ServerStorage_0;
        local l_R15MigratorProgress_5 = l_l_ServerStorage_0_5:FindFirstChild("R15MigratorProgress");
        local v66;
        if not l_R15MigratorProgress_5 or not l_R15MigratorProgress_5:IsA("Folder") then
            local l_Folder_8 = Instance.new("Folder");
            l_Folder_8.Name = "R15MigratorProgress";
            l_Folder_8.Parent = l_l_ServerStorage_0_5;
            v66 = l_Folder_8;
        else
            v66 = l_R15MigratorProgress_5;
        end;
        v12 = v66;
    end;
    return v63:IsDescendantOf(v12);
end;
v0.doesSaveFolderExistInDM = function()
    return l_ServerStorage_0:FindFirstChild("R15MigratorProgress") ~= nil;
end;
v0.removeAllSavedData = function()
    local l_R15MigratorProgress_6 = l_ServerStorage_0:FindFirstChild("R15MigratorProgress");
    if l_R15MigratorProgress_6 ~= nil then
        l_R15MigratorProgress_6:Destroy();
    end;
end;
v0.conversionIdFilter = function()
    return function(v69)
        return v69:GetAttribute(v10) ~= nil;
    end;
end;
v0.removeConversionId = function(v70)
    v70:SetAttribute(v10, nil);
end;
v0.SetAdapted = function(v71)
    if not v12 then
        local l_l_ServerStorage_0_6 = l_ServerStorage_0;
        local l_R15MigratorProgress_7 = l_l_ServerStorage_0_6:FindFirstChild("R15MigratorProgress");
        local v74;
        if not l_R15MigratorProgress_7 or not l_R15MigratorProgress_7:IsA("Folder") then
            local l_Folder_9 = Instance.new("Folder");
            l_Folder_9.Name = "R15MigratorProgress";
            l_Folder_9.Parent = l_l_ServerStorage_0_6;
            v74 = l_Folder_9;
        else
            v74 = l_R15MigratorProgress_7;
        end;
        v12 = v74;
    end;
    v12:SetAttribute(l_Attributes_0.Adapted, v71);
end;
v0.GetAdapted = function()
    if not v12 then
        local l_l_ServerStorage_0_7 = l_ServerStorage_0;
        local l_R15MigratorProgress_8 = l_l_ServerStorage_0_7:FindFirstChild("R15MigratorProgress");
        local v78;
        if not l_R15MigratorProgress_8 or not l_R15MigratorProgress_8:IsA("Folder") then
            local l_Folder_10 = Instance.new("Folder");
            l_Folder_10.Name = "R15MigratorProgress";
            l_Folder_10.Parent = l_l_ServerStorage_0_7;
            v78 = l_Folder_10;
        else
            v78 = l_R15MigratorProgress_8;
        end;
        v12 = v78;
    end;
    local l_v12_1 = v12;
    local l_l_v12_1_Attribute_0 = l_v12_1:GetAttribute(l_Attributes_0.Adapted);
    if l_l_v12_1_Attribute_0 == nil then
        l_v12_1:SetAttribute(l_Attributes_0.Adapted, true);
        return true;
    else
        return l_l_v12_1_Attribute_0 == true;
    end;
end;
v0.getConversionId = function(v82)
    return v82:GetAttribute(v10);
end;
v0.hasConvertedFrom = function(v83)
    return v0.getConversionId(v83) ~= nil;
end;
v0.addConvertibleCharacters = function(v84)
    if not v12 then
        local l_l_ServerStorage_0_8 = l_ServerStorage_0;
        local l_R15MigratorProgress_9 = l_l_ServerStorage_0_8:FindFirstChild("R15MigratorProgress");
        local v87;
        if not l_R15MigratorProgress_9 or not l_R15MigratorProgress_9:IsA("Folder") then
            local l_Folder_11 = Instance.new("Folder");
            l_Folder_11.Name = "R15MigratorProgress";
            l_Folder_11.Parent = l_l_ServerStorage_0_8;
            v87 = l_Folder_11;
        else
            v87 = l_R15MigratorProgress_9;
        end;
        v12 = v87;
    end;
    local l_v12_2 = v12;
    local l_R6Characters_0 = l_v12_2:FindFirstChild("R6Characters");
    local v91;
    if not l_R6Characters_0 or not l_R6Characters_0:IsA("Folder") then
        local l_Folder_12 = Instance.new("Folder");
        l_Folder_12.Name = "R6Characters";
        l_Folder_12.Parent = l_v12_2;
        v91 = l_Folder_12;
    else
        v91 = l_R6Characters_0;
    end;
    for _, v94 in v84, nil, nil do
        if not v94:GetAttribute(v10) then
            local v95 = l_HttpService_0:GenerateGUID();
            v94:SetAttribute(v10, v95);
            local v96 = v94:Clone();
            v96.Name = v95;
            v96.Parent = v91;
            v7:clearPublishTags(v96);
            v8.clearTags(v96);
        end;
    end;
end;
v0.getR6Characters = function()
    if not v12 then
        local l_l_ServerStorage_0_9 = l_ServerStorage_0;
        local l_R15MigratorProgress_10 = l_l_ServerStorage_0_9:FindFirstChild("R15MigratorProgress");
        local v99;
        if not l_R15MigratorProgress_10 or not l_R15MigratorProgress_10:IsA("Folder") then
            local l_Folder_13 = Instance.new("Folder");
            l_Folder_13.Name = "R15MigratorProgress";
            l_Folder_13.Parent = l_l_ServerStorage_0_9;
            v99 = l_Folder_13;
        else
            v99 = l_R15MigratorProgress_10;
        end;
        v12 = v99;
    end;
    local l_v12_3 = v12;
    local l_R6Characters_1 = l_v12_3:FindFirstChild("R6Characters");
    local v103;
    if not l_R6Characters_1 or not l_R6Characters_1:IsA("Folder") then
        local l_Folder_14 = Instance.new("Folder");
        l_Folder_14.Name = "R6Characters";
        l_Folder_14.Parent = l_v12_3;
        v103 = l_Folder_14;
    else
        v103 = l_R6Characters_1;
    end;
    l_v12_3 = {};
    for _, v106 in v103:GetChildren() do
        l_v12_3[v106.Name] = v106;
    end;
    return l_v12_3;
end;
v0.addScriptConversionRules = function(v107)
    if not v12 then
        local l_l_ServerStorage_0_10 = l_ServerStorage_0;
        local l_R15MigratorProgress_11 = l_l_ServerStorage_0_10:FindFirstChild("R15MigratorProgress");
        local v110;
        if not l_R15MigratorProgress_11 or not l_R15MigratorProgress_11:IsA("Folder") then
            local l_Folder_15 = Instance.new("Folder");
            l_Folder_15.Name = "R15MigratorProgress";
            l_Folder_15.Parent = l_l_ServerStorage_0_10;
            v110 = l_Folder_15;
        else
            v110 = l_R15MigratorProgress_11;
        end;
        v12 = v110;
    end;
    v12:SetAttribute(v11, l_HttpService_0:JSONEncode(v107));
end;
v0.getScriptConversionRules = function()
    if not v12 then
        local l_R15MigratorProgress_12 = l_ServerStorage_0:FindFirstChild("R15MigratorProgress");
        v12 = if not not l_R15MigratorProgress_12 and l_R15MigratorProgress_12:IsA("Folder") then l_R15MigratorProgress_12 else nil;
    end;
    if v12 then
        if not v12 then
            local l_R15MigratorProgress_13 = l_ServerStorage_0:FindFirstChild("R15MigratorProgress");
            v12 = if not not l_R15MigratorProgress_13 and l_R15MigratorProgress_13:IsA("Folder") then l_R15MigratorProgress_13 else nil;
        end;
        local l_v12_Attribute_0 = v12:GetAttribute(v11);
        if not l_v12_Attribute_0 then
            return nil;
        else
            return (l_HttpService_0:JSONDecode(l_v12_Attribute_0));
        end;
    else
        return nil;
    end;
end;
v0.isConvertibleKeyframeSequence = function(v115)
    return v115:IsA("KeyframeSequence") and v115:GetAttribute(v10) ~= nil;
end;
v0.addConvertibleKeyframeSequences = function(v116)
    if not v12 then
        local l_l_ServerStorage_0_11 = l_ServerStorage_0;
        local l_R15MigratorProgress_14 = l_l_ServerStorage_0_11:FindFirstChild("R15MigratorProgress");
        local v119;
        if not l_R15MigratorProgress_14 or not l_R15MigratorProgress_14:IsA("Folder") then
            local l_Folder_16 = Instance.new("Folder");
            l_Folder_16.Name = "R15MigratorProgress";
            l_Folder_16.Parent = l_l_ServerStorage_0_11;
            v119 = l_Folder_16;
        else
            v119 = l_R15MigratorProgress_14;
        end;
        v12 = v119;
    end;
    local l_v12_4 = v12;
    local l_R6KeyframeSequences_0 = l_v12_4:FindFirstChild("R6KeyframeSequences");
    local v123;
    if not l_R6KeyframeSequences_0 or not l_R6KeyframeSequences_0:IsA("Folder") then
        local l_Folder_17 = Instance.new("Folder");
        l_Folder_17.Name = "R6KeyframeSequences";
        l_Folder_17.Parent = l_v12_4;
        v123 = l_Folder_17;
    else
        v123 = l_R6KeyframeSequences_0;
    end;
    for _, v126 in v116, nil, nil do
        if not (not v126:IsA("KeyframeSequence") or v126:GetAttribute(v10)) then
            local v127 = l_HttpService_0:GenerateGUID();
            v126:SetAttribute(v10, v127);
            local v128 = v126:Clone();
            v128.Name = v127;
            v128:SetAttribute(l_Attributes_0.OriginalId, nil);
            v128.Parent = v123;
            v7:clearPublishTags(v128);
            v8.clearTags(v128);
        end;
    end;
end;
v0.getR6KeyframeSequence = function(v129, v130)
    local l_v129_Attribute_0 = v129:GetAttribute(v10);
    if l_v129_Attribute_0 then
        local v132 = nil;
        if not v130 then
            if not v12 then
                local l_l_ServerStorage_0_12 = l_ServerStorage_0;
                local l_R15MigratorProgress_15 = l_l_ServerStorage_0_12:FindFirstChild("R15MigratorProgress");
                local v135;
                if not l_R15MigratorProgress_15 or not l_R15MigratorProgress_15:IsA("Folder") then
                    local l_Folder_18 = Instance.new("Folder");
                    l_Folder_18.Name = "R15MigratorProgress";
                    l_Folder_18.Parent = l_l_ServerStorage_0_12;
                    v135 = l_Folder_18;
                else
                    v135 = l_R15MigratorProgress_15;
                end;
                v12 = v135;
            end;
            local l_v12_5 = v12;
            local l_R6KeyframeSequences_1 = l_v12_5:FindFirstChild("R6KeyframeSequences");
            local v139;
            if not l_R6KeyframeSequences_1 or not l_R6KeyframeSequences_1:IsA("Folder") then
                local l_Folder_19 = Instance.new("Folder");
                l_Folder_19.Name = "R6KeyframeSequences";
                l_Folder_19.Parent = l_v12_5;
                v139 = l_Folder_19;
            else
                v139 = l_R6KeyframeSequences_1;
            end;
            v132 = v139:FindFirstChild(l_v129_Attribute_0);
        else
            v132 = v130[l_v129_Attribute_0];
        end;
        if v132 then
            return v132;
        else
            local l_warn_0 = warn;
            local v142 = "Original R6 KeyframeSequence is unavailable. Was the %* folder edited?";
            if not v12 then
                local l_l_ServerStorage_0_13 = l_ServerStorage_0;
                local l_R15MigratorProgress_16 = l_l_ServerStorage_0_13:FindFirstChild("R15MigratorProgress");
                local v145;
                if not l_R15MigratorProgress_16 or not l_R15MigratorProgress_16:IsA("Folder") then
                    local l_Folder_20 = Instance.new("Folder");
                    l_Folder_20.Name = "R15MigratorProgress";
                    l_Folder_20.Parent = l_l_ServerStorage_0_13;
                    v145 = l_Folder_20;
                else
                    v145 = l_R15MigratorProgress_16;
                end;
                v12 = v145;
            end;
            l_warn_0((v142:format(v12)));
            return ;
        end;
    else
        local l_warn_1 = warn;
        local v148 = "Could not find matching R6 KeyframeSequence. Was the %* folder edited?";
        if not v12 then
            local l_l_ServerStorage_0_14 = l_ServerStorage_0;
            local l_R15MigratorProgress_17 = l_l_ServerStorage_0_14:FindFirstChild("R15MigratorProgress");
            local v151;
            if not l_R15MigratorProgress_17 or not l_R15MigratorProgress_17:IsA("Folder") then
                local l_Folder_21 = Instance.new("Folder");
                l_Folder_21.Name = "R15MigratorProgress";
                l_Folder_21.Parent = l_l_ServerStorage_0_14;
                v151 = l_Folder_21;
            else
                v151 = l_R15MigratorProgress_17;
            end;
            v12 = v151;
        end;
        l_warn_1((v148:format(v12)));
        return ;
    end;
end;
v0.getOriginalR6KeyframeSequences = function(v153)
    if not v12 then
        local l_l_ServerStorage_0_15 = l_ServerStorage_0;
        local l_R15MigratorProgress_18 = l_l_ServerStorage_0_15:FindFirstChild("R15MigratorProgress");
        local v156;
        if not l_R15MigratorProgress_18 or not l_R15MigratorProgress_18:IsA("Folder") then
            local l_Folder_22 = Instance.new("Folder");
            l_Folder_22.Name = "R15MigratorProgress";
            l_Folder_22.Parent = l_l_ServerStorage_0_15;
            v156 = l_Folder_22;
        else
            v156 = l_R15MigratorProgress_18;
        end;
        v12 = v156;
    end;
    local l_v12_6 = v12;
    local l_R6KeyframeSequences_2 = l_v12_6:FindFirstChild("R6KeyframeSequences");
    local v160;
    if not l_R6KeyframeSequences_2 or not l_R6KeyframeSequences_2:IsA("Folder") then
        local l_Folder_23 = Instance.new("Folder");
        l_Folder_23.Name = "R6KeyframeSequences";
        l_Folder_23.Parent = l_v12_6;
        v160 = l_Folder_23;
    else
        v160 = l_R6KeyframeSequences_2;
    end;
    l_v12_6 = {};
    for _, v163 in v160:GetChildren() do
        l_v12_6[v163.Name] = v163;
    end;
    l_R6KeyframeSequences_2 = {};
    for _, v165 in v153, nil, nil do
        l_R6KeyframeSequences_2[v165] = v0.getR6KeyframeSequence(v165, l_v12_6);
    end;
    return l_R6KeyframeSequences_2;
end;
v0.addConvertibleAssetIds = function(v166)
    if not v12 then
        local l_l_ServerStorage_0_16 = l_ServerStorage_0;
        local l_R15MigratorProgress_19 = l_l_ServerStorage_0_16:FindFirstChild("R15MigratorProgress");
        local v169;
        if not l_R15MigratorProgress_19 or not l_R15MigratorProgress_19:IsA("Folder") then
            local l_Folder_24 = Instance.new("Folder");
            l_Folder_24.Name = "R15MigratorProgress";
            l_Folder_24.Parent = l_l_ServerStorage_0_16;
            v169 = l_Folder_24;
        else
            v169 = l_R15MigratorProgress_19;
        end;
        v12 = v169;
    end;
    local l_v12_7 = v12;
    local l_R15KeyframeSequences_0 = l_v12_7:FindFirstChild("R15KeyframeSequences");
    local v173;
    if not l_R15KeyframeSequences_0 or not l_R15KeyframeSequences_0:IsA("Folder") then
        local l_Folder_25 = Instance.new("Folder");
        l_Folder_25.Name = "R15KeyframeSequences";
        l_Folder_25.Parent = l_v12_7;
        v173 = l_Folder_25;
    else
        v173 = l_R15KeyframeSequences_0;
    end;
    l_v12_7 = {};
    for _, v176 in v173:GetChildren() do
        l_v12_7[tonumber(v176.Name)] = true;
    end;
    for _, v178 in v166, nil, nil do
        if not l_v12_7[v178] then
            local v179 = v9.getConvertedKeyframeSequence(v178);
            if v179 then
                l_v12_7[v178] = true;
                local v180 = v179.Parent:Clone();
                v180.Name = v178;
                v180:SetAttribute(l_Attributes_0.TempId, nil);
                v180.Parent = v173;
                v7:clearPublishTags(v180);
                v8.clearTags(v180);
            end;
        end;
    end;
end;
v0.setTargetAssetId = function(v181, v182)
    if v181 and v182 then
        local v183 = tostring(v181);
        local v184 = tostring(v182);
        if not v12 then
            local l_l_ServerStorage_0_17 = l_ServerStorage_0;
            local l_R15MigratorProgress_20 = l_l_ServerStorage_0_17:FindFirstChild("R15MigratorProgress");
            local v187;
            if not l_R15MigratorProgress_20 or not l_R15MigratorProgress_20:IsA("Folder") then
                local l_Folder_26 = Instance.new("Folder");
                l_Folder_26.Name = "R15MigratorProgress";
                l_Folder_26.Parent = l_l_ServerStorage_0_17;
                v187 = l_Folder_26;
            else
                v187 = l_R15MigratorProgress_20;
            end;
            v12 = v187;
        end;
        local l_v12_8 = v12;
        local l_R15KeyframeSequences_1 = l_v12_8:FindFirstChild("R15KeyframeSequences");
        local v191;
        if not l_R15KeyframeSequences_1 or not l_R15KeyframeSequences_1:IsA("Folder") then
            local l_Folder_27 = Instance.new("Folder");
            l_Folder_27.Name = "R15KeyframeSequences";
            l_Folder_27.Parent = l_v12_8;
            v191 = l_Folder_27;
        else
            v191 = l_R15KeyframeSequences_1;
        end;
        l_v12_8 = v191:FindFirstChild(v183);
        if l_v12_8 and l_v12_8:IsA("StringValue") then
            if #l_v12_8.Value > 0 then
                l_R15KeyframeSequences_1 = warn;
                local v193 = "%*.Value in folder %* should be empty. Was the %* folder edited?";
                local l_v183_0 = v183;
                local v195 = "R15KeyframeSequences";
                if not v12 then
                    local l_l_ServerStorage_0_18 = l_ServerStorage_0;
                    local l_R15MigratorProgress_21 = l_l_ServerStorage_0_18:FindFirstChild("R15MigratorProgress");
                    local v198;
                    if not l_R15MigratorProgress_21 or not l_R15MigratorProgress_21:IsA("Folder") then
                        local l_Folder_28 = Instance.new("Folder");
                        l_Folder_28.Name = "R15MigratorProgress";
                        l_Folder_28.Parent = l_l_ServerStorage_0_18;
                        v198 = l_Folder_28;
                    else
                        v198 = l_R15MigratorProgress_21;
                    end;
                    v12 = v198;
                end;
                l_R15KeyframeSequences_1((v193:format(l_v183_0, v195, v12)));
            end;
            l_v12_8.Value = v184;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v0.addConvertibleAnimations = function(v200)
    local v201 = {};
    for _, v203 in v200, nil, nil do
        if v203:IsA("Animation") then
            local v204 = v9.getNormalizedAssetId(v203);
            assert(v204 and typeof(v204) == "number");
            table.insert(v201, v204);
        end;
    end;
    v0.addConvertibleAssetIds(v201);
end;
v0.getAllSavedAnimationAssetIds = function()
    if not v12 then
        local l_l_ServerStorage_0_19 = l_ServerStorage_0;
        local l_R15MigratorProgress_22 = l_l_ServerStorage_0_19:FindFirstChild("R15MigratorProgress");
        local v207;
        if not l_R15MigratorProgress_22 or not l_R15MigratorProgress_22:IsA("Folder") then
            local l_Folder_29 = Instance.new("Folder");
            l_Folder_29.Name = "R15MigratorProgress";
            l_Folder_29.Parent = l_l_ServerStorage_0_19;
            v207 = l_Folder_29;
        else
            v207 = l_R15MigratorProgress_22;
        end;
        v12 = v207;
    end;
    local l_v12_9 = v12;
    local l_R15KeyframeSequences_2 = l_v12_9:FindFirstChild("R15KeyframeSequences");
    local v211;
    if not l_R15KeyframeSequences_2 or not l_R15KeyframeSequences_2:IsA("Folder") then
        local l_Folder_30 = Instance.new("Folder");
        l_Folder_30.Name = "R15KeyframeSequences";
        l_Folder_30.Parent = l_v12_9;
        v211 = l_Folder_30;
    else
        v211 = l_R15KeyframeSequences_2;
    end;
    l_v12_9 = {};
    for _, v214 in v211:GetChildren() do
        if v214:IsA("StringValue") then
            local v215 = tonumber(v214.Name);
            if v215 then
                local v216 = tonumber(v214.Value);
                if v216 then
                    l_v12_9[v215] = {
                        converted = v216, 
                        kfs = v214:FindFirstChildWhichIsA("KeyframeSequence"), 
                        name = v214:GetAttribute(l_Attributes_0.Name)
                    };
                end;
            end;
        end;
    end;
    return l_v12_9;
end;
v0.setPublishTime = function(v217)
    if not v13 then
        local l_l_ServerStorage_0_20 = l_ServerStorage_0;
        local l_R15MigratorPostPublish_2 = l_l_ServerStorage_0_20:FindFirstChild("R15MigratorPostPublish");
        local v220;
        if not l_R15MigratorPostPublish_2 or not l_R15MigratorPostPublish_2:IsA("Folder") then
            local l_Folder_31 = Instance.new("Folder");
            l_Folder_31.Name = "R15MigratorPostPublish";
            l_Folder_31.Parent = l_l_ServerStorage_0_20;
            v220 = l_Folder_31;
        else
            v220 = l_R15MigratorPostPublish_2;
        end;
        v13 = v220;
    end;
    local l_v13_1 = v13;
    local l_PublishInfo_0 = l_v13_1:FindFirstChild("PublishInfo");
    local v224;
    if not l_PublishInfo_0 or not l_PublishInfo_0:IsA("Folder") then
        local l_Folder_32 = Instance.new("Folder");
        l_Folder_32.Name = "PublishInfo";
        l_Folder_32.Parent = l_v13_1;
        v224 = l_Folder_32;
    else
        v224 = l_PublishInfo_0;
    end;
    v224:SetAttribute("publishTime", v217:ToIsoDate());
end;
v0.getPublishTime = function()
    if not v13 then
        local l_R15MigratorPostPublish_3 = l_ServerStorage_0:FindFirstChild("R15MigratorPostPublish");
        v13 = if not not l_R15MigratorPostPublish_3 and l_R15MigratorPostPublish_3:IsA("Folder") then l_R15MigratorPostPublish_3 else nil;
    end;
    local v227 = if not v13 then v13 else v13:FindFirstChild("PublishInfo");
    if v227 then
        local l_v227_Attribute_0 = v227:GetAttribute("publishTime");
        if type(l_v227_Attribute_0) == "string" then
            return (DateTime.fromIsoDate(l_v227_Attribute_0));
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
return v0;
