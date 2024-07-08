local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.Images);
local v8 = require(l_Util_0.AssetConfigUtil);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v15 = require(l_Parent_0.Core.Components.RoundFrame);
local v16 = game:DefineFastInt("AssetConfigDescendantsPreviewLimit", 10000);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local v18 = if not l_EnableUGCBundleUnknownMeshPartFiltering_0 then nil else require(l_Util_0.AssetThumbnailPreviewUtil);
local function v22(v19)
    for _, v21 in pairs(v19:GetDescendants()) do
        if v21:IsA("LuaSourceContainer") then
            v21:Destroy();
        end;
    end;
end;
local function v26(v23)
    for _, v25 in pairs(v23:GetDescendants()) do
        if not (not v25:IsA("Sound") or not v25.Playing) then
            v25.Playing = false;
        end;
    end;
end;
local function v30(v27, v28)
    local l_v28_ModelCFrame_0 = v28:GetModelCFrame();
    v27:SetImageServerView(l_v28_ModelCFrame_0);
    v27.CFrame = ((v27.CFrame - v27.CFrame.p) + l_v28_ModelCFrame_0.p) + (v27.CFrame.p - l_v28_ModelCFrame_0.p).unit * ((v28:GetExtentsSize().magnitude / 2) / math.tan(math.rad(v27.FieldOfView) / 2));
end;
local v31 = v2.PureComponent:extend("AssetThumbnailPreview");
v31.init = function(v32, _)
    v32.viewportRef = v2.createRef();
    v32.state = {
        shouldShow = v32:shouldShowInstances()
    };
end;
v31.didMount = function(v34)
    v34:setView();
end;
if l_EnableUGCBundleUnknownMeshPartFiltering_0 then
    v31.didUpdate = function(v35, v36, _)
        if v35.props.AssetType ~= v36.AssetType and v35.props.AssetType ~= nil then
            v35:setView();
        end;
    end;
end;
v31.setView = function(v38)
    if v38.state.shouldShow then
        if v38.props.instances then
            local l_current_0 = v38.viewportRef.current;
            l_current_0:ClearAllChildren();
            local l_Camera_0 = Instance.new("Camera");
            l_Camera_0.Name = "Camera";
            l_Camera_0.Parent = l_current_0;
            l_current_0.CurrentCamera = l_Camera_0;
            local l_Model_0 = Instance.new("Model");
            l_Model_0.Parent = l_current_0;
            for _, v43 in pairs(v38.props.instances) do
                if not v43:IsA("LuaSourceContainer") then
                    pcall(function()
                        local v44 = v43:Clone();
                        v22(v44);
                        if not (not l_EnableUGCBundleUnknownMeshPartFiltering_0 or not v8.isUGCBundleType(v38.props.AssetType)) then
                            v18.removeAllUGCBUndleUnknownMeshParts(v44, v38.props.AssetType, v38.props.AllowedBundleTypeSettings);
                        end;
                        v44.Parent = l_Model_0;
                    end);
                end;
            end;
            v26(l_Model_0);
            local v45 = #v38.props.instances == 1 and v38.props.instances[1] or l_Model_0;
            local l_ThumbnailConfiguration_0 = v45:FindFirstChild("ThumbnailConfiguration");
            local l_ThumbnailCamera_0 = v45:FindFirstChild("ThumbnailCamera");
            if not l_ThumbnailConfiguration_0 or not l_ThumbnailConfiguration_0:IsA("Configuration") then
                if not l_ThumbnailCamera_0 or not l_ThumbnailCamera_0:IsA("Camera") then
                    v30(l_Camera_0, l_Model_0);
                else
                    l_current_0.CurrentCamera = l_ThumbnailCamera_0;
                    return ;
                end;
            else
                local l_ThumbnailCameraTarget_0 = l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraTarget");
                local l_ThumbnailCameraValue_0 = l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraValue");
                if not (((not l_ThumbnailCameraTarget_0 or not l_ThumbnailCameraTarget_0:IsA("ObjectValue")) or not l_ThumbnailCameraValue_0) or not l_ThumbnailCameraValue_0:IsA("CFrameValue")) then
                    local l_Value_0 = l_ThumbnailCameraTarget_0.Value;
                    if not (not l_Value_0 or not l_Value_0:IsA("BasePart")) then
                        l_Camera_0.CFrame = l_Value_0.CFrame:toWorldSpace(l_ThumbnailCameraValue_0.Value);
                        return ;
                    end;
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
v31.getName = function(v51)
    if v51.props.instances and #v51.props.instances > 0 then
        return v51.props.instances[1].Name;
    else
        return "";
    end;
end;
v31.shouldShowInstances = function(v52)
    if v52.props.instances == nil then
        return false;
    else
        local v53 = 0;
        for _, v55 in v52.props.instances, nil, nil do
            v53 = v53 + #v55:GetDescendants();
            if v16 <= v53 then
                return false;
            end;
        end;
        return true;
    end;
end;
v31.render = function(v56)
    local l_props_0 = v56.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v60 = l_props_0.title or v56:getName();
    local v61 = true;
    if l_props_0.ShowTitle ~= nil then
        v61 = l_props_0.showTitle;
    end;
    local v62 = l_props_0.Position or UDim2.new(1, 0, 1, 0);
    local v63 = l_props_0.titleHeight or 24;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = v62, 
        LayoutOrder = l_props_0.LayoutOrder or 1
    }, {
        PreviewFrame = v2.createElement(v15, {
            BackgroundColor3 = l_Stylizer_0.thumbnailPreview.background, 
            BorderColor3 = l_Stylizer_0.thumbnailPreview.border, 
            Size = not not v61 and UDim2.new(1, 0, 1, -(v63 + (l_props_0.titlePadding or 12))) or UDim2.new(1, 0, 1, 0)
        }, {
            Viewport = if not v56.state.shouldShow then v2.createElement(l_Pane_0, {}, {
                Image = v2.createElement(l_Image_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v7.WARNING_ICON, 
                    ImageColor3 = l_Stylizer_0.thumbnailPreview.text, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = l_Stylizer_0.thumbnailPreview.warningIconSize
                }), 
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = l_Localization_0:getText("AssetThumbnailPreview", "PreviewTooBig")
                })
            }) else v2.createElement("ViewportFrame", {
                [v2.Ref] = v56.viewportRef, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Stylizer_0.thumbnailPreview.background, 
                BackgroundTransparency = 1
            })
        }), 
        Title = v61 and v2.createElement("TextLabel", {
            Text = v60, 
            Font = v6.FONT, 
            TextSize = v6.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.thumbnailPreview.text, 
            Position = UDim2.new(0, 0, 1, -v63), 
            Size = UDim2.new(1, 0, 0, v63), 
            BackgroundTransparency = 1
        })
    });
end;
return v3.connect(function(v64, _)
    return {
        instances = (v64 or {}).instances
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v31)));
