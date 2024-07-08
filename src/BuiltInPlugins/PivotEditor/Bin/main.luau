return function(v0, v1)
    require(script.Parent.defineLuaFlags);
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.Src.Flags.getFFlagImprovePluginSpeedPivotEditor);
    if not require(l_Parent_0.Src.Utility.DebugFlags).RunningUnderCLI() then
        local v4 = require(l_Parent_0.Packages.Roact);
        local v5 = require(l_Parent_0.Packages.Rodux);
        local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
        local v7 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v8 = require(l_Parent_0.Src.RoduxComponents.EditPivotPlugin);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
        local v11 = require(l_Parent_0.Src.Utility.ToastNotification);
        local v12 = {
            pluginName = "PivotEditor", 
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0
        };
        (function()
            local v13 = v4.mount(l_ContextServices_0.provide({
                l_ContextServices_0.Plugin.new(v0), 
                l_ContextServices_0.Mouse.new(v0:GetMouse()), 
                l_ContextServices_0.Store.new(v5.Store.new(v7, nil, {
                    v5.thunkMiddleware
                })), 
                l_ContextServices_0.Localization.new(v12), 
                v11.new()
            }, {
                Plugin = if not v3() then v4.createElement(v8) else v4.createElement(v8, {
                    Plugin = v0, 
                    pluginLoaderContext = v1
                })
            }));
            v0.Unloading:Connect(function()
                v4.unmount(v13);
            end);
        end)();
        return ;
    else
        return ;
    end;
end;
