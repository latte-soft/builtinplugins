local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.createAnalyticsHandlers);
local v2 = require(l_script_FirstAncestor_0.Src.Resources.Localization.createLocalization);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useSizeCalculator);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useVisualizationModeCombiner);
local v8 = require(l_script_FirstAncestor_0.Src.Components.Actions.VisualizationModeActions);
local v9 = require(l_script_FirstAncestor_0.Src.Components.VisualizationModesMainView);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioVisualizationModesUI);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioPluginPopupAnchorPoint);
local l_UI_0 = v3.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_Pane_0 = l_UI_0.Pane;
local l_Popup_0 = l_UI_0.Popup;
local l_ContextServices_0 = v3.ContextServices;
local l_StudioTheme_0 = v3.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v3.Styling.registerPluginStyles;
local function v30(v20)
    local v21 = l_ContextServices_0.Localization:use();
    local v22 = l_ContextServices_0.Analytics:use();
    local v23 = l_ContextServices_0.Plugin:use():get();
    local v24 = v4.useRef(false);
    local v25 = v6({
        Width = 325, 
        HeaderHeight = 32, 
        MaxHeight = 700, 
        InnerPadding = 5, 
        Padding = Vector2.new(10, 10)
    });
    local v28 = v4.useState(function()
        local v26, v27 = l_registerPluginStyles_0(v23, l_script_FirstAncestor_0);
        return {
            design = v26, 
            conn = v27
        };
    end, {
        v23
    });
    v4.useEffect(function()
        if v28.conn == nil then
            return nil;
        else
            return function()
                v28.conn:Disconnect();
            end;
        end;
    end, {
        v28.conn
    });
    local v29 = v4.useCallback(function()
        v20.ToggleState.disable();
    end);
    v4.useEffect(function()
        if v20.ToggleState.enabled then
            v22:report("openPlugin");
        end;
    end, {
        v22, 
        v20.ToggleState.enabled
    });
    if v20.PluginButton then
        if v20.ToggleState.enabled or v24.current then
            return v4.createElement(l_Popup_0, {
                CreateWidgetImmediately = false, 
                Enabled = v20.ToggleState.enabled, 
                Modal = false, 
                Title = v21:getText("Plugin", "Name"), 
                Size = v25.size, 
                OnClose = v29, 
                PopupTarget = v20.PluginButton, 
                PopupSelfAnchorPoint = if not v11() then nil else Vector2.new(1, 0), 
                PopupTargetAnchorPoint = if not v11() then nil else Vector2.new(1, 1)
            }, {
                Wrapper = v4.createElement(l_Pane_0, {
                    [v4.Tag] = "X-Fill X-Column X-Top VisualizationModes-Popup"
                }, {
                    VisualizationModesMainView = v4.createElement(v9, {
                        VisualizationModeCategories = v20.CombinerState.state.categories, 
                        RecentVisualizationModes = v20.CombinerState.state.recentModes, 
                        SizeCalculator = v25, 
                        OnVisualizationModeToggle = v20.CombinerState.onVisualizationModeToggle, 
                        OnVisualizationModeCategoryToggle = v20.CombinerState.onVisualizationModeCategoryToggle
                    })
                }), 
                VisualizationModesStrokePane = v4.createElement("Frame", {
                    [v4.Tag] = "VisualizationModesStrokePane"
                }), 
                StyleLink = v4.createElement("StyleLink", {
                    StyleSheet = v28.design
                })
            });
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function v37()
    local v31 = v5.useToggleState();
    local v32 = v4.useRef(nil);
    local v33 = l_ContextServices_0.Localization:use();
    local v34 = l_ContextServices_0.Plugin:use():get();
    local v35 = v7();
    if v10() then
        return v4.createElement(v4.Fragment, {}, {
            Actions = v4.createElement(v8, {
                VisualizationModeCategories = v35.state.categories, 
                OnVisualizationModeToggle = v35.onVisualizationModeToggle
            }), 
            Toolbar = v4.createElement(l_PluginToolbar_0, {
                Title = "visualizationModesToolbar", 
                Plugin = v34, 
                RenderButtons = function(v36)
                    return {
                        Toggle = v4.createElement(l_PluginButton_0, {
                            Toolbar = v36, 
                            Active = v31.enabled, 
                            Id = "visualizationModesButton", 
                            Title = v33:getText("Plugin", "Button"), 
                            Tooltip = v33:getText("Plugin", "Tooltip"), 
                            Icon = "rbxlocaltheme://VisualizationModes", 
                            OnClick = v31.toggle, 
                            ClickableWhenViewportHidden = false, 
                            ref = v32
                        })
                    };
                end
            }), 
            Popup = v4.createElement(v30, {
                ToggleState = v31, 
                CombinerState = v35, 
                PluginButton = v32.current and v32.current.button
            })
        });
    else
        return nil;
    end;
end;
return function(v38)
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(v38.Plugin), 
        l_ContextServices_0.Mouse.new(v38.Plugin:GetMouse()), 
        v4.useState(function()
            return l_StudioTheme_0.new();
        end), 
        v4.useState(function()
            return v2();
        end), 
        (v4.useState(function()
            return l_ContextServices_0.Analytics.new(v1);
        end))
    }, {
        Main = v4.createElement(v37)
    });
end;
