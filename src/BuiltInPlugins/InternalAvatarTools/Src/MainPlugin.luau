local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v5 = require(l_Parent_0.Src.Resources.MakeTheme);
local v6 = require(l_Parent_0.Src.Components.Toolbar);
local v7 = require(l_Parent_0.Src.Components.PromptExportNonAccessory);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v10 = require(l_Parent_0.Src.Functions.NonAccessoriesSelected);
local v11 = require(l_Parent_0.Src.Functions.Export);
local v12 = v1.PureComponent:extend("MainPlugin");
v12.init = function(v13, _)
    v13.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "InternalAvatarTools"
    });
    v13:setState({
        promptExportNonAccessoryOpen = false
    });
end;
v12.render = function(v15)
    local l_Plugin_1 = v15.props.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v5(), 
        v15.localization
    }, {
        Toolbar = v1.createElement(v6, {
            onExportClicked = function()
                if not v10() then
                    v11(l_Plugin_1);
                    return ;
                else
                    v15:setState({
                        promptExportNonAccessoryOpen = true
                    });
                    return ;
                end;
            end
        }), 
        PromptExportNonAccessory = v15.state.promptExportNonAccessoryOpen and v1.createElement(v7, {
            onConfirm = function()
                v11(l_Plugin_1);
                v15:setState({
                    promptExportNonAccessoryOpen = false
                });
            end, 
            onCancel = function()
                v15:setState({
                    promptExportNonAccessoryOpen = false
                });
            end
        })
    });
end;
return v12;
