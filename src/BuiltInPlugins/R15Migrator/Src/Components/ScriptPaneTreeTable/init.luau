local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local v9 = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_Dash_0 = v4.Dash;
local _ = l_Dash_0.append;
local l_join_0 = l_Dash_0.join;
local l_map_0 = l_Dash_0.map;
local l_None_0 = l_Dash_0.None;
local v16 = require(script.CellComponent);
local v17 = require(script.Renderers);
local v18 = require(script.ScriptPaneHelpers);
local l_UI_0 = v4.UI;
local _ = l_UI_0.Pane;
local l_TreeTable_0 = l_UI_0.TreeTable;
local _ = l_script_FirstAncestor_0.Src.Actions;
local _ = l_script_FirstAncestor_0.Src.Components;
local v24 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v25 = require(l_script_FirstAncestor_0.Src.Thunks.ApplyResolutions);
local v26 = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
local v27 = require(script.Sort);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v29 = {
    {
        Name = nil, 
        Key = "select", 
        SortMethod = v27.booleanSort
    }, 
    {
        Name = "NameTitle", 
        Key = "name", 
        SortMethod = v27.scriptLinkSort
    }, 
    {
        Name = nil, 
        Key = "count", 
        SortMethod = v27.optionalNumSort
    }, 
    {
        Name = "TypeTitle", 
        Key = "issue"
    }, 
    {
        Name = "R6Title", 
        Key = "r6"
    }, 
    {
        Name = "R15Title", 
        Key = "r15"
    }, 
    {
        Name = nil, 
        Key = "menu_status", 
        SortMethod = v27.booleanSort
    }
};
local function v31(v30)
    return v30.children or {};
end;
local v32 = v2.PureComponent:extend("ScriptPaneTreeTable");
v32.init = function(v33)
    v33.state = {
        Sizes = {
            UDim.new(0, 24), 
            UDim.new(0.5, -84), 
            UDim.new(0, 24), 
            UDim.new(0, 72), 
            UDim.new(0.25, -42), 
            UDim.new(0.25, -42), 
            UDim.new(0, 48)
        }, 
        SortChildren = nil, 
        SortIndex = 5, 
        SortOrder = Enum.SortDirection.Ascending, 
        Expansion = {}, 
        Selection = {}, 
        _Ref = {
            diagnostics = nil, 
            searchFilters = nil
        }
    };
    v33.onSizesChange = function(v34)
        v33:setState({
            Sizes = v34
        });
    end;
    v33.onSortChange = function(v35, v36)
        local v37 = l_join_0(v33.state.Items);
        table.sort(v37, (v18.genSortItems(v29[v35], v36)));
        v33:setState({
            Items = v37, 
            SortChildren = v18.genSortItems(v29[2], if v35 == 2 then v36 else Enum.SortDirection.Descending), 
            SortIndex = v35, 
            SortOrder = v36
        });
    end;
    v33.onCheckboxEdited = function(v38, v39)
        v33:setState({
            Selection = l_join_0(v33.state.Selection, {
                [v18.makeItemId(v39.scriptId, v39.issueType, v39.instanceName)] = if not v38 then l_None_0 else v39
            })
        });
    end;
    v33.onSuggestionApplied = function(v40, v41)
        local v42 = l_join_0(v33.state.Items);
        local l_item_0 = v41.item;
        local v44 = l_join_0(v33.state.Selection);
        if not (not v41.parent or not v44[v18.getItemId(v41.parent)]) then
            l_item_0 = v41.parent;
            v41 = l_item_0.Path;
        end;
        local v45 = {
            [v41.scriptId] = {}
        };
        l_item_0.r15.Value = v40;
        if not l_item_0.children then
            table.insert(v45[v41.scriptId], l_item_0.Path.diagnostic.diagnosticId);
        else
            l_item_0.r15.Value = v40;
            for _, v47 in l_item_0.children, nil, nil do
                if v47.r15.Value ~= v40 then
                    v47.r15.Value = v40;
                    table.insert(v45[v41.scriptId], v47.Path.diagnostic.diagnosticId);
                end;
            end;
        end;
        for _, v49 in v42, nil, nil do
            if not (not v44 or not v44[v18.getItemId(v49)]) then
                v45[v49.Path.scriptId] = v45[v49.Path.scriptId] or {};
                for _, v51 in v49.children, nil, nil do
                    table.insert(v45[v49.Path.scriptId], v51.Path.diagnostic.diagnosticId);
                end;
            end;
        end;
        for v52, v53 in v45, nil, nil do
            v33.props.ApplyResolutions(v52, v53, v40, v33.props.ScriptConversionContext);
        end;
        v33:setState({
            Items = v42, 
            Selection = {}
        });
    end;
    v33.onCellEdited = function(v54, v55, v56)
        if v56 == 1 then
            v33.onCheckboxEdited(v54, v55);
            return ;
        elseif v56 == 6 then
            v33.onSuggestionApplied(v54.Id, v55, true);
            return ;
        else
            assert(false, "Unknown column changed");
            return ;
        end;
    end;
    v33.onCellAction = function(v57, v58)
        local l_props_0 = v33.props;
        if v57 == v24.ScriptMenuActions.ShowInExplorer then
            l_Selection_0:Set({
                (l_props_0.ScriptConversionContext:getScriptInstanceFromGUID(v58.scriptId))
            });
            return ;
        elseif v57 == v24.ScriptMenuActions.GoToScript then
            v26.goToScript(v58.scriptId, if not v58.diagnostic then nil else v58.diagnostic.range, l_props_0.ScriptConversionContext);
            return ;
        elseif v57 == v24.ScriptMenuActions.RevertScript then
            v33.onSuggestionApplied(v26.UNASSIGNED, v58, false);
            return ;
        else
            if v57 == v24.ScriptMenuActions.SelectAllSimilar then
                local v60 = {};
                for v61 in l_props_0.diagnostics, nil, nil do
                    v60[v18.makeItemId(v61, v58.issueType, v58.instanceName)] = l_join_0(v58, {
                        scriptId = v61
                    });
                end;
                v33:setState({
                    Selection = v60
                });
            end;
            return ;
        end;
    end;
    v33.onExpansionChange = function(v62)
        v33:setState({
            Expansion = l_join_0(v33.state.Expansion, v62)
        });
    end;
    v33.ExpandAllEventConn = nil;
end;
v32.getDerivedStateFromProps = function(v63, v64)
    if not (v63.diagnostics == v64._Ref.diagnostics) or v63.SearchFilters ~= v64._Ref.SearchFilters then
        local v65 = v18.generateTreeViewItems(v63.diagnostics, v63.ScriptConversionContext, v63.SearchFilters, v64.Selection, v63.Localization);
        if not (not v64.SortIndex or not v64.SortOrder) then
            table.sort(v65, (v18.genSortItems(v29[v64.SortIndex], v64.SortOrder)));
        end;
        return {
            Items = v65, 
            _Ref = l_join_0(v64._Ref, {
                diagnostics = v63.diagnostics, 
                completedScripts = v63.completedScripts, 
                searchFilters = v63.SearchFilters
            })
        };
    else
        return ;
    end;
end;
v32.didMount = function(v66)
    v66.ExpandAllEventConn = v66.props.ExpandTreeView.Event:Connect(function(v67)
        v67 = v67 or nil;
        local v68 = {};
        for _, v70 in v66.state.Items, nil, nil do
            v68[v18.getItemId(v70)] = v67;
        end;
        v66:setState({
            Expansion = v68
        });
    end);
end;
v32.willUnmount = function(v71)
    v71.ExpandAllEventConn:Disconnect();
    v71.ExpandAllEventConn = nil;
end;
v32.render = function(v72)
    local _ = v72.state;
    local l_props_1 = v72.props;
    local l_Localization_1 = l_props_1.Localization;
    return v2.createElement(l_TreeTable_0, {
        LayoutOrder = l_props_1.LayoutOrder, 
        Size = l_props_1.Size, 
        SortIndex = v72.state.SortIndex, 
        SortOrder = v72.state.SortOrder, 
        SortChildren = v72.state.SortChildren, 
        OnSortChange = v72.onSortChange, 
        Columns = l_map_0(v29, function(v76, v77)
            return l_join_0(v76, {
                Name = not v76.Name and "" or l_Localization_1:getText("ScriptPane", v76.Name), 
                Width = v72.state.Sizes[v77]
            });
        end), 
        OnExpansionChange = v72.onExpansionChange, 
        CellComponent = v16, 
        Expansion = v72.state.Expansion, 
        Selection = v72.state.Selection, 
        RootItems = v72.state.Items, 
        GetChildren = v31, 
        GetItemId = v18.getItemId, 
        OnCellEdited = v72.onCellEdited, 
        OnCellAction = v72.onCellAction, 
        Scroll = true, 
        ClampSize = true, 
        UseDeficit = true, 
        Renderers = {
            ScriptLink = v17.ScriptLinkCell, 
            Dropdown = v17.DropdownCell, 
            Status = v17.StatusCell
        }
    });
end;
return (v3.connect(function(v78, _)
    return {
        diagnostics = v78.ScriptConversion.diagnostics
    };
end, function(v80)
    return {
        ApplyResolutions = function(v81, v82, v83, v84)
            v80(v25(v81, v82, v83, v84));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    ScriptConversionContext = v9
})(v32))));
