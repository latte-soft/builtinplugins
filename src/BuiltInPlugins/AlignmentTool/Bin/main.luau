return function(v0, v1)
    local l_Parent_0 = script.Parent.Parent;
    local v3 = require(l_Parent_0.Src.Flags.getFFlagAlignToolRoactInspector);
    local v4 = require(l_Parent_0.Packages.Roact);
    local v5 = require(l_Parent_0.Packages.Rodux);
    local v6 = require(l_Parent_0.Packages.Framework);
    local l_ContextServices_0 = v6.ContextServices;
    local l_Analytics_0 = l_ContextServices_0.Analytics;
    local l_Localization_0 = l_ContextServices_0.Localization;
    local l_Mouse_0 = l_ContextServices_0.Mouse;
    local l_Store_0 = l_ContextServices_0.Store;
    local v12 = require(l_Parent_0.Src.Components.AlignmentToolPlugin);
    local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
    local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
    local v15 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
    local v16 = l_Localization_0.new({
        pluginName = "AlignmentTool", 
        stringResourceTable = l_Parent_0.Src.Resources.Localization.SourceStrings, 
        translationResourceTable = l_Parent_0.Src.Resources.Localization.LocalizedStrings
    });
    local v17 = v5.Store.new(v13, nil, {
        v5.thunkMiddleware
    });
    local v18 = require(l_Parent_0.Src.Utility.CalloutController).new();
    v18:defineCallout("AlignToolCallout", v16:getText("Callout", "Title"), v16:getText("Callout", "Description"), "https://developer.roblox.com/en-us/resources/studio/Align-Tool");
    local v19 = nil;
    if not (not v3() or not game:GetService("StudioService"):HasInternalPermission()) then
        v19 = v6.DeveloperTools.forPlugin(l_Parent_0.Name, v0);
        v4.setGlobalConfig({
            elementTracing = true
        });
    end;
    (function()
        local v20 = nil;
        local function v21()
            if v19 then
                v19:destroy();
                v19 = nil;
            end;
            if v20 then
                v4.unmount(v20);
                v20 = nil;
            end;
        end;
        v20 = v4.mount((l_ContextServices_0.provide({
            l_ContextServices_0.Plugin.new(v0), 
            v16, 
            v14(), 
            l_Mouse_0.new(v0:GetMouse()), 
            l_Store_0.new(v17), 
            l_Analytics_0.new(v15), 
            v18
        }, {
            AlignTool = v4.createElement(v12, {
                pluginLoaderContext = v1
            })
        })));
        if v19 then
            v19:addRoactTree("Roact tree", v20);
        end;
        v0.Unloading:Connect(v21);
    end)();
end;
