local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = require(l_Parent_1.Packages.Framework).Util.LayoutOrderIterator;
local v6 = require(l_Parent_0.Util.ConstantAvatar);
local v7 = require(l_Parent_0.Util.ConstantLayout);
local v8 = require(l_Parent_0.Util.StateModelTemplate);
local v9 = require(l_Parent_0.Util.StateInterfaceTemplates);
local v10 = require(l_Parent_0.Util.StateInterfaceTheme);
local v11 = require(l_Parent_0.Components.AssetInput);
local v12 = require(l_Parent_0.Components.DividerRow);
local v13 = require(l_Parent_0.Components.TitleBar);
local v14 = v2.Component:extend("ComponentAssetsPanel");
local v15 = nil;
local v16 = nil;
v14.init = function(v17)
    v17.frameRef = v2.createRef();
end;
v14.render = function(v18)
    local v19 = l_LayoutOrderIterator_0.new();
    local v21 = {
        UIListLayoutVertical = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v7.VirticalPadding, 
            [v2.Change.AbsoluteContentSize] = function(v20)
                v18.frameRef.current.Size = UDim2.new(1, 0, 0, v20.AbsoluteContentSize.y);
            end
        })
    };
    local l_Localization_0 = v18.props.Localization;
    v15(v18, v21, v19, l_Localization_0);
    v16(v18, v21, v19, l_Localization_0);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v10.getBackgroundColor(v18.props), 
        LayoutOrder = v18.props.LayoutOrder, 
        [v2.Ref] = v18.frameRef
    }, v21);
end;
v14 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v14);
local function v43(v23, v24, v25, v26)
    local v27 = v9.getStateModelTemplate(v23.props);
    local v28, v29 = v27:getAsset(v25);
    local v30 = v26:getNextOrder();
    local l_Localization_1 = v23.props.Localization;
    local l_createElement_0 = v2.createElement;
    local l_v11_0 = v11;
    local v34 = {
        InputBoxText = tostring(v28), 
        Title = v24, 
        LayoutOrder = v30, 
        PlayerChoice = v29, 
        IsEnabled = v23.props.IsEnabled
    };
    local v35 = not not v23.props.AssetOverrideErrors and v23.props.AssetOverrideErrors[v25] or nil;
    v34.ErrorMessage = v35 and l_Localization_1:getText("General", "Error" .. v35);
    v34.Mouse = v23.props.Mouse;
    v34.SetValue = function(v36)
        local v37, _ = string.gsub(v36, " ", "");
        local v39 = string.len(v37) > 0 and tonumber(v36) or 0;
        if v39 ~= v28 then
            local v40 = v8.makeCopy(v27);
            v40:setAsset(v25, v39, not (v39 ~= 0));
            v23.props.clobberTemplate(v23.props.template, v40);
        end;
    end;
    v34.SetPlayerChoiceValue = function(v41)
        local v42 = v8.makeCopy(v27);
        v42:setAsset(v25, nil, not v41);
        v23.props.clobberTemplate(v23.props.template, v42);
    end;
    return l_createElement_0(l_v11_0, v34);
end;
local function v51(v44, v45, v46, v47, v48)
    v45[v47 .. "Separator"] = v2.createElement(v12, {
        ThemeData = v44.props.ThemeData, 
        LayoutOrder = v46:getNextOrder()
    });
    v45[v47] = v2.createElement(v13, {
        ThemeData = v44.props.ThemeData, 
        LayoutOrder = v46:getNextOrder(), 
        IsEnabled = v44.props.IsEnabled, 
        Text = v47, 
        IsPlayerChoiceTitleStyle = true
    });
    for _, v50 in pairs(v48) do
        v45[v50[1]] = v43(v44, v50[1], v50[2], v46);
    end;
end;
v15 = function(v52, v53, v54, v55)
    v51(v52, v53, v54, v55:getText("General", "TitleBodyParts"), {
        {
            v55:getText("General", "PartFace"), 
            v6.AssetTypes.Face
        }, 
        {
            v55:getText("General", "PartHead"), 
            v6.AssetTypes.Head
        }, 
        {
            v55:getText("General", "PartTorso"), 
            v6.AssetTypes.Torso
        }, 
        {
            v55:getText("General", "PartLeftArm"), 
            v6.AssetTypes.LeftArm
        }, 
        {
            v55:getText("General", "PartRightArm"), 
            v6.AssetTypes.RightArm
        }, 
        {
            v55:getText("General", "PartLeftLeg"), 
            v6.AssetTypes.LeftLeg
        }, 
        {
            v55:getText("General", "PartRightLeg"), 
            v6.AssetTypes.RightLeg
        }
    });
end;
v16 = function(v56, v57, v58, v59)
    v51(v56, v57, v58, v59:getText("General", "TitleClothing"), {
        {
            v59:getText("General", "ClothingTShirt"), 
            v6.AssetTypes.ShirtGraphic
        }, 
        {
            v59:getText("General", "ClothingShirt"), 
            v6.AssetTypes.Shirt
        }, 
        {
            v59:getText("General", "ClothingPants"), 
            v6.AssetTypes.Pants
        }
    });
end;
return v14;
