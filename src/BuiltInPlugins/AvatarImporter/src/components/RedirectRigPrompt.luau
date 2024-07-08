local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.src.Constants);
local v4 = require(l_Parent_0.src.components.CustomTextButton);
local v5 = require(l_Parent_0.src.thunks.ImportWithoutSceneLoad);
local l_Studio_0 = settings().Studio;
local v7 = v1.Component:extend("RedirectRigPrompt");
v7.render = function(v8)
    local function v9()
        if v8.props.avatarType == v3.AVATAR_TYPE.RTHRO_SLENDER then
            v8.props.doImportWithoutSceneLoad(v3.AVATAR_TYPE.RTHRO_SLENDER);
            return ;
        elseif v8.props.avatarType == v3.AVATAR_TYPE.RTHRO then
            v8.props.doImportWithoutSceneLoad(v3.AVATAR_TYPE.RTHRO);
            return ;
        else
            v8.props.doImportWithoutSceneLoad(v3.AVATAR_TYPE.R15);
            return ;
        end;
    end;
    local function v10()
        v8.props.doImportWithoutSceneLoad(v3.AVATAR_TYPE.CUSTOM);
    end;
    local v11 = v8.props.avatarType == v3.AVATAR_TYPE.RTHRO_SLENDER and "Rthro Narrow" or v8.props.avatarType;
    local v12 = (not (v8.props.avatarType ~= v3.AVATAR_TYPE.CUSTOM) or v8.props.avatarType == nil) and "You are trying to import a R15 rig as Custom:" or "You are trying to import a Custom rig as " .. v11 .. ":";
    local v13 = "Continue as R15";
    if v8.props.avatarType ~= v3.AVATAR_TYPE.CUSTOM then
        v13 = "Continue as " .. v11;
    end;
    return v1.createElement("Frame", {
        Name = "RedirectRigPrompt", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground, Enum.StudioStyleGuideModifier.Default)
    }, {
        header = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v3.FONT_BOLD, 
            Position = UDim2.new(0, 0, 0, 123), 
            Size = UDim2.new(1, 0, 0, 18), 
            Text = v12, 
            TextSize = v3.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextColor3 = l_Studio_0.Theme:GetColor(Enum.StudioStyleGuideColor.MainText, Enum.StudioStyleGuideModifier.Default)
        }), 
        buttons = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -123), 
            Size = UDim2.new(1, 0, 0, 34)
        }, {
            buttonsListLayout = v1.createElement("UIListLayout", {
                Padding = UDim.new(0, 21), 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            cancelButton = v1.createElement(v4, {
                Name = "R15Button", 
                labelText = v13, 
                layoutOrder = 0, 
                isLarge = true, 
                [v1.Event.MouseButton1Click] = v9
            }), 
            retryButton = v1.createElement(v4, {
                Name = "CustomButton", 
                labelText = "Continue as Custom", 
                layoutOrder = 1, 
                isLarge = true, 
                [v1.Event.MouseButton1Click] = v10
            })
        })
    });
end;
return v2.connect(function(v14)
    return {
        avatarType = (v14 or {}).plugin.avatarType
    };
end, function(v15)
    return {
        doImportWithoutSceneLoad = function(v16)
            v15(v5(v16));
        end
    };
end)(v7);
