local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Components.ContextMenu);
local _ = v6.MENU_SEPARATOR;
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.SaveAnimation);
local v12 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.ExportAnimation);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateMetadata);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetEditorMode);
local v16 = game:DefineFastFlag("AnimationFromVideoCreatorServiceInAnimationEditor", false);
local v17 = game:DefineFastFlag("ACESanitizeAnimations", false);
local v18 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagForceR6HumanoidRootPart);
local v19 = v1.PureComponent:extend("AnimationClipMenu");
v19.init = function(v20)
    v20.hasInternalPermission = false;
end;
v19.didMount = function(v21)
    if v17 then
        local l_status_0, l_result_0 = pcall(function()
            return game:GetService("StudioService"):HasInternalPermission();
        end);
        v21.hasInternalPermission = l_status_0 and l_result_0;
    end;
end;
v19.makeLoadMenu = function(v24)
    local l_props_0 = v24.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnLoadRequested_0 = l_props_0.OnLoadRequested;
    local v28 = v5.getAnimSaves(l_props_0.RootInstance);
    local v29 = {
        Text = l_Localization_0:getText("Menu", "Load"), 
        Data = nil, 
        OnItemClicked = nil
    };
    if #v28 > 0 then
        for _, v31 in ipairs(v28) do
            local l_Name_0 = v31.animation.Name;
            if v31.isLegacyAnimSaves then
                l_Name_0 = l_Name_0 .. " *";
            end;
            table.insert(v29, {
                Text = l_Name_0, 
                Data = {
                    Animation = v31.animation, 
                    IsLegacyAnimSaves = v31.isLegacyAnimSaves
                }, 
                OnItemClicked = function(v33)
                    l_OnLoadRequested_0(v33.Data.Animation.Name, v33.Data.IsLegacyAnimSaves);
                end
            });
        end;
        return v29;
    else
        v29.Enabled = false;
        return v29;
    end;
end;
v19.makeSaveAsMenu = function(v34)
    local l_props_1 = v34.props;
    local l_Localization_1 = l_props_1.Localization;
    local _ = l_props_1.CurrentAnimation or "";
    local v38 = v5.getAnimSaves(l_props_1.RootInstance);
    local function _(v39, v40)
        l_props_1.OnOverwriteRequested(v39, v40);
    end;
    local v42 = {
        Text = l_Localization_1:getText("Menu", "SaveAs"); 
        {
            Text = l_Localization_1:getText("Menu", "New"), 
            OnItemClicked = l_props_1.OnSaveAsRequested
        }
    };
    if #v38 > 0 then
        table.insert(v42, v6.MENU_SEPARATOR);
    end;
    for _, v44 in ipairs(v38) do
        local l_Name_1 = v44.animation.Name;
        if v44.isLegacyAnimSaves then
            l_Name_1 = l_Name_1 .. " *";
        end;
        table.insert(v42, {
            Text = l_Name_1, 
            Data = {
                Animation = v44.animation, 
                IsLegacyAnimSaves = v44.isLegacyAnimSaves
            }, 
            OnItemClicked = function(v46)
                l_props_1.OnOverwriteRequested(v46.Data.Animation.Name, v46.Data.IsLegacyAnimSaves);
            end
        });
    end;
    return v42;
end;
local function _(v47)
    if (not v47 or not v47:IsA("Humanoid")) or v47.RigType ~= Enum.HumanoidRigType.R15 then
        return false;
    else
        local l_Parent_0 = v47.Parent;
        if l_Parent_0 and l_Parent_0:IsA("Model") then
            return true;
        else
            return false;
        end;
    end;
end;
v19.makeImportMenu = function(v50)
    local l_props_2 = v50.props;
    local l_Localization_2 = l_props_2.Localization;
    local v53 = {
        Text = l_Localization_2:getText("Menu", "Import"); 
        {
            Text = l_Localization_2:getText("Menu", "FromRoblox"), 
            OnItemClicked = l_props_2.OnImportRequested
        }, 
        {
            Text = l_Localization_2:getText("Menu", "FromFBX"), 
            OnItemClicked = l_props_2.OnImportFbxRequested
        }
    };
    if v16 then
        local v54 = {
            Text = l_Localization_2:getText("Menu", "CreateFromVideo"), 
            OnItemClicked = l_props_2.OnCreateFromVideoRequested
        };
        local v55;
        if not v18() then
            local l_Humanoid_0 = l_props_2.RootInstance:FindFirstChildOfClass("Humanoid");
            if (not l_Humanoid_0 or not l_Humanoid_0:IsA("Humanoid")) or l_Humanoid_0.RigType ~= Enum.HumanoidRigType.R15 then
                v55 = false;
            else
                local l_Parent_1 = l_Humanoid_0.Parent;
                v55 = not not l_Parent_1 and (l_Parent_1:IsA("Model") and true or false);
            end;
        else
            v55 = v4.isR15Humanoid(l_props_2.RootInstance);
        end;
        v54.Enabled = v55;
        table.insert(v53, v54);
    end;
    return v53;
end;
v19.makePriorityMenu = function(v58)
    local l_props_3 = v58.props;
    local l_Localization_3 = l_props_3.Localization;
    local l_SetPriority_0 = l_props_3.SetPriority;
    local l_AnimationData_0 = l_props_3.AnimationData;
    local v63 = (l_AnimationData_0 and l_AnimationData_0.Metadata) and l_AnimationData_0.Metadata.Priority;
    local function v65(v64)
        l_SetPriority_0(v64.Data);
    end;
    local v66 = {
        Text = l_Localization_3:getText("Menu", "SetPriority")
    };
    for _, v68 in {
        Enum.AnimationPriority.Core, 
        Enum.AnimationPriority.Idle, 
        Enum.AnimationPriority.Movement, 
        Enum.AnimationPriority.Action, 
        Enum.AnimationPriority.Action2, 
        Enum.AnimationPriority.Action3, 
        Enum.AnimationPriority.Action4
    }, nil, nil do
        table.insert(v66, {
            Text = l_Localization_3:getText("Menu", v68.Name), 
            Data = v68, 
            Checked = v63 == v68, 
            OnItemClicked = v65
        });
    end;
    return v66;
end;
v19.makeAction = function(v69, v70, v71, v72)
    return {
        Text = v69.props.Localization:getText("Menu", v70), 
        Enabled = v72 ~= false, 
        OnItemClicked = v71
    };
end;
v19.makeMenuActions = function(v73)
    local l_props_4 = v73.props;
    local l_OnCreateNewRequested_0 = l_props_4.OnCreateNewRequested;
    local l_OnReduceKeyframesRequested_0 = l_props_4.OnReduceKeyframesRequested;
    local l_OnSanitizeAnimation_0 = l_props_4.OnSanitizeAnimation;
    local v78 = l_props_4.CurrentAnimation or "";
    local l_AnimationData_1 = l_props_4.AnimationData;
    local l_Plugin_0 = l_props_4.Plugin;
    local v81 = l_props_4.PlayState == v6.PLAY_STATE.Record;
    local l_l_AnimationData_1_0 = l_AnimationData_1;
    if l_l_AnimationData_1_0 then
        l_l_AnimationData_1_0 = l_AnimationData_1.Metadata;
        if l_l_AnimationData_1_0 then
            l_l_AnimationData_1_0 = false;
            if l_AnimationData_1.Metadata.EndTick > 0 then
                l_l_AnimationData_1_0 = not v81;
            end;
        end;
    end;
    local v83 = {
        v73:makeLoadMenu(), 
        v73:makeAction("Save", function()
            l_props_4.SaveAnimation(v78, l_props_4.Analytics);
        end), 
        v73:makeSaveAsMenu(), 
        v6.MENU_SEPARATOR, 
        v73:makeImportMenu(), 
        v73:makeAction("PublishToRoblox", function()
            l_props_4.ExportAnimation(l_Plugin_0, l_props_4.Analytics);
        end), 
        v6.MENU_SEPARATOR, 
        v73:makeAction("CreateNew", l_OnCreateNewRequested_0), 
        v6.MENU_SEPARATOR, 
        v73:makePriorityMenu(), 
        v6.MENU_SEPARATOR, 
        v73:makeAction("OptimizeKeyframes", l_OnReduceKeyframesRequested_0, l_l_AnimationData_1_0)
    };
    if not (not v17 or not v73.hasInternalPermission) then
        table.insert(v83, {
            Text = "[INTERNAL] Sanitize animation", 
            OnItemClicked = l_OnSanitizeAnimation_0
        });
    end;
    return v83;
end;
v19.render = function(v84)
    local l_props_5 = v84.props;
    return not not l_props_5.ShowMenu and v1.createElement(v9, {
        Actions = v84:makeMenuActions(), 
        OnMenuOpened = l_props_5.OnMenuOpened
    }) or nil;
end;
return v2.connect(function(v86, _)
    local l_Status_0 = v86.Status;
    return {
        AnimationData = v86.AnimationData, 
        EditorMode = l_Status_0.EditorMode, 
        PlayState = l_Status_0.PlayState, 
        RootInstance = l_Status_0.RootInstance
    };
end, function(v89)
    return {
        ExportAnimation = function(v90, v91)
            v89(v12(v90, v91));
        end, 
        SaveAnimation = function(v92, v93)
            v89(v11(v92, v93));
        end, 
        SetEditorMode = function(v94)
            v89(v15(v94));
        end, 
        SetPriority = function(v95)
            v89(v13());
            v89(v14({
                Priority = v95
            }));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Analytics = l_ContextServices_0.Analytics
})(v19)));
