local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_StudioService_0 = game:GetService("StudioService");
return {
    openItemInBrowser = function(v5)
        l_GuiService_0:OpenBrowserWindow((("%*library/%*/asset"):format(l_ContentProvider_0.BaseUrl, (l_HttpService_0:urlEncode(v5)))));
    end, 
    copyAssetId = function(v6)
        l_StudioService_0:CopyToClipboard(v6);
    end, 
    openAssetConfig = function(v7)
        l_MemStorageService_0:Fire("OpenAssetConfig", v7);
    end
};
