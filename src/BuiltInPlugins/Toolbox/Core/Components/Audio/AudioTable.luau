local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local _ = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local _ = require(l_script_FirstAncestor_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v6 = require(l_Packages_0.Dash);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v8 = require(l_Util_0.LayoutOrderIterator);
local v9 = require(l_Util_0.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v15 = require(l_script_FirstAncestor_0.Core.Types.Category);
local l_UI_0 = v4.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local v19 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioRow);
local v20 = require(l_script_FirstAncestor_0.Core.Components.Audio.GetAudioTableSizes);
local v21 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local v22 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagAddInsertionNavData);
local v23 = v2.PureComponent:extend("AudioTable");
v23.init = function(v24, v25)
    v24.ref = v2.createRef();
    v24.state = {
        width = 0
    };
    v24.setExpandedAssetId = function(v26)
        v24:setState(function(v27)
            return {
                expandedAssetId = if v26 == v27.expandedAssetId then v2.None else v26
            };
        end);
    end;
    v24.OnAbsoluteSizeChanged = function()
        if v24.ref.current then
            v24:setState({
                width = v24.ref.current.AbsoluteSize.X
            });
        end;
    end;
    v24.createHeaderElement = function(v28, v29, v30, v31)
        local v32 = v20(v24.props.AudioType, v24.state.width);
        local l_itemRow_0 = v25.Stylizer.itemRow;
        local v34 = v32[v29];
        if not v34 then
            return nil;
        else
            local l_createElement_0 = v2.createElement;
            local l_l_TextLabel_0_0 = l_TextLabel_0;
            local v37 = {
                Font = v9.FONT, 
                LayoutOrder = v30, 
                Size = v34, 
                Text = v28, 
                TextColor = l_itemRow_0.headerTextColor, 
                TextSize = v9.FONT_SIZE_SMALL, 
                TextXAlignment = v31 or Enum.TextXAlignment.Left
            };
            local v38 = {};
            local v39 = false;
            if v30 ~= 1 then
                v39 = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, if not v21() then v9.AUDIO_ROW.LEFT_RIGHT_PADDING else v9.ITEM_ROW.LEFT_RIGHT_PADDING)
                });
            end;
            v38.UIPadding = v39;
            return (l_createElement_0(l_l_TextLabel_0_0, v37, v38));
        end;
    end;
end;
v23.didMount = function(v40)
    v40.OnAbsoluteSizeChanged();
end;
v23.render = function(v41)
    local l_props_0 = v41.props;
    local l_state_0 = v41.state;
    local l_Localization_0 = l_props_0.Localization;
    local l_Assets_0 = l_props_0.Assets;
    local l_AudioType_0 = l_props_0.AudioType;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_LogImpression_0 = l_props_0.LogImpression;
    local l_CanInsertAsset_0 = l_props_0.CanInsertAsset;
    local l_expandedAssetId_0 = l_state_0.expandedAssetId;
    local l_width_0 = l_state_0.width;
    local _ = l_AudioType_0 == v15.SOUND_EFFECTS.name;
    local _ = l_AudioType_0 == v15.MUSIC.name;
    local v54 = v8.new();
    local v59 = v6.map(l_Assets_0, function(v55)
        local function v57(v56)
            if not v22() then
                l_props_0.TryInsert(v55, v56 or false);
                return ;
            else
                l_props_0.TryInsert(v55, v56 or false, nil, v41.props.SwimlaneName);
                return ;
            end;
        end;
        local l_Asset_0 = v55.Asset;
        if not l_Asset_0 then
            return nil;
        else
            return v19.Generator({
                key = l_Asset_0.Id, 
                AssetInfo = v55, 
                CanInsertAsset = l_CanInsertAsset_0, 
                InsertAsset = v57, 
                IsExpanded = l_Asset_0.Id == l_expandedAssetId_0, 
                LayoutOrder = v54:getNextOrder() + 1, 
                LogImpression = l_LogImpression_0, 
                OnExpanded = v41.setExpandedAssetId, 
                OnAssetPreviewButtonClicked = l_props_0.OnAssetPreviewButtonClicked, 
                ParentAbsoluteSize = l_props_0.ParentAbsoluteSize, 
                TryOpenAssetConfig = l_props_0.TryOpenAssetConfig, 
                width = l_width_0
            });
        end;
    end);
    local v60 = v8.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        Layout = Enum.FillDirection.Vertical, 
        [v2.Ref] = v41.ref, 
        [v2.Change.AbsoluteSize] = v41.OnAbsoluteSizeChanged
    }, {
        HeaderRow = v2.createElement(l_Pane_0, {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, 20), 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = if not v21() then {
                Right = v9.AUDIO_ROW.BORDER_SIZE, 
                Left = v9.AUDIO_ROW.BORDER_SIZE, 
                Top = v9.AUDIO_ROW.BORDER_SIZE, 
                Bottom = v9.AUDIO_ROW.BORDER_SIZE
            } else v9.ITEM_ROW.BORDER_SIZE
        }, {
            Icon = v41.createHeaderElement("", v9.AUDIO_ROW.COLUMNS.ICON, v60:getNextOrder()), 
            Title = v41.createHeaderElement(l_Localization_0:getText("AudioView", "Title"):upper(), v9.AUDIO_ROW.COLUMNS.TITLE, v60:getNextOrder()), 
            Creator = v41.createHeaderElement(l_Localization_0:getText("AudioView", "Creator"):upper(), v9.AUDIO_ROW.COLUMNS.CREATOR, v60:getNextOrder()), 
            Tags = v41.createHeaderElement(l_Localization_0:getText("AudioView", "Tags"):upper(), v9.AUDIO_ROW.COLUMNS.TAGS, v60:getNextOrder()), 
            Length = v41.createHeaderElement(l_Localization_0:getText("AudioView", "Length"):upper(), v9.AUDIO_ROW.COLUMNS.LENGTH, v60:getNextOrder(), Enum.TextXAlignment.Right)
        }), 
        RowsWrapper = v2.createFragment(v59)
    });
end;
v23 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v23);
TypedAudioTable = function(v61, v62)
    return v2.createElement(v23, v61, v62);
end;
return {
    Component = v23, 
    Generator = TypedAudioTable
};
