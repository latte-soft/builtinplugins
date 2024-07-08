local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local v1 = require(script.Parent.PluginLoader);
local v2 = {};
local function _(v3, v4, v5, v6)
    local l_v3_DockWidgetPluginGui_0 = v3:CreateDockWidgetPluginGui(if not l_StudioFixPluginWidgetLocalizedIds_0 then v5 else v4.id, v4.dockWidgetPluginGuiInfo);
    l_v3_DockWidgetPluginGui_0.Title = v5;
    if v6 ~= nil then
        l_v3_DockWidgetPluginGui_0.Name = v6;
    end;
    l_v3_DockWidgetPluginGui_0.ZIndexBehavior = v4.zIndexBehavior or Enum.ZIndexBehavior.Sibling;
    return l_v3_DockWidgetPluginGui_0;
end;
v2.build = function(v9)
    local v10 = v1.new({
        plugin = v9.plugin, 
        pluginName = v9.pluginName, 
        translationResourceTable = v9.translationResourceTable, 
        fallbackResourceTable = v9.fallbackResourceTable, 
        overrideLocaleId = v9.overrideLocaleId, 
        localizationNamespace = v9.localizationNamespace, 
        shouldImmediatelyOpen = v9.shouldImmediatelyOpen
    });
    local function v11(...)
        return v10:getLocalizedText(...);
    end;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    if v9.noToolbar ~= true then
        v12 = v9.plugin:CreateToolbar(v9.getToolbarName and v9.getToolbarName(v11, v10:getKeyNamespace(), v10:getPluginName()));
        local l_buttonInfo_0 = v9.buttonInfo;
        v13 = v12:CreateButton(l_buttonInfo_0.getName(v11, v10:getKeyNamespace(), v10:getPluginName()), l_buttonInfo_0.getDescription(v11, v10:getKeyNamespace(), v10:getPluginName()), l_buttonInfo_0.icon, if type(l_buttonInfo_0.text) == "function" then l_buttonInfo_0.text(v11, v10:getKeyNamespace(), v10:getPluginName()) else l_buttonInfo_0.text);
        if l_buttonInfo_0.clickableWhenViewportHidden then
            v13.ClickableWhenViewportHidden = l_buttonInfo_0.clickableWhenViewportHidden;
        end;
        if l_buttonInfo_0.enabled ~= nil then
            v13.Enabled = l_buttonInfo_0.enabled;
        end;
        v13:SetActive(false);
        v14 = v10:registerButton(v13);
    end;
    local v16 = nil;
    local l_dockWidgetInfo_0 = v9.dockWidgetInfo;
    if l_dockWidgetInfo_0 then
        local v18 = l_dockWidgetInfo_0.getDockTitle(v11, v10:getKeyNamespace(), v10:getPluginName());
        if not l_dockWidgetInfo_0.name then
            local l_DockWidgetPluginGui_0 = v9.plugin:CreateDockWidgetPluginGui(if not l_StudioFixPluginWidgetLocalizedIds_0 then v18 else l_dockWidgetInfo_0.id, l_dockWidgetInfo_0.dockWidgetPluginGuiInfo);
            l_DockWidgetPluginGui_0.Title = v18;
            l_DockWidgetPluginGui_0.ZIndexBehavior = l_dockWidgetInfo_0.zIndexBehavior or Enum.ZIndexBehavior.Sibling;
            v16 = l_DockWidgetPluginGui_0;
        else
            local v20 = if type(l_dockWidgetInfo_0.name) == "function" then l_dockWidgetInfo_0.name(v11, v10:getKeyNamespace(), v10:getPluginName()) else l_dockWidgetInfo_0.name;
            local l_DockWidgetPluginGui_1 = v9.plugin:CreateDockWidgetPluginGui(if not l_StudioFixPluginWidgetLocalizedIds_0 then v18 else l_dockWidgetInfo_0.id, l_dockWidgetInfo_0.dockWidgetPluginGuiInfo);
            l_DockWidgetPluginGui_1.Title = v18;
            if v20 ~= nil then
                l_DockWidgetPluginGui_1.Name = v20;
            end;
            l_DockWidgetPluginGui_1.ZIndexBehavior = l_dockWidgetInfo_0.zIndexBehavior or Enum.ZIndexBehavior.Sibling;
            v16 = l_DockWidgetPluginGui_1;
        end;
        v10:registerWidget(v16);
    end;
    local v22 = {};
    if v9.extraTriggers then
        for v23, v24 in pairs(v9.extraTriggers) do
            v22[v23] = v10:registerSignal((v24()));
        end;
    end;
    local v25 = {
        pluginLoader = v10, 
        plugin = v9.plugin, 
        toolbar = v12, 
        mainButton = v13, 
        mainDockWidget = v16, 
        mainButtonClickedSignal = v14, 
        signals = v22
    };
    v9.plugin.Unloading:Connect(function()
        v10:Destroy();
        v10 = nil;
        v25.pluginLoader = nil;
        if v25.mainButtonClickedSignal then
            v25.mainButtonClickedSignal:Destroy();
        end;
        for _, v27 in pairs(v25.signals) do
            v27:Destroy();
        end;
    end);
    return v25;
end;
return v2;
