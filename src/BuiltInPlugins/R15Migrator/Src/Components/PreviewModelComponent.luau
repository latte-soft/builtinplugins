local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_ThemeSwitcher_0 = v2.Style.ThemeSwitcher;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v17 = require(l_script_FirstAncestor_0.Src.Resources.Images);
local v18 = Vector3.new(-1, 1, -1);
local v19 = v1.PureComponent:extend("PreviewModelComponent");
local function _()
    local v20 = l_ThemeSwitcher_0.getThemeName();
    if not (v20 ~= "Dark") or v20 == "Default" then
        return v17.RESET_CAM_DARK;
    else
        return v17.RESET_CAM_LIGHT;
    end;
end;
game:GetService("Players"):CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R6).Parent = Instance.new("WorldModel");
local function _(v22)
    if v22 == nil then
        return nil;
    elseif not v22:IsA("WorldModel") then
        local l_WorldModel_0 = Instance.new("WorldModel");
        v22.Parent = l_WorldModel_0;
        return l_WorldModel_0;
    else
        return v22;
    end;
end;
v19.init = function(v25)
    v25.camera = Instance.new("Camera");
    v25.resetCamera = function()
        local l_Model_0 = v25.props.Model;
        local v27;
        if l_Model_0 == nil then
            v27 = nil;
        elseif not l_Model_0:IsA("WorldModel") then
            local l_WorldModel_1 = Instance.new("WorldModel");
            l_Model_0.Parent = l_WorldModel_1;
            v27 = l_WorldModel_1;
        else
            v27 = l_Model_0;
        end;
        local v29 = v27:GetExtentsSize().Magnitude * 0.8;
        local l_Unit_0 = v18.Unit;
        v25.camera.Focus = CFrame.new();
        v25.camera.CFrame = CFrame.new(v29 * l_Unit_0, v25.camera.Focus.Position);
    end;
    v25.clone = false;
    v25.loadAnimation = function(v31)
        local l_AnimationId_0 = v25.props.AnimationId;
        if l_AnimationId_0 then
            local v33 = nil;
            v33 = v31.AncestryChanged:Connect(function(_, v35)
                if not (not v35 or not v35:IsDescendantOf(game)) then
                    v33:Disconnect();
                    local v36 = nil;
                    local l_v31_FirstChildWhichIsA_0 = v31:FindFirstChildWhichIsA("Humanoid", true);
                    if not l_v31_FirstChildWhichIsA_0 then
                        return ;
                    else
                        v36 = l_v31_FirstChildWhichIsA_0;
                        local l_v36_FirstChildWhichIsA_0 = v36:FindFirstChildWhichIsA("Animator", true);
                        if not l_v36_FirstChildWhichIsA_0 then
                            l_v36_FirstChildWhichIsA_0 = Instance.new("Animator");
                            l_v36_FirstChildWhichIsA_0.Parent = v36;
                        end;
                        local l_Animation_0 = Instance.new("Animation");
                        l_Animation_0.AnimationId = l_AnimationId_0;
                        l_Animation_0.Parent = v36;
                        local v40 = l_v36_FirstChildWhichIsA_0:LoadAnimation(l_Animation_0);
                        v40.Looped = true;
                        if v25.props.Loaded then
                            v25.props.Loaded:Fire(true, v40, l_v36_FirstChildWhichIsA_0);
                        end;
                        v31.Destroying:Connect(function()
                            v25.props.Loaded:Fire(false, v40);
                        end);
                    end;
                end;
            end);
            return ;
        else
            return ;
        end;
    end;
end;
v19.getDerivedStateFromProps = function(v41, v42)
    if not (v41.AnimationId == v42.animationId) or v41.Model ~= v42.refModel then
        return {
            animationId = v41.AnimationId, 
            refModel = if not v41.Model then v1.None else v41.Model, 
            model = if not v41.Model then v1.None else v41.Model:Clone()
        };
    else
        return nil;
    end;
end;
v19.render = function(v43)
    local l_props_0 = v43.props;
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local v47 = v43.state.model or Instance.new("Model");
    local l_Label_0 = l_props_0.Label;
    local l_AnimationId_1 = l_props_0.AnimationId;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v53 = {
        Style = "RoundBox", 
        Padding = l_Stylizer_1.Padding, 
        Size = l_Size_0, 
        Position = l_Position_0, 
        BackgroundColor3 = l_Stylizer_1.BackgroundColor
    };
    local v54 = {
        PreviewRender = v1.createElement(l_AssetRenderModel_0, {
            Camera = v43.camera, 
            Model = v47, 
            FocusDirection = v18, 
            OnViewModelLoaded = if not l_AnimationId_1 then nil else v43.loadAnimation
        })
    };
    local l_createElement_1 = v1.createElement;
    local l_l_Button_0_0 = l_Button_0;
    local v57 = {
        OnClick = v43.resetCamera, 
        Style = "RoundSubtle", 
        Size = l_Stylizer_1.ResetButtonSize, 
        AnchorPoint = Vector2.new(1, 0), 
        Position = UDim2.fromScale(1, 0)
    };
    local v58 = {};
    local l_createElement_2 = v1.createElement;
    local l_l_Image_0_0 = l_Image_0;
    local v61 = {};
    local v62 = l_ThemeSwitcher_0.getThemeName();
    v61.Image = if not (v62 ~= "Dark") or v62 == "Default" then v17.RESET_CAM_DARK else v17.RESET_CAM_LIGHT;
    v58.Icon = l_createElement_2(l_l_Image_0_0, v61);
    v58.Tooltip = v1.createElement(l_Tooltip_0, {
        Text = "Reset Camera"
    });
    v54.CameraResetButton = l_createElement_1(l_l_Button_0_0, v57, v58);
    v54.Label = v1.createElement(l_TextLabel_0, {
        Text = l_Label_0, 
        AutomaticSize = Enum.AutomaticSize.XY
    });
    return l_createElement_0(l_l_Pane_0_0, v53, v54);
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    Plugin = l_Plugin_0
})(v19));
