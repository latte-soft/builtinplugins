local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(l_Parent_0.Packages.Dash);
local _ = require(l_Parent_0.Src.Types);
local v4 = game:DefineFastInt("AvatarPreviewerInfluxSeriesThrottlingPercentage", 0);
local v5 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v6 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetry);
local function v8(v7)
    return {
        paletteKey = v7.palette.Key, 
        source = v7.item.source, 
        serializedValue = if v7.item.source == "builtin" then if v7.palette.Serializer then tostring(v7.palette.Serializer.serialize(v7.item.builtinItem)) else tostring(v7.item.builtinItem) else nil
    };
end;
return function(v9)
    local function v12(v10, v11)
        v9:SendEventDeferred("studio", "AvatarCompatibilityPreviewer", v10, (v2.join({
            studioSid = v9:GetSessionId(), 
            clientId = v9:GetClientId(), 
            placeId = game.PlaceId
        }, v11)));
    end;
    local function _(v13, v14)
        v9:ReportCounter(v13, v14);
    end;
    local function _(v16, v17)
        v9:ReportStats(v16, v17);
    end;
    local function _(v19, v20)
        v9:ReportInfluxSeries(v19, v20, v4);
    end;
    return {
        addUserItems = function(_, v23, v24)
            v12("AddUserItems", {
                itemsSelected = v23, 
                itemsSucceeded = v24
            });
        end, 
        autoSetupFailure = function(_, v26, v27)
            v12("AutoSetupFailure", {
                assetUrl = v27, 
                timeToComplete = v26
            });
        end, 
        autoSetupFinish = function(_, v29, v30)
            v12("AutoSetupFinish", {
                assetUrl = v30, 
                timeToComplete = v29
            });
        end, 
        autoSetupAssetsGenerated = if not v6() then nil else function(_, v32, v33)
            v12("AutoSetupAssetsGenerated", {
                inputAssetId = v32, 
                outputAssetIds = table.concat(v33, ",")
            });
        end, 
        bundlesMetadataError = function(_, v35)
            v12("BundlesMetadataError", {
                problem = v35
            });
        end, 
        changedLayers = function()
            v12("ChangedLayers");
        end, 
        equipItem = function(_, v37)
            v12("EquipItem", (v8(v37)));
        end, 
        openPalette = function(_, v39)
            v12("PaletteOpen", {
                paletteKey = v39
            });
        end, 
        openPlugin = function()
            v12("PluginOpen");
        end, 
        openTab = function(_, v41)
            v12("TabOpen", {
                tabKey = v41
            });
        end, 
        publish = function(_, v43)
            if not v5() then
                v12("Publish");
                return ;
            else
                v12("Publish", {
                    isAutoSetupped = v43
                });
                return ;
            end;
        end, 
        selectScreenChoice = function(_, v45)
            v12("SelectScreenChoice", {
                choice = v45
            });
        end, 
        sendAutoSetupSurvey = function(_, v47, v48, v49)
            v12("AutoSetupSurvey", {
                userId = l_StudioService_0:GetUserId(), 
                rating = v47.rating, 
                message = v47.message, 
                problems = table.concat(v2.keys(v47.problems), ","), 
                inputAssetId = v49, 
                outputAssetIds = if not v6() then nil else table.concat(v48, ",")
            });
        end, 
        setStage = function(_, v51)
            v12("SetStage", {
                stageKey = v51
            });
        end, 
        testInExperience = function()
            v12("TestInExperience");
        end, 
        unequipItem = function(_, v53)
            v12("UnequipItem", (v8(v53)));
        end, 
        autoSetupPassedValidation = function()
            v9:ReportCounter("AutoSetupPassedValidation", nil);
        end, 
        autoSetupFailedValidation = function()
            v9:ReportCounter("AutoSetupFailedValidation", nil);
        end, 
        autoSetupValidationDuration = function(_, v55)
            v9:ReportStats("AutoSetupValidationDuration", v55);
        end, 
        autoSetupValidationErrorCount = function(_, v57)
            v9:ReportStats("AutoSetupValidationErrorCount", v57);
        end, 
        autoSetupValidationError = function(_, v59, v60)
            v9:ReportInfluxSeries("AutoSetupValidationError", {
                inputAssetId = v59, 
                errorText = v60
            }, v4);
        end
    };
end;
