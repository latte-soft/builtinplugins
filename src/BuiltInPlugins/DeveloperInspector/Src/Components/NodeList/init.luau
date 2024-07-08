local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Util.InspectorContext);
local l_RoactInspectorApi_0 = v1.DeveloperTools.RoactInspectorApi;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v11 = require(l_Parent_0.Packages.Dash);
local l_collect_0 = v11.collect;
local l_find_0 = v11.find;
local l_shallowEqual_0 = v11.shallowEqual;
local v15 = require(script.NodeListRow);
local v16 = require(l_Parent_0.Src.Util.traceSource);
local v17 = require(l_Parent_0.Src.Actions.RoactInspector.SelectNode);
local v18 = v2.PureComponent:extend("NodeList");
v18.init = function(v19)
    v19.onSelectNode = function(v20)
        v19.props.selectNode(v20);
        local v21 = v19.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v21) then
            v21:getFields(v19.props.SelectedPath, v20, {
                "props"
            });
            v21:getFields(v19.props.SelectedPath, v20, {
                "state"
            });
            v21:getFields(v19.props.SelectedPath, v20, {
                "_context"
            });
        end;
    end;
end;
v18.getFlash = function(v22)
    local v25 = l_find_0(v22.props.Flash, function(_, v24)
        return l_shallowEqual_0(v24, v22.props.SelectedPath);
    end);
    if v25 and os.clock() - v25.time < 1 then
        return v25;
    else
        return nil;
    end;
end;
v18.onSelectLink = function(v26, v27)
    local v28 = v26.props.Plugin:get();
    local v29, v30 = v16(v27);
    if v29 then
        v28:OpenScript(v29, v30);
    end;
end;
v18.render = function(v31)
    local l_props_0 = v31.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v34 = v31:getFlash();
    return v2.createElement(l_Pane_0, {
        Padding = l_Stylizer_0.Padding, 
        Size = l_props_0.Size, 
        Style = "BorderBox"
    }, {
        ScrollingFrame = v2.createElement(l_ScrollingFrame_0, {
            Size = UDim2.fromScale(1, 1), 
            Style = l_Stylizer_0.ScrollingFrame, 
            AutoSizeCanvas = true, 
            AutoSizeLayoutOptions = {
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }, (l_collect_0(l_props_0.Nodes, function(v35, v36)
            return "Item " .. v35, v2.createElement(v15, {
                Index = v35, 
                Icon = v36.Icon, 
                Name = v36.Name, 
                Flash = not not (v34 and v34.indexSet[v35]) and v34 or nil, 
                LinkText = v36.Link, 
                IsSelected = v35 == l_props_0.SelectedIndex, 
                OnSelect = v31.onSelectNode, 
                OnClickLink = function()
                    v31:onSelectLink(v36.Source);
                end, 
                Style = l_Stylizer_0
            });
        end)))
    });
end;
return v3.connect(function(v37, _)
    return {
        Flash = v37.RoactInspector.flashInstances, 
        Nodes = v37.RoactInspector.nodes, 
        SelectedPath = v37.RoactInspector.selectedPath, 
        SelectedIndex = v37.RoactInspector.selectedNodeIndex
    };
end, function(v39)
    return {
        selectNode = function(v40)
            v39(v17(v40));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Plugin = l_ContextServices_0.Plugin, 
    Inspector = v6
})(v18)));
