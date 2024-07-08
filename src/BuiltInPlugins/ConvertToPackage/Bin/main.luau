return function(v0, v1)
    if v0 then
        local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
        local l_Parent_0 = script.Parent.Parent;
        local v4 = require(l_Parent_0.Packages.Roact);
        local v5 = require(l_Parent_0.Packages.Rodux);
        local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
        local l_Util_0 = l_Parent_0.Src.Util;
        local v8 = require(l_Parent_0.Src.Resources.MakeTheme);
        local v9 = require(l_Util_0.Constants);
        local v10 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v11 = require(l_Parent_0.Src.Networking.NetworkInterface);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local l_Localization_0 = l_ContextServices_0.Localization;
        local v15 = require(l_Parent_0.Src.Components.ServiceWrapper);
        local v16 = require(l_Parent_0.Src.Components.ConvertToPackageWindow.ScreenSelect);
        local v17 = l_Localization_0.new({
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            pluginName = l_Parent_0.Name
        });
        local v18 = nil;
        local v19 = nil;
        local function v20()
            v19 = v0:CreateQWidgetPluginGui(l_Parent_0.Name, {
                Size = Vector2.new(960, 600), 
                MinSize = Vector2.new(960, 600), 
                Resizable = true, 
                Modal = not l_DebugBuiltInPluginModalsNotBlocking_0, 
                InitialEnabled = false
            });
            v19.Name = v17:getText("Meta", "PluginName");
            v19.Title = v17:getText("Meta", "PluginName");
            v19.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v19:GetPropertyChangedSignal("Enabled"):connect(function()
                if not (v19.Enabled or not v18) then
                    v4.unmount(v18);
                    v18 = nil;
                end;
            end);
        end;
        local function v21()
            if v18 then
                v4.unmount(v18);
                v18 = nil;
            end;
            v19.Enabled = false;
        end;
        local function v25(v22, v23, v24)
            if not v18 then
                v18 = v4.mount(v4.createElement(v15, {
                    plugin = v0, 
                    store = v5.Store.new(v10, {
                        AssetConfigReducer = {
                            instances = v22, 
                            clonedInstances = v24
                        }
                    }, {
                        v5.thunkMiddleware
                    }), 
                    theme = v8(), 
                    mouse = v0:GetMouse(), 
                    focusGui = v19, 
                    networkInterface = v11.new(), 
                    localization = v17
                }, {
                    v4.createElement(v16, {
                        onClose = v21, 
                        assetName = v23, 
                        pluginGui = v19, 
                        currentScreen = v9.SCREENS.CONFIGURE_ASSET, 
                        instances = v22
                    })
                }), v19);
                v19.Enabled = true;
                return v18;
            else
                return ;
            end;
        end;
        local function _()
            v0.Name = l_Parent_0.Name;
            v20();
            v1.signals["PackageUIService.OnOpenConvertToPackagePlugin"]:Connect(function(v26, v27, v28)
                v25(v26, v27, v28);
            end);
        end;
        v0.Name = l_Parent_0.Name;
        v20();
        v1.signals["PackageUIService.OnOpenConvertToPackagePlugin"]:Connect(function(v30, v31, v32)
            v25(v30, v31, v32);
        end);
        return ;
    else
        return ;
    end;
end;
