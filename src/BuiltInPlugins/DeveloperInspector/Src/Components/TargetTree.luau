local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.InspectorContext);
local v5 = require(l_Parent_0.Packages.Dash);
local l_values_0 = v5.values;
local l_keys_0 = v5.keys;
local l_withContext_0 = v3.ContextServices.withContext;
local l_InstanceTreeView_0 = v3.UI.InstanceTreeView;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.SelectTarget);
local v12 = require(l_Actions_0.ToggleTarget);
local v13 = v1.PureComponent:extend("TargetTree");
local l_UserInputService_0 = game:GetService("UserInputService");
v13.init = function(v15)
    v15.onSelectTarget = function(v16)
        local v17 = v15:getTargetFromChange(v16);
        if v17 then
            v15.props.Inspector:get():attachRoactTree(v17.BridgeId, v17.Id):getRoot();
            v15.props.selectTarget(v17);
            l_UserInputService_0.MouseIconEnabled = true;
            return ;
        else
            return ;
        end;
    end;
end;
v13.getTargetFromChange = function(_, v19)
    local v20 = l_keys_0(v19)[1];
    if not v20.BridgeId then
        return nil;
    else
        return v20;
    end;
end;
v13.render = function(v21)
    local l_props_0 = v21.props;
    return v1.createElement(l_InstanceTreeView_0, {
        Instances = l_values_0(l_props_0.Instances), 
        Expansion = l_props_0.Expansion, 
        Selection = {}, 
        OnExpansionChange = l_props_0.toggleTarget, 
        OnSelectionChange = v21.onSelectTarget, 
        Size = UDim2.new(1, 0, 1, 0), 
        Style = "BorderBox"
    });
end;
return v2.connect(function(v23, _)
    return {
        Instances = v23.Targets.targets, 
        Expansion = v23.Targets.expandedTargets
    };
end, function(v25)
    return {
        selectTarget = function(v26)
            v25(v11(v26));
        end, 
        toggleTarget = function(v27)
            v25(v12(v27));
        end
    };
end)((l_withContext_0({
    Inspector = v4
})(v13)));
