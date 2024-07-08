local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_Alert_0 = v2.UI.Alert;
local l_Pane_0 = v2.UI.Pane;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v11 = require(l_Components_0.Browser);
local v12 = require(l_Components_0.Editor);
local v13 = require(l_Components_0.Prompt);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v15 = require(l_script_FirstAncestor_0.Src.Hooks.useResponsiveLayout);
local v16 = require(l_script_FirstAncestor_0.Src.Resources.AppLayout);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v18 = require(l_script_FirstAncestor_0.Src.Util.GenerationContext);
local v19 = require(l_script_FirstAncestor_0.Src.Util.PreviewContext);
return function(v20)
    assert(v14(), "Expected FFlagMaterialGeneratorNewUI to be true");
    local l_selectedMaterial_0 = v3.useContext(v19).selectedMaterial;
    local v22 = v3.useContext(v18);
    local l_errorMessage_0 = v22.errorMessage;
    local v24, v25 = v15(v16);
    local v26 = l_LayoutOrderIterator_0.new();
    local v27 = l_Stylizer_0:use("App", v20);
    local v28 = l_Localization_0:use();
    local function v31()
        local v29 = nil;
        local v30 = true;
        if not l_selectedMaterial_0 or not v25 then
            v29 = UDim2.fromScale(1, 1);
        else
            v29 = v25.mainContentSize;
            if v25.browserVisible == false then
                v30 = false;
            end;
        end;
        if v29 == UDim2.new() then
            return nil;
        else
            return v3.createElement(l_Pane_0, {
                LayoutOrder = v26:getNextOrder(), 
                Size = v29
            }, {
                Alert = if not l_errorMessage_0 then nil else v3.createElement(l_Alert_0, {
                    Description = l_errorMessage_0, 
                    OnClose = function()
                        v22.popError();
                    end, 
                    Style = "AppError", 
                    Title = v28:getText("App", "ErrorAlertTitle"), 
                    ZIndex = 2
                }), 
                Content = v3.createElement(l_Pane_0, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }, {
                    Prompt = v3.createElement(v13, {
                        LayoutOrder = v26:getNextOrder(), 
                        Size = v27.PromptSize, 
                        isDisabled = l_errorMessage_0 ~= nil
                    }), 
                    Browser = if not v30 then nil else v3.createElement(v11, {
                        LayoutOrder = v26:getNextOrder(), 
                        Size = v27.BrowserSize
                    })
                })
            });
        end;
    end;
    local function _()
        if not l_selectedMaterial_0 or not v25 then
            return nil;
        else
            return v3.createElement(v12, {
                LayoutOrder = v26:getNextOrder(), 
                Size = v25.editorSize
            });
        end;
    end;
    return v3.createElement(l_Pane_0, v1.join({
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = if not v25 then nil else v25.fillDirection, 
        Style = "Box", 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, v24), {
        MainContent = v31(), 
        Editor = if not not l_selectedMaterial_0 and v25 then v3.createElement(v12, {
            LayoutOrder = v26:getNextOrder(), 
            Size = v25.editorSize
        }) else nil
    });
end;
