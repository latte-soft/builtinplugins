local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_join_0 = v4.Dash.join;
local l_deepEqual_0 = v4.Util.deepEqual;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_TreeView_0 = v4.UI.TreeView;
local v12 = require(l_Parent_0.Src.Actions.SetPath);
local v13 = require(l_Parent_0.Src.Util.getCategories);
local v14 = require(l_Parent_0.Src.Controllers.MaterialServiceController);
local v15 = v2.PureComponent:extend("SideBar");
v15.updateSelection = function(v16)
    local l_props_0 = v16.props;
    if #l_props_0.Path ~= 0 and v16.state.lastPath ~= l_props_0.Path then
        local v18 = {};
        local function v19(v20, v21, v22)
            table.insert(v18, v21);
            for _, v24 in pairs(v20) do
                if not v24.path or not l_deepEqual_0(v24.path, v22) then
                    if v24.children and next(v16.currentCategory) == nil then
                        v19(v24.children, v24, v22);
                    end;
                else
                    v16.currentCategory = v24;
                end;
            end;
            if next(v16.currentCategory) == nil then
                table.remove(v18, #v18);
            end;
        end;
        v19(v16.categories, {}, l_props_0.Path);
        if not ((not next(v18) or not v16.currentCategory.path) or l_deepEqual_0(v16.categories, v18)) then
            local v25 = {};
            local v26 = {};
            for _, v28 in ipairs(v18) do
                v26[v28] = true;
            end;
            v25[v16.currentCategory] = true;
            if not l_deepEqual_0(v16.state.Selection, v25) then
                v16:setState(function(v29)
                    return {
                        Expansion = l_join_0(v29.Expansion, v26), 
                        Selection = v25
                    };
                end);
            end;
        end;
        v16.currentCategory = {};
        v16:setState({
            lastPath = l_props_0.Path
        });
    end;
end;
v15.init = function(v30)
    v30.currentCategory = {};
    v30.onExpansionChange = function(v31)
        v30:setState(function(v32)
            return {
                Expansion = l_join_0(v32.Expansion, v31)
            };
        end);
    end;
    v30.onSelectionChange = function(v33)
        local l_props_1 = v30.props;
        for v35, _ in pairs(v33) do
            l_props_1.MaterialServiceController:setPath(v35.path);
        end;
        l_props_1.Analytics:report("clickOnCategoriesOpen");
        v30:setState({
            Selection = v33
        });
    end;
    v30.state = {
        Expansion = {}, 
        Selection = {}, 
        lastPath = {}
    };
end;
v15.didMount = function(v37)
    local l_props_2 = v37.props;
    local l_Localization_1 = l_props_2.Localization;
    local v40 = l_props_2.MaterialServiceController:getRootCategory();
    if not v37.categories then
        v37.categories = v13(v40, l_Localization_1);
        local v41 = v37.categories[1];
        v37:setState({
            Expansion = {
                [v41] = true
            }, 
            Selection = {
                [v41] = true
            }
        });
    end;
    v37:updateSelection();
end;
v15.didUpdate = function(v42)
    v42:updateSelection();
end;
v15.render = function(v43)
    local l_props_3 = v43.props;
    local l_state_0 = v43.state;
    return v2.createElement(l_TreeView_0, {
        Size = l_props_3.Size, 
        ZIndex = l_props_3.ZIndex, 
        Expansion = l_state_0.Expansion, 
        Selection = l_state_0.Selection, 
        RootItems = v43.categories or {}, 
        OnExpansionChange = v43.onExpansionChange, 
        OnSelectionChange = v43.onSelectionChange
    });
end;
return v3.connect(function(v46, _)
    return {
        Path = v46.MaterialBrowserReducer.Path
    };
end, function(v48)
    return {
        dispatchSetPath = function(v49)
            v48(v12(v49));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    MaterialServiceController = v14
})(v15)));
