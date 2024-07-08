local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v4 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v6 = require(l_script_FirstAncestor_0.Src.Components.Background);
local v7 = require(l_script_FirstAncestor_0.Src.Components.DummyPreview_DEPRECATED);
local v8 = require(l_script_FirstAncestor_0.Src.Components.ModelPreview);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedState);
local l_UI_0 = v1.UI;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_Pane_0 = l_UI_0.Pane;
local v13 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v17 = v16();
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v20)
    local v21 = if not v18() then if v17 then v2.useContext(v5) else nil else v2.useContext(v4.Context);
    local v22 = if not v17 then l_Stylizer_0:use("PrimaryDummyPreview") else nil;
    local v27 = v2.useCallback(function(_, v24)
        if v24.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return ;
        else
            local l_Position_0 = v24.Position;
            local v26 = nil;
            v26 = v24:GetPropertyChangedSignal("Position"):Connect(function()
                if (v24.Position - l_Position_0).Magnitude >= 4 then
                    v26:Disconnect();
                end;
            end);
            return ;
        end;
    end, {
        v20.Dummy, 
        v20.RevertToDefault
    });
    local v28, v29 = v9(v20.Avatar.WorldModel, "CameraPosition", v13.DEFAULT_CAMERA_ANGLE);
    if not v16() and not v18() then
        return v2.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v22.BackgroundImage, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = -1, 
            [v3.Event.InputBegan] = v27
        }, {
            DummyPreview = if not v20.Dummy then v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(0.5, 0.5)
            }) else v2.createElement(v7, {
                Dummy = v20.Dummy, 
                ResetCameraSignal = v20.ResetCameraSignal
            })
        });
    else
        return v2.createElement(l_Pane_0, {
            ZIndex = -1, 
            [v3.Event.InputBegan] = v27
        }, {
            Background = v2.createElement(v6), 
            DummyPreview = if not v20.Dummy then v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(0.5, 0.5)
            }) else v2.createElement(v8, {
                Model = v20.Dummy, 
                ResetCameraSignal = v20.ResetCameraSignal, 
                InitialCameraPosition = v28, 
                SetInitialCameraPosition = v29, 
                GetCameraModifications = v21.stage.getPreviewCameraModifications, 
                Static = v21.dummyPreviewLocked
            })
        });
    end;
end;
