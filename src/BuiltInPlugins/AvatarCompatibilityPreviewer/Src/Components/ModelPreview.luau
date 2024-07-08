local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.addPlatform);
local _ = require(l_script_FirstAncestor_0.Src.Components.Screens.AvatarScreen.Stages.StageType);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSetUpResetCameraButton);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local l_UI_0 = v1.UI;
local l_SharedFlags_0 = v1.SharedFlags;
local v10 = if not l_SharedFlags_0.getFFlagDevFrameworkBetterInit() then v1.StudioUI.AssetRenderModel else l_UI_0.AssetRenderModel;
local v11 = l_SharedFlags_0.getFFlagDevFrameworkAssetRenderModelEnableSky();
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local v13 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return (v2.memo(function(v16)
    assert(v5() or v7(), "ModelPreview requires FFlagAvatarPreviewerSkinToneAlphaDetection");
    assert(v16.Model.PrimaryPart ~= nil, "PrimaryPart is not set");
    local v17 = l_Stylizer_0:use("ModelPreview");
    local v18, v19 = v2.useState(nil);
    v2.useEffect(function()
        if v18 ~= nil then
            v18:Destroy();
            v19(nil);
        end;
        if v16.Model == nil then
            return ;
        else
            assert(v16.Model ~= nil, v13.LUAU_ANALYZE_ERROR);
            local l_WorldModel_0 = Instance.new("WorldModel");
            v16.Model.Name = "Dummy";
            v16.Model.Parent = l_WorldModel_0;
            l_WorldModel_0.PrimaryPart = v16.Model.PrimaryPart;
            l_WorldModel_0:PivotTo(CFrame.new());
            v19(l_WorldModel_0);
            return v3(l_WorldModel_0, v16.Model, v17.PlatformHeight, v17.PlatformSize);
        end;
    end, {
        v16.Model
    });
    local v21 = v2.useState(Instance.new("Camera"));
    local v22 = v2.useRef({
        cframe = CFrame.new(), 
        focus = CFrame.new(), 
        model = nil
    });
    assert(v22.current ~= nil, v13.LUAU_ANALYZE_ERROR);
    local v25 = v2.useCallback(function()
        local l_current_0 = v22.current;
        assert(l_current_0.model ~= nil, "Model hasn't been set before resetCamera");
        local v24 = v16.GetCameraModifications(l_current_0.model.Dummy);
        v21.CFrame = v24.cframe or l_current_0.cframe;
        v21.Focus = v24.focus or l_current_0.focus;
        v21.FieldOfView = v24.fov;
    end, {
        v16.GetCameraModifications
    });
    v2.useEffect(function()
        if v22.current.model == nil then
            return ;
        else
            v25();
            return ;
        end;
    end, {
        v16.GetCameraModifications
    });
    local v28 = v2.useCallback(function(v26)
        local v27 = nil;
        task.defer(function()
            if v26:IsDescendantOf(game) then
                assert(v26:FindFirstChild("Dummy"), "View model does not have a dummy");
                v22.current = {
                    cframe = v13.DEFAULT_CAMERA_ANGLE, 
                    focus = v21.Focus, 
                    model = v26
                };
                v25();
                if v16.InitialCameraPosition == nil then
                    return ;
                else
                    assert(v16.InitialCameraPosition ~= nil, v13.LUAU_ANALYZE_ERROR);
                    assert(v16.SetInitialCameraPosition ~= nil, "InitialCameraPosition should always some with a SetInitialCameraPosition");
                    v21.CFrame = v16.InitialCameraPosition;
                    v27 = v21:GetPropertyChangedSignal("CFrame"):Connect(function()
                        v16.SetInitialCameraPosition(v21.CFrame);
                    end);
                    return ;
                end;
            else
                return ;
            end;
        end);
        return function()
            if v27 ~= nil then
                v27:Disconnect();
            end;
        end;
    end, {
        v16.InitialCameraPosition
    });
    v2.useEffect(function()
        if v16.ResetCameraSignal == nil then
            return ;
        else
            assert(v16.ResetCameraSignal ~= nil, v13.LUAU_ANALYZE_ERROR);
            local v29 = v16.ResetCameraSignal:Connect(v25);
            return function()
                v29:Disconnect();
            end;
        end;
    end, {
        v25, 
        v16.ResetCameraSignal
    });
    v2.useEffect(function()
        local function v32()
            if v18 ~= nil then
                for _, v31 in v18:GetDescendants() do
                    if v31:IsA("WrapLayer") then
                        v31.Order = v31.Order + 1;
                        v31.Order = v31.Order - 1;
                    end;
                end;
            end;
        end;
        task.defer(v32);
        task.delay(0.05, v32);
    end, {
        v18
    });
    if not v18 then
        return nil;
    else
        return (v2.createElement(v10, {
            Camera = v21, 
            Model = v18, 
            FocusPosition = v16.Model.PrimaryPart.CFrame.Position, 
            FocusDirection = v16.Model.PrimaryPart.CFrame.LookVector, 
            Size = UDim2.fromScale(1, 1), 
            Ambient = v17.Ambient, 
            EnableSky = if not v11 then nil else v17.EnableSky, 
            LightColor = v17.LightColor, 
            LightDirection = v17.LightDirection, 
            PanSpeedMultiplier = v17.PanSpeedMultiplier, 
            ShouldClone = false, 
            RecenterModelOnUpdate = true, 
            RecenterCameraOnUpdate = true, 
            Static = v16.Static, 
            ResetCameraPosition = v13.DEFAULT_CAMERA_ANGLE, 
            OnViewModelLoaded = v28, 
            ShowResetCamera = if not v6() then nil else v16.ShowResetCameraButton
        }));
    end;
end));
