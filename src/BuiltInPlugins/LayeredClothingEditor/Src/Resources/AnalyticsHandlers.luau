local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_PreviewConstants_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared.PreviewConstants;
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local l_StudioService_0 = game:GetService("StudioService");
local function v14(v6)
    if v6 then
        for _, v8 in {
            "id://", 
            "[Ii][Dd]="
        }, nil, nil do
            local v9, v10 = string.find(v6, v8);
            if v9 then
                local v11, v12 = string.find(v6, "%d+", v10 + 1);
                v9 = v11;
                v10 = v12;
                if not (not v9 or not v10) then
                    v11 = v6:sub(v9, v10);
                    local v13;
                    v12, v13 = pcall(function()
                        return (tonumber(v11));
                    end);
                    if v12 then
                        return v13;
                    end;
                end;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
return function(v15)
    local l_ANALYTICS_CONSTANTS_0 = v3.ANALYTICS_CONSTANTS;
    local function v19(v17, v18)
        v15:SendEventDeferred("studio", "accessoryFittingTool", v17, (v1.Dictionary.join({
            studioSid = v15:GetSessionId(), 
            clientId = v15:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v18 or {})));
    end;
    local v20 = {
        [v3.SCREENS.Select] = "exitSelect", 
        [v3.SCREENS.AssetType] = "exitAssetType", 
        [v3.SCREENS.Edit] = "exitEdit"
    };
    local v21 = {
        Default = {
            [l_PreviewConstants_0.TABS_KEYS.Animations] = "defaultPreviewAnimSelected", 
            [l_PreviewConstants_0.TABS_KEYS.Avatars] = "defaultPreviewAvatarSelected", 
            [l_PreviewConstants_0.TABS_KEYS.Clothing] = "defaultPreviewClothingSelected"
        }, 
        Custom = {
            [l_PreviewConstants_0.TABS_KEYS.Animations] = "customPreviewAnimSelected", 
            [l_PreviewConstants_0.TABS_KEYS.Avatars] = "customPreviewAvatarSelected", 
            [l_PreviewConstants_0.TABS_KEYS.Clothing] = "customPreviewClothingSelected"
        }
    };
    local function _()
        if not (v4.TotalLayers <= 0) or v4.TotalAvatars > 1 then
            v19("previewUsed", {
                layerCount = v4.TotalLayers, 
                avatarCount = v4.TotalAvatars
            });
        end;
    end;
    local function _()
        if v4.CageEdits > 0 then
            v19("cageEdited", {
                count = v4.CageEdits
            });
            v15:ReportCounter("AccessoryFittingToolCageEdited", v4.CageEdits);
        end;
    end;
    return {
        FirstAction = function(v24)
            if v4.FirstAction then
                v19("firstAction", {
                    actionId = v24
                });
            end;
        end, 
        CreateAccessory = function(v25)
            v19("createAccessory", {
                count = v25
            });
            v15:ReportCounter("CreateAccessory", v25);
        end, 
        PluginOpened = function()
            v19("opened");
            v15:ReportCounter("AccessoryFittingToolOpened", 1);
        end, 
        LayeredAccessoryPublished = function(v26)
            v19("publishedLC", {
                cageEdited = if v4.CageEdits > 0 then l_ANALYTICS_CONSTANTS_0.CAGE_EDITING.Edited else l_ANALYTICS_CONSTANTS_0.CAGE_EDITING.Unedited, 
                meshId = v14(v26)
            });
            v15:ReportCounter("AccessoryFittingToolPublishedLC", 1);
        end, 
        RigidAccessoryPublished = function(v27)
            v19("publishedAcc", {
                meshId = v14(v27)
            });
            v15:ReportCounter("AccessoryFittingToolPublishedAcc", 1);
        end, 
        LayeredAccessorySelected = function()
            v19("selectedLC");
            v15:ReportCounter("AccessoryFittingToolSelectedLC", 1);
        end, 
        RigidAccessorySelected = function()
            v19("selectedAcc");
            v15:ReportCounter("AccessoryFittingToolSelectedAcc", 1);
        end, 
        CenterAvatarToCamera = function()
            v19("centerAvatarToCamera");
            v15:ReportCounter("AccessoryFittingToolCenterAvatarToCamera", 1);
        end, 
        ZoomToAvatar = function()
            v19("zoomToAvatar");
            v15:ReportCounter("AccessoryFittingToolZoomToAvatar", 1);
        end, 
        AutoSkinningToggled = function(v28)
            v19("autoSkinningToggled", {
                enabled = v28
            });
            v15:ReportCounter("AccessoryFittingToolAutoSkinningToggled", 1);
        end, 
        FalloffSliderAdjusted = function(_)
            v19("falloffAdjusted");
            v15:ReportCounter("AccessoryFittingToolFalloffAdjusted", 1);
        end, 
        PreviewAssetSelected = function(v30, v31, v32, v33)
            local v34 = (if not v30 then v21.Default else v21.Custom)[v31];
            if v34 then
                v19(v34, {
                    method = if not v33 then l_ANALYTICS_CONSTANTS_0.PREVIEW_SELECT_METHOD.Workspace else l_ANALYTICS_CONSTANTS_0.PREVIEW_SELECT_METHOD.Thumbnail, 
                    assetId = if v30 then nil else v32
                });
            end;
        end, 
        ExitScreen = function()
            local l_HasPublished_0 = v4.HasPublished;
            local l_CurrentScreen_0 = v4.CurrentScreen;
            local l_RigidFlow_0 = v4.RigidFlow;
            local v38 = math.abs(os.time() - v4.StartTime);
            local v39 = v20[l_CurrentScreen_0];
            if v39 then
                v19(v39, {
                    flow = if not l_RigidFlow_0 then l_ANALYTICS_CONSTANTS_0.FLOW.Layered else l_ANALYTICS_CONSTANTS_0.FLOW.Rigid, 
                    didGenerate = if not l_HasPublished_0 then l_ANALYTICS_CONSTANTS_0.PUBLISHING.Unpublished else l_ANALYTICS_CONSTANTS_0.PUBLISHING.Published, 
                    timeInSeconds = v38
                });
            end;
        end, 
        SessionEnded = function(v40)
            if not (v4.TotalLayers <= 0) or v4.TotalAvatars > 1 then
                v19("previewUsed", {
                    layerCount = v4.TotalLayers, 
                    avatarCount = v4.TotalAvatars
                });
            end;
            if v4.CageEdits > 0 then
                v19("cageEdited", {
                    count = v4.CageEdits
                });
                v15:ReportCounter("AccessoryFittingToolCageEdited", v4.CageEdits);
            end;
            if not v40 then
                v4:resetSession();
                return ;
            else
                v4:reset();
                return ;
            end;
        end
    };
end;
