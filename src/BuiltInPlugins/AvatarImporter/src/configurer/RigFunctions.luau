local v0 = {};
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_PublishService_0 = game:GetService("PublishService");
local v4 = require(script.Parent.Constants);
local v5 = require(script.Parent.FixedRigPositions);
local v6 = require(script.Parent.R6);
local v7 = {
    Head = {
        "Head"
    }, 
    Torso = {
        "UpperTorso", 
        "LowerTorso"
    }, 
    ["Right Arm"] = {
        "RightUpperArm", 
        "RightLowerArm", 
        "RightHand"
    }, 
    ["Left Arm"] = {
        "LeftUpperArm", 
        "LeftLowerArm", 
        "LeftHand"
    }, 
    ["Right Leg"] = {
        "RightUpperLeg", 
        "RightLowerLeg", 
        "RightFoot"
    }, 
    ["Left Leg"] = {
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "LeftFoot"
    }
};
local v8 = {
    l_ContentProvider_0.BaseUrl .. "asset/?id=", 
    "rbxassetid://"
};
local function _(v9)
    if not tonumber(v9) then
        return v9;
    else
        return l_ContentProvider_0.BaseUrl .. "asset/?id=" .. v9;
    end;
end;
v0.GetLimbNames = function()
    local v11 = {};
    for v12, _ in pairs(v7) do
        v11[#v11 + 1] = v12;
    end;
    return v11;
end;
v0.GetBodyPartNames = function()
    local v14 = {};
    for _, v16 in pairs(Enum.BodyPart:GetEnumItems()) do
        v14[#v14 + 1] = v16.Name;
    end;
    return v14;
end;
v0.RemoveAssetUrlFromText = function(v17)
    if typeof(v17) ~= "string" then
        return v17;
    else
        for _, v19 in pairs(v8) do
            if string.find(v17, v19, 1, true) ~= nil then
                return (string.sub(v17, v19:len() + 1));
            end;
        end;
        return v17;
    end;
end;
v0.GetCurrentTextureIdFromRig = function(v20, v21)
    for _, v23 in pairs(v7[v21]) do
        local l_v20_FirstChild_0 = v20:FindFirstChild(v23);
        if l_v20_FirstChild_0 and l_v20_FirstChild_0.TextureID ~= "" then
            return v0.RemoveAssetUrlFromText(l_v20_FirstChild_0.TextureID);
        end;
    end;
    return nil;
end;
local function _(v25)
    if typeof(v25) == "string" and v25 ~= "" then
        return true;
    elseif typeof(v25) == "number" and v25 ~= 0 then
        return true;
    else
        return ;
    end;
end;
local function _(v27)
    local v28 = false;
    if v27 ~= "" then
        v28 = v27 ~= v4.DEFAULT_FACE_TEXTURE;
    end;
    return v28;
end;
v0.FindFaceTexture = function(v30, v31)
    if v31 then
        local l_Head_0 = v31:FindFirstChild("Head");
        if l_Head_0 then
            local l_face_0 = l_Head_0:FindFirstChild("face");
            if l_face_0 then
                local l_Texture_0 = l_face_0.Texture;
                local v35 = false;
                if l_Texture_0 ~= "" then
                    v35 = l_Texture_0 ~= v4.DEFAULT_FACE_TEXTURE;
                end;
                if v35 then
                    return l_face_0.Texture;
                end;
            end;
        end;
    end;
    if v30 then
        local l_Head_1 = v30:FindFirstChild("Head");
        if l_Head_1 then
            if l_Head_1:IsA("MeshPart") and l_Head_1.TextureID ~= "" then
                return l_Head_1.TextureID;
            else
                local l_face_1 = l_Head_1:FindFirstChild("face");
                if l_face_1 then
                    local l_Texture_1 = l_face_1.Texture;
                    local v39 = false;
                    if l_Texture_1 ~= "" then
                        v39 = l_Texture_1 ~= v4.DEFAULT_FACE_TEXTURE;
                    end;
                    if v39 then
                        return l_face_1.Texture;
                    end;
                end;
            end;
        end;
    end;
    return nil;
end;
v0.GetCurrentCharacterMeshIdFromRig = function(v40, v41)
    for _, v43 in pairs(v40:GetChildren()) do
        if v43:IsA("CharacterMesh") and v43.BodyPart.Name == v41 then
            local l_MeshId_0 = v43.MeshId;
            if typeof(l_MeshId_0) == "string" and l_MeshId_0 ~= "" or ((typeof(l_MeshId_0) == "number" and l_MeshId_0 ~= 0) and true or nil) then
                return v43.MeshId;
            end;
        elseif v43:IsA("Part") and v43.Name == v41 then
            local l_SpecialMesh_0 = v43:FindFirstChildWhichIsA("SpecialMesh");
            if l_SpecialMesh_0 then
                local l_MeshId_1 = l_SpecialMesh_0.MeshId;
                if typeof(l_MeshId_1) == "string" and l_MeshId_1 ~= "" or ((typeof(l_MeshId_1) == "number" and l_MeshId_1 ~= 0) and true or nil) then
                    return v0.RemoveAssetUrlFromText(l_SpecialMesh_0.MeshId);
                end;
            end;
        end;
    end;
    return nil;
end;
v0.GetCharacterMeshPropertyFromRig = function(v47, v48)
    for _, v50 in pairs(v47:GetChildren()) do
        if v50:IsA("CharacterMesh") then
            local v51 = v50[v48];
            if typeof(v51) == "string" and v51 ~= "" or ((typeof(v51) == "number" and v51 ~= 0) and true or nil) then
                return v51;
            end;
        end;
    end;
    return nil;
end;
local function v58(v52, v53, v54)
    for _, v56 in pairs(v53) do
        local l_v52_FirstChild_0 = v52:FindFirstChild(v56);
        if l_v52_FirstChild_0 then
            l_v52_FirstChild_0.TextureID = if not tonumber(v54) then v54 else l_ContentProvider_0.BaseUrl .. "asset/?id=" .. v54;
        end;
    end;
end;
local function v66(v59, v60, v61)
    for _, v63 in pairs(v59:GetChildren()) do
        if v63:IsA("CharacterMesh") then
            local l_status_0, l_result_0 = pcall(function()
                v63[v60] = v61;
            end);
            if not l_status_0 then
                warn("Expected CharacterMesh property, got " .. v60 .. "\n" .. "Error: " .. l_result_0 .. "\n" .. "Traceback: " .. debug.traceback());
            end;
        end;
    end;
end;
local function v71(v67, v68)
    for _, v70 in pairs(v68:GetChildren()) do
        if v70:IsA("CharacterMesh") and v70.BodyPart == v67 then
            return v70;
        end;
    end;
    return nil;
end;
local function v76(v72, v73)
    for _, v75 in pairs(v73:GetChildren()) do
        if v75:IsA("Part") and v75.Name == v72 then
            return v75;
        end;
    end;
    return nil;
end;
v0.CopyCharacterMeshesToRig = function(v77, v78)
    for _, v80 in pairs(Enum.BodyPart:GetEnumItems()) do
        local v81 = tonumber(v77[v80.Name]);
        if v81 and v80 ~= Enum.BodyPart.Head then
            local v82 = v71(v80, v78);
            if not v82 then
                v82 = Instance.new("CharacterMesh");
                v82.BodyPart = v80;
                v82.Parent = v78;
            end;
            v82.MeshId = v81;
        end;
    end;
    local l_Name_0 = Enum.BodyPart.Head.Name;
    local v84 = v76(l_Name_0, v78);
    local v85 = tonumber(v77[l_Name_0]);
    if not (not v85 or not v84) then
        local l_SpecialMesh_1 = v84:FindFirstChildWhichIsA("SpecialMesh");
        if l_SpecialMesh_1 then
            l_SpecialMesh_1.MeshId = if not tonumber(v85) then v85 else l_ContentProvider_0.BaseUrl .. "asset/?id=" .. v85;
        end;
    end;
end;
v0.CopyTexturesToRig = function(v87, v88)
    for v89, v90 in pairs(v87) do
        if not v7[v89] then
            v66(v88, v89, v90);
        else
            v58(v88, v7[v89], v90);
        end;
    end;
end;
v0.AddFaceToRig = function(v91, v92)
    if v91 then
        local l_Head_2 = v92:FindFirstChild("Head");
        if l_Head_2 then
            if l_Head_2:IsA("MeshPart") and l_Head_2.TextureID ~= "" then
                return ;
            else
                local l_face_2 = l_Head_2:FindFirstChild("face");
                if not l_face_2 then
                    l_face_2 = Instance.new("Decal");
                    l_face_2.Name = "face";
                    l_face_2.Parent = l_Head_2;
                end;
                l_face_2.Texture = if not tonumber(v91) then v91 else l_ContentProvider_0.BaseUrl .. "asset/?id=" .. v91;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function _(v95, v96)
    local v97 = v6.Create();
    local l_CFrame_0 = v95.HumanoidRootPart.CFrame;
    v97.HumanoidRootPart.CFrame = l_CFrame_0 + l_CFrame_0.rightVector * 5;
    v97.Parent = v96;
end;
local function _(v100)
    local l_AvatarPartScaleType_0 = v100:FindFirstChild("AvatarPartScaleType");
    if not l_AvatarPartScaleType_0 then
        return v4.AVATAR_PART_SCALE_TYPE.PROPORTIONS_CLASSIC;
    else
        return l_AvatarPartScaleType_0.Value;
    end;
end;
local function _(v103)
    local l_AvatarPartScaleType_1 = v103.Parent:FindFirstChild("AvatarPartScaleType");
    local v105 = if not l_AvatarPartScaleType_1 then v4.AVATAR_PART_SCALE_TYPE.PROPORTIONS_CLASSIC else l_AvatarPartScaleType_1.Value;
    if v105 == v4.AVATAR_PART_SCALE_TYPE.PROPORTIONS_NORMAL then
        return v5.AnthroNormalFixedRigAttachmentMap[v103.Name];
    elseif v105 == v4.AVATAR_PART_SCALE_TYPE.PROPORTIONS_SLENDER then
        return v5.AnthroSlenderFixedRigAttachmentMap[v103.Name];
    else
        return v5.R15FixedRigAttachmentMap[v103.Name];
    end;
end;
local function v107(v108, v109)
    if not v109:IsA("Motor6D") then
        if v109:IsA("Attachment") then
            local l_AvatarPartScaleType_2 = v109.Parent:FindFirstChild("AvatarPartScaleType");
            local v111 = if not l_AvatarPartScaleType_2 then v4.AVATAR_PART_SCALE_TYPE.PROPORTIONS_CLASSIC else l_AvatarPartScaleType_2.Value;
            local v112 = if v111 == v4.AVATAR_PART_SCALE_TYPE.PROPORTIONS_NORMAL then v5.AnthroNormalFixedRigAttachmentMap[v109.Name] else if v111 == v4.AVATAR_PART_SCALE_TYPE.PROPORTIONS_SLENDER then v5.AnthroSlenderFixedRigAttachmentMap[v109.Name] else v5.R15FixedRigAttachmentMap[v109.Name];
            if v112 then
                v111 = v109.Parent;
                local l_OriginalPosition_0 = v109:FindFirstChild("OriginalPosition");
                if l_OriginalPosition_0 then
                    l_OriginalPosition_0:Destroy();
                end;
                v109.Position = ((v111.CFrame - v108.WorldPosition):inverse() * CFrame.new(v112)).p;
            end;
        end;
    else
        v109:Destroy();
    end;
    if v109.Name ~= "HumanoidRootPart" then
        for _, v115 in pairs(v109:GetChildren()) do
            v107(v108, v115);
        end;
    end;
end;
local function v116(v117)
    if v117:IsA("Motor6D") then
        v117:Destroy();
    end;
    for _, v119 in pairs(v117:GetChildren()) do
        v116(v119);
    end;
end;
local function v125(v120, v121)
    local v122 = v120:Clone();
    v122.Name = v4.R15_FIXED_FOLDER_NAME;
    v116(v122);
    v107(v122.HumanoidRootPart.RootRigAttachment, v122);
    local l_Humanoid_0 = v122:FindFirstChildOfClass("Humanoid");
    if l_Humanoid_0 then
        l_Humanoid_0.NameOcclusion = Enum.NameOcclusion.NoOcclusion;
        l_Humanoid_0:BuildRigFromAttachments();
    end;
    local l_CFrame_1 = v120.HumanoidRootPart.CFrame;
    v122.HumanoidRootPart.CFrame = l_CFrame_1 + l_CFrame_1.rightVector * -5;
    v122.Parent = v121;
end;
v0.CreateImportedFbxModel = function(v126)
    for _, v128 in pairs(workspace:GetChildren()) do
        if v128.Name == v4.IMPORTED_RIGS_MODEL_NAME then
            v128:Destroy();
        end;
    end;
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = v4.IMPORTED_RIGS_MODEL_NAME;
    v126.Name = v4.R15_ARTIST_INTENT_FOLDER_NAME;
    v126.Parent = l_Model_0;
    local v130 = v6.Create();
    local l_CFrame_2 = v126.HumanoidRootPart.CFrame;
    v130.HumanoidRootPart.CFrame = l_CFrame_2 + l_CFrame_2.rightVector * 5;
    v130.Parent = l_Model_0;
    v125(v126, l_Model_0);
    l_Model_0.Parent = workspace;
    return l_Model_0;
end;
v0.FindExistingImportedFbx = function()
    return (workspace:FindFirstChild(v4.IMPORTED_RIGS_MODEL_NAME));
end;
local function _(v132, v133, v134)
    local l_Position_0 = v132.HumanoidRootPart.Position;
    local l_v132_FirstChild_0 = v132:FindFirstChild(v133);
    if l_v132_FirstChild_0 then
        local v137 = l_v132_FirstChild_0:Clone();
        v137.CFrame = (CFrame.new() + l_v132_FirstChild_0.Position) - l_Position_0;
        v137.Parent = v134;
    end;
end;
local function v143(v139, v140)
    for _, v142 in pairs(v139:GetChildren()) do
        if v142:IsA("CharacterMesh") and v142.BodyPart.Name == v140:gsub("%s+", "") then
            return v142:Clone();
        end;
    end;
end;
v0.MakeExportVersion = function(v144)
    for _, v146 in pairs(l_ServerStorage_0:GetChildren()) do
        if v146.Name == v4.PACKAGE_EXPORT_MODEL_NAME then
            v146:Destroy();
        end;
    end;
    local l_Model_1 = Instance.new("Model");
    l_Model_1.Name = v4.PACKAGE_EXPORT_MODEL_NAME;
    l_Model_1.Parent = l_ServerStorage_0;
    local function v171()
        l_Model_1:ClearAllChildren();
        local l_v144_FirstChild_0 = v144:FindFirstChild(v4.R15_ARTIST_INTENT_FOLDER_NAME);
        local l_v144_FirstChild_1 = v144:FindFirstChild(v4.R15_FIXED_FOLDER_NAME);
        local l_v144_FirstChild_2 = v144:FindFirstChild(v4.R6_FOLDER_NAME);
        if not (not l_v144_FirstChild_0 or not l_v144_FirstChild_1) and l_v144_FirstChild_2 then
            for v151, v152 in pairs(v7) do
                local v153 = Instance.new("Folder", l_Model_1);
                v153.Name = v151;
                local v154 = Instance.new("Folder", v153);
                v154.Name = v4.R15_ARTIST_INTENT_FOLDER_NAME;
                local v155 = Instance.new("Folder", v153);
                v155.Name = v4.R15_FIXED_FOLDER_NAME;
                for _, v157 in pairs(v152) do
                    local l_Position_1 = l_v144_FirstChild_0.HumanoidRootPart.Position;
                    local l_l_v144_FirstChild_0_FirstChild_0 = l_v144_FirstChild_0:FindFirstChild(v157);
                    if l_l_v144_FirstChild_0_FirstChild_0 then
                        local v160 = l_l_v144_FirstChild_0_FirstChild_0:Clone();
                        v160.CFrame = (CFrame.new() + l_l_v144_FirstChild_0_FirstChild_0.Position) - l_Position_1;
                        v160.Parent = v154;
                    end;
                    l_Position_1 = l_v144_FirstChild_1.HumanoidRootPart.Position;
                    l_l_v144_FirstChild_0_FirstChild_0 = l_v144_FirstChild_1:FindFirstChild(v157);
                    if l_l_v144_FirstChild_0_FirstChild_0 then
                        local v161 = l_l_v144_FirstChild_0_FirstChild_0:Clone();
                        v161.CFrame = (CFrame.new() + l_l_v144_FirstChild_0_FirstChild_0.Position) - l_Position_1;
                        v161.Parent = v155;
                    end;
                end;
                local v162 = Instance.new("Folder", v153);
                v162.Name = "R6";
                local l_Name_1 = Enum.BodyPart.Head.Name;
                if v151 == l_Name_1 then
                    local v164 = v76(l_Name_1, l_v144_FirstChild_2);
                    local v165 = v76(l_Name_1, l_v144_FirstChild_0);
                    local v166 = not not v164 and v164:FindFirstChildWhichIsA("SpecialMesh") or nil;
                    if not (not v166 or not v165) then
                        v166 = v166:Clone();
                        v166:ClearAllChildren();
                        for _, v168 in pairs(v165:GetChildren()) do
                            if not v168:IsA("ValueBase") then
                                if v168:IsA("Attachment") then
                                    local l_Vector3Value_0 = Instance.new("Vector3Value");
                                    l_Vector3Value_0.Name = v168.Name;
                                    l_Vector3Value_0.Value = v168.Position;
                                    l_Vector3Value_0.Parent = v166;
                                end;
                            else
                                v168:Clone().Parent = v166;
                            end;
                        end;
                        v166.Parent = v162;
                    end;
                else
                    local v170 = v143(l_v144_FirstChild_2, v151);
                    if v170 then
                        v170.Parent = v162;
                    end;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v171();
    local v172 = false;
    spawn(function()
        while v144 and v144.Parent ~= nil do
            if v172 then
                v171();
                v172 = false;
            end;
            wait(1);
        end;
    end);
    local function v173(v174)
        v174.Changed:connect(function()
            v172 = true;
        end);
        for _, v176 in pairs(v174:GetChildren()) do
            v173(v176);
        end;
    end;
    v173(v144);
    local l_v144_FirstChild_3 = v144:FindFirstChild(v4.R6_FOLDER_NAME);
    if l_v144_FirstChild_3 then
        l_v144_FirstChild_3.ChildAdded:connect(function(v178)
            v178.Changed:connect(v171);
            v172 = true;
        end);
        l_v144_FirstChild_3.ChildRemoved:connect(function()
            v172 = true;
        end);
    end;
end;
v0.Export = function(v179)
    local l_l_ServerStorage_0_FirstChild_0 = l_ServerStorage_0:FindFirstChild(v4.PACKAGE_EXPORT_MODEL_NAME);
    if l_l_ServerStorage_0_FirstChild_0 then
        for _, v182 in pairs(l_l_ServerStorage_0_FirstChild_0:GetChildren()) do
            l_PublishService_0:PublishDescendantAssets(v182);
            local l_Name_2 = v182.Name;
            if v182.Name == "Head" then
                local l_R15ArtistIntent_0 = v182:FindFirstChild("R15ArtistIntent");
                if l_R15ArtistIntent_0 then
                    v182 = l_R15ArtistIntent_0;
                end;
            end;
            game.Selection:Set(v182:GetChildren());
            v179:PromptSaveSelection(l_Name_2);
        end;
        return ;
    else
        return ;
    end;
end;
return v0;
