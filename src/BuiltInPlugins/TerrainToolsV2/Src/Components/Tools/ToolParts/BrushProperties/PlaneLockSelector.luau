local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_PlaneLockType_0 = require(l_Parent_0.Src.Util.TerrainEnums).PlaneLockType;
local l_Parent_1 = script.Parent.Parent;
local v7 = require(l_Parent_1.LabeledElementPair);
local v8 = require(l_Parent_1.SingleSelectButtonGroup);
local v9 = v2.PureComponent:extend("PlaneLockSelector");
local v10 = game:DefineFastFlag("TerrainEditorFixDETruncations", false);
v9.render = function(v11)
    local l_Localization_0 = v11.props.Localization;
    return v2.createElement(v7, {
        Size = UDim2.new(1, 0, 0, 22), 
        Text = l_Localization_0:getText("BrushSettings", "PlaneLock"), 
        LayoutOrder = v11.props.LayoutOrder
    }, {
        v2.createElement(v8, {
            Size = if not v10 then UDim2.new(0, 141, 0, 22) else UDim2.new(0, 150, 0, 22), 
            Selected = v11.props.planeLock, 
            Select = v11.props.setPlaneLock, 
            Options = {
                {
                    Text = l_Localization_0:getText("BrushSettings", "Off"), 
                    Data = l_PlaneLockType_0.Off
                }, 
                {
                    Text = l_Localization_0:getText("BrushSettings", "Auto"), 
                    Data = l_PlaneLockType_0.Auto
                }, 
                {
                    Text = l_Localization_0:getText("BrushSettings", "Manual"), 
                    Data = l_PlaneLockType_0.Manual
                }
            }
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v9));
