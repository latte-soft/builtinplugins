local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.RoactRodux);
local l_RoactStudioWidgets_0 = l_Parent_1.Packages.RoactStudioWidgets;
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Util.ConstantAvatar);
local v8 = require(l_Parent_0.Util.StateModelTemplate);
local v9 = require(l_RoactStudioWidgets_0.ButtonBar);
local v10 = v2.Component:extend("ComponentPresetsPanel");
v10.init = function(v11)
    v11.createDefaultModel = function(v12)
        local v13 = v8.new(v12);
        v13:setScaleHeightMin(1, v12);
        v13:setScaleHeightMax(1, v12);
        v13:setScaleWidthMin(1, v12);
        v13:setScaleWidthMax(1, v12);
        v13:setScaleHeadMin(1, v12);
        v13:setScaleHeadMax(1, v12);
        v13:setScaleBodyTypeMin(0, v12);
        v13:setScaleBodyTypeMax(0, v12);
        v13:setScaleProportionMin(0, v12);
        v13:setScaleProportionMax(0, v12);
        v13:setRigTypeR15();
        return v13;
    end;
    v11.createClassicModel1 = function(v14)
        local v15 = v8.new(v14);
        v15:setScaleHeightMin(1, v14);
        v15:setScaleHeightMax(1, v14);
        v15:setScaleWidthMin(1, v14);
        v15:setScaleWidthMax(1, v14);
        v15:setScaleHeadMin(1, v14);
        v15:setScaleHeadMax(1, v14);
        v15:setScaleBodyTypeMin(0, v14);
        v15:setScaleBodyTypeMax(0, v14);
        v15:setScaleProportionMin(0, v14);
        v15:setScaleProportionMax(0, v14);
        v15:setRigTypeR15();
        return v15;
    end;
    v11.createClassicModel2 = function(v16)
        local v17 = v8.new(v16);
        v17:setScaleHeightMin(1, v16);
        v17:setScaleHeightMax(1, v16);
        v17:setScaleWidthMin(1, v16);
        v17:setScaleWidthMax(1, v16);
        v17:setScaleHeadMin(1, v16);
        v17:setScaleHeadMax(1, v16);
        v17:setScaleBodyTypeMin(0, v16);
        v17:setScaleBodyTypeMax(0, v16);
        v17:setScaleProportionMin(0, v16);
        v17:setScaleProportionMax(0, v16);
        v17:setRigTypeR15();
        v17:setAsset(v7.AssetTypes.Head, 2432102561, false);
        return v17;
    end;
    v11.createRthroModel = function(v18)
        local v19 = v8.new(v18);
        v19:setScaleHeightMin(1, v18);
        v19:setScaleHeightMax(1, v18);
        v19:setScaleWidthMin(1, v18);
        v19:setScaleWidthMax(1, v18);
        v19:setScaleHeadMin(1, v18);
        v19:setScaleHeadMax(1, v18);
        v19:setScaleBodyTypeMin(1, v18);
        v19:setScaleBodyTypeMax(1, v18);
        v19:setScaleProportionMin(0, v18);
        v19:setScaleProportionMax(0, v18);
        v19:setRigTypeR15();
        return v19;
    end;
    v11.createPlayerChoiceModel = function(v20)
        return v8.new(v20);
    end;
end;
v10.render = function(v21)
    local l_props_0 = v21.props;
    local l_Localization_0 = l_props_0.Localization;
    local v24 = l_props_0.Mouse:get();
    local l_IsEnabled_0 = l_props_0.IsEnabled;
    return v2.createElement(v9, {
        Padding = 10, 
        Buttons = {
            {
                Name = l_Localization_0:getText("General", "PresetDefault"), 
                Enabled = l_IsEnabled_0, 
                Value = v21.createDefaultModel, 
                ShowPressed = true, 
                Mouse = v24
            }, 
            {
                Name = l_Localization_0:getText("General", "PresetClassicScale"), 
                Enabled = l_IsEnabled_0, 
                Value = v21.createClassicModel1, 
                ShowPressed = true, 
                Mouse = v24
            }, 
            {
                Name = l_Localization_0:getText("General", "PresetFullClassic"), 
                Enabled = l_IsEnabled_0, 
                Value = v21.createClassicModel2, 
                ShowPressed = true, 
                Mouse = v24
            }, 
            {
                Name = l_Localization_0:getText("General", "PresetRthro"), 
                Enabled = l_IsEnabled_0, 
                Value = v21.createRthroModel, 
                ShowPressed = true, 
                Mouse = v24
            }, 
            {
                Name = l_Localization_0:getText("General", "PresetPlayerChoice"), 
                Enabled = l_IsEnabled_0, 
                Value = v21.createPlayerChoiceModel, 
                ShowPressed = true, 
                Mouse = v24
            }
        }, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Title = l_Localization_0:getText("General", "TitlePresets"), 
        ButtonClicked = function(v26)
            v21.props.clobberTemplate(v21.props.template, v26(v21.props.boundaries));
        end, 
        ShowPressed = true, 
        LayoutOrder = v21.props.LayoutOrder
    });
end;
return (v3.UNSTABLE_connect2(function(v27, _)
    return {
        boundaries = v27.MorpherEditorRoot.StateMorpher.StateSettings.scaleBoundaries.boundaries
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v10))));
