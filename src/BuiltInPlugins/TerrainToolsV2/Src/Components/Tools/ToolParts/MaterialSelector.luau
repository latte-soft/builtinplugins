local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local l_Tooltip_0 = v1.UI.Tooltip;
local l_MaterialService_0 = game:GetService("MaterialService");
local l_TextService_0 = game:GetService("TextService");
local v9 = require(l_Parent_0.Src.Util.MaterialDetails);
local v10 = nil;
v10 = {
    Enum.Material.Asphalt, 
    Enum.Material.Basalt, 
    Enum.Material.Brick, 
    Enum.Material.Cobblestone, 
    Enum.Material.Concrete, 
    Enum.Material.CrackedLava, 
    Enum.Material.Glacier, 
    Enum.Material.Grass, 
    Enum.Material.Ground, 
    Enum.Material.Ice, 
    Enum.Material.LeafyGrass, 
    Enum.Material.Limestone, 
    Enum.Material.Mud, 
    Enum.Material.Pavement, 
    Enum.Material.Rock, 
    Enum.Material.Salt, 
    Enum.Material.Sand, 
    Enum.Material.Sandstone, 
    Enum.Material.Slate, 
    Enum.Material.Snow, 
    Enum.Material.Water, 
    Enum.Material.WoodPlanks
};
local v11 = v2.PureComponent:extend(script.Name);
local v12 = v2.PureComponent:extend("MaterialTooltip");
local v13 = v2.PureComponent:extend("MaterialButton");
v12.init = function(v14)
    v14.ref = v2.createRef();
end;
v12.didMount = function(v15)
    if v15.ref.current then
        local l_current_0 = v15.ref.current;
        local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
        local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
        local l_AbsolutePosition_1 = l_current_0.Parent.Parent.AbsolutePosition;
        local l_AbsoluteSize_1 = l_current_0.Parent.Parent.AbsoluteSize;
        local v21 = nil;
        if l_AbsolutePosition_0.x < l_AbsolutePosition_1.x then
            v21 = l_AbsolutePosition_1.x - l_AbsolutePosition_0.x;
        elseif l_AbsolutePosition_1.x + l_AbsoluteSize_1.x < l_AbsolutePosition_0.x + l_AbsoluteSize_0.x then
            v21 = ((l_AbsolutePosition_1.x + l_AbsoluteSize_1.x) - (l_AbsolutePosition_0.x + l_AbsoluteSize_0.x)) - 1;
        end;
        if v21 then
            local l_Position_0 = l_current_0.Position;
            l_current_0.Position = UDim2.new(l_Position_0.X.Scale, v21, l_Position_0.Y.Scale, l_Position_0.Y.Offset);
        end;
    end;
end;
v12.render = function(v23)
    local v24 = v23.props.Theme:get();
    local l_MaterialName_0 = v23.props.MaterialName;
    return v2.createElement("TextLabel", {
        BackgroundTransparency = 0, 
        BackgroundColor3 = v24.backgroundColor, 
        Size = UDim2.new(0, l_TextService_0:GetTextSize(l_MaterialName_0, v24.textSize, 0, Vector2.new()).x + v24.padding * 1.5, 0, v24.textSize * 1.3), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, -v24.textSize + 3.5), 
        Text = l_MaterialName_0, 
        TextSize = v24.textSize, 
        TextColor3 = v24.textColor, 
        Font = v24.font, 
        [v2.Ref] = v23.ref
    });
end;
v12 = l_withContext_0({
    Theme = v5.DEPRECATED_Theme
})(v12);
v13.init = function(v26, _)
    v26.onMouseEnter = function()
        v26.props.OnMouseEnter(v26.props.Material);
    end;
    v26.onMouseLeave = function()
        v26.props.OnMouseLeave(v26.props.Material);
    end;
    v26.selectMaterial = function()
        v26.props.SelectMaterial(v26.props.Material);
    end;
end;
v13.render = function(v28)
    local l_props_0 = v28.props;
    local v30 = l_props_0.Theme:get();
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Material_0 = l_props_0.Material;
    local l_IsSelected_0 = l_props_0.IsSelected;
    local l_IsHovered_0 = l_props_0.IsHovered;
    local v36 = nil;
    v36 = if not l_props_0.Use2022Materials then v9[l_Material_0].image else v9[l_Material_0].image_2022;
    local v37 = nil;
    if l_IsHovered_0 then
        v37 = l_Localization_0:getText("Materials", l_Material_0.Name);
    end;
    return v2.createElement("ImageButton", {
        LayoutOrder = l_LayoutOrder_0, 
        Image = "rbxasset://textures/TerrainTools/" .. v36, 
        BackgroundColor3 = v30.backgroundColor, 
        BorderSizePixel = not l_IsSelected_0 and 0 or 2, 
        BorderColor3 = not not l_IsSelected_0 and v30.selectionBorderColor or v30.borderColor, 
        ZIndex = not l_IsHovered_0 and 1 or 2, 
        [v2.Event.MouseEnter] = v28.onMouseEnter, 
        [v2.Event.MouseLeave] = v28.onMouseLeave, 
        [v2.Event.Activated] = v28.selectMaterial
    }, {
        Tooltip = l_IsHovered_0 and v2.createElement(v12, {
            MaterialName = v37
        })
    });
end;
v13 = l_withContext_0({
    Theme = v5.DEPRECATED_Theme, 
    Localization = l_ContextServices_0.Localization
})(v13);
v11.init = function(v38, _)
    v38.state = {
        hoverMaterial = nil
    };
    v38.onMouseEnterMaterial = function(v40)
        v38:setState({
            hoverMaterial = v40
        });
    end;
    v38.onMouseLeaveMaterial = function(_)
        v38:setState({
            hoverMaterial = v2.None
        });
    end;
    v38.selectMaterial = function(v42)
        v38.props.setMaterial(v42);
    end;
end;
v11.didMount = function(v43)
    v43.connection = l_MaterialService_0:GetPropertyChangedSignal("Use2022Materials"):Connect(function()
        v43:setState({});
    end);
end;
v11.willUnmount = function(v44)
    v44.connection:Disconnect();
end;
v11.render = function(v45)
    local v46 = v45.props.Theme:get();
    local l_Localization_1 = v45.props.Localization;
    local v48 = v45.props.LayoutOrder or 1;
    local l_material_0 = v45.props.material;
    local l_Tooltip_1 = v45.props.Tooltip;
    local l_AllowAir_0 = v45.props.AllowAir;
    local v52 = {
        UIGridLayout = v2.createElement("UIGridLayout", {
            CellSize = UDim2.new(0, 32, 0, 32), 
            CellPadding = UDim2.new(0, 9, 0, 9), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        LayoutPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 9), 
            PaddingBottom = UDim.new(0, 9), 
            PaddingLeft = UDim.new(0, 9), 
            PaddingRight = UDim.new(0, 9)
        })
    };
    local function v55(v53, v54)
        v52[v54.Name] = v2.createElement(v13, {
            LayoutOrder = v53, 
            Material = v54, 
            IsHovered = v54 == v45.state.hoverMaterial, 
            IsSelected = l_material_0 == v54, 
            OnMouseEnter = v45.onMouseEnterMaterial, 
            OnMouseLeave = v45.onMouseLeaveMaterial, 
            SelectMaterial = v45.selectMaterial, 
            Use2022Materials = l_MaterialService_0.Use2022Materials
        });
    end;
    for v56, v57 in ipairs(v10) do
        v55(v56, v57);
    end;
    if l_AllowAir_0 then
        v55(#v10 + 1, Enum.Material.Air);
    end;
    return v2.createElement("Frame", {
        LayoutOrder = v48, 
        Size = UDim2.new(0, 230, 0, 235), 
        Position = UDim2.new(0, 20, 0, 0), 
        BackgroundTransparency = 1
    }, {
        Label = v2.createElement("TextLabel", {
            Text = v45.props.Label or l_Localization_1:getText("MaterialSettings", "ChooseMaterial"), 
            TextSize = v46.textSize, 
            Font = v46.font, 
            TextColor3 = v46.textColor, 
            Size = UDim2.new(1, 0, 0, 16), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Position = UDim2.new(0, 20, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Tooltip = if not l_Tooltip_1 then nil else v2.createElement(l_Tooltip_0, {
                Text = l_Tooltip_1
            })
        }), 
        Container = v2.createElement("Frame", {
            BackgroundColor3 = v46.backgroundColor, 
            Size = UDim2.new(0, 230, 0, 214), 
            Position = UDim2.new(0, 20, 0, 20), 
            BorderColor3 = v46.borderColor
        }, v52)
    });
end;
return (l_withContext_0({
    Theme = v5.DEPRECATED_Theme, 
    Localization = l_ContextServices_0.Localization
})(v11));
