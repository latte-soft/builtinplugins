local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_script_FirstAncestor_0.Packages.Roact);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TreeView_0 = v6.UI.TreeView;
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v11 = require(l_script_FirstAncestor_0.Src.Components.IK.IKTreeRow);
local v12 = v5.PureComponent:extend("IKTreeView");
v12.init = function(v13)
    local v14 = {};
    local v15 = v4.getMotors(v13.props.RootInstance);
    local v16 = if not v10() then nil else v4.getAnimationConstraints(v13.props.RootInstance);
    for _, v18 in ipairs(v15) do
        v14[v18.Part1.Name] = true;
    end;
    if v10() then
        for _, v20 in v16, nil, nil do
            v14[v20.Attachment1.Parent.Name] = true;
        end;
    end;
    v14[v4.findRootPart(v13.props.RootInstance).Name] = true;
    v13.state = {
        expandedItems = v14, 
        treeArray = {}
    };
    v13.getChildren = function(v21)
        local v22 = {};
        for _, v24 in ipairs(v15) do
            if v24.Part0.Name == v21 then
                table.insert(v22, v24.Part1.Name);
            end;
        end;
        if v10() then
            for _, v26 in v16, nil, nil do
                if v26.Attachment0.Parent.Name == v21 then
                    table.insert(v22, v26.Attachment1.Parent.Name);
                end;
            end;
        end;
        return v22;
    end;
    v13.onInputBegan = function(v27, v28)
        if v27.UserInputType == Enum.UserInputType.MouseButton1 then
            v13.props.SetSelectedTracks({
                {
                    v28
                }
            });
        end;
    end;
    v13.getVerticalLineHeight = function(v29, v30)
        local v31 = 1;
        local v32 = {};
        local v33 = v13.getChildren(v29);
        for v34, v35 in ipairs(v13.state.treeArray) do
            if v35 == v29 then
                v31 = v34;
            end;
            for _, v37 in ipairs(v33) do
                if not (not (v37 == v35) or v30 and not v13.props.Chain[v37]) then
                    table.insert(v32, {
                        index = v34, 
                        element = v37
                    });
                end;
            end;
        end;
        table.sort(v32, function(v38, v39)
            return v38.index < v39.index;
        end);
        local l_v31_0 = v31;
        if #v32 > 0 then
            l_v31_0 = v32[#v32].index;
        end;
        return (l_v31_0 - v31) * v2.TRACK_HEIGHT;
    end;
    v13.toggleExpanded = function(v41)
        v13:setState(function(v42)
            return {
                expandedItems = v1.Dictionary.join(v42.expandedItems, {
                    [v41] = not v42.expandedItems[v41]
                })
            };
        end);
    end;
    v13.contributeItem = function(v43, v44, v45)
        table.insert(v45, v43);
        if v13.state.expandedItems[v43] then
            for _, v47 in ipairs((v13.getChildren(v43))) do
                v13.contributeItem(v47, v44 + 1, v45);
            end;
        end;
        return v45;
    end;
    v13.calculateRows = function(v48)
        if v48 and v13.state.expandedItems == v48.expandedItems then
            return ;
        else
            local v49 = {};
            v13.contributeItem(v4.findRootPart(v13.props.RootInstance).Name, 0, v49);
            v13:setState({
                treeArray = v49
            });
            v13.props.OnTreeUpdated(v49);
            return ;
        end;
    end;
    v13.getRowProps = function(v50, v51, v52, v53)
        local l_props_0 = v13.props;
        local l_SelectedTrack_0 = l_props_0.SelectedTrack;
        local l_item_0 = v50.item;
        return {
            Chain = l_props_0.Chain, 
            Depth = v50.depth, 
            GetVerticalLineHeight = v13.getVerticalLineHeight, 
            IsExpanded = v13.state.expandedItems[l_item_0], 
            IsLeafNode = #v13.getChildren(l_item_0) == 0, 
            Item = l_item_0, 
            Key = v51, 
            OnInputBegan = v13.onInputBegan, 
            OnToggleExpanded = v13.toggleExpanded, 
            PinnedParts = l_props_0.PinnedParts, 
            Position = v52, 
            RootInstance = l_props_0.RootInstance, 
            IKMode = l_props_0.IKMode, 
            IsSelected = l_SelectedTrack_0 and l_SelectedTrack_0[1] == l_item_0, 
            Size = v53, 
            TogglePinnedPart = l_props_0.TogglePinnedPart
        };
    end;
end;
v12.didMount = function(v57)
    v57.calculateRows();
end;
v12.didUpdate = function(v58, _, v60)
    v58.calculateRows(v60);
end;
v12.render = function(v61)
    local l_props_1 = v61.props;
    local l_Position_0 = l_props_1.Position;
    local l_Size_0 = l_props_1.Size;
    local v65 = v4.findRootPart(l_props_1.RootInstance);
    local v66 = {};
    table.insert(v66, v65.Name);
    return v5.createElement("Frame", {
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1
    }, {
        TreeView = v5.createElement(l_TreeView_0, {
            RootItems = v66, 
            GetChildren = v61.getChildren, 
            Expansion = v61.state.expandedItems, 
            RowComponent = v11, 
            RowHeight = v2.TRACK_HEIGHT, 
            GetRowProps = v61.getRowProps, 
            Style = "BorderBox"
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v12));
