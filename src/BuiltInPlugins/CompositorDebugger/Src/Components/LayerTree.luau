local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_join_0 = v3.Dash.join;
local l_TreeView_0 = v3.UI.TreeView;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v12 = require(l_Actions_0.SetSelectedLayer);
local v13 = require(l_Actions_0.SetHistoryField);
local v14 = require(l_script_FirstAncestor_0.Src.Components.LayerTreeRow);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.DetachCompositor);
local v16 = require(l_script_FirstAncestor_0.Src.Util.traverse);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v18 = v1.PureComponent:extend("LayerTree");
v18.init = function(v19)
    v19.state = {
        Selection = {}, 
        Expansion = {}
    };
    v19.getItemId = function(v20)
        return v20.id;
    end;
    v19.onExpand = function(v21)
        v19:setState({
            Expansion = l_join_0(v19.state.Expansion, v21)
        });
    end;
    v19.onToggleAdornment = function(v22)
        if v19.props.OnToggleAdornment then
            v19.props.OnToggleAdornment(v22);
        end;
    end;
    v19.onSelect = function(v23)
        for v24, _ in v23, nil, nil do
            v19.props.SetSelectedLayer(v24);
        end;
        v19.props.ClearHistoryField();
        v19:setState({
            Selection = v23
        });
    end;
end;
updateTreeViewItems = function(v26, v27)
    local v28 = {};
    if v26 then
        v16(v26, function(v29)
            if v27[v29.id] == nil then
                v28[v29.id] = true;
            end;
            if v29.children then
                table.sort(v29.children, function(v30, v31)
                    if not (not v30.index or not v31.index) and v30.index ~= v31.index then
                        return v30.index < v31.index;
                    elseif not (not v30.name or not v31.name) and v30.name ~= v31.name then
                        return v30.name < v31.name;
                    elseif not (not v30.className or not v31.className) and v30.className ~= v31.className then
                        return v30.className < v31.className;
                    else
                        return v30.id < v31.id;
                    end;
                end);
            end;
        end);
    end;
    return v28;
end;
v18.getDerivedStateFromProps = function(v32, v33)
    local v34 = updateTreeViewItems(v32.FramePayload, v33.Expansion);
    if not next(v34) then
        return {};
    else
        return {
            Expansion = l_join_0(v33.Expansion, v34)
        };
    end;
end;
v18.render = function(v35)
    local l_state_0 = v35.state;
    local l_props_0 = v35.props;
    return v1.createElement(l_TreeView_0, {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        RootItems = {
            l_props_0.FramePayload
        }, 
        Expansion = l_state_0.Expansion, 
        Selection = l_state_0.Selection, 
        GetItemId = v35.getItemId, 
        RowComponent = v14, 
        RowProps = {
            GetItemId = v35.getItemId, 
            Adornments = l_props_0.Adornments, 
            OnToggleAdornment = v35.onToggleAdornment
        }, 
        RowHeight = 26, 
        OnExpansionChange = v35.onExpand, 
        OnSelectionChange = v35.onSelect, 
        ScrollingDirection = Enum.ScrollingDirection.Y
    }, {});
end;
return (v2.connect(function(_, _)
    return {};
end, function(v40)
    return {
        ClearHistoryField = function()
            v40(v13(nil, nil, nil));
        end, 
        SetSelectedLayer = function(v41)
            v40(v12(v41));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v18))));
