local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Src.Components.MainView);
local v2 = require(l_script_FirstAncestor_0.Src.Components.ServiceWrapper);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v5 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v6 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v7 = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local v11 = require(l_script_FirstAncestor_0.Src.Util.MakePluginActions);
local v12 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v13 = require(l_script_FirstAncestor_0.Packages.TestLoader);
v13.launch("FileSync", l_script_FirstAncestor_0.Src);
if not v13.isCli() then
    if plugin then
        if game:GetFastFlag("Collab4900") then
            local v14 = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, true, v12.BACKGROUND_WIDTH, 555, v12.BACKGROUND_WIDTH, 520);
            local v15 = v5.Store.new(v6, {}, nil);
            local l_plugin_DockWidgetPluginGui_0 = plugin:CreateDockWidgetPluginGui("FileSync", v14);
            l_plugin_DockWidgetPluginGui_0.Name = "FileSync";
            l_plugin_DockWidgetPluginGui_0.Title = "Script Sync";
            local v17 = l_ContextServices_0.Localization.new({
                stringResourceTable = l_SourceStrings_0, 
                translationResourceTable = l_LocalizedStrings_0, 
                pluginName = "FileSync"
            });
            v4.createRoot(l_plugin_DockWidgetPluginGui_0):render((v3.createElement(v2, {
                plugin = plugin, 
                focusGui = l_plugin_DockWidgetPluginGui_0, 
                store = v15, 
                mouse = plugin:getMouse(), 
                theme = v7(), 
                localization = v17, 
                pluginActions = l_ContextServices_0.PluginActions.new(plugin, v11(plugin, v17))
            }, {
                MainView = v3.createElement(v1, {})
            })));
            local function _()
                l_plugin_DockWidgetPluginGui_0.Enabled = not l_plugin_DockWidgetPluginGui_0.Enabled;
            end;
            local l_Parent_0 = script.Parent.Parent;
            (function()
                plugin.Name = l_Parent_0.Name;
                local l_Events_0 = l_Parent_0.Src.Events;
                local v21 = require(l_Events_0.onPluginOpened);
                local v22 = require(l_Events_0.onPluginClosed);
                local l_Button_0 = plugin:CreateToolbar("Script Sync"):CreateButton("Script Sync", "Toggles the Script Sync window.", "rbxasset://textures/GameSettings/ToolbarIcon.png");
                l_Button_0.ClickableWhenViewportHidden = true;
                local l_status_0, l_result_0 = pcall(function()
                    return game:GetService("RunService"):IsEdit();
                end);
                if l_status_0 and l_result_0 then
                    local v26 = false;
                    local function _(v27)
                        if v26 == v27 then
                            return ;
                        else
                            v26 = v27;
                            l_Button_0:SetActive(v26);
                            if not v26 then
                                v22(plugin, l_plugin_DockWidgetPluginGui_0);
                                return ;
                            else
                                plugin:Activate(false);
                                v21(plugin, l_plugin_DockWidgetPluginGui_0);
                                return ;
                            end;
                        end;
                    end;
                    l_Button_0.Click:Connect(function()
                        l_plugin_DockWidgetPluginGui_0.Enabled = not l_plugin_DockWidgetPluginGui_0.Enabled;
                    end);
                    l_plugin_DockWidgetPluginGui_0:GetPropertyChangedSignal("Enabled"):Connect(function()
                        l_Button_0:SetActive(l_plugin_DockWidgetPluginGui_0.Enabled);
                    end);
                    plugin.Deactivation:Connect(function()
                        if v26 == false then
                            return ;
                        else
                            v26 = false;
                            l_Button_0:SetActive(v26);
                            if not v26 then
                                v22(plugin, l_plugin_DockWidgetPluginGui_0);
                                return ;
                            else
                                plugin:Activate(false);
                                v21(plugin, l_plugin_DockWidgetPluginGui_0);
                                return ;
                            end;
                        end;
                    end);
                    return ;
                else
                    l_Button_0.Enabled = false;
                    return ;
                end;
            end)();
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
