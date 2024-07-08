local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_ToolParts_0 = l_Parent_0.Src.Components.Tools.ToolParts;
local v7 = require(l_ToolParts_0.ButtonGroup);
local v8 = require(l_ToolParts_0.EditSettings);
local v9 = require(l_ToolParts_0.MaterialSettings);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.ApplyToolAction);
local v12 = require(l_Actions_0.SetMaterial);
local v13 = require(l_Actions_0.SetMergeEmpty);
local v14 = require(l_Parent_0.Src.Util.TerrainEnums);
local v15 = require(l_Parent_0.Src.Components.Functions.TerrainRegionEditor);
local v16 = v2.PureComponent:extend(script.Name);
v16.init = function(v17)
    v17.onFillClicked = function()
        if v17.props.material then
            v15.OnButtonClick();
        end;
    end;
    v17.updateProperties = function()
        v15.ChangeProperties({
            material = v17.props.material, 
            mergeEmpty = v17.props.mergeEmpty
        });
    end;
end;
v16.didUpdate = function(v18)
    v18.updateProperties();
end;
v16.didMount = function(v19)
    v19.updateProperties();
end;
v16.render = function(v20)
    return v2.createFragment({
        EditSettings = v2.createElement(v8, {
            LayoutOrder = 1, 
            mergeEmpty = v20.props.mergeEmpty, 
            setMergeEmpty = v20.props.dispatchSetMergeEmpty
        }), 
        MaterialSettings = v2.createElement(v9, {
            LayoutOrder = 2, 
            material = v20.props.material, 
            setMaterial = v20.props.dispatchSetMaterial
        }), 
        FillButtonFrame = v2.createElement(v7, {
            LayoutOrder = 3, 
            Buttons = {
                {
                    Key = "Fill", 
                    Name = v20.props.Localization:getText("ToolName", "Fill"), 
                    Active = true, 
                    OnClicked = v20.onFillClicked
                }
            }
        })
    });
end;
return v3.connect(function(v21, _)
    return {
        toolName = v14.ToolId.Fill, 
        material = v21.FillTool.material, 
        mergeEmpty = v21.FillTool.mergeEmpty
    };
end, function(v23)
    local function _(v24)
        v23(v11("FillTool", v24));
    end;
    return {
        dispatchSetMaterial = function(v26)
            v23(v11("FillTool", (v12(v26))));
        end, 
        dispatchSetMergeEmpty = function(v27)
            v23(v11("FillTool", (v13(v27))));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v16)));
