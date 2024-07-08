local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_Components_0 = l_Parent_0.Src.Components;
local v4 = require(l_Components_0.Dialogs.MeshImportDialog);
local v5 = require(l_Components_0.Dialogs.ProgressWidget);
local v6 = require(l_Components_0.Dialogs.ErrorWidget);
local v7 = require(l_Components_0.Dialogs.ImportQueue);
local v8 = require(l_Parent_0.Src.Resources.CalloutList);
local v9 = require(l_Parent_0.Src.Utility.GetLocalizedString);
local v10 = require(l_Parent_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v11 = v1.PureComponent:extend("MainPlugin");
local function v18(v12, v13)
    for v14, v15 in v8, nil, nil do
        local v16 = v9(v13, "Callouts", v15.Title);
        local v17 = v9(v13, "Callouts", v15.Description);
        if not (not v16 or not v17) then
            v12:defineCallout(v14, v16, v17, v15.Link);
        end;
    end;
end;
v11.init = function(v19, v20)
    v20.PluginLoaderContextItem.mainButtonClickedSignal:Connect(function()
        v19.props.FileController:onPluginButtonClicked();
    end);
end;
v11.didUpdate = function(v21)
    local l_props_0 = v21.props;
    l_props_0.PluginLoaderContextItem.mainButton:SetActive(l_props_0.Store:getState().showPreview);
end;
v11.render = function(v23)
    local l_props_1 = v23.props;
    local l_Localization_0 = l_props_1.Localization;
    local v26 = {
        l_props_1.Plugin, 
        l_props_1.Mouse, 
        l_props_1.Store, 
        l_props_1.Theme, 
        l_Localization_0, 
        l_props_1.Analytics, 
        l_props_1.CalloutController, 
        l_props_1.PresetController, 
        l_props_1.FileController, 
        l_props_1.QueueController
    };
    v18(l_props_1.CalloutController, l_Localization_0);
    return l_ContextServices_0.provide(v26, {
        ImportQueue = if not v10() then nil else v1.createElement(v7, {
            Title = l_Localization_0:getText("ImportQueue", "WindowTitle")
        }), 
        Preview = v1.createElement(v4, {
            Title = l_Localization_0:getText("Plugin", "WindowTitle")
        }), 
        ProgressWidget = v1.createElement(v5, {
            Title = l_Localization_0:getText("Upload", "WindowTitle")
        }), 
        ErrorWidget = v1.createElement(v6, {
            Title = l_Localization_0:getText("Error", "WindowTitle")
        })
    });
end;
return v11;
