local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
local v1 = require(l_Packages_0.Roact);
local v2 = require(l_Packages_0.Framework);
local l_Checkbox_0 = v2.UI.Checkbox;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_SimpleExpandablePane_0 = v2.UI.SimpleExpandablePane;
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v1.PureComponent:extend("AssetQualityFilter");
local v9 = l_LayoutOrderIterator_0.new();
local v10 = {
    "christmas", 
    "dia_de_muertos", 
    "diwali", 
    "easter", 
    "fourth_of_july", 
    "halloween", 
    "hanukkah", 
    "lunar_new_year", 
    "new_year", 
    "st_patricks_day", 
    "thanksgiving", 
    "valentines_day"
};
local v11 = {
    "anime", 
    "cartoony", 
    "realistic", 
    "stylized"
};
local v12 = {
    "pbr"
};
local v13 = {
    "ultra_high", 
    "high", 
    "medium", 
    "low", 
    "ultra_low"
};
local v14 = {
    "Animation", 
    "Decal", 
    "Humanoid", 
    "Motor", 
    "Motor6D", 
    "ParticleEmitter", 
    "PointLight", 
    "ProximityPrompt", 
    "Script", 
    "Seat", 
    "SpawnLocation", 
    "Spotlight", 
    "SurfaceLight", 
    "Tool", 
    "VehicleSeat"
};
v8.getControls = function(v15, v16, v17, v18, v19)
    local l_props_0 = v15.props;
    local v21 = {};
    for _, v23 in ipairs(v16) do
        local l_v23_0 = v23;
        if not (not v19 or not v18) then
            l_v23_0 = v19:getText("QualityFilterOptions", v18 .. "." .. v23);
        end;
        local v25 = v17 .. "." .. v23;
        table.insert(v21, (v1.createElement(l_Checkbox_0, {
            Checked = l_props_0.CheckedState[v25], 
            Key = v25, 
            LayoutOrder = v9:getNextOrder(), 
            OnClick = l_props_0.OnToggleFilter, 
            Text = l_v23_0
        })));
    end;
    return v21;
end;
v8.render = function(v26)
    local l_Localization_0 = v26.props.Localization;
    return {
        TriangleCount = v1.createElement(l_SimpleExpandablePane_0, {
            Expanded = true, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            LayoutOrder = v9:getNextOrder(), 
            Text = l_Localization_0:getText("QualityFilterOptions", "TriangleCount")
        }, v26:getControls(v13, "triangle", "Buckets", l_Localization_0)), 
        Contains = v1.createElement(l_SimpleExpandablePane_0, {
            Expanded = true, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            LayoutOrder = v9:getNextOrder(), 
            Text = l_Localization_0:getText("QualityFilterOptions", "Contains")
        }, v26:getControls(v14, "contains", nil, nil)), 
        VisualStyle = v1.createElement(l_SimpleExpandablePane_0, {
            Expanded = true, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            LayoutOrder = v9:getNextOrder(), 
            Text = l_Localization_0:getText("QualityFilterOptions", "VisualStyles")
        }, v26:getControls(v11, "visual_styles", "VisualStyles", l_Localization_0)), 
        Graphics = v1.createElement(l_SimpleExpandablePane_0, {
            Expanded = false, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            LayoutOrder = v9:getNextOrder(), 
            Text = l_Localization_0:getText("QualityFilterOptions", "Graphics")
        }, v26:getControls(v12, "graphics", "Graphics", l_Localization_0)), 
        Holidays = v1.createElement(l_SimpleExpandablePane_0, {
            Expanded = false, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            LayoutOrder = v9:getNextOrder(), 
            Text = l_Localization_0:getText("QualityFilterOptions", "Holidays")
        }, v26:getControls(v10, "holidays", "Holidays", l_Localization_0))
    };
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
