local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_TextLabel_0 = v2.UI.TextLabel;
local v8 = require(script.Parent.PropertyListView);
local v9 = v1.PureComponent:extend("ImportConfiguration");
local function v11(v10)
    return v1.createFragment({
        Image = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(32, 32)
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            Text = v10.Localization:getText("Plugin", "ImportConfiguration"), 
            TextWrapped = true
        })
    });
end;
local function v13(v12)
    return v1.createFragment({
        PropertyList = v1.createElement(v8, {
            Instance = v12.ImportItem, 
            AssetImportSession = v12.AssetImportSession, 
            Localization = v12.Localization
        })
    });
end;
v9.render = function(v14)
    local l_props_0 = v14.props;
    local l_Localization_1 = l_props_0.Localization;
    if not l_props_0.ImportItem then
        return (v1.createElement(v11, {
            Localization = l_Localization_1
        }));
    else
        return (v1.createElement(v13, {
            ImportItem = l_props_0.ImportItem, 
            AssetImportSession = l_props_0.AssetImportSession
        }));
    end;
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v9));
