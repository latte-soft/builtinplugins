local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_GetTextSize_0 = v4.Util.GetTextSize;
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = require(script.Parent.DevSubListItem);
local v12 = require(script.Parent.DevSubListHeaderText);
local v13 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v14 = require(l_Parent_0.Src.Util.DeepMergeTables);
local v15 = require(l_Parent_0.Src.Actions.AddChange);
local v16 = v1.Component:extend("DeveloperSubscriptionList");
v16.render = function(v17)
    local l_DeveloperSubscriptions_0 = v17.props.DeveloperSubscriptions;
    local l_OnDeveloperSubscriptionEdited_0 = v17.props.OnDeveloperSubscriptionEdited;
    local l_OnDeveloperSubscriptionCreated_0 = v17.props.OnDeveloperSubscriptionCreated;
    local v21 = v17.props.ListItemHeight or 32;
    local l_Stylizer_0 = v17.props.Stylizer;
    local l_Localization_0 = v17.props.Localization;
    local l_LayoutOrder_0 = v17.props.LayoutOrder;
    local v25 = l_GetTextSize_0(l_Localization_0:getText("General", "DevSubsCreateAction"), l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font);
    local v26 = {
        Header = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Title, {
            Size = UDim2.new(1, 0, 0, v13.HEADER_HEIGHT), 
            Text = l_Localization_0:getText("General", "DevSubsListHeader"), 
            TextColor3 = Color3.fromRGB(170, 170, 170), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            LayoutOrder = 0
        }), {
            Padding = v1.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 12)
            }), 
            Layout = v1.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom
            }), 
            CreateButton = v1.createElement(l_Button_0, {
                Style = "GameSettingsPrimaryButton", 
                Text = l_Localization_0:getText("General", "DevSubsCreateAction"), 
                Size = UDim2.new(0, v25.X + l_Stylizer_0.createButton.PaddingX, 0, v25.Y + l_Stylizer_0.createButton.PaddingY), 
                OnClick = l_OnDeveloperSubscriptionCreated_0
            })
        }), 
        ListHeader = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v21), 
            LayoutOrder = 1
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 4), 
                PaddingRight = UDim.new(0, 24)
            }), 
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            IdText = v1.createElement(v12, {
                Size = UDim2.new(0.25, 0, 1, 0), 
                Text = l_Localization_0:getText("General", "DevSubsPlanID"), 
                LayoutOrder = 1, 
                Alignment = Enum.TextXAlignment.Left
            }), 
            NameText = v1.createElement(v12, {
                Size = UDim2.new(0.25, 0, 1, 0), 
                Text = l_Localization_0:getText("General", "DevSubsName"), 
                LayoutOrder = 2, 
                Alignment = Enum.TextXAlignment.Left
            }), 
            SubscribersText = v1.createElement(v12, {
                Size = UDim2.new(0.2, 0, 1, 0), 
                Text = l_Localization_0:getText("General", "DevSubsSubscribers"), 
                LayoutOrder = 3, 
                Alignment = Enum.TextXAlignment.Left
            }), 
            CreationDateText = v1.createElement(v12, {
                Size = UDim2.new(0.2, 0, 1, 0), 
                Text = l_Localization_0:getText("General", "DevSubsCreationDate"), 
                LayoutOrder = 4, 
                Alignment = Enum.TextXAlignment.Left
            })
        })
    };
    local v27 = {};
    for _, v29 in pairs(l_DeveloperSubscriptions_0) do
        table.insert(v27, v29);
    end;
    table.sort(v27, function(v30, v31)
        if v30.Active ~= v31.Active then
            if not v30.Active then
                if v31.Active then
                    return false;
                end;
            else
                return true;
            end;
        end;
        return v30.Key:upper() < v31.Key:upper();
    end);
    local v32 = 1;
    for _, v34 in ipairs(v27) do
        v26[v34.Key] = v1.createElement(v11, {
            Name = v34.Name or "", 
            Id = v34.Id, 
            Subscribers = v34.Subscribers, 
            Active = v34.Active, 
            LayoutOrder = v32 + 1, 
            OnEditButtonActivated = function()
                l_OnDeveloperSubscriptionEdited_0(v34);
            end, 
            Height = v21, 
            HasError = v17.props.DevSubsErrors[v34.Key] ~= nil, 
            CreationDate = v34.CreationDate or ""
        });
        v32 = v32 + 1;
    end;
    v26.Space = v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v32 + 1
    });
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Spacing = UDim.new(0, 10)
    }, v26);
end;
return v3.connect(function(v35, _)
    return {
        DeveloperSubscriptions = v14.Merge((v35.Settings.Current or {}).DeveloperSubscriptions or {}, (v35.Settings.Changed or {}).DeveloperSubscriptions or {}) or {}, 
        ModeratedDevSubs = v35.DevSubModeration or {}, 
        DevSubsErrors = v35.Settings.Errors.DeveloperSubscriptions or {}
    };
end, function(v37)
    return {
        OnDeveloperSubscriptionEdited = function(v38)
            v37(v15("isEditingSubscription", true));
            v37(v15("editedSubscriptionKey", v38.Key));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v16)));
