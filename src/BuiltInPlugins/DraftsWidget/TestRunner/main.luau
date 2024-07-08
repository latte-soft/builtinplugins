return function(v0)
    if v0 then
        require(script.Parent.defineLuaFlags);
        local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
        local l_Parent_0 = script.Parent.Parent;
        local l_FVariable_0 = settings():GetFVariable("StudioForceLocale");
        local v4 = require(l_Parent_0.Src.TestHelpers.MockDraftsService);
        local l_DraftsService_0 = game:GetService("DraftsService");
        local l_RunService_0 = game:GetService("RunService");
        local l_StudioService_0 = game:GetService("StudioService");
        local v8 = require(l_Parent_0.Packages.Roact);
        local v9 = require(l_Parent_0.Packages.Rodux);
        local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
        local v11 = require(l_Parent_0.Src.Components.ServiceWrapper);
        local v12 = require(l_Parent_0.Src.Components.MainView);
        local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v14 = require(l_Parent_0.Src.Actions.DraftsServiceLoaded);
        local v15 = require(l_Parent_0.Src.Actions.DraftsLoadedAction);
        local v16 = require(l_Parent_0.Src.Actions.DraftAddedAction);
        local v17 = require(l_Parent_0.Src.Actions.DraftRemovedAction);
        local v18 = require(l_Parent_0.Src.Actions.DraftStateChangedAction);
        local v19 = require(l_Parent_0.Src.Symbols.CommitState);
        local v20 = require(l_Parent_0.Src.Symbols.DraftState);
        local v21 = require(l_Parent_0.Src.Resources.MakeTheme);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local function v24()
            if #l_FVariable_0 > 0 then
                return l_FVariable_0;
            else
                return l_StudioService_0.StudioLocaleId;
            end;
        end;
        local v25 = v9.Store.new(v13);
        local v26 = v21();
        local v27 = l_ContextServices_0.Localization.new({
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            overrideLocaleChangedSignal = l_StudioService_0:GetPropertyChangedSignal("StudioLocaleId"), 
            overrideGetLocale = v24, 
            pluginName = "Drafts"
        });
        local l_game_FastInt_0 = game:GetFastInt("DebugStudioDraftsWidgetTestCase");
        local v29 = l_game_FastInt_0 == 0 and l_DraftsService_0 or v4.new(l_game_FastInt_0);
        local v30 = nil;
        local v31 = nil;
        local function v32()
            if not v30 then
                v30 = v8.mount(v8.createElement(v11, {
                    draftsService = v29, 
                    focusGui = v31, 
                    localization = v27, 
                    plugin = v0, 
                    store = v25, 
                    theme = v26
                }, {
                    mainView = v8.createElement(v12, {})
                }), v31);
                return ;
            else
                warn("Plugin handle already exists");
                return ;
            end;
        end;
        local function _()
            if v30 then
                v8.unmount(v30);
                v30 = nil;
            end;
        end;
        v0.Unloading:Connect(function()
            if v30 then
                v8.unmount(v30);
                v30 = nil;
            end;
        end);
        local function v34()
            v31.Enabled = not v31.Enabled;
        end;
        local function _(v35)
            local l_Button_0 = v0:CreateToolbar("draftsToolbar"):CreateButton("draftsButton", v27:getText("Meta", "PluginButtonTooltip"), "");
            if v35 then
                l_Button_0.ClickableWhenViewportHidden = true;
                l_Button_0.Click:connect(v34);
            end;
            l_Button_0.Enabled = v35;
            return l_Button_0;
        end;
        if game:GetService("RunService"):IsEdit() then
            local function _(v38)
                if l_RunService_0:IsEdit() then
                    if not (#v38 > 0) then
                        local v39 = nil;
                        v39 = v29.DraftAdded:connect(function()
                            v39:disconnect();
                            v31.Enabled = true;
                        end);
                        return ;
                    else
                        v31.Enabled = true;
                        return ;
                    end;
                else
                    return ;
                end;
            end;
            local function v64()
                local v41 = {};
                local function v45(v42, v43)
                    if v43 == Enum.DraftStatusCode.DraftOutdated then
                        v25:dispatch(v18(v42, v20.Outdated, true));
                        return ;
                    elseif v43 == Enum.DraftStatusCode.OK then
                        v25:dispatch(v18(v42, v20.Outdated, false));
                        return ;
                    elseif v43 == Enum.DraftStatusCode.DraftCommitted then
                        local v44 = v25:getState();
                        assert(v44.Drafts[v42][v20.Outdated] == false, "Draft '" .. v42:GetFullName() .. "' was committed with dirty Outdated state");
                        assert(v44.Drafts[v42][v20.Deleted] == false, "Draft '" .. v42:GetFullName() .. "' was committed with dirty Deleted state");
                        return ;
                    else
                        if v43 == Enum.DraftStatusCode.ScriptRemoved then
                        end;
                        return ;
                    end;
                end;
                local function v49(v46)
                    assert(v41[v46] == nil);
                    v45(v46, (v29:GetDraftStatus(v46)));
                    v41[v46] = v46.AncestryChanged:Connect(function(_, v48)
                        v25:dispatch(v18(v46, v20.Deleted, v48 == nil));
                    end);
                end;
                local function _(v50)
                    assert(v41[v50] ~= nil);
                    v41[v50]:Disconnect();
                    v41[v50] = nil;
                end;
                spawn(function()
                    local l_status_0, l_result_0 = pcall(function()
                        return v29:GetDrafts();
                    end);
                    v25:dispatch(v14(l_status_0, l_result_0));
                    if l_status_0 then
                        v25:dispatch(v15(l_result_0));
                        for _, v55 in pairs(l_result_0) do
                            v49(v55);
                        end;
                        v29.DraftAdded:connect(function(v56)
                            v25:dispatch(v16(v56));
                            v49(v56);
                        end);
                        v29.DraftRemoved:connect(function(v57)
                            v25:dispatch(v17(v57));
                            assert(v41[v57] ~= nil);
                            v41[v57]:Disconnect();
                            v41[v57] = nil;
                        end);
                        v29.DraftStatusChanged:connect(function(v58)
                            v45(v58, (v29:GetDraftStatus(v58)));
                        end);
                        v29.UpdateStatusChanged:connect(function(v59, v60)
                            v45(v59, v60);
                        end);
                        v29.CommitStatusChanged:connect(function(v61, v62)
                            v25:dispatch(v18(v61, v20.Committed, v62 == Enum.DraftStatusCode.DraftCommitted and v19.Committed or v19.Uncommitted));
                            v45(v61, v62);
                        end);
                        if l_RunService_0:IsEdit() then
                            if not (#l_result_0 > 0) then
                                local v63 = nil;
                                v63 = v29.DraftAdded:connect(function()
                                    v63:disconnect();
                                    v31.Enabled = true;
                                end);
                                return ;
                            else
                                v31.Enabled = true;
                                return ;
                            end;
                        else
                            return ;
                        end;
                    else
                        return ;
                    end;
                end);
            end;
            (function()
                local v65 = v27:getText("Meta", "PluginName");
                v0.Name = v65;
                local l_Button_1 = v0:CreateToolbar("draftsToolbar"):CreateButton("draftsButton", v27:getText("Meta", "PluginButtonTooltip"), "");
                l_Button_1.ClickableWhenViewportHidden = true;
                l_Button_1.Click:connect(v34);
                l_Button_1.Enabled = true;
                local l_l_Button_1_0 = l_Button_1;
                local function v68()
                    if not v31.Enabled then
                        if v30 then
                            v8.unmount(v30);
                            v30 = nil;
                        end;
                    else
                        v32();
                    end;
                    l_l_Button_1_0:SetActive(v31.Enabled);
                end;
                v31 = v0:CreateDockWidgetPluginGui(if not l_StudioFixPluginWidgetLocalizedIds_0 then v65 else "Drafts", (DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, false, true, 300, 600, 150, 150)));
                v31.Name = v65;
                v31.Title = v65;
                v31.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                v31:GetPropertyChangedSignal("Enabled"):connect(v68);
                if not v31.Enabled then
                    if v30 then
                        v8.unmount(v30);
                        v30 = nil;
                    end;
                else
                    v32();
                end;
                l_l_Button_1_0:SetActive(v31.Enabled);
                v64();
            end)();
            return ;
        else
            v0:CreateToolbar("draftsToolbar"):CreateButton("draftsButton", v27:getText("Meta", "PluginButtonTooltip"), "").Enabled = false;
            return ;
        end;
    else
        return ;
    end;
end;
