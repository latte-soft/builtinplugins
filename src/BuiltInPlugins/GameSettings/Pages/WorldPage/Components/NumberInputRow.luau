local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local l_GameSettingsFixNumberInputRow_0 = game:GetFastFlag("GameSettingsFixNumberInputRow");
local l_StudioGameSettingsWorldPageFormatNumbersForGerman_0 = game:GetFastFlag("StudioGameSettingsWorldPageFormatNumbersForGerman");
local v5 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v5.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v12 = require(l_Parent_0.ContextServices.WorldRootPhysics);
local v13 = require(l_Parent_0.Util.formatNumberForDisplay);
local v14 = require(l_Parent_0.Util.formatNumberForEngine);
local v15 = v2.PureComponent:extend("NumberInputRow");
v15.init = function(v16)
    v16.onFocusLost = function()
        v16:onTextChanged(v16.props.Value);
    end;
    v16.onTextChanged = function(v17)
        local l_props_0 = v16.props;
        local v19 = l_props_0.MinValue or -math.huge;
        local v20 = l_props_0.MaxValue or math.huge;
        if not l_GameSettingsFixNumberInputRow_0 then
            v16.props.OnUpdate((math.clamp(l_props_0.Value, v19, v20)));
        elseif not l_StudioGameSettingsWorldPageFormatNumbersForGerman_0 then
            local v21 = tonumber(v17);
            if v21 then
                v16.props.OnUpdate((math.clamp(v21, v19, v20)));
                return ;
            end;
        else
            local v22 = nil;
            if typeof(v17) == "string" then
                v22 = tonumber((v14(v17)));
            end;
            if v22 then
                v16.props.OnUpdate((math.clamp(v22, v19, v20)));
                return ;
            end;
        end;
    end;
    v16.onValidateText = function(v23)
        if not l_StudioGameSettingsWorldPageFormatNumbersForGerman_0 then
            local v24 = true;
            if v23 ~= "" then
                v24 = tonumber(v23) ~= nil;
            end;
            local v25 = nil;
            if not v24 then
                v25 = v16.props.Localization:getText("General", "NumberError");
            end;
            return v24, v25;
        else
            local v26 = v14(v23);
            local v27 = true;
            if v26 ~= "" then
                v27 = tonumber(v26) ~= nil;
            end;
            local v28 = nil;
            if not v27 then
                v28 = v16.props.Localization:getText("General", "NumberError");
            end;
            return v27, v28;
        end;
    end;
end;
v15.render = function(v29)
    local l_props_1 = v29.props;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Title_0 = l_props_1.Title;
    local l_Label_0 = l_props_1.Label;
    local l_Value_0 = l_props_1.Value;
    local l_UnitsFormatFunction_0 = l_props_1.UnitsFormatFunction;
    return v2.createElement(l_TitledFrame_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Title = l_Title_0
    }, {
        Label = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            Style = "Normal", 
            Text = l_Label_0
        }), 
        InputBox = v2.createElement(l_TextInput_0, {
            OnFocusLost = v29.onFocusLost, 
            OnTextChanged = v29.onTextChanged, 
            OnValidateText = v29.onValidateText, 
            LayoutOrder = 2, 
            Position = UDim2.new(0, 160, 0, 0), 
            Width = 150, 
            Text = v13(l_Value_0)
        }), 
        MetricLabel = l_UnitsFormatFunction_0 and v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 3, 
            Style = "SubText", 
            Text = l_UnitsFormatFunction_0(l_props_1.WorldRootPhysics:get().convertStudsToMeters(l_Value_0))
        })
    });
end;
return (l_withContext_0({
    Mouse = l_ContextServices_0.Mouse, 
    Localization = l_ContextServices_0.Localization, 
    WorldRootPhysics = v12
})(v15));
