local l_InsertService_0 = game:GetService("InsertService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useAnimationOnAnimateTarget);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_UI_0 = v2.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Pane_0 = l_UI_0.Pane;
return function(v12)
    local v13 = l_Stylizer_0:use("AnimationPreview", v12);
    local v14 = v3.useState(Instance.new("WorldModel"));
    local v16 = v3.useState(function()
        local l_Camera_0 = Instance.new("Camera");
        if v13.FieldOfView ~= nil then
            l_Camera_0.FieldOfView = v13.FieldOfView;
        end;
        return l_Camera_0;
    end);
    local v17, v18 = v3.useState(nil);
    v3.useEffect(function()
        local v19 = l_InsertService_0:LoadLocalAsset(v12.AnimateTargetAsset):Clone();
        v19.Parent = v14;
        v14.PrimaryPart = v19.PrimaryPart;
        v18(v19);
        return function()
            v19:Destroy();
        end;
    end, {});
    local v20 = v7(false);
    v6(v17, v12.AnimationId, nil, if not v20.enabled then v13.PausedAnimationAlpha else nil);
    if not v17 then
        return nil;
    else
        return (v3.createElement(l_Pane_0, {
            Active = true, 
            [v3.Event.MouseEnter] = v20.enable, 
            [v3.Event.MouseLeave] = v20.enable
        }, {
            Model = v3.createElement(l_AssetRenderModel_0, {
                Ambient = Color3.new(1, 1, 1), 
                Camera = v16, 
                FocusDirection = v17.PrimaryPart.CFrame.LookVector:Lerp(v17.PrimaryPart.CFrame.RightVector, v13.FrontRightAngleLerp), 
                InitialDistance = v13.InitialDistance, 
                Model = v14, 
                ShouldClone = false, 
                Static = true, 
                ImageTransparency = v12.Transparency
            })
        }));
    end;
end;
