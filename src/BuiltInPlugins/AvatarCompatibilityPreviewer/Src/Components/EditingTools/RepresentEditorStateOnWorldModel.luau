local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v6 = require(l_script_FirstAncestor_0.Src.Components.TestingInterfaceContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCageEditingTools);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v10 = require(l_script_FirstAncestor_0.Src.Util.isAvatar);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useAsync);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useClothingFromInstances);
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useIncrementedState);
local v14 = require(l_script_FirstAncestor_0.Src.Hooks.useMoveAccessoriesAlongsideAttachments);
local v15 = require(l_script_FirstAncestor_0.Src.Hooks.usePreviewHumanoidDescription);
local function v17(v16)
    v12(v16.dummy);
    v14(v16.dummy);
end;
local function _(v18)
    return v18:FindFirstChildWhichIsA("WrapTarget");
end;
local function v27(v20)
    local v24 = v2.useMemo(function()
        local v21 = {};
        for _, v23 in v20:GetChildren() do
            if not (not v23:IsA("Accessory") or not v23.Archivable) then
                table.insert(v21, v23:Clone());
            end;
        end;
        return v21;
    end, {
        v20
    });
    return v2.useCallback(function()
        for _, v26 in v24, nil, nil do
            v26:Clone().Parent = v20;
        end;
    end, {
        v24
    });
end;
local function v63(v28, v29)
    local v33 = v2.useMemo(function()
        local v30 = {};
        for _, v32 in v28:GetChildren() do
            if not (not v32:IsA("BasePart") or not v32.Archivable) then
                assert(v32:IsA("BasePart"), "Luau");
                if v4.BODY_PART_TO_LIMB_NAME[v32.Name] ~= nil then
                    table.insert(v30, v32:Clone());
                end;
            end;
        end;
        return v30;
    end, {
        v28
    });
    local v38 = v3.useRefToState((v2.useMemo(function()
        local v34 = {};
        for _, v36 in v33, nil, nil do
            local v37 = v4.BODY_PART_TO_LIMB_NAME[v36.Name];
            if v37 ~= nil and v29[v37] == 0 then
                table.insert(v34, v36);
            end;
        end;
        return v34;
    end, {
        v33, 
        v29
    })));
    local function v44(v39)
        local l_Humanoid_0 = v28:FindFirstChildWhichIsA("Humanoid");
        if l_Humanoid_0 == nil then
            return ;
        else
            assert(l_Humanoid_0:IsA("Humanoid"), "Luau");
            for _, v42 in v39, nil, nil do
                local v43 = v42:Clone();
                if v8() then
                    l_UGCValidationService_0:ResetCollisionFidelity(v43, Enum.CollisionFidelity.Default);
                end;
                l_Humanoid_0:ReplaceBodyPartR15(Enum.BodyPartR15[v42.Name], v43);
            end;
            return ;
        end;
    end;
    return (v2.useCallback(function()
        local v45 = {};
        for _, v47 in v33, nil, nil do
            if table.find(v38.current, v47) ~= nil then
                local l_v28_FirstChild_0 = v28:FindFirstChild(v47.Name);
                if l_v28_FirstChild_0 ~= nil then
                    local v49 = {};
                    for _, v51 in l_v28_FirstChild_0:GetChildren() do
                        if v51:IsA("Attachment") then
                            v49[v51.Name] = v51.CFrame;
                        end;
                    end;
                    local l_WrapTarget_0 = l_v28_FirstChild_0:FindFirstChildWhichIsA("WrapTarget");
                    local v53 = l_WrapTarget_0 and l_WrapTarget_0:GetVertices(Enum.CageType.Outer);
                    table.insert(v45, function()
                        local l_v28_FirstChild_1 = v28:FindFirstChild(l_v28_FirstChild_0.Name);
                        if l_v28_FirstChild_1 == nil then
                            return ;
                        else
                            assert(l_v28_FirstChild_1 ~= nil, v4.LUAU_ANALYZE_ERROR);
                            for v55, v56 in v49, nil, nil do
                                local l_l_v28_FirstChild_1_FirstChild_0 = l_v28_FirstChild_1:FindFirstChild(v55);
                                if not (not (l_l_v28_FirstChild_1_FirstChild_0 ~= nil) or not l_l_v28_FirstChild_1_FirstChild_0:IsA("Attachment")) then
                                    local v58 = false;
                                    if l_l_v28_FirstChild_1_FirstChild_0 ~= nil then
                                        v58 = l_l_v28_FirstChild_1_FirstChild_0:IsA("Attachment");
                                    end;
                                    assert(v58, v4.LUAU_ANALYZE_ERROR);
                                    l_l_v28_FirstChild_1_FirstChild_0.CFrame = v56;
                                    local l_l_l_v28_FirstChild_1_FirstChild_0_FirstChild_0 = l_l_v28_FirstChild_1_FirstChild_0:FindFirstChild(v4.ORIGINAL_POSITION_VALUE);
                                    if not (not (l_l_l_v28_FirstChild_1_FirstChild_0_FirstChild_0 ~= nil) or not l_l_l_v28_FirstChild_1_FirstChild_0_FirstChild_0:IsA("Vector3Value")) then
                                        l_l_l_v28_FirstChild_1_FirstChild_0_FirstChild_0.Value = v56.Position;
                                    end;
                                end;
                            end;
                            local l_WrapTarget_1 = l_v28_FirstChild_1:FindFirstChildWhichIsA("WrapTarget");
                            if l_WrapTarget_1 ~= nil and v53 ~= nil then
                                l_WrapTarget_1:ModifyVertices(Enum.CageType.Outer, v53);
                            end;
                            return ;
                        end;
                    end);
                end;
            end;
        end;
        v44(v33);
        for _, v62 in v45, nil, nil do
            v62();
        end;
    end, {
        v33, 
        v28
    }));
end;
return function(v64)
    assert(v9(), "RepresentEditorStateOnWorldModle required FFlagAvatarPreviewerEditingTools");
    local v65 = v2.useContext(v5);
    local v66 = v2.useContext(v6.Context);
    v2.useEffect(function()
        return v65.startIgnoringChildren();
    end, {
        v65.startIgnoringChildren
    });
    local v67 = v15({
        WorldModel = v64.worldModel
    }, {}, {
        includeAccessories = v64.includeAccessories, 
        resetIncludesBodyParts = false
    });
    local v68 = v27(v64.worldModel);
    local v69 = v63(v64.worldModel, v67);
    local v70 = v3.useRefToState(v68);
    local v71 = v3.useRefToState(v69);
    v2.useEffect(function()
        local l_BodyColors_0 = v64.worldModel:FindFirstChildWhichIsA("BodyColors");
        if l_BodyColors_0 ~= nil then
            l_BodyColors_0 = l_BodyColors_0:Clone();
        end;
        return function()
            if v10(v64.worldModel) then
                if v64.includeAccessories then
                    for _, v74 in v64.worldModel:GetChildren() do
                        if v74:IsA("Accessory") then
                            v74:Destroy();
                        end;
                    end;
                    v70.current();
                end;
                v71.current();
                if l_BodyColors_0 ~= nil then
                    local l_BodyColors_1 = v64.worldModel:FindFirstChildWhichIsA("BodyColors");
                    if l_BodyColors_1 ~= nil then
                        l_BodyColors_1:Destroy();
                    end;
                    l_BodyColors_0.Parent = v64.worldModel;
                end;
                if v66.onRepresentEditorStateOnWorldModelUnmounted ~= nil then
                    task.defer(function()
                        v66.onRepresentEditorStateOnWorldModelUnmounted:Fire();
                    end);
                end;
                return ;
            else
                return ;
            end;
        end;
    end, {
        v64.includeAccessories, 
        v68, 
        v69
    });
    local v76 = v13();
    v11(function()
        v64.worldModel.Humanoid:ApplyDescriptionReset(v67);
        if not v64.includeAccessories then
            v68();
        end;
        if v66.onRepresentEditorStateOnWorldModelDescriptionApplied ~= nil then
            task.defer(function()
                v66.onRepresentEditorStateOnWorldModelDescriptionApplied:Fire();
            end);
        end;
        v76.increment();
        return nil;
    end, {
        v67, 
        v68
    });
    if v64.includeAccessories and v76.amount > 0 then
        return v2.createElement(v17, {
            key = ("GiveDummyInstancesClothing%*"):format(v76.amount), 
            dummy = v64.worldModel
        });
    else
        return nil;
    end;
end;
