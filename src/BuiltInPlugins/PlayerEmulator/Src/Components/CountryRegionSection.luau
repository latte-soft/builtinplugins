local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.ContextServices.NetworkingContext);
local v8 = require(l_Parent_0.Src.Networking.Requests.GetCountryRegion);
local v9 = require(l_Parent_0.Src.Util.Constants);
local v10 = require(l_Parent_0.Src.Actions.OnEmulatedCountryRegionChanged);
local l_UI_0 = v4.UI;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_map_0 = v4.Dash.map;
local l_StyleModifier_0 = v4.Util.StyleModifier;
local v16 = v2.PureComponent:extend("CountryRegionSection");
local function _()
    return l_PlayerEmulatorService_0.EmulatedCountryCode;
end;
local function _(v18)
    l_PlayerEmulatorService_0.EmulatedCountryCode = v18;
end;
v16.getCurrentCountryRegionText = function(v20, v21)
    local l_countryRegionTable_0 = v20.props.countryRegionTable;
    if not l_countryRegionTable_0 or not l_countryRegionTable_0[v21] then
        return "";
    else
        return l_countryRegionTable_0[v21].displayText;
    end;
end;
v16.updateCountryRegionSetting = function(v23, v24)
    local v25 = v23.props.Plugin:get();
    if v25:GetSetting(v9.COUNTRY_REGION_SETTING_KEY) ~= v24 then
        v25:SetSetting(v9.COUNTRY_REGION_SETTING_KEY, v24);
    end;
    v23.props.onEmulatedCountryRegionChanged(v24);
end;
v16.init = function(v26)
    v26.signalTokens = {};
    v26.createCountryRegionListForSelectInput = function(v27)
        return {
            Id = v27.displayText, 
            Label = v27.displayText, 
            code = v27.code
        };
    end;
    v26.onItemClicked = function(v28)
        l_PlayerEmulatorService_0.EmulatedCountryCode = v28.code;
    end;
end;
v16.didMount = function(v29)
    local v30 = v29.props.Plugin:get();
    local v31 = v29.props.Networking:get();
    table.insert(v29.signalTokens, (l_PlayerEmulatorService_0:GetPropertyChangedSignal("EmulatedCountryCode"):Connect(function()
        v29:updateCountryRegionSetting(l_PlayerEmulatorService_0.EmulatedCountryCode);
    end)));
    v29.props.loadCountryRegion(v31, v30);
end;
v16.willUnmount = function(v32)
    for _, v34 in pairs(v32.signalTokens) do
        v34:Disconnect();
    end;
    v32.signalTokens = nil;
end;
v16.render = function(v35)
    local l_props_0 = v35.props;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    local l_countryRegionList_0 = l_props_0.countryRegionList;
    local l_userCountryRegionCode_0 = l_props_0.userCountryRegionCode;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement("Frame", {
        Size = l_Stylizer_0.SELECTOR_SIZE, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING
        }), 
        Label = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            StyleModifier = if not l_mainSwitchEnabled_0 then l_StyleModifier_0.Disabled else nil, 
            Text = l_props_0.Localization:getText("CountryRegionSection", "LabelText"), 
            LayoutOrder = 1
        }), 
        CountryRegionDropdown = v2.createElement(l_SelectInput_0, {
            Items = l_map_0(l_countryRegionList_0, v35.createCountryRegionListForSelectInput), 
            LayoutOrder = 2, 
            OnItemActivated = v35.onItemClicked, 
            SelectedId = v35:getCurrentCountryRegionText(l_userCountryRegionCode_0), 
            Enabled = l_mainSwitchEnabled_0
        })
    });
end;
return v3.connect(function(v41, _)
    return {
        mainSwitchEnabled = v41.MainSwitch.mainSwitchEnabled, 
        countryRegionTable = v41.CountryRegion.countryRegionTable, 
        countryRegionList = v41.CountryRegion.countryRegionList, 
        userCountryRegionCode = v41.CountryRegion.userCountryRegionCode
    };
end, function(v43)
    return {
        loadCountryRegion = function(v44, v45)
            v43(v8(v44, v45));
        end, 
        onEmulatedCountryRegionChanged = function(v46)
            v43(v10(v46));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Networking = v7, 
    Plugin = l_ContextServices_0.Plugin
})(v16)));
