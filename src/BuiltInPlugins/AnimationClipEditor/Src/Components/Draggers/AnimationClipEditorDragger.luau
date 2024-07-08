local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v4 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
local v5 = require(l_DraggerFramework_0.Handles.MoveHandles);
local v6 = require(l_DraggerFramework_0.Handles.RotateHandles);
local _ = require(l_DraggerFramework_0.Handles.ExtrudeHandles);
local v8 = require(l_script_FirstAncestor_0.Src.Util.DraggerSchema.DraggerSchema);
local v9 = v1.PureComponent:extend("AnimationClipEditorDragger");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Mouse_0 = l_props_0.Mouse;
    local l_Tool_0 = l_props_0.Tool;
    local l_Context_0 = l_props_0.Context;
    local function v18(v15, v16, v17)
        return v15:moveToWithIk(v16, v17);
    end;
    local function v22(v19, v20, v21)
        return v19:rotateToWithIk(v20, v21);
    end;
    local v23 = {};
    if l_Tool_0 == Enum.RibbonTool.Move then
        table.insert(v23, v5.new(l_Context_0, nil, v8.TransformHandlesImplementation.new(l_Context_0, v18, Enum.RibbonTool.Move)));
    elseif l_Tool_0 == Enum.RibbonTool.Rotate then
        table.insert(v23, v6.new(l_Context_0, nil, v8.TransformHandlesImplementation.new(l_Context_0, v22, Enum.RibbonTool.Rotate)));
    end;
    return v1.createElement(v4, {
        Mouse = l_Mouse_0, 
        DraggerContext = l_Context_0, 
        DraggerSchema = v8, 
        DraggerSettings = {
            AnalyticsName = "AnimationClipEditor" .. l_Tool_0.Name, 
            AllowDragSelect = false, 
            AllowFreeformDrag = false, 
            ShowLocalSpaceIndicator = true, 
            HandlesList = v23
        }
    });
end;
return v9;
