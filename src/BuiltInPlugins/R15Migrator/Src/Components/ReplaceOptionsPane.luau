local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_List_0 = v1.UI.List;
local l_deepCopy_0 = v1.Util.deepCopy;
local v7 = require(l_script_FirstAncestor_0.Src.Components.ReplaceOptionItem);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.ReplaceRules);
local v9 = v2.PureComponent:extend("ReplaceOptionsPane");
v9.init = function(v10, v11)
    v10.state = {
        rules = l_deepCopy_0(v11.replaceRules)
    };
    v10.onRuleUpdated = function(v12, v13, v14, v15)
        local v16 = l_deepCopy_0(v10.state.rules);
        v16[v12] = {
            FromText = v13, 
            ToText = v14, 
            Enabled = v15
        };
        v10.props.Analytics:getHandler("onScriptRulesUpdate")(v13, v14, v15);
        v10:setState({
            rules = v16
        });
        v10.props.ReplaceRules(l_deepCopy_0(v16));
    end;
    v10.getRowProps = function(v17, _, v19, v20)
        return {
            Key = v17.Key, 
            FromText = v17.FromText, 
            ToText = v17.ToText, 
            Enabled = v17.Enabled, 
            Selectable = v17.Selectable, 
            UpdateReplaceRules = v10.onRuleUpdated, 
            Position = v19, 
            Size = v20
        };
    end;
end;
v9.render = function(v21)
    local l_props_0 = v21.props;
    local l_state_0 = v21.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_rules_0 = l_state_0.rules;
    local v26 = {};
    for v27, v28 in l_rules_0, nil, nil do
        table.insert(v26, {
            Key = v27, 
            FromText = v28.FromText, 
            ToText = v28.ToText, 
            Enabled = v28.Enabled, 
            Selectable = true
        });
    end;
    return v2.createElement(l_List_0, {
        Rows = v26, 
        RowComponent = v7, 
        RowHeight = l_Stylizer_0.RowHeight, 
        GetRowProps = v21.getRowProps, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.PaneHeight)
    });
end;
v9.willUnmount = function(v29)
    if v29.paneSizeChanged then
        v29.paneSizeChanged:Disconnect();
        v29.paneSizeChanged = nil;
    end;
    if v29.listSizeChanged then
        v29.listSizeChanged:Disconnect();
        v29.listSizeChanged = nil;
    end;
end;
return v3.connect(function(v30, _)
    return {
        replaceRules = v30.ScriptConversion.replaceRules
    };
end, function(v32)
    return {
        ReplaceRules = function(v33)
            v32(v8(v33));
        end
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Analytics = l_ContextServices_0.Analytics
})(v9)));
