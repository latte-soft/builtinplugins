local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_Components_0 = l_Parent_0.Src.Components;
local v5 = require(l_Components_0.TabbedView);
local v6 = require(l_Components_0.PlaybackTabView);
local v7 = require(l_Components_0.RecordTabView);
local v8 = require(l_Parent_0.Src.Util.Enums);
local v9 = require(l_Parent_0.Src.Util.DMBridge);
local v10 = require(l_Parent_0.Src.Actions.Common.SetPluginState);
local v11 = game:getFastFlag("UserInputPlaybackPluginFixTabInitiallySelected");
local v12 = v1.PureComponent:extend("MainView");
v12.didMount = function(v13)
    v9.setPluginObject(v13.props.Plugin:get());
    v9.setLocalizationObject(v13.props.Localization);
    v9.setPluginStateRoduxActionHandler(v13.props.SetPluginState);
end;
v12.render = function(v14)
    local l_props_0 = v14.props;
    local l_Localization_0 = v14.props.Localization;
    local v17 = l_props_0.PluginState == v8.PluginState.Disabled;
    return v1.createElement(v5, {
        Tabs = {
            {
                Label = l_Localization_0:getText("Plugin", "RecordingTabTitle"), 
                ContentComponent = v7, 
                Disabled = v17 or l_props_0.PluginState == v8.PluginState.Playing, 
                Key = if not v11 then nil else "Recording Tab"
            }, 
            {
                Label = l_Localization_0:getText("Plugin", "PlaybackTabTitle"), 
                ContentComponent = v6, 
                Disabled = v17 or l_props_0.PluginState == v8.PluginState.Recording, 
                Key = if not v11 then nil else "Playback Tab"
            }
        }
    });
end;
return v2.connect(function(v18, _)
    return {
        PluginState = v18.common.pluginState
    };
end, function(v20)
    return {
        SetPluginState = function(v21)
            v20(v10(v21));
        end
    };
end)((l_ContextServices_0.withContext({
    Plugin = l_ContextServices_0.Plugin, 
    Localization = l_ContextServices_0.Localization
})(v12)));
