local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.ContextServices.DraftsService);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v5.Util.GetTextSize;
local v9 = require(l_Parent_0.Src.Components.DraftDiscardDialog);
local v10 = require(l_Parent_0.Src.Components.DraftListItem);
local v11 = require(l_Parent_0.Src.Components.ListItemView);
local l_Button_0 = v5.UI.Button;
local l_StyleModifier_0 = v5.Util.StyleModifier;
local v14 = require(l_Parent_0.Src.Actions.DraftStateChangedAction);
local v15 = require(l_Parent_0.Src.Symbols.DraftState);
local v16 = require(l_Parent_0.Src.Symbols.CommitState);
local v17 = v3.Component:extend("DraftListView");
v17.init = function(v18)
    local v19 = nil;
    v18:setState({
        draftsHasActiveSelection = false
    });
    v18.GetCurrentSelection = Instance.new("BindableFunction");
    v18.commitSelectedScripts = function()
        if not (next(v18.props.Drafts) == nil) then
            local v20 = v18.GetCurrentSelection:Invoke();
            if #v20 == 0 then
                return ;
            else
                v18.commitChanges(v20);
                return ;
            end;
        else
            return ;
        end;
    end;
    v18.openScripts = function(v21)
        local v22 = v18.props.Plugin:get();
        for _, v24 in pairs(v21) do
            v22:OpenScript(v24);
        end;
    end;
    v18.diffChanges = function(v25)
        v19 = v18.props.DraftService:get();
        v19:ShowDiffsAgainstServer(v25);
    end;
    v18.commitChanges = function(v26)
        v19 = v18.props.DraftService:get();
        v18.props.DraftsCommitted(v26);
        v19:CommitEdits(v26);
    end;
    v18.updateSource = function(v27)
        v19 = v18.props.DraftService:get();
        v19:UpdateToLatestVersion(v27);
    end;
    v18.restoreScripts = function(v28)
        v19 = v18.props.DraftService:get();
        v19:RestoreScripts(v28);
    end;
    v18.promptDiscardEdits = function(v29)
        v18:setState({
            draftsPendingDiscard = v29
        });
    end;
    v18.discardPromptClosed = function(v30)
        if v30 then
            v19 = v18.props.DraftService:get();
            v19:DiscardEdits(v18.state.draftsPendingDiscard);
        end;
        v18:setState({
            draftsPendingDiscard = v3.None
        });
    end;
    v18.getIndicatorEnabled = function(v31)
        local v32 = v18.props.Drafts[v31];
        local v33 = true;
        if v32[v15.Committed] ~= v16.Committed then
            v33 = v32[v15.Deleted] or v32[v15.Outdated];
        end;
        return v33;
    end;
    v18.getCommitButtonEnabled = function()
        return l_RunService_0:IsEdit() and v18.state.draftsHasActiveSelection;
    end;
    v18.onDoubleClicked = function(v34)
        v18.openScripts({
            v34
        });
    end;
    v18.onSelectionChanged = function(v35)
        if v35 and next(v35) == nil then
            v18:setState({
                draftsHasActiveSelection = false
            });
            return ;
        else
            v18:setState({
                draftsHasActiveSelection = true
            });
            return ;
        end;
    end;
    v18.makeMenuActions = function(v36)
        local l_Localization_0 = v18.props.Localization;
        local v38 = true;
        local v39 = true;
        local v40 = true;
        local v41 = true;
        local v42 = true;
        local v43 = true;
        local v44 = true;
        local v45 = true;
        for _, v47 in ipairs(v36) do
            local v48 = v18.props.Drafts[v47];
            if not v48[v15.Deleted] then
                if not v48[v15.Outdated] then
                    v38 = false;
                else
                    v43 = false;
                end;
            else
                v41 = false;
                v43 = false;
                v38 = false;
            end;
            if not v48[v15.Deleted] then
                v39 = false;
            end;
            if v48[v15.Committed] == v16.Committing then
                v40 = false;
                v44 = false;
                v42 = false;
                v43 = false;
                v41 = false;
                v45 = false;
            end;
        end;
        if not l_RunService_0:IsEdit() then
            v39 = false;
            v38 = false;
            v43 = false;
            v41 = false;
            v45 = false;
        end;
        return {
            {
                Text = l_Localization_0:getText("ContextMenu", "OpenScript"), 
                Enabled = v40, 
                OnItemClicked = function()
                    v18.openScripts(v36);
                end
            }, 
            {
                Text = l_Localization_0:getText("ContextMenu", "ShowDiff"), 
                Enabled = v41, 
                OnItemClicked = function()
                    v18.diffChanges(v36);
                end
            }, 
            v38 and {
                Text = l_Localization_0:getText("ContextMenu", "Update"), 
                Enabled = v42, 
                OnItemClicked = function()
                    v18.updateSource(v36);
                end
            }, 
            not v38 and {
                Text = l_Localization_0:getText("ContextMenu", "Commit"), 
                Enabled = v43, 
                OnItemClicked = function()
                    v18.commitChanges(v36);
                end
            }, 
            v39 and {
                Text = l_Localization_0:getText("ContextMenu", "Restore"), 
                Enabled = v44, 
                OnItemClicked = function()
                    v18.restoreScripts(v36);
                end
            }, 
            {
                Text = l_Localization_0:getText("ContextMenu", "Revert"), 
                Enabled = v45, 
                OnItemClicked = function()
                    v18.promptDiscardEdits(v36);
                end
            }
        };
    end;
end;
v17.render = function(v49)
    local l_Localization_1 = v49.props.Localization;
    local l_Stylizer_0 = v49.props.Stylizer;
    local l_Drafts_0 = v49.props.Drafts;
    local l_draftsPendingDiscard_0 = v49.state.draftsPendingDiscard;
    local v54 = l_draftsPendingDiscard_0 ~= nil;
    local v55 = next(l_Drafts_0) == nil;
    local v56 = v49.getCommitButtonEnabled();
    local v57 = false;
    local v58 = {};
    for v59, _ in pairs(l_Drafts_0) do
        table.insert(v58, v59);
        if not v57 then
            v57 = v49.getIndicatorEnabled(v59);
        end;
    end;
    table.sort(v58, function(v61, v62)
        return v61.Name:lower() < v62.Name:lower();
    end);
    local v63 = l_Localization_1:getText("Toolbar", "CommitButton");
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Toolbar = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 32), 
            LayoutOrder = 0
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4), 
                PaddingLeft = UDim.new(0, 4)
            }), 
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            CommitButton = v3.createElement(l_Button_0, {
                OnClick = v49.commitSelectedScripts, 
                Size = UDim2.new(0, l_GetTextSize_0(v63).X + 20, 1, 0), 
                StyleModifier = if v56 then nil else l_StyleModifier_0.Disabled, 
                Style = "RoundPrimary", 
                Text = v63
            })
        }), 
        Container = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, -32), 
            LayoutOrder = 1
        }, {
            ListItemView = v3.createElement(v11, {
                Items = v58, 
                ItemHeight = 24, 
                GetCurrentSelection = v49.GetCurrentSelection, 
                OnDoubleClicked = v49.onDoubleClicked, 
                OnSelectionChanged = v49.onSelectionChanged, 
                MakeMenuActions = v49.makeMenuActions, 
                RenderItem = function(v64, v65)
                    return v3.createElement(v10, {
                        Draft = v64, 
                        RowProps = v65, 
                        IndicatorMargin = not v57 and 0 or 24
                    });
                end
            }), 
            EmptyLabel = v55 and v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -16, 1, -16), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Text = l_Localization_1:getText("Main", "NoDrafts"), 
                TextColor3 = l_Stylizer_0.labels.MainText, 
                TextSize = 22, 
                Font = l_Stylizer_0.labels.MainFont, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        DiscardDialog = v54 and v3.createElement(v9, {
            Drafts = l_draftsPendingDiscard_0, 
            ChoiceSelected = v49.discardPromptClosed
        })
    });
end;
return v4.connect(function(v66, _)
    return {
        Drafts = v66.Drafts
    };
end, function(v68)
    return {
        DraftsCommitted = function(v69)
            for _, v71 in ipairs(v69) do
                v68(v14(v71, v15.Committed, v16.Committing));
            end;
        end
    };
end)((l_withContext_0({
    DraftService = v2, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v17)));
