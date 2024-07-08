local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local _ = l_script_FirstAncestor_0.Core.Util;
local v3 = require(l_script_FirstAncestor_0.Core.Util.Colors);
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Packages_0.Framework);
local v7 = require(l_script_FirstAncestor_0.Core.Networking.Requests.RequestSearchRequest);
local v8 = require(l_script_FirstAncestor_0.Core.Types.AutocorrectTypes);
local v9 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v10 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v11 = require(l_script_FirstAncestor_0.Core.Thunks.LogMarketplaceSearchAnalytics);
local l_LayoutOrderIterator_0 = v6.Util.LayoutOrderIterator;
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LinkText_0 = v6.UI.LinkText;
local l_Pane_0 = v6.UI.Pane;
local l_TextLabel_0 = v6.UI.TextLabel;
local v18 = v4.PureComponent:extend("Autocorrect");
v18.init = function(v19)
    v19.onClickOfferedQuery = function(v20, v21, v22, v23)
        v19.props.requestSearchRequest(v19.props.Network.networkInterface, v19.props.Settings:get("Plugin"), v20, v21, v22, v23);
        v19.props.logSearchAnalytics(v20, v21, v22, v23);
    end;
end;
v18.render = function(v24)
    local l_props_0 = v24.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_CorrectionState_0 = l_props_0.CorrectionState;
    local l_CurrentQuery_0 = l_props_0.CurrentQuery;
    local l_CorrectedQuery_0 = l_props_0.CorrectedQuery;
    local l_UserQuery_0 = l_props_0.UserQuery;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    if l_CorrectionState_0 == v8.AutocorrectResponseState.CorrectionAvailable then
        v31 = "DidYouMean";
        v32 = v8.QuerySource.CorrectedQuery;
        v33 = l_CurrentQuery_0;
        v36 = l_CorrectedQuery_0;
        v35 = v3.WARNING_TEXT_COLOR;
    elseif l_CorrectionState_0 == v8.AutocorrectResponseState.CorrectionAccepted then
        v31 = "SearchInsteadFor";
        v32 = v8.QuerySource.ReversionToUserQuery;
        v34 = l_CurrentQuery_0;
        v36 = l_UserQuery_0;
    else
        return nil;
    end;
    local v37 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 0), 
        VerticalAlignment = Enum.VerticalAlignment.Top
    };
    local v38 = l_LayoutOrderIterator_0.new();
    return v4.createElement(l_Pane_0, v37, {
        Message = v4.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v38:getNextOrder(), 
            Text = l_Localization_0:getText("General", v31) .. " ", 
            TextColor = v35
        }), 
        Suggestion = v4.createElement(l_LinkText_0, {
            LayoutOrder = v38:getNextOrder(), 
            Text = v36, 
            OnClick = function()
                v24.onClickOfferedQuery(v36, v32, v33, v34);
            end
        })
    });
end;
return (v5.connect(nil, function(v39)
    return {
        logSearchAnalytics = function(v40, v41, v42, v43)
            v39(v11(v40, false, v41, v42, v43));
        end, 
        requestSearchRequest = function(v44, v45, v46, v47, v48, v49)
            v39(v7(v44, v45, v46, nil, false, v47, v48, v49));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v9, 
    Plugin = l_ContextServices_0.Plugin, 
    Settings = v10, 
    Stylizer = l_ContextServices_0.Stylizer
})(v18))));
