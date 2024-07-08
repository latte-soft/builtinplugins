local l_Parent_0 = script.Parent.Parent;
if not require(l_Parent_0.src.flags.getFFlagDeprecateAvatarImport)() then
    require(l_Parent_0.Bin.defineLuaFlags);
    local v1 = require(l_Parent_0.src.Constants);
    local v2 = require(l_Parent_0.src.Globals);
    v2.plugin = plugin;
    v2.toolbar = v2.plugin:CreateToolbar(v1.TOOLBAR_NAME);
    local v3 = require(l_Parent_0.Packages.Roact);
    local v4 = require(l_Parent_0.Packages.Rodux);
    local v5 = require(l_Parent_0.Packages.RoactRodux);
    local v6 = require(l_Parent_0.src.components.AvatarImporter);
    local v7 = require(l_Parent_0.src.reducers);
    local v8 = require(l_Parent_0.src.actions.ClosePlugin);
    local v9 = require(l_Parent_0.src.actions.TogglePlugin);
    local v10 = v4.Store.new(v7, nil, {
        v4.thunkMiddleware
    });
    local l_QWidgetPluginGui_0 = v2.plugin:CreateQWidgetPluginGui(v1.NAME, {
        Enabled = false, 
        Title = v1.TITLE, 
        Name = v1.NAME, 
        Modal = true, 
        Size = Vector2.new(v1.BACKGROUND_WIDTH, v1.BACKGROUND_HEIGHT)
    });
    l_QWidgetPluginGui_0.Name = v1.NAME;
    l_QWidgetPluginGui_0:BindToClose(function()
        v10:dispatch(v8());
    end);
    local function v12()
        return v3.createElement(v5.StoreProvider, {
            store = v10
        }, {
            AvatarImporter = v3.createElement(v6, {
                pluginGui = l_QWidgetPluginGui_0
            })
        });
    end;
    local v13 = v3.mount(v12(), l_QWidgetPluginGui_0);
    local l_Button_0 = v2.toolbar:CreateButton(v1.BUTTON_NAME, v1.BUTTON_TOOLTIP, "rbxlocaltheme://AvatarImporter");
    l_Button_0.Click:Connect(function()
        v10:dispatch(v9());
    end);
    v10.changed:connect(function(v15)
        local l_enabled_0 = v15.plugin.enabled;
        l_Button_0:SetActive(l_enabled_0);
        l_QWidgetPluginGui_0.Enabled = l_enabled_0;
    end);
    settings().Studio.ThemeChanged:Connect(function()
        v3.update(v13, v12());
    end);
    return nil;
else
    return ;
end;
