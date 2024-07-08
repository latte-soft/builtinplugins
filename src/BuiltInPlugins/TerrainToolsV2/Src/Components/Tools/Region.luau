local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Src.Components.Tools.ToolParts.EditSettings);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.ApplyToolAction);
local v6 = require(l_Actions_0.SetMergeEmpty);
local v7 = require(l_Parent_0.Src.Components.Functions.TerrainRegionEditor);
local v8 = v1.PureComponent:extend(script.Name);
v8.init = function(v9)
    v9.updateProperties = function()
        v7.ChangeProperties({
            mergeEmpty = v9.props.mergeEmpty
        });
    end;
end;
v8.didUpdate = function(v10)
    v10.updateProperties();
end;
v8.didMount = function(v11)
    v11.updateProperties();
end;
v8.render = function(v12)
    return v1.createElement(v3, {
        LayoutOrder = 1, 
        mergeEmpty = v12.props.mergeEmpty, 
        setMergeEmpty = v12.props.dispatchSetMergeEmpty
    });
end;
return v2.connect(function(v13, _)
    return {
        toolName = v13.Tools.currentTool, 
        mergeEmpty = v13.RegionTool.mergeEmpty
    };
end, function(v15)
    local function _(v16)
        v15(v5("RegionTool", v16));
    end;
    return {
        dispatchSetMergeEmpty = function(v18)
            v15(v5("RegionTool", (v6(v18))));
        end
    };
end)(v8);
