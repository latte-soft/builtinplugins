local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.src.Assets);
local v4 = require(l_Parent_0.src.utils.themeConfig);
local v5 = require(l_Parent_0.src.utils.getTextWidth);
local v6 = require(l_Parent_0.src.components.Tooltip);
local v7 = require(l_Parent_0.src.thunks.Import);
local v8 = require(l_Parent_0.src.thunks.DetectType);
local v9 = require(l_Parent_0.src.thunks.DetectTypeWithOrigAvatarType);
local v10 = require(l_Parent_0.src.Constants);
local l_Studio_0 = settings().Studio;
local function v17(v12, v13, v14)
    v12 = v12 or "";
    v13 = v13 or "";
    v14 = v14 or "";
    local v15 = math.max(v5(v12, v10.FONT_SIZE_SMALL, v10.FONT_BOLD), v5(v13, v10.FONT_SIZE_SMALL, v10.FONT), v5(v14, v10.FONT_SIZE_SMALL, v10.FONT));
    local v16 = 0;
    if v12 ~= "" then
        v16 = v16 + 1;
    end;
    if v13 ~= "" then
        v16 = v16 + 1;
    end;
    if v14 ~= "" then
        v16 = v16 + 1;
    end;
    return UDim2.new(0, v15 + 10, 0, (5 + 14 * v16) + 5);
end;
local v18 = v1.Component:extend("AvatarButton");
v18.init = function(v19)
    v19.state = {
        hover = false, 
        down = false
    };
end;
v18.getColor = function(v20)
    if not v20.state.down then
        if not v20.state.hover then
            return l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Default);
        else
            return l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Hover);
        end;
    else
        return l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.Button, Enum.StudioStyleGuideModifier.Pressed);
    end;
end;
v18.getTooltipFields = function(v21)
    local v22 = {};
    if v21.props.contextInfo.title then
        v22[#v22 + 1] = v21.props.contextInfo.title;
    end;
    if v21.props.contextInfo.height then
        v22[#v22 + 1] = string.format("Ideal height: %s studs", (tostring(v21.props.contextInfo.height)));
    end;
    if v21.props.contextInfo.description then
        v22[#v22 + 1] = v21.props.contextInfo.description;
    end;
    return v22;
end;
v18.render = function(v23)
    local v24 = v23:getTooltipFields();
    local v25 = v24[1];
    local v26 = v24[2];
    local v27 = v24[3];
    local function _(v28)
        if not (v28 ~= v10.AVATAR_TYPE.CUSTOM) then
            v23.props.detectTypeWithOrigAvatarType(v28);
            return ;
        else
            v23.props.doImport(v23.props.avatarType);
            return ;
        end;
    end;
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        Image = v3.BUTTON_AVATAR_TYPE, 
        LayoutOrder = v23.props.layoutOrder, 
        ScaleType = Enum.ScaleType.Slice, 
        Size = UDim2.new(0, v10.BUTTON_WIDTH, 0, v10.BUTTON_HEIGHT), 
        SliceCenter = Rect.new(4, 4, 5, 5), 
        ImageColor3 = v23:getColor(), 
        [v1.Event.InputBegan] = function(_, v31)
            if not (not (v31.UserInputType == Enum.UserInputType.MouseMovement) or v23.state.hover) then
                v23:setState({
                    hover = true
                });
            end;
        end, 
        [v1.Event.InputChanged] = function(_, v33)
            if not (not (v33.UserInputType == Enum.UserInputType.MouseMovement) or v23.state.hover) then
                v23:setState({
                    hover = true
                });
            end;
        end, 
        [v1.Event.InputEnded] = function(_, v35)
            if not (not (v35.UserInputType == Enum.UserInputType.MouseMovement) or not v23.state.hover and not v23.state.down) then
                v23:setState({
                    hover = false, 
                    down = false
                });
            end;
        end, 
        [v1.Event.MouseButton1Down] = function()
            v23:setState({
                down = true
            });
        end, 
        [v1.Event.MouseButton1Up] = function()
            v23:setState({
                down = false
            });
        end, 
        [v1.Event.Activated] = function()
            if v23.props.avatarType == v10.AVATAR_TYPE.CUSTOM then
                local l_avatarType_0 = v23.props.avatarType;
                if not (l_avatarType_0 ~= v10.AVATAR_TYPE.CUSTOM) then
                    v23.props.detectTypeWithOrigAvatarType(l_avatarType_0);
                    return ;
                else
                    v23.props.doImport(v23.props.avatarType);
                    return ;
                end;
            elseif v23.props.avatarType ~= v10.AVATAR_TYPE.CUSTOM then
                v23.props.detectTypeWithOrigAvatarType(v23.props.avatarType);
                return ;
            else
                v23.props.doImport(v23.props.avatarType);
                return ;
            end;
        end
    }, {
        tooltip = v1.createElement(v6, {
            Size = v17(v25, v26, v27)
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UIPadding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 5), 
                PaddingTop = UDim.new(0, 5)
            }), 
            Title = v25 and v1.createElement("TextLabel", {
                ZIndex = 10, 
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Font = v10.FONT_BOLD, 
                Size = UDim2.new(1, 0, 0, v10.FONT_SIZE_SMALL), 
                TextSize = v10.FONT_SIZE_SMALL, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default), 
                Text = v25
            }), 
            Top = v26 and v1.createElement("TextLabel", {
                ZIndex = 10, 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Font = v10.FONT, 
                Size = UDim2.new(1, 0, 0, v10.FONT_SIZE_SMALL), 
                TextSize = v10.FONT_SIZE_SMALL, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default), 
                Text = v26
            }), 
            Bottom = v27 and v1.createElement("TextLabel", {
                ZIndex = 10, 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Font = v10.FONT, 
                Size = UDim2.new(1, 0, 0, v10.FONT_SIZE_SMALL), 
                TextSize = v10.FONT_SIZE_SMALL, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default), 
                Text = v27
            })
        }), 
        border = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v3.BUTTON_AVATAR_TYPE_BORDER, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 1, 0), 
            SliceCenter = Rect.new(4, 4, 5, 5), 
            ImageColor3 = v4({
                Light = Color3.fromRGB(184, 184, 184), 
                Dark = Color3.fromRGB(60, 60, 60)
            })
        }), 
        icon = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 28, 0, 17), 
            Size = UDim2.new(0, 91, 0, 160), 
            Image = v4(v23.props.iconOptions)
        }), 
        title = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v10.FONT_SEMIBOLD, 
            Position = UDim2.new(0, 0, 0, 188), 
            Size = UDim2.new(1, 0, 0, v10.FONT_SIZE_TITLE), 
            Text = v23.props.name, 
            TextSize = v10.FONT_SIZE_TITLE, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextColor3 = v4({
                Light = Color3.fromRGB(0, 162, 255), 
                Dark = Color3.fromRGB(204, 204, 204)
            })
        })
    });
end;
return v2.connect(nil, function(v37)
    return {
        doImport = function(v38)
            v37(v7(v38));
        end, 
        detectType = function()
            v37(v8());
        end, 
        detectTypeWithOrigAvatarType = function(v39)
            v37(v9(v39));
        end
    };
end)(v18);
