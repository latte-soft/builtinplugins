local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v2.ContextServices;
local l_InstanceTreeView_0 = v2.UI.InstanceTreeView;
local v6 = v3.PureComponent:extend("CharacterInstanceTree");
v6.isValidDisplayInstance = function(v7)
    if not v7:IsA("Accoutrement") then
        if not v7:IsA("BasePart") then
            return false;
        else
            return true;
        end;
    else
        return true;
    end;
end;
local function v8(v9, v10)
    local v11 = {};
    for _, v13 in v9:GetChildren() do
        if v10(v13) then
            v11[#v11 + 1] = v8(v13, v10);
        end;
    end;
    local v14 = v9:Clone();
    v14:ClearAllChildren();
    for _, v16 in v11, nil, nil do
        v16.Parent = v14;
    end;
    return v14;
end;
v6.getInstanceTreeRoot = function(v17)
    if v17 then
        return (v8(v17:GetChildren()[1], v6.isValidDisplayInstance));
    else
        return nil;
    end;
end;
v6.init = function(v18)
    v18.instanceTreeRoot = v18.getInstanceTreeRoot(v18.props.Instance);
    v18.state = {
        Expansion = {
            [v18.instanceTreeRoot] = true
        }, 
        Selection = {}
    };
    v18.onSelectionChanged = function(v19)
        for v20, v21 in v18.state.Selection, nil, nil do
            if not (not v19[v20] or not v21) then
                v19[v20] = false;
            end;
        end;
        v18:setState({
            Selection = v19
        });
        if v18.props.OnSelectionChange then
            v18.props.OnSelectionChange(v19);
        end;
    end;
    v18.onExpansionChanged = function(v22)
        v18:setState({
            Expansion = v1.Dictionary.join(v18.state.Expansion, v22)
        });
    end;
end;
v6.render = function(v23)
    return v3.createElement(l_InstanceTreeView_0, {
        Size = UDim2.fromScale(1, 1), 
        LayoutOrder = v23.props.LayoutOrder, 
        Instances = {
            v23.instanceTreeRoot
        }, 
        Selection = v23.state.Selection, 
        Expansion = v23.state.Expansion, 
        OnSelectionChange = v23.onSelectionChanged, 
        OnExpansionChange = v23.onExpansionChanged, 
        Style = v23.props.Stylizer.CompactNoBorder
    });
end;
v6.didUpdate = function(v24, v25)
    if v25.Instance ~= v24.props.Instance then
        v24.instanceTreeRoot = v24.getInstanceTreeRoot(v24.props.Instance);
        v24:setState({
            Expansion = {
                [v24.instanceTreeRoot] = true
            }, 
            Selection = {}
        });
        return ;
    else
        if v25.Selection ~= v24.props.Selection then
            local v26 = {};
            for v27 in v24.props.Selection, nil, nil do
                local l_FirstChild_0 = v24.instanceTreeRoot:FindFirstChild(v27, true);
                if l_FirstChild_0 then
                    v26[l_FirstChild_0] = true;
                end;
            end;
            v24:setState({
                Selection = v26
            });
        end;
        return ;
    end;
end;
v6 = l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v6);
return v6;
