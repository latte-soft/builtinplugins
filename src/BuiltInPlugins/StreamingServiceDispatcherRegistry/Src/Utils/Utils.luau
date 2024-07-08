local v0 = {
    commandsEnded = nil
};
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v2 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v3 = v2.GetService("MarketplaceService");
local v4 = v2.GetService("ChatbotUIService");
local v5 = v2.GetService("StreamingService");
local v6 = v2.GetService("TweenService");
local v7 = v2.GetService("CoreGui");
local v8 = v2.GetService("Workspace");
local v9 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagRemoveHintsAndMessagesFromInsertion);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAutoUnlockInsertedAssets);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIMenu_Attrib);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvoAIDisableAssetScripts);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAutoNormalizeBoundingBoxesForInsertedAssets);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIAssetCreditAttributes);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFIntMaxRequestAreaSizeRatio);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFIntMaxRegionFenceHeight);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCAPDMHierarchyIncludeAttributes);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchyMaxAttributesSize);
local v20 = {
    BasePart = "BasePart", 
    Model = "Model", 
    Attachment = "Attachment", 
    Bone = "Bone", 
    FaceInstance = "FaceInstance", 
    SurfaceGui = "FaceInstance"
};
local function v24(v21)
    for v22, v23 in v20, nil, nil do
        if not (not v23 or not v21:IsA(v22)) then
            v20[v21.ClassName] = v23;
            return v23;
        end;
    end;
    v20[v21.ClassName] = false;
    return false;
end;
local function v25(v26, v27)
    local v28 = v20[v26.ClassName];
    if v28 == nil then
        v28 = v24(v26);
    end;
    local v29 = nil;
    if v28 == "BasePart" then
        v29 = true;
        local l_PartSet_0 = v27.PartSet;
        if not l_PartSet_0[v26] then
            l_PartSet_0[v26] = true;
            v27.PartToRootMap[v26] = v26;
            v27.BasisObject = v26;
        else
            return ;
        end;
    elseif v28 == "Model" then
        v29 = true;
        local l_ModelSet_0 = v27.ModelSet;
        if not l_ModelSet_0[v26] then
            l_ModelSet_0[v26] = true;
            v27.BasisObject = v26;
        else
            return ;
        end;
    elseif v28 == "Attachment" then
        v27.AttachmentSet[v26] = true;
    elseif v28 == "Bone" then
        v27.BoneSet[v26] = true;
    elseif v28 == "FaceInstance" then
        v27.FaceInstanceSet[v26] = true;
    end;
    if not v29 then
        for _, v33 in v26:GetChildren() do
            v25(v33, v27);
        end;
        return ;
    else
        local l_ModelSet_1 = v27.ModelSet;
        local l_PartSet_1 = v27.PartSet;
        local l_PartToRootMap_0 = v27.PartToRootMap;
        local v37 = 0;
        for _, v39 in v26:GetDescendants() do
            local v40 = v20[v39.ClassName];
            if v40 == nil then
                v40 = v24(v39);
            end;
            if v40 == "BasePart" then
                l_PartSet_1[v39] = true;
                v37 = v37 + 1;
                l_PartToRootMap_0[v39] = v26;
            elseif v40 == "Model" then
                l_ModelSet_1[v39] = true;
                v37 = v37 + 1;
            elseif v40 == "Attachment" then
                v27.AttachmentSet[v39] = true;
            elseif v40 == "Bone" then
                v27.BoneSet[v39] = true;
            elseif v40 == "FaceInstance" then
                v27.FaceInstanceSet[v39] = true;
            end;
        end;
        v27.RootToDescendantCountMap[v26] = v37;
        return ;
    end;
end;
local function v45(v41)
    local v42 = {
        RootToDescendantCountMap = {}, 
        PartToRootMap = {}, 
        PartSet = {}, 
        ModelSet = {}, 
        AttachmentSet = {}, 
        BoneSet = {}, 
        FaceInstanceSet = {}, 
        BasisObject = nil
    };
    for _, v44 in v41, nil, nil do
        v25(v44, v42);
    end;
    return v42;
end;
local function _(v46)
    local v47 = {};
    for v48 in v46, nil, nil do
        table.insert(v47, v48);
    end;
    return v47;
end;
local function v93(v50, v51, v52)
    local v53 = v50:Inverse();
    local l_huge_0 = math.huge;
    local v55 = -math.huge;
    local l_huge_1 = math.huge;
    local v57 = -math.huge;
    local l_huge_2 = math.huge;
    local v59 = -math.huge;
    local l_Terrain_0 = v8.Terrain;
    for _, v62 in ipairs(v51) do
        if v62 ~= l_Terrain_0 then
            local v63 = nil;
            local v64 = nil;
            v63 = v62.CFrame;
            v64 = v62.Size;
            local l_X_0 = v64.X;
            local l_Y_0 = v64.Y;
            local l_Z_0 = v64.Z;
            local v68 = v53 * v63;
            local _, _, _, v72, v73, v74, v75, v76, v77, v78, v79, v80 = v68:components();
            local v81 = 0.5 * ((math.abs(l_X_0 * v72) + math.abs(l_Y_0 * v73)) + math.abs(l_Z_0 * v74));
            local v82 = 0.5 * ((math.abs(l_X_0 * v75) + math.abs(l_Y_0 * v76)) + math.abs(l_Z_0 * v77));
            local v83 = 0.5 * ((math.abs(l_X_0 * v78) + math.abs(l_Y_0 * v79)) + math.abs(l_Z_0 * v80));
            local l_X_1 = v68.X;
            local l_Y_1 = v68.Y;
            local l_Z_1 = v68.Z;
            l_huge_0 = math.min(l_huge_0, l_X_1 - v81);
            v55 = math.max(v55, l_X_1 + v81);
            l_huge_1 = math.min(l_huge_1, l_Y_1 - v82);
            v57 = math.max(v57, l_Y_1 + v82);
            l_huge_2 = math.min(l_huge_2, l_Z_1 - v83);
            v59 = math.max(v59, l_Z_1 + v83);
        end;
    end;
    for _, v88 in ipairs(v52) do
        local v89 = v50:PointToObjectSpace(v88.WorldPosition);
        local l_X_2 = v89.X;
        local l_Y_2 = v89.Y;
        local l_Z_2 = v89.Z;
        l_huge_0 = math.min(l_huge_0, l_X_2);
        v55 = math.max(v55, l_X_2);
        l_huge_1 = math.min(l_huge_1, l_Y_2);
        v57 = math.max(v57, l_Y_2);
        l_huge_2 = math.min(l_huge_2, l_Z_2);
        v59 = math.max(v59, l_Z_2);
    end;
    return Vector3.new(0.5 * (l_huge_0 + v55), 0.5 * (l_huge_1 + v57), 0.5 * (l_huge_2 + v59)), (Vector3.new(v55 - l_huge_0, v57 - l_huge_1, v59 - l_huge_2));
end;
v0.getPositionAndSize = function(v94, v95)
    if type(v94) ~= "table" then
        v94 = {
            v94
        };
    end;
    assert(type(v94) == "table", "Failed to convert selectedObjects to table");
    local l_PartSet_2 = v45(v94).PartSet;
    local v97 = {};
    for v98 in l_PartSet_2, nil, nil do
        table.insert(v97, v98);
    end;
    local v99;
    v97, v99 = v93(v95 or CFrame.new(), v97, {});
    if (not (not v97 or not v99) and v97 == v97) and v99 == v99 then
        return v97, v99;
    else
        return ;
    end;
end;
local v100 = {};
local v101 = {};
local function v102(v103, v104)
    if not v101[v103] then
        v101[v103] = true;
        v4:DisplayContent("TransformContent", {
            requestId = v103, 
            transformFunction = function(v105)
                local v106 = {};
                for _, v108 in v105, nil, nil do
                    for v109, v110 in pairs(v9.chatBulletMap) do
                        if #v110 > 1 then
                            v108 = v108:gsub(("<a id=\"%*\"/>.-</a>"):format(v109), (("<a id=\"%*\"/> x%*</a>"):format(v109, #v110)));
                        elseif not (not (#v110 == 0) or not v104) then
                            v108 = v108:gsub(("<span id=\"%*\">(.-)</span>"):format(v109), (("<span id=\"%*\" style=\"color:#646464\">%%1</span>"):format(v109)));
                        end;
                    end;
                    table.insert(v106, v108);
                end;
                return v106;
            end, 
            completeCallback = function(v111)
                if not v111 or v100[v103] then
                    task.delay(0.25, function()
                        local v112 = v100[v103];
                        v100[v103] = nil;
                        v101[v103] = nil;
                        v102(v103, v112.isFinal);
                    end);
                    return ;
                else
                    v101[v103] = nil;
                    return ;
                end;
            end
        });
        return ;
    else
        v100[v103] = {
            isFinal = v104
        };
        return ;
    end;
end;
local function v129(v113)
    local l_Position_0 = v113.Position;
    local l_Unit_0 = v113.LookVector.Unit;
    local l_Y_3 = l_Position_0.Y;
    local v117 = math.max(l_Y_3 * 3, 50);
    local v118 = math.sqrt(l_Y_3 * l_Y_3 + v117 * v117);
    local v119 = {};
    local l_Terrain_1 = workspace.Terrain;
    if l_Terrain_1 and l_Terrain_1:CountCells() > 0 then
        table.insert(v119, l_Terrain_1);
    end;
    local l_Baseplate_0 = workspace:FindFirstChild("Baseplate");
    if l_Baseplate_0 then
        table.insert(v119, l_Baseplate_0);
    end;
    if #v119 > 0 then
        local v122 = RaycastParams.new();
        v122.FilterDescendantsInstances = v119;
        v122.FilterType = Enum.RaycastFilterType.Include;
        v122.IgnoreWater = true;
        local v123 = workspace:Raycast(l_Position_0, l_Unit_0 * v118, v122);
        if not v123 then
            v123 = workspace:Raycast(l_Position_0 + l_Unit_0 * v117, -Vector3.yAxis * v117, v122);
            if not v123 then
                v123 = workspace:Raycast(l_Position_0 + l_Unit_0 * v117, Vector3.yAxis * v117, v122);
                if v123 then
                    return v123.Position, nil;
                end;
            else
                return v123.Position, nil;
            end;
        else
            return v123.Position, nil;
        end;
    else
        local v124 = l_Unit_0:Dot(-Vector3.yAxis);
        if (v124 > 0 and v124 < 1) and l_Position_0.Y > 0 then
            local v125 = l_Y_3 / v124;
            local v126 = Vector3.new(l_Position_0.X, 0, l_Position_0.Z);
            local v127 = v125 * l_Unit_0 + l_Position_0;
            if v125 < v118 then
                return v127, v127.Y;
            else
                return Vector3.new(l_Unit_0.X, 0, l_Unit_0.Z).Unit * v117 + v126, 0;
            end;
        end;
    end;
    local v128 = l_Position_0 + l_Unit_0 * v117;
    return v128, v128.Y;
end;
v0.getRequestCFrame = function(v130)
    local v131 = v9.GetRequestMetadata(v130, "RequestCFrame");
    if not v131 then
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        local l_Position_1 = l_CFrame_0.Position;
        local v135, v136 = v129(l_CFrame_0);
        local v137 = l_CurrentCamera_0:ViewportPointToRay(l_CurrentCamera_0.ViewportSize.X, l_CurrentCamera_0.ViewportSize.Y);
        local v138 = v137.Origin + v137.Direction * (-(v137.Origin - v135):Dot(Vector3.yAxis) / v137.Direction:Dot(Vector3.yAxis));
        v138 = Vector3.new(v138.X, v135.Y, v138.Z);
        local v139 = CFrame.new(v135, v135 + (v135 - Vector3.new(l_Position_1.X, v135.Y, l_Position_1.Z)));
        local v140 = v139:ToObjectSpace(CFrame.new(v138)).Position * 2;
        local l_X_3 = v140.X;
        local l_Z_3 = v140.Z;
        local v143 = l_X_3 / l_Z_3;
        local v144 = v16() * 0.01;
        if v144 > 0 then
            if v144 < v143 then
                l_X_3 = l_Z_3 * v144;
            elseif v143 < 1 / v144 then
                local l_l_Z_3_0 = l_Z_3;
                l_Z_3 = l_X_3 * v144;
                v139 = v139:ToWorldSpace(CFrame.new((Vector3.new(0, 0, (l_l_Z_3_0 - l_Z_3) * 0.5))));
            end;
        end;
        local v146 = Vector3.new(math.ceil(l_X_3), 0, (math.ceil(l_Z_3)));
        v9.SetRequestMetadata(v130, "RequestCFrame", v139);
        v9.SetRequestMetadata(v130, "CameraCFrame", l_CFrame_0);
        v9.SetRequestMetadata(v130, "PlacementSize", v146);
        v9.SetRequestMetadata(v130, "PlacementForcedY", v136);
        return v139, v136;
    else
        return v131, v9.GetRequestMetadata(v130, "PlacementForcedY");
    end;
end;
toHexy = function(v147)
    return v147:gsub(".", function(v148)
        return string.format("%x", v148:byte());
    end);
end;
v0.modifyChatWithInstanceLink = function(v149, v150, v151, v152, v153)
    if v152 then
        v152 = "a" .. toHexy(v149 .. v152);
    end;
    v153 = v153 or {};
    local l_v150_DebugId_0 = v150:GetDebugId();
    if not v153.guid then
        v153.guid = l_v150_DebugId_0;
        v9.altDataMap[l_v150_DebugId_0] = v153;
        if v9.activeDraftGuids then
            v9.activeDraftGuids[l_v150_DebugId_0] = true;
        end;
        local v155 = nil;
        local v156 = nil;
        if v152 then
            v155 = not v9.chatBulletMap[v152];
            v156 = v9.chatBulletMap[v152] or {};
            v9.chatBulletMap[v152] = v156;
            if not v9.activeDraftGuids then
                table.insert(v156, l_v150_DebugId_0);
            end;
        end;
        v9.guidToInfo[l_v150_DebugId_0] = {
            instance = v150, 
            chatBulletGroupId = v152
        };
        if v156 then
            if not v155 then
                if #v156 > 1 then
                    v102(v149, false);
                end;
            else
                v4:DisplayContent("StreamTextInNewMessage", {
                    requestId = v149 or "", 
                    content = ("* %* <span class=\"instanceLink\"><a href=\"studio://instance/%*\"> <img src=\"image://instance/%*\" alt=\"%*\"/> <span id=\"%*\">%*</span><a id=\"%*\"/></a></span>"):format(v151, l_v150_DebugId_0, v150.ClassName, v150.ClassName, v152, v150.Name, v152)
                });
                v4:DisplayContent("AddAssetIterationDropdown", {
                    requestId = v149 or "", 
                    assetIds = v153.altAssets or {}, 
                    actionString = "studio://instance/" .. l_v150_DebugId_0
                });
            end;
        else
            v4:DisplayContent("StreamTextInNewMessage", {
                requestId = v149 or "", 
                content = ("* %* [//instance/%*) <span id=\"%*\">%*</span>](studio://instance/%*)"):format(v151, v150.ClassName, v152, v150.Name, l_v150_DebugId_0)
            });
        end;
        if not v0.commandsEnded then
            v0.commandsEnded = v5.SequentialCommandsFinished:Connect(function(v157)
                v102(v157, true);
            end);
        end;
        return ;
    else
        v9.altDataMap[v153.guid].assetId = v153.assetId;
        v9.guidToInfo[v153.guid].instance = v150;
        v9.g2g[l_v150_DebugId_0] = v153.guid;
        return ;
    end;
end;
v0.destroy = function()
    if v0.commandsEnded then
        v0.commandsEnded:Disconnect();
        v0.commandsEnded = nil;
    end;
end;
v0.streamText = function(v158, v159, v160)
    v4:DisplayContent("StreamText", {
        requestId = v158 or "", 
        content = v159, 
        streamId = v160
    });
end;
v0.endConstraintVisualization = function(v161)
    local v162 = v9.requestRegionAdornments[v161];
    if v162 then
        local l_Parent_0 = v162.Parent;
        if l_Parent_0 then
            l_Parent_0:Destroy();
        end;
        local l_ToggleVisibilityEvent_0 = v162.ToggleVisibilityEvent;
        if l_ToggleVisibilityEvent_0 then
            l_ToggleVisibilityEvent_0:Destroy();
        end;
        v9.requestRegionAdornments[v161] = nil;
    end;
end;
v0.getGroundLevelAt = function(v165, v166, v167, v168)
    if not v168 then
        if not (not v166 or not v167) then
            local v169 = RaycastParams.new();
            v169.FilterDescendantsInstances = {
                v166
            };
            v169.FilterType = Enum.RaycastFilterType.Include;
            local v170 = workspace:Raycast(v165 + Vector3.new(0, v167.Y + 5, 0), (-Vector3.yAxis * 2) * (v167.Y + 5), v169);
            if v170 then
                return v170.Position.Y;
            end;
        end;
        local v171 = {};
        local l_Terrain_2 = workspace.Terrain;
        if l_Terrain_2 and l_Terrain_2:CountCells() > 0 then
            table.insert(v171, l_Terrain_2);
        end;
        local l_Baseplate_1 = workspace:FindFirstChild("Baseplate");
        if l_Baseplate_1 then
            table.insert(v171, l_Baseplate_1);
        end;
        if #v171 > 0 then
            local v174 = RaycastParams.new();
            v174.FilterDescendantsInstances = v171;
            v174.FilterType = Enum.RaycastFilterType.Include;
            v174.IgnoreWater = true;
            local v175 = workspace:Raycast(v165 + Vector3.new(0, 10000, 0), -Vector3.yAxis * 20000, v174);
            if v175 then
                return v175.Position.Y;
            end;
        end;
        return v165.Y;
    else
        return v168;
    end;
end;
getDraftModeModel = function(v176)
    return v9.draftModeModels[v176];
end;
v0.enableDraftMode = function(v177)
    if not v9.draftModeModels[v177] then
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Archivable = false;
        l_Model_0.Parent = v9.GetRequestFolder(v177);
        v9.draftModeModels[v177] = l_Model_0;
        local l_Highlight_0 = Instance.new("Highlight");
        l_Highlight_0.FillColor = Color3.new(1, 1, 1);
        l_Highlight_0.FillTransparency = 0.45;
        l_Highlight_0.OutlineTransparency = 1;
        l_Highlight_0.Parent = l_Model_0;
        local v180 = v6:Create(l_Highlight_0, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0), {
            FillTransparency = 0.6
        });
        v180:Play();
        l_Model_0.Destroying:Once(function()
            v180:Cancel();
        end);
        l_Model_0.ChildAdded:Connect(function(v181)
            if v181:IsA("BasePart") then
                v181.Locked = true;
                v181.CastShadow = false;
                if v181.Transparency < 0.75 then
                    v181.Transparency = 0;
                end;
            end;
            for _, v183 in v181:GetDescendants() do
                if v183:IsA("BasePart") then
                    v183.Locked = true;
                    v183.CastShadow = false;
                    if v183.Transparency < 0.75 then
                        v183.Transparency = 0;
                    end;
                end;
                if v183:IsA("PackageLink") then
                    v183:Destroy();
                end;
            end;
        end);
        return ;
    else
        warn("Attempted to enable draft mode when it's already running");
        return ;
    end;
end;
v0.disableDraftMode = function(v184)
    local v185 = v9.draftModeModels[v184];
    if v185 then
        v185:Destroy();
        v9.draftModeModels[v184] = nil;
        return ;
    else
        return ;
    end;
end;
v0.isDraftModeEnabled = function(v186)
    if not v9.draftModeModels[v186] then
        return false;
    else
        return true;
    end;
end;
v0.getRequestParent = function(v187, v188)
    return ((not not v9.activeDraftGuids and getDraftModeModel(v188) or v187.Parent) or v9.GetRequestFolder(v188)) or workspace;
end;
v0.addConstraintVisualization = function(v189, v190, v191, v192, v193)
    v193 = v193 or Color3.fromRGB(255, 255, 255);
    local v194 = v9.requestRegionAdornments[v189];
    if not v194 then
        v194 = {
            Parent = nil, 
            ToggleVisibilityEvent = Instance.new("BoolValue")
        };
        v194.ToggleVisibilityEvent.Value = false;
        v9.requestRegionAdornments[v189] = v194;
    end;
    local l_ToggleVisibilityEvent_1 = v194.ToggleVisibilityEvent;
    local v196 = v194.Parent or Instance.new("Folder");
    v196.Archivable = false;
    v196.Parent = v7;
    v196.Name = "AssistantArea";
    v194.Parent = v196;
    local v197 = {};
    local v198 = {};
    local v199 = nil;
    local v200 = v191.Y == 0;
    local v201 = if v191.Y > 0 then v191.Y else 10000;
    if v200 then
        v201 = math.min(v17() * 0.01, v191.Z * 0.62, v191.X * 0.62);
        local v202 = v9.GetRequestMetadata(v189, "PlacementForcedY");
        local l_v202_0 = v202 --[[ copy: 13 -> 32 ]];
        v199 = function(v204)
            return v0.getGroundLevelAt(v204, nil, nil, l_v202_0);
        end;
    end;
    for v205 = 1, 4 do
        local l_BoxHandleAdornment_0 = Instance.new("BoxHandleAdornment");
        l_BoxHandleAdornment_0.Parent = v196;
        l_BoxHandleAdornment_0.Adornee = nil;
        l_BoxHandleAdornment_0.Name = ("Edge_%*"):format(v205);
        l_BoxHandleAdornment_0.ZIndex = 0;
        l_BoxHandleAdornment_0.Size = Vector3.new(0.2, v201, 0.2);
        l_BoxHandleAdornment_0.Color3 = v193;
        l_BoxHandleAdornment_0.Transparency = 0.6;
        table.insert(v198, l_BoxHandleAdornment_0);
        local l_BoxHandleAdornment_1 = Instance.new("BoxHandleAdornment");
        l_BoxHandleAdornment_1.Parent = v196;
        l_BoxHandleAdornment_1.Adornee = nil;
        l_BoxHandleAdornment_1.Name = ("Face_%*"):format(v205);
        l_BoxHandleAdornment_0.ZIndex = 0;
        l_BoxHandleAdornment_1.Color3 = v193;
        l_BoxHandleAdornment_1.Transparency = 0.87;
        table.insert(v197, l_BoxHandleAdornment_1);
    end;
    l_ToggleVisibilityEvent_1:GetPropertyChangedSignal("Value"):Connect(function()
        for _, v209 in v198, nil, nil do
            v209.Adornee = not not l_ToggleVisibilityEvent_1.Value and workspace.Terrain or nil;
        end;
        for _, v211 in v197, nil, nil do
            v211.Adornee = not not l_ToggleVisibilityEvent_1.Value and workspace.Terrain or nil;
        end;
    end);
    local v212 = v191.X * 0.5;
    local v213 = v191.Z * 0.5;
    local v214 = {
        Vector3.new(v212, 0, v213), 
        Vector3.new(v212, 0, -v213), 
        Vector3.new(-v212, 0, -v213), 
        (Vector3.new(-v212, 0, v213))
    };
    local v215 = {
        Vector3.new(v191.X, v201, 0), 
        (Vector3.new(0, v201, v191.Z))
    };
    for v216 = 1, 4 do
        v198[v216].CFrame = v190:ToWorldSpace(CFrame.new(v214[v216]));
        v197[v216].Size = v215[v216 % 2 + 1];
        v197[v216].CFrame = v190:ToWorldSpace(CFrame.new((v214[v216] + v214[v216 % 4 + 1]) * 0.5));
    end;
    if v200 then
        local l_v197_0 = v197;
        v197 = {};
        for v218, v219 in l_v197_0, nil, nil do
            if v218 % 2 == 0 then
                local l_X_4 = v219.Size.X;
                local v221 = v199(v219.CFrame:ToWorldSpace(CFrame.new(-l_X_4 * 0.5, 0, 0)).Position);
                local v222 = math.ceil(l_X_4 / 4);
                local v223 = l_X_4 / v222;
                for v224 = 0, v222 - 1 do
                    local v225 = v219:Clone();
                    v225.Parent = v196;
                    v225.Name = v219.Name .. "_" .. v224;
                    v225.Size = Vector3.new(v223, v219.Size.Y, v219.Size.Z);
                    v225.CFrame = v219.CFrame:ToWorldSpace(CFrame.new(-v219.Size.X * 0.5 + (v224 + 0.5) * v223, 0, 0));
                    local v226 = v199(v225.CFrame:ToWorldSpace(CFrame.new(v223 * 0.5, 0, 0)).Position);
                    v225.CFrame = v225.CFrame + Vector3.new(0, (v226 + v221) * 0.5 - v225.CFrame.Position.Y, 0);
                    v225.CFrame = v225.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, (v226 - v221) * 0.25, 1, 0, 0, 0, 1);
                    v221 = v226;
                    table.insert(v197, v225);
                end;
            else
                local l_Z_4 = v219.Size.Z;
                local v228 = v199(v219.CFrame:ToWorldSpace(CFrame.new(0, 0, -l_Z_4 * 0.5)).Position);
                local v229 = math.ceil(l_Z_4 / 4);
                local v230 = l_Z_4 / v229;
                for v231 = 0, v229 - 1 do
                    local v232 = v219:Clone();
                    v232.Parent = v196;
                    v232.Name = v219.Name .. "_" .. v231;
                    v232.Size = Vector3.new(v219.Size.X, v219.Size.Y, v230);
                    v232.CFrame = v219.CFrame:ToWorldSpace(CFrame.new(0, 0, -v219.Size.Z * 0.5 + (v231 + 0.5) * v230));
                    local v233 = v199(v232.CFrame:ToWorldSpace(CFrame.new(0, 0, v230 * 0.5)).Position);
                    v232.CFrame = v232.CFrame + Vector3.new(0, (v233 + v228) * 0.5 - v232.CFrame.Position.Y, 0);
                    v232.CFrame = v232.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, (v233 - v228) * 0.25, 0, 0, 1);
                    v228 = v233;
                    table.insert(v197, v232);
                end;
            end;
            v219:Destroy();
        end;
        for _, v235 in v198, nil, nil do
            v235.CFrame = v235.CFrame + Vector3.new(0, v199(v235.CFrame.Position) - v235.CFrame.Position.Y, 0);
        end;
    end;
    if v192 then
        local v236 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0);
        local function v239(v237)
            local v238 = v6:Create(v237, v236, {
                Transparency = 0.99
            });
            v238.Parent = v196;
            v238.Name = ("Tweening_%*"):format(v237.Name);
            v238:Play();
            v196.Destroying:Once(function()
                v238:Cancel();
            end);
        end;
        for _, v241 in v198, nil, nil do
            v239(v241);
        end;
        for _, v243 in v197, nil, nil do
            v239(v243);
        end;
    end;
end;
v0.startConstraintVisualization = function(v244, v245)
    local v246 = v9.requestRegionAdornments[v244];
    if not (not v246 or not v246.ToggleVisibilityEvent) then
        v246.ToggleVisibilityEvent.Value = v245;
    end;
end;
local function v248(v247)
    if v247:IsA("Model") then
        assert(v247:IsA("Model"), "Bad model check");
        v247.WorldPivot = CFrame.new(v247.WorldPivot.Position);
        v247.WorldPivot = CFrame.new(v247:GetBoundingBox().Position);
        return ;
    else
        return ;
    end;
end;
v0.getWorldBoundingBox = function(v249, v250)
    if v249 then
        assert(v249, "Luau");
        local l_Model_1 = Instance.new("Model");
        local l_Parent_1 = v249.Parent;
        v249.Parent = l_Model_1;
        v248(l_Model_1);
        local l_l_Model_1_Pivot_0 = l_Model_1:GetPivot();
        local l_l_Model_1_ExtentsSize_0 = l_Model_1:GetExtentsSize();
        if v250 then
            v250(l_Model_1);
        end;
        v249.Parent = l_Parent_1;
        l_Model_1:Destroy();
        return l_l_Model_1_Pivot_0, l_l_Model_1_ExtentsSize_0;
    else
        return CFrame.new(), (Vector3.new());
    end;
end;
local function v263(v255)
    if not v255:IsA("Folder") then
        return v255;
    else
        local l_Model_2 = Instance.new("Model");
        l_Model_2.Name = v255.Name;
        l_Model_2.Archivable = v255.Archivable;
        for _, v258 in pairs(v255:GetTags()) do
            l_Model_2:AddTag(v258);
        end;
        for v259, v260 in pairs(v255:GetAttributes()) do
            l_Model_2:SetAttribute(v259, v260);
        end;
        for _, v262 in pairs(v255:GetChildren()) do
            v262.Parent = l_Model_2;
        end;
        l_Model_2.Parent = v255.Parent;
        v255:Destroy();
        return l_Model_2;
    end;
end;
local function v267(v264)
    for _, v266 in v264:GetDescendants() do
        if v266:IsA("Message") then
            v266:Destroy();
        end;
    end;
end;
local function v271(v268)
    if v268:IsA("BasePart") then
        v268.Locked = false;
    end;
    for _, v270 in v268:GetDescendants() do
        if v270:IsA("BasePart") then
            v270.Locked = false;
        end;
    end;
end;
local function v275(v272)
    if v272:IsA("Script") then
        v272.Enabled = false;
    end;
    for _, v274 in v272:GetDescendants() do
        if v274:IsA("Script") then
            v274.Enabled = false;
        end;
    end;
end;
local function v282(v276, v277)
    assert(v15(), "FFlagConvAIAssetCreditAttributes is not enabled");
    if not v12() then
        local l_status_0, l_result_0 = pcall(function()
            local v278 = tonumber(v277);
            if not v278 then
                error("Invalid assetId: " .. v277);
            end;
            return v3:GetProductInfo(v278, Enum.InfoType.Asset);
        end);
        v276:SetAttribute("OriginalName", v276.Name);
        v276:SetAttribute("AssetId", v277);
        if l_status_0 then
            v276:SetAttribute("AssetName", l_result_0.Name);
            v276:SetAttribute("CreatorType", l_result_0.Creator.CreatorType);
            v276:SetAttribute("CreatorId", l_result_0.Creator.Id);
            v276:SetAttribute("CreatorName", l_result_0.Creator.Name);
        end;
    else
        local v281 = v0.getAssetAttributionInfo(v277);
        v276:SetAttribute("OriginalName", v276.Name);
        v276:SetAttribute("AssetId", v277);
        if v281 then
            v276:SetAttribute("AssetName", v281.Name);
            v276:SetAttribute("CreatorType", v281.Creator.CreatorType);
            v276:SetAttribute("CreatorId", v281.Creator.Id);
            v276:SetAttribute("CreatorName", v281.Creator.Name);
            return ;
        end;
    end;
end;
prepareInsertedAsset = function(v283, v284)
    v283 = v263(v283);
    v283.SourceAssetId = tonumber(v284) or v283.SourceAssetId;
    if v10() then
        v267(v283);
    end;
    if v11() then
        v271(v283);
    end;
    if not (not v13() or not v4:GetSettings().DisableAssetScripts) then
        v275(v283);
    end;
    if v14() then
        v248(v283);
    end;
    if v15() then
        v282(v283, v284);
    end;
    return v283;
end;
v0.isAssetCached = function(v285)
    return v9.assetCacheMap[v285] ~= nil;
end;
v0.loadAssetAsync = function(v286)
    local l_status_1, l_result_1 = pcall(function()
        local v287 = v9.assetCacheMap[v286];
        if not v287 then
            local l_game_ObjectsAsync_0 = game:GetObjectsAsync("rbxassetid://" .. v286);
            local v289 = l_game_ObjectsAsync_0[1];
            if not (#l_game_ObjectsAsync_0 <= 1 and v289:IsA("PVInstance")) then
                v289 = Instance.new("Model");
                for _, v291 in l_game_ObjectsAsync_0, nil, nil do
                    v291.Parent = v289;
                end;
            end;
            v289 = prepareInsertedAsset(v289, v286);
            v9.assetCacheMap[v286] = v289;
            return v289:Clone();
        else
            return v287:Clone();
        end;
    end);
    if l_status_1 then
        return l_result_1;
    else
        warn(l_result_1);
        return ;
    end;
end;
v0.getAssetAttributionInfo = function(v294)
    if not v9.cachedAssetAttributionInfo[v294] then
        local l_status_2, l_result_2 = pcall(function()
            local v295 = tonumber(v294);
            if not v295 then
                error("Invalid assetId: " .. v294);
            end;
            return v3:GetProductInfo(v295, Enum.InfoType.Asset);
        end);
        if not l_status_2 then
            return nil;
        else
            v9.cachedAssetAttributionInfo[v294] = l_result_2;
            return l_result_2;
        end;
    else
        return v9.cachedAssetAttributionInfo[v294];
    end;
end;
v0.getInstanceAttributes = function(v298)
    if v18() then
        local v299 = {};
        local v300 = v19();
        local v301 = 0;
        for v302, v303 in pairs(v298:GetAttributes()) do
            if v300 > v301 then
                v299[v302] = v303;
                v301 = v301 + 1;
            else
                break;
            end;
        end;
        return v299;
    else
        return nil;
    end;
end;
return v0;
