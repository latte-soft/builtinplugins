local l_Parent_0 = script.Parent.Parent;
return function(v1, v2, v3)
    local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
    local l_Analytics_0 = l_ContextServices_0.Analytics;
    local l_Localization_0 = l_ContextServices_0.Localization;
    local l_Mouse_0 = l_ContextServices_0.Mouse;
    local l_Store_0 = l_ContextServices_0.Store;
    local v9 = require(l_Parent_0.Src.Controllers.CalloutController);
    local v10 = require(l_Parent_0.Src.Controllers.PresetController);
    local v11 = require(l_Parent_0.Src.Controllers.FileController);
    local v12 = require(l_Parent_0.Src.Controllers.QueueController);
    local v13 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
    local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v17 = require(l_Parent_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
    local v18 = l_ContextServices_0.Plugin.new(v1);
    local v19 = l_Mouse_0.new(v1:GetMouse());
    local v20 = l_Store_0.new(v2);
    local v21 = v14();
    local v22 = l_Localization_0.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AssetImporter"
    });
    local v23 = v9.new();
    local v24 = v10.new(v1, v2, v22);
    local v25 = {
        Plugin = v18, 
        Mouse = v19, 
        Store = v20, 
        Theme = v21, 
        Localization = v22, 
        Analytics = l_Analytics_0.new(v13), 
        CalloutController = v23, 
        PresetController = v24, 
        FileController = v11.new(v2, v24), 
        QueueController = if not v17() then nil else v12.new(v2)
    };
    if v3 then
        v25.PluginLoaderContextItem = v3;
    end;
    return v25;
end;
