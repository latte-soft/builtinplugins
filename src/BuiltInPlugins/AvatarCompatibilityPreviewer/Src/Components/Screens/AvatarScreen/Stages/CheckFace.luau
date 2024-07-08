local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.AnimationController);
local v4 = require(l_script_FirstAncestor_0.Src.Components.EquippedItemsSidebar);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Notice);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerReorganizeCheckFace);
local v7 = v6();
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useOnClothingLayerOrderChanged);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v11 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local _ = require(script.Parent.StageType);
local l_Localization_0 = v1.ContextServices.Localization;
return {
    tabs = if not v6() then {
        "face"
    } else {
        "animations_face", 
        "accessories_face"
    }, 
    render = function(v14)
        local v15 = l_Localization_0:use();
        local v16 = v2.useContext(v11);
        local v17 = nil;
        if v7 then
            v17 = v8();
        end;
        if v14.Dummy == nil then
            return nil;
        else
            assert(v14.Dummy ~= nil, v10.LUAU_ANALYZE_ERROR);
            local v18 = if v14.Dummy.Head:FindFirstChildWhichIsA("FaceControls") == nil and (not v6() or v14.SelectedTab == "animations_face") then v2.createElement(v5, {
                key = "Notice", 
                Text = v15:getText("CheckFace", "DynamicHeadNotice")
            }) else if v16.avatarAssets.emotion ~= nil then v2.createElement(v3, {
                key = "AnimationController", 
                Dummy = v14.Dummy, 
                AnimationId = v16.avatarAssets.emotion
            }) else nil;
            if not v6() then
                return v18;
            else
                return v2.createElement(v2.Fragment, {}, {
                    EquippedItemsSidebar = v2.createElement(v4, {
                        OnClothingLayerOrderChanged = v17
                    }); 
                    v18
                });
            end;
        end;
    end, 
    getPreviewCameraModifications = function(v19)
        local l_Head_0 = v19.Head;
        return {
            focus = CFrame.new(l_Head_0.Position), 
            cframe = if not v6() then CFrame.lookAt(l_Head_0.Position + (l_Head_0.Size.Magnitude * l_Head_0.CFrame.LookVector) * 1.5, l_Head_0.Position) else CFrame.lookAt((l_Head_0.Position + (l_Head_0.Size.Magnitude * l_Head_0.CFrame.LookVector) * 2) - (l_Head_0.Size.Magnitude * l_Head_0.CFrame.RightVector) * 1, l_Head_0.Position), 
            fov = 35
        };
    end
};
