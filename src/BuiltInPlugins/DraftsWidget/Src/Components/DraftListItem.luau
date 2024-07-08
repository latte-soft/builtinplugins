local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Components.DraftStatusIndicator);
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TreeViewRow_0 = l_UI_0.TreeViewRow;
local v10 = require(l_Parent_0.Src.Symbols.DraftState);
local v11 = require(l_Parent_0.Src.Symbols.CommitState);
local v12 = require(l_Parent_0.Src.Symbols.AutosaveState);
local v13 = v1.PureComponent:extend("DraftListItem");
v13.init = function(v14)
    v14:setState({
        draftName = nil
    });
    v14.nameUpdated = function()
        v14:setState({
            draftName = v14.props.Draft.Name
        });
    end;
    v14.getDraftIndicator = function()
        local v15 = v14.props.Drafts[v14.props.Draft];
        local l_Localization_0 = v14.props.Localization;
        local l_Stylizer_0 = v14.props.Stylizer;
        local v18 = nil;
        local v19 = nil;
        if v15[v10.Committed] == v11.Committed then
            v18 = l_Localization_0:getText("Tooltip", "DraftCommitted");
            v19 = l_Stylizer_0.icons.DraftState.Committed;
        elseif not v15[v10.Deleted] then
            if v15[v10.Outdated] then
                v18 = l_Localization_0:getText("Tooltip", "DraftOutdated");
                v19 = l_Stylizer_0.icons.DraftState.Outdated;
            end;
        else
            v18 = l_Localization_0:getText("Tooltip", "ScriptDeleted");
            v19 = l_Stylizer_0.icons.DraftState.Deleted;
        end;
        if not v19 then
            return ;
        else
            return v1.createElement(v6, {
                Tooltip = v18, 
                Icon = v19
            });
        end;
    end;
    v14.getStatusText = function()
        local v20 = v14.props.Drafts[v14.props.Draft];
        local l_Localization_1 = v14.props.Localization;
        if v20[v10.Committed] == v11.Committed then
            return "";
        elseif v20[v10.Committed] == v11.Committing then
            return l_Localization_1:getText("StatusText", "Committing");
        elseif v20[v10.Autosaved] == v12.Saved then
            return l_Localization_1:getText("StatusText", "Uncommitted");
        elseif v20[v10.Autosaved] == v12.Saving then
            return l_Localization_1:getText("StatusText", "Saving");
        else
            return "";
        end;
    end;
    v14.getLabelText = function()
        local l_Draft_0 = v14.props.Draft;
        local l_draftName_0 = v14.state.draftName;
        local v24 = v14.props.Drafts[l_Draft_0];
        local l_Localization_2 = v14.props.Localization;
        if v24[v10.Committed] == v11.Committed then
            return l_Localization_2:getText("DraftItem", "CommittedLabel", {
                l_draftName_0
            });
        else
            return ".../" .. l_draftName_0;
        end;
    end;
    v14.nameChangedConnection = v14.props.Draft:GetPropertyChangedSignal("Name"):Connect(v14.nameUpdated);
    v14.nameUpdated();
end;
v13.didUpdate = function(v26, v27)
    assert(v27.Draft == v26.props.Draft, "The Draft property of DraftListItem should never be changed. These should be keyed by the draft");
end;
v13.willUnmount = function(v28)
    v28.nameChangedConnection:Disconnect();
end;
v13.render = function(v29)
    local l_Drafts_0 = v29.props.Drafts;
    local l_Draft_1 = v29.props.Draft;
    if l_Drafts_0[l_Draft_1] then
        local v32 = v29.getLabelText();
        local v33 = v29.getStatusText();
        local l_RowProps_0 = v29.props.RowProps;
        return v1.createElement(l_TreeViewRow_0, {
            TailItem = function()
                return v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Style = "Label", 
                    Text = v33
                });
            end, 
            BeforeIcon = function()
                return v29.getDraftIndicator();
            end, 
            Children = {}, 
            Depth = 0, 
            Index = 1, 
            Item = {
                text = v32, 
                tooltip = l_Draft_1:getFullName()
            }, 
            OnToggle = function()
            end, 
            OnPress = l_RowProps_0.OnPress, 
            OnSecondaryPress = l_RowProps_0.OnSecondaryPress, 
            Selected = l_RowProps_0.Selected
        });
    else
        return nil;
    end;
end;
return v2.connect(function(v35, _)
    return {
        Drafts = v35.Drafts
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13)));
