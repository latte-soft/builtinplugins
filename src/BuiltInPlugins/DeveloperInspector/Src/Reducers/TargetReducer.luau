local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Dash);
local l_None_0 = v2.None;
local l_join_0 = v2.join;
local l_joinDeep_0 = v2.joinDeep;
local l_collect_0 = v2.collect;
local l_values_0 = v2.values;
local l_sort_0 = table.sort;
local v9 = require(l_Parent_0.Src.Util.TabIds);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.SetTab);
local v12 = require(l_Actions_0.AddTargets);
local v13 = require(l_Actions_0.ClearTargets);
local v14 = require(l_Actions_0.CloseTarget);
local v15 = require(l_Actions_0.SelectTarget);
local v16 = require(l_Actions_0.ToggleTarget);
local function v18(v17)
    return v17.Id or v17.Name;
end;
local function v23(v19)
    local v20 = l_values_0(v19.Children);
    l_sort_0(v20, function(v21, v22)
        return v22.Name < v21.Name;
    end);
    return v20;
end;
local function _(v24, v25, v26)
    return {
        Name = v24, 
        ClassName = v25, 
        Children = v26 or {}, 
        GetChildren = v23, 
        GetDebugId = v18
    };
end;
local v28 = {
    {
        Id = v9.ELEMENTS, 
        Label = "Elements"
    }, 
    {
        Id = v9.PROFILE, 
        Label = "Profile"
    }
};
return v1.createReducer({
    tabs = v28, 
    selectedTab = v28[1], 
    targets = {}, 
    selectedTargetName = nil, 
    selectedTarget = nil, 
    expandedTargets = {}
}, {
    [v11.name] = function(v29, v30)
        return l_join_0(v29, {
            selectedTab = v30.tab
        });
    end, 
    [v13.name] = function(v31, _)
        return l_join_0(v31, {
            targets = {}, 
            expandedTargets = {}, 
            selectedTarget = l_None_0
        });
    end, 
    [v15.name] = function(v33, v34)
        return l_join_0(v33, {
            selectedTarget = v34.target
        });
    end, 
    [v14.name] = function(v35)
        return l_join_0(v35, {
            selectedTarget = l_None_0
        });
    end, 
    [v16.name] = function(v36, v37)
        return l_joinDeep_0(v36, {
            expandedTargets = v37.change
        });
    end, 
    [v12.name] = function(v38, v39)
        local v40 = ({
            Plugin = "Plugin", 
            CoreGui = "CoreGui", 
            Library = "Frame", 
            StandalonePlugin = "Plugin"
        })[v39.sourceKind] or "Frame";
        return (l_joinDeep_0(v38, {
            targets = l_collect_0(v39.targets, function(_, v42)
                local v43 = {
                    Name = v42.name, 
                    ClassName = v40, 
                    Children = {}, 
                    GetChildren = v23, 
                    GetDebugId = v18
                };
                local v44 = v42.name == "Roact tree" and "" or " - " .. v42.name;
                v43.Id = v42.id;
                v43.Name = v39.sourceName .. v44;
                v43.BridgeId = v39.fromBridgeId;
                return v42.id, v43;
            end)
        }));
    end
});
