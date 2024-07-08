local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
local l_Packages_0 = l_Parent_0.Packages;
local v4 = require(l_Packages_0.Roact);
local l_Components_0 = l_Parent_0.Core.Components;
local v6 = require(l_Components_0.PluginWidget.Dialog);
local v7 = require(l_Components_0.AssetConfiguration.ScreenSelect);
local v8 = require(l_Parent_0.Core.Themes.getAssetConfigTheme);
local v9 = require(l_Util_0.AssetConfigConstants);
local v10 = require(l_Util_0.makeTheme);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v12 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v13 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v14 = v4.PureComponent:extend("AssetConfigWrapper");
v14.init = function(v15, _)
    v15.state = {
        popUpGui = nil
    };
    v15.popUpRefFunc = function(v17)
        v15.popUpGuiRef = v17;
    end;
    v15.onClose = function(_)
        if v15.props.onAssetConfigDestroy then
            v15.props.onAssetConfigDestroy();
        end;
    end;
end;
v14.didMount = function(v19)
    v19:setState({
        popUpGui = v19.popUpGuiRef
    });
end;
v14.render = function(v20)
    local l_props_0 = v20.props;
    local l_state_0 = v20.state;
    return v4.createElement(v6, {
        Title = "Asset Configuration", 
        Resizable = true, 
        MinSize = Vector2.new(v9.MIN_WIDTH, v9.MIN_HEIGHT), 
        Size = Vector2.new(v9.WIDTH, v9.HEIGHT), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        Modal = not l_DebugBuiltInPluginModalsNotBlocking_0, 
        InitialEnabled = true, 
        plugin = l_props_0.plugin, 
        [v4.Change.Enabled] = v20.onClose, 
        [v4.Ref] = v20.popUpRefFunc, 
        [v4.Event.AncestryChanged] = v20.onAncestryChanged
    }, {
        ContextServices = if not l_state_0.popUpGui then nil else l_ContextServices_0.provide({
            l_ContextServices_0.Focus.new(l_state_0.popUpGui), 
            v12.new(l_state_0.popUpGui), 
            v13.new(l_props_0.networkInterface), 
            v10(v8())
        }, {
            ScreenSelect = v4.createElement(v7, {
                assetId = l_props_0.assetId, 
                assetTypeEnum = l_props_0.assetTypeEnum, 
                onClose = v20.onClose, 
                pluginGui = l_state_0.popUpGui
            })
        })
    });
end;
return v14;
