local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Parent_0.Libs.Http.Url);
local v3 = require(l_Util_0.Urls);
local v4 = require(l_Util_0.DebugFlags);
local v5 = require(l_Util_0.Analytics.Analytics);
local v6 = require(l_Util_0.AssetConfigConstants);
local v7 = require(l_Util_0.EnumConvert);
local v8 = require(l_Util_0.ToolboxUtilities);
local v9 = require(l_Util_0.getReportUrl);
local l_StudioService_0 = game:GetService("StudioService");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local v14 = require(script.Parent.isCli);
local v15 = nil;
v15 = if not v14() then game:GetService("AssetManagerService") else {
    GetMeshIdFromAssetId = function(_)
        return 1;
    end, 
    GetTextureIdFromAssetId = function(_)
        return 1;
    end
};
local v18 = {};
local _ = function(v19)
    local v20 = nil;
    local l_status_0, _ = pcall(function()
        local v21 = v3.constructAssetIdString(v19);
        if v4.shouldDebugUrls() then
            print(("Inserting decal %s"):format(v21));
        end;
        v20 = game:GetObjects(v21);
    end);
    if (not l_status_0 or not v20) or not v20[1] then
        return 0;
    else
        return v20[1].Texture:match("%d+");
    end;
end;
v18.tryCreateContextMenu = function(v25, v26, v27, v28, v29, v30, v31, v32, v33, v34)
    local v35 = l_HttpService_0:GenerateGUID();
    local l_v25_PluginMenu_0 = v25:CreatePluginMenu((string.format("ToolboxAssetMenu-%s", v35)));
    l_v25_PluginMenu_0:AddNewAction(string.format("OpenInBrowser-%s", v35), v29:getText("General", "RightClickMenuViewInBrowser")).Triggered:connect(function()
        local v37 = nil;
        local v38 = v8.getCreatorMarketplaceWebBaseUrl();
        if not v38 then
            v37 = string.format("%slibrary/%s/asset", l_ContentProvider_0.BaseUrl, l_HttpService_0:urlEncode(v26));
            if v33 then
                v37 = v37 .. "?" .. v2.makeQueryString(v33);
            end;
        else
            v37 = string.format("%sasset/%s", v38, l_HttpService_0:urlEncode(v26));
            if v33 then
                v37 = v37 .. "?" .. v2.makeQueryString({
                    keyword = v33.SearchKeyword, 
                    searchId = v33.SearchId, 
                    viewFromStudio = true
                });
            end;
        end;
        l_GuiService_0:OpenBrowserWindow(v37);
    end);
    if not v28 and v34 ~= 1 then
        l_v25_PluginMenu_0:AddNewAction(string.format("Report-%s", v35), v29:getText("General", "RightClickMenuReport")).Triggered:connect(function()
            v5.reportAssetClicked(v26, v27);
            local _ = l_ContentProvider_0.BaseUrl;
            l_GuiService_0:OpenBrowserWindow((v9(v26, v27)));
        end);
    end;
    if v27 ~= Enum.AssetType.Plugin.Value then
        local l_v26_0 = v26;
        do
            local l_l_v26_0_0 = l_v26_0;
            if v27 == Enum.AssetType.Decal.Value then
                local v42 = nil;
                local l_status_1, _ = pcall(function()
                    local v43 = v3.constructAssetIdString(v26);
                    if v4.shouldDebugUrls() then
                        print(("Inserting decal %s"):format(v43));
                    end;
                    v42 = game:GetObjects(v43);
                end);
                if (not l_status_1 or not v42) or not v42[1] then
                    l_l_v26_0_0 = 0;
                    --[[ close >= 14 ]]
                else
                    l_l_v26_0_0 = v42[1].Texture:match("%d+");
                    --[[ close >= 14 ]]
                end;
            end;
            l_v25_PluginMenu_0:AddNewAction(string.format("CopyAssetIdToClipboard-%s", v35), v29:getText("General", "RightClickMenuCopyAssetID")).Triggered:connect(function()
                v5.onContextMenuClicked("CopyAssetId", v26, v27, v32);
                l_StudioService_0:CopyToClipboard(l_l_v26_0_0);
            end);
            if v27 == Enum.AssetType.MeshPart.Value then
                local l_status_2, l_result_2 = pcall(v15.GetMeshIdFromAssetId, v15, l_l_v26_0_0);
                local l_status_3, l_result_3 = pcall(v15.GetTextureIdFromAssetId, v15, l_l_v26_0_0);
                if not l_status_2 then
                    warn("Failed to get mesh id for asset id " .. l_l_v26_0_0);
                else
                    l_v25_PluginMenu_0:AddNewAction(string.format("CopyMeshIdToClipboard-%s", v35), v29:getText("General", "RightClickMenuCopyMeshID")).Triggered:connect(function()
                        v5.onContextMenuClicked("CopyMeshId", v26, v27, v32);
                        l_StudioService_0:CopyToClipboard(l_result_2);
                    end);
                end;
                if l_status_3 then
                    l_v25_PluginMenu_0:AddNewAction(string.format("CopyTextureIdToClipboard-%s", v35), v29:getText("General", "RightClickMenuCopyTextureID")).Triggered:connect(function()
                        v5.onContextMenuClicked("CopyTextureId", v26, v27, v32);
                        l_StudioService_0:CopyToClipboard(l_result_3);
                    end);
                end;
            end;
        end;
    end;
    if not (not v28 or not v30) then
        if not v31 then
            l_v25_PluginMenu_0:AddNewAction(string.format("EditAsset-%s", v35), v29:getText("General", "RightClickMenuEditAsset")).Triggered:connect(function()
                v30(v26, v6.FLOW_TYPE.EDIT_FLOW, nil, v7.convertAssetTypeValueToEnum(v27));
            end);
        else
            l_v25_PluginMenu_0:AddNewAction(string.format("PackageDetails-%s", v35), v29:getText("AssetConfigPackagePermissions", "PackageDetails")).Triggered:connect(function()
                v30(v26, v6.FLOW_TYPE.EDIT_FLOW, nil, v7.convertAssetTypeValueToEnum(v27));
            end);
        end;
    end;
    l_v25_PluginMenu_0:ShowAsync();
    l_v25_PluginMenu_0:Destroy();
    return l_v25_PluginMenu_0;
end;
return v18;
