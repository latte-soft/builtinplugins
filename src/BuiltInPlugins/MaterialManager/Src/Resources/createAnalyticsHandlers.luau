local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Util.DebugFlags);
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Parent_0.Src.Flags.getFFlagMaterialActionAsTool);
return function(v5)
    local function _(v6, v7)
        local v8 = v1.Dictionary.join({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId
        }, v7 or {});
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("MaterialManager", tostring(v6), l_HttpService_0:JSONEncode(v8)));
        end;
        v5:SendEventDeferred("studio", "MaterialManager", v6, v8);
    end;
    local function _(v10, v11)
        v11 = v11 or 1;
        if v2.LogAnalytics() then
            print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring(v10), (tostring(v11))));
        end;
        v5:ReportCounter(v10, v11);
    end;
    local function v16(v13, v14, v15)
        v14 = v14 or {};
        if v2.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s throttlingPercent=%s"):format("MaterialManager", tostring(v13), l_HttpService_0:JSONEncode(v14), (tostring(v15))));
        end;
        v5:ReportInfluxSeries(v13, v14, v15);
    end;
    return {
        newMaterialVariant = function(_, v18, v19)
            v16("BaseMaterialForVariant", v18, v19);
        end, 
        newMaterialVariantCounter = function()
            local v20 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("NewMaterialVariantCounter"), (tostring(v20))));
            end;
            v5:ReportCounter("NewMaterialVariantCounter", v20);
        end, 
        showInExplorer = function()
            local v21 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ShowInExplorer"), (tostring(v21))));
            end;
            v5:ReportCounter("ShowInExplorer", v21);
        end, 
        clickOnCategoriesOpen = function()
            local v22 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ClickOnCategoriesOpen"), (tostring(v22))));
            end;
            v5:ReportCounter("ClickOnCategoriesOpen", v22);
        end, 
        importTextureMap = function()
            local v23 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ImportTextureMap"), (tostring(v23))));
            end;
            v5:ReportCounter("ImportTextureMap", v23);
        end, 
        uploadAssetIdTextureMap = function()
            local v24 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadAssetIdTextureMap"), (tostring(v24))));
            end;
            v5:ReportCounter("UploadAssetIdTextureMap", v24);
        end, 
        uploadTextureMapSuccess = function()
            local v25 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadTextureMapSuccess"), (tostring(v25))));
            end;
            v5:ReportCounter("UploadTextureMapSuccess", v25);
        end, 
        deleteMaterialVariant = function()
            local v26 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("DeleteMaterialVariant"), (tostring(v26))));
            end;
            v5:ReportCounter("DeleteMaterialVariant", v26);
        end, 
        applyToSelectionButton = function()
            local v27 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ApplyToSelectionButton"), (tostring(v27))));
            end;
            v5:ReportCounter("ApplyToSelectionButton", v27);
        end, 
        applyToSelectionAction = function()
            local v28 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ApplyToSelectionAction"), (tostring(v28))));
            end;
            v5:ReportCounter("ApplyToSelectionAction", v28);
        end, 
        materialAsTool = not v4() and function()
            local v29 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("MaterialAsTool"), (tostring(v29))));
            end;
            v5:ReportCounter("MaterialAsTool", v29);
        end or nil, 
        setOverrideToggled = function()
            local v30 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("SetOverrideToggled"), (tostring(v30))));
            end;
            v5:ReportCounter("SetOverrideToggled", v30);
        end, 
        searchBar = function()
            local v31 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("SearchBar"), (tostring(v31))));
            end;
            v5:ReportCounter("SearchBar", v31);
        end, 
        importTextureMapError = function()
            local v32 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("ImportTextureMapError"), (tostring(v32))));
            end;
            v5:ReportCounter("ImportTextureMapError", v32);
        end, 
        uploadFromURLTextureMapError = function()
            local v33 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadFromURLTextureMapError"), (tostring(v33))));
            end;
            v5:ReportCounter("UploadFromURLTextureMapError", v33);
        end, 
        uploadTextureMapFromFileError = function()
            local v34 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadTextureMapFromFileError"), (tostring(v34))));
            end;
            v5:ReportCounter("UploadTextureMapFromFileError", v34);
        end, 
        uploadTextureMapGeneralError = function()
            local v35 = nil or 1;
            if v2.LogAnalytics() then
                print(("%s ReportCounter counterName=%s count=%s"):format("MaterialManager", tostring("UploadTextureMapGeneralError"), (tostring(v35))));
            end;
            v5:ReportCounter("UploadTextureMapGeneralError", v35);
        end
    };
end;
