local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
local l_Parent_1 = script.Parent;
local v7 = require(l_Parent_1.LabeledElementPair);
local v8 = require(l_Parent_1.SingleSelectButtonGroup);
local v9 = v2.PureComponent:extend("ReplaceModeSelector");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Localization_0 = l_props_0.Localization;
    return v2.createElement(v7, {
        Size = UDim2.new(1, 0, 0, 22), 
        Text = l_Localization_0:getText("BrushSettings", "MaterialMode"), 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        v2.createElement(v8, {
            Size = UDim2.new(1, 0, 0, 22), 
            Selected = l_props_0.ReplaceMode, 
            Select = l_props_0.SetReplaceMode, 
            Options = {
                {
                    Text = if l_props_0.Tool == l_ToolId_0.Paint then l_Localization_0:getText("BrushSettings", "Paint") else l_Localization_0:getText("BrushSettings", "Fill"), 
                    Data = false
                }, 
                {
                    Text = l_Localization_0:getText("BrushSettings", "Replace"), 
                    Data = true
                }
            }
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v9));
