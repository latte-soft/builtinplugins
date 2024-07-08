local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.RoactRodux);
local l_RoactStudioWidgets_0 = l_Parent_1.Packages.RoactStudioWidgets;
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = require(l_Parent_1.Packages.Framework).Util.LayoutOrderIterator;
local v8 = require(l_Parent_0.Util.ConstantLayout);
local v9 = require(l_Parent_0.Util.StateInterfaceSettings);
local v10 = require(l_Parent_0.Util.StateInterfaceTemplates);
local v11 = require(l_Parent_0.Util.StateInterfaceTheme);
local v12 = require(l_Parent_0.Util.StateModelTemplate);
local v13 = require(l_Parent_0.Components.DividerRow);
local v14 = require(l_RoactStudioWidgets_0.RangeSlider);
local v15 = require(l_Parent_0.Components.TitleBar);
local v16 = v2.Component:extend("ComponentScalePanel");
local function v48(v17, v18, v19, v20, v21, v22, v23, v24)
    local v25 = v10.getStateModelTemplate(v17.props);
    local l_boundaries_0 = v17.props.StateSettings.scaleBoundaries.boundaries;
    local function _(v27)
        local v28 = v27 * 100;
        return not not (v28 - math.floor(v28) >= 0.5) and math.ceil(v28) or math.floor(v28);
    end;
    local function v33(v30)
        v30 = v30 / 100;
        if v20.increment > 0.001 then
            local v31 = math.max(v20.increment * math.floor(v30 / v20.increment), v20.min);
            local v32 = math.min(v31 + v20.increment, v20.max);
            return math.abs(v31 - v30) < math.abs(v32 - v30) and v31 or v32;
        else
            return (math.min(v20.max, (math.max(v20.min, v30))));
        end;
    end;
    local v34 = v20.min * 100;
    local v35 = not not (v34 - math.floor(v34) >= 0.5) and math.ceil(v34) or math.floor(v34);
    local v36 = v20.max * 100;
    local v37 = not not (v36 - math.floor(v36) >= 0.5) and math.ceil(v36) or math.floor(v36);
    v34 = v17.props;
    v36 = v34.Localization;
    local l_Mouse_0 = v34.Mouse;
    local l_createElement_0 = v2.createElement;
    local l_v14_0 = v14;
    local v41 = {
        LayoutOrder = v18, 
        Title = v19, 
        Enabled = v17.props.IsEnabled, 
        Min = v35, 
        Max = v37
    };
    local v42 = v20.increment * 100;
    v41.SnapIncrement = not not (v42 - math.floor(v42) >= 0.5) and math.ceil(v42) or math.floor(v42);
    v42 = v21(v25) * 100;
    v41.LowerRangeValue = not not (v42 - math.floor(v42) >= 0.5) and math.ceil(v42) or math.floor(v42);
    v42 = v22(v25) * 100;
    v41.UpperRangeValue = not not (v42 - math.floor(v42) >= 0.5) and math.ceil(v42) or math.floor(v42);
    v41.Mouse = l_Mouse_0:get();
    v41.MinLabelText = v36:getText("General", "ScaleSliderLabel", {
        number = tostring(v35)
    });
    v41.MaxLabelText = v36:getText("General", "ScaleSliderLabel", {
        number = tostring(v37)
    });
    v41.UnitsLabelText = v36:getText("General", "ScaleSliderUnits");
    v41.SetValues = function(v43, v44)
        local v45 = v12.makeCopy(v25);
        v23(v45, math.min(v22(v25), (v33(v43))), l_boundaries_0);
        v24(v45, math.max(v21(v25), (v33(v44))), l_boundaries_0);
        v17.props.clobberTemplate(v17.props.template, v45);
    end;
    v41.SetUpperRangeValue = function(v46)
        local v47 = v12.makeCopy(v10.getStateModelTemplate(v17.props));
        v24(v47, math.max(v21(v47), (v33(v46))), l_boundaries_0);
        v17.props.clobberTemplate(v17.props.template, v47);
    end;
    return l_createElement_0(l_v14_0, v41);
end;
v16.init = function(v49)
    v49.frameRef = v2.createRef();
end;
v16.render = function(v50)
    local l_Localization_0 = v50.props.Localization;
    if not v10.getStateModelTemplate(v50.props):isRigTypeR6() then
        local v52 = l_LayoutOrderIterator_0.new();
        local v54 = {
            UIListLayoutVertical = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = v8.VirticalPadding, 
                [v2.Change.AbsoluteContentSize] = function(v53)
                    v50.frameRef.current.Size = UDim2.new(1, 0, 0, v53.AbsoluteContentSize.y);
                end
            }), 
            ComponentDividerRowAboveScale = v2.createElement(v13, {
                ThemeData = v50.props.ThemeData, 
                LayoutOrder = v52:getNextOrder()
            }), 
            ComponentTitleBar = v2.createElement(v15, {
                ThemeData = v50.props.ThemeData, 
                LayoutOrder = v52:getNextOrder(), 
                IsEnabled = v50.props.IsEnabled, 
                Text = l_Localization_0:getText("General", "TitleScale"), 
                IsPlayerChoiceTitleStyle = false
            })
        };
        local l_v12_0 = v12;
        for _, v57 in ipairs({
            {
                l_Localization_0:getText("General", "ScaleHeight"), 
                v9.getHeightBoundaries(v50.props), 
                l_v12_0.getScaleHeightMin, 
                l_v12_0.getScaleHeightMax, 
                l_v12_0.setScaleHeightMin, 
                l_v12_0.setScaleHeightMax
            }, 
            {
                l_Localization_0:getText("General", "ScaleWidth"), 
                v9.getWidthBoundaries(v50.props), 
                l_v12_0.getScaleWidthMin, 
                l_v12_0.getScaleWidthMax, 
                l_v12_0.setScaleWidthMin, 
                l_v12_0.setScaleWidthMax
            }, 
            {
                l_Localization_0:getText("General", "ScaleHead"), 
                v9.getHeadBoundaries(v50.props), 
                l_v12_0.getScaleHeadMin, 
                l_v12_0.getScaleHeadMax, 
                l_v12_0.setScaleHeadMin, 
                l_v12_0.setScaleHeadMax
            }, 
            {
                l_Localization_0:getText("General", "ScaleBodyType"), 
                v9.getBodyTypeBoundaries(v50.props), 
                l_v12_0.getScaleBodyTypeMin, 
                l_v12_0.getScaleBodyTypeMax, 
                l_v12_0.setScaleBodyTypeMin, 
                l_v12_0.setScaleBodyTypeMax
            }, 
            {
                l_Localization_0:getText("General", "ScaleProportions"), 
                v9.getProportionBoundaries(v50.props), 
                l_v12_0.getScaleProportionMin, 
                l_v12_0.getScaleProportionMax, 
                l_v12_0.setScaleProportionMin, 
                l_v12_0.setScaleProportionMax
            }
        }) do
            v54[v57[1]] = v48(v50, v52:getNextOrder(), v57[1], v57[2], v57[3], v57[4], v57[5], v57[6]);
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v11.getBackgroundColor(v50.props), 
            LayoutOrder = v50.props.LayoutOrder, 
            [v2.Ref] = v50.frameRef
        }, v54);
    else
        return nil;
    end;
end;
return (v3.UNSTABLE_connect2(function(v58, _)
    return {
        StateSettings = v58.MorpherEditorRoot.StateMorpher.StateSettings
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v16))));
