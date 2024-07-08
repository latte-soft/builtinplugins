local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Constants);
local v4 = require(l_Parent_0.Src.TagManager);
local v5 = require(l_Parent_0.Src.Maid);
local l_TagEditorShowTextSeparately_0 = game:GetFastFlag("TagEditorShowTextSeparately");
local v7 = v2.PureComponent:extend("WorldProvider");
local l_TagEditorExternalUpdate_0 = game:GetFastFlag("TagEditorExternalUpdate");
local function _(v9)
    local v10 = true;
    if v9.Visible ~= false then
        v10 = false;
        if v9.DrawType == "None" then
            v10 = not v9.ShowText;
        end;
    end;
    return v10;
end;
v7.init = function(v12)
    v12.state = {
        partsList = {}
    };
    v12.nextId = 0;
    v12.partIds = {};
    v12.trackedParts = {};
    v12.trackedTags = {};
    v12.instanceAddedConns = v5.new();
    v12.instanceRemovedConns = v5.new();
    v12.instanceAncestryChangedConns = v5.new();
    v12.maid = v5.new();
    v12.maid.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function(v13)
        v12.maid.cameraMovedConn = nil;
        if v13 then
            local l_Position_0 = v13.CFrame.Position;
            do
                local l_l_Position_0_0 = l_Position_0;
                v12.maid.cameraMovedConn = v13:GetPropertyChangedSignal("CFrame"):Connect(function()
                    local l_Position_1 = v13.CFrame.Position;
                    if v3.WorldProvider.CameraMinMovementStepForPartUpdate < (l_l_Position_0_0 - l_Position_1).Magnitude then
                        l_l_Position_0_0 = l_Position_1;
                        v12:updateParts();
                    end;
                end);
            end;
        end;
    end);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    v12.maid.cameraMovedConn = nil;
    if l_CurrentCamera_0 then
        local l_Position_2 = l_CurrentCamera_0.CFrame.Position;
        do
            local l_l_Position_2_0 = l_Position_2;
            v12.maid.cameraMovedConn = l_CurrentCamera_0:GetPropertyChangedSignal("CFrame"):Connect(function()
                local l_Position_3 = l_CurrentCamera_0.CFrame.Position;
                if v3.WorldProvider.CameraMinMovementStepForPartUpdate < (l_l_Position_2_0 - l_Position_3).Magnitude then
                    l_l_Position_2_0 = l_Position_3;
                    v12:updateParts();
                end;
            end);
        end;
    end;
end;
v7.didMount = function(v21)
    local v22 = v4.Get();
    for _, v24 in pairs(v22:GetTags()) do
        local v25 = true;
        if v24.Visible ~= false then
            v25 = false;
            if v24.DrawType == "None" then
                v25 = not v24.ShowText;
            end;
        end;
        if not v25 then
            v21:tagAdded(v24.Name);
        end;
    end;
    v21.onTagsUpdatedConn = v22:OnTagsUpdated(function(v26, v27)
        local v28 = {};
        local v29 = {};
        for _, v31 in pairs(v26) do
            local v32 = true;
            if v31.Visible ~= false then
                v32 = false;
                if v31.DrawType == "None" then
                    v32 = not v31.ShowText;
                end;
            end;
            if not v32 then
                v28[v31.Name] = v31;
            end;
        end;
        for _, v34 in pairs(v27) do
            local v35 = true;
            if v34.Visible ~= false then
                v35 = false;
                if v34.DrawType == "None" then
                    v35 = not v34.ShowText;
                end;
            end;
            if not v35 then
                if not v28[v34.Name] then
                    v29[v34.Name] = v34;
                else
                    v28[v34.Name] = nil;
                end;
            end;
        end;
        for v36 in pairs(v28) do
            v21:tagAdded(v36);
        end;
        for v37 in pairs(v29) do
            v21:tagRemoved(v37);
        end;
        v21:updateParts();
    end);
    v21:updateParts();
end;
local function v45(v38, v39, v40, v41)
    local v42 = 1;
    local v43 = #v38;
    while v43 - v42 > 1 do
        local v44 = math.floor(v42 + (v43 - v42) / 2);
        if not v40(v39, v38[v44]) then
            v42 = v44 + 1;
        else
            v43 = v44;
        end;
    end;
    if v42 < v41 then
        table.insert(v38, v42, v39);
        if v41 <= v43 then
            table.remove(v38, v43);
        end;
    end;
end;
isInFrontOf = function(v46, v47, v48)
    return (v47 - v46):Dot(v48) > 0;
end;
v7.collectParts = function(v49)
    local v50 = {};
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if l_CurrentCamera_1 then
        local l_Position_4 = l_CurrentCamera_1.CFrame.Position;
        local function v55(v53, v54)
            return v54.AngularSize < v53.AngularSize;
        end;
        local function _(v56, v57)
            return v57.Magnitude / (v56 - l_Position_4).Magnitude;
        end;
        for v59, _ in pairs(v49.trackedParts) do
            local l_ClassName_0 = v59.ClassName;
            local v62 = nil;
            if l_ClassName_0 == "Model" then
                v62 = v59:GetPivot().Position;
                if isInFrontOf(l_CurrentCamera_1.CFrame.Position, v62, l_CurrentCamera_1.CFrame.LookVector) then
                    v45(v50, {
                        AngularSize = v59:GetExtentsSize().Magnitude / (v62 - l_Position_4).Magnitude, 
                        Instance = v59
                    }, v55, v3.WorldProvider.AdornedPartLimit);
                end;
            elseif l_ClassName_0 == "Attachment" then
                v62 = v59.WorldPosition;
                if isInFrontOf(l_CurrentCamera_1.CFrame.Position, v62, l_CurrentCamera_1.CFrame.LookVector) then
                    v45(v50, {
                        AngularSize = Vector3.new().Magnitude / (v62 - l_Position_4).Magnitude, 
                        Instance = v59
                    }, v55, v3.WorldProvider.AdornedPartLimit);
                end;
            elseif l_ClassName_0 == "Part" then
                v62 = v59.Position;
                if isInFrontOf(l_CurrentCamera_1.CFrame.Position, v62, l_CurrentCamera_1.CFrame.LookVector) then
                    v45(v50, {
                        AngularSize = v59.Size.Magnitude / (v62 - l_Position_4).Magnitude, 
                        Instance = v59
                    }, v55, v3.WorldProvider.AdornedPartLimit);
                end;
            end;
        end;
        return v50;
    else
        return ;
    end;
end;
v7.prepareAdornmentMap = function(v63, v64)
    local v65 = {};
    for _, v67 in pairs(v4.Get():GetTags()) do
        v65[v67.Name] = v67;
    end;
    local v68 = {};
    for v69 = 1, #v64 do
        local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v64[v69].Instance);
        local v71 = {};
        local v72 = {};
        local v73 = {};
        local v74 = {};
        local v75 = {};
        local v76 = false;
        for v77 = 1, #l_l_CollectionService_0_Tags_0 do
            local v78 = l_l_CollectionService_0_Tags_0[v77];
            local v79 = v65[v78];
            if not (not v63.trackedTags[v78] or not v79) then
                if v79.DrawType == "Outline" then
                    v71[#v71 + 1] = v79.Color;
                elseif v79.DrawType == "Box" then
                    v72[#v72 + 1] = v79.Color;
                elseif v79.DrawType == "Icon" then
                    v73[#v73 + 1] = v79.Icon;
                elseif not l_TagEditorShowTextSeparately_0 and v79.DrawType == "Text" then
                    v74[#v74 + 1] = v78;
                elseif v79.DrawType == "Sphere" then
                    v75[#v75 + 1] = v79.Color;
                end;
                if not (not l_TagEditorShowTextSeparately_0 or not v79.ShowText) then
                    v74[#v74 + 1] = v78;
                end;
                if v79.AlwaysOnTop then
                    v76 = true;
                end;
            end;
        end;
        local v80 = v63.partIds[v64[v69].Instance];
        if #v71 > 0 then
            local v81 = 0;
            local v82 = 0;
            local v83 = 0;
            for v84 = 1, #v71 do
                v81 = v81 + v71[v84].r;
                v82 = v82 + v71[v84].g;
                v83 = v83 + v71[v84].b;
            end;
            v68["Outline:" .. v80] = {
                Id = v80, 
                Part = v64[v69].Instance, 
                DrawType = "Outline", 
                Color = Color3.new(v81 / #v71, v82 / #v71, v83 / #v71), 
                AlwaysOnTop = v76
            };
        end;
        if #v72 > 0 then
            local v85 = 0;
            local v86 = 0;
            local v87 = 0;
            for v88 = 1, #v72 do
                v85 = v85 + v72[v88].r;
                v86 = v86 + v72[v88].g;
                v87 = v87 + v72[v88].b;
            end;
            v68["Box:" .. v80] = {
                Id = v80, 
                Part = v64[v69].Instance, 
                DrawType = "Box", 
                Color = Color3.new(v85 / #v72, v86 / #v72, v87 / #v72), 
                AlwaysOnTop = v76
            };
        end;
        if #v73 > 0 then
            v68["Icon:" .. v80] = {
                Id = v80, 
                Part = v64[v69].Instance, 
                DrawType = "Icon", 
                Icon = v73, 
                AlwaysOnTop = v76
            };
        end;
        if #v74 > 0 then
            table.sort(v74);
            if #v73 > 0 then
                v74[#v74 + 1] = "";
            end;
            v68["Text:" .. v80] = {
                Id = v80, 
                Part = v64[v69].Instance, 
                DrawType = "Text", 
                TagName = v74, 
                AlwaysOnTop = v76
            };
        end;
        if #v75 > 0 then
            local v89 = 0;
            local v90 = 0;
            local v91 = 0;
            for v92 = 1, #v75 do
                v89 = v89 + v75[v92].r;
                v90 = v90 + v75[v92].g;
                v91 = v91 + v75[v92].b;
            end;
            v68["Sphere:" .. v80] = {
                Id = v80, 
                Part = v64[v69].Instance, 
                DrawType = "Sphere", 
                Color = Color3.new(v89 / #v75, v90 / #v75, v91 / #v75), 
                AlwaysOnTop = v76
            };
        end;
    end;
    return v68;
end;
v7.updateParts = function(v93)
    debug.profilebegin("[Tag Editor] Update WorldProvider");
    v93:setState({
        partsList = v93:prepareAdornmentMap((v93:collectParts()))
    });
    debug.profileend();
end;
v7.instanceAdded = function(v94, v95)
    if not v94.trackedParts[v95] then
        v94.trackedParts[v95] = 1;
        v94.nextId = v94.nextId + 1;
        v94.partIds[v95] = v94.nextId;
        return ;
    else
        v94.trackedParts[v95] = v94.trackedParts[v95] + 1;
        return ;
    end;
end;
v7.instanceRemoved = function(v96, v97)
    if v96.trackedParts[v97] then
        if v96.trackedParts[v97] <= 1 then
            v96:removeInstance(v97);
            return ;
        else
            v96.trackedParts[v97] = v96.trackedParts[v97] - 1;
            return ;
        end;
    else
        return ;
    end;
end;
v7.removeInstance = function(v98, v99)
    v98.trackedParts[v99] = nil;
    v98.partIds[v99] = nil;
end;
local function _(v100)
    if v100.ClassName == "Model" then
        return true;
    elseif v100.ClassName == "Attachment" then
        return true;
    elseif not v100:IsA("BasePart") then
        return false;
    else
        return true;
    end;
end;
v7.tagAdded = function(v102, v103)
    assert(not v102.trackedTags[v103], "Newly added tag must not already be tracked");
    v102.trackedTags[v103] = true;
    for _, v105 in pairs(l_CollectionService_0:GetTagged(v103)) do
        if (v105.ClassName == "Model" or v105.ClassName == "Attachment") or (v105:IsA("BasePart") and true or false) then
            if v105:IsDescendantOf(workspace) then
                v102:instanceAdded(v105);
            end;
            if not v102.instanceAncestryChangedConns[v105] then
                v102.instanceAncestryChangedConns[v105] = v105.AncestryChanged:Connect(function()
                    if v102.trackedParts[v105] or not v105:IsDescendantOf(workspace) then
                        if not (not v102.trackedParts[v105] or v105:IsDescendantOf(workspace)) then
                            v102:removeInstance(v105);
                            v102:updateParts();
                        end;
                        return ;
                    else
                        v102:instanceAdded(v105);
                        v102:updateParts();
                        return ;
                    end;
                end);
            end;
        end;
    end;
    if not l_TagEditorExternalUpdate_0 then
        v102.instanceAddedConns[v103] = l_CollectionService_0:GetInstanceAddedSignal(v103):Connect(function(v106)
            if (v106.ClassName == "Model" or v106.ClassName == "Attachment") or (v106:IsA("BasePart") and true or false) then
                if v106:IsDescendantOf(workspace) then
                    v102:instanceAdded(v106);
                    v102:updateParts();
                end;
                if not v102.instanceAncestryChangedConns[v106] then
                    v102.instanceAncestryChangedConns[v106] = v106.AncestryChanged:Connect(function()
                        if v102.trackedParts[v106] or not v106:IsDescendantOf(workspace) then
                            if not (not v102.trackedParts[v106] or v106:IsDescendantOf(workspace)) then
                                v102:removeInstance(v106);
                                v102:updateParts();
                            end;
                            return ;
                        else
                            v102:instanceAdded(v106);
                            v102:updateParts();
                            return ;
                        end;
                    end);
                end;
                return ;
            else
                return ;
            end;
        end);
        v102.instanceRemovedConns[v103] = l_CollectionService_0:GetInstanceRemovedSignal(v103):Connect(function(v107)
            if (v107.ClassName == "Model" or v107.ClassName == "Attachment") or (v107:IsA("BasePart") and true or false) then
                v102:instanceRemoved(v107);
                v102:updateParts();
                return ;
            else
                return ;
            end;
        end);
    end;
end;
v7.tagRemoved = function(v108, v109)
    assert(v108.trackedTags[v109], "Attempted to remove a tag that isn't tracked");
    v108.trackedTags[v109] = nil;
    for _, v111 in pairs(l_CollectionService_0:GetTagged(v109)) do
        if v111:IsDescendantOf(workspace) then
            v108:instanceRemoved(v111);
        end;
    end;
    v108.instanceAddedConns[v109] = nil;
    v108.instanceRemovedConns[v109] = nil;
end;
v7.willUnmount = function(v112)
    v112.onTagsUpdatedConn:Disconnect();
    v112.instanceAddedConns:clean();
    v112.instanceRemovedConns:clean();
    v112.instanceAncestryChangedConns:clean();
    v112.maid:clean();
end;
v7.render = function(v113)
    return v2.oneChild(v113.props[v2.Children])(v113.state.partsList);
end;
return v7;
