local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v4.Util.AccessoryAndBodyToolShared;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local l_Components_0 = v4.Components;
local l_AnimationPlaybackSlider_0 = l_Components_0.AnimationPlaybackSlider;
local _ = l_Components_0.PreviewDockWidget;
local l_PreviewCategoryList_0 = l_Components_0.PreviewCategoryList;
local v11 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v11.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v11.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_Pane_0 = v11.UI.Pane;
local _ = require(l_Parent_0.Src.Components.Preview.PreviewTabsRibbon);
local v19 = require(l_Parent_0.Src.Components.Preview.Grid);
local v20 = require(l_Parent_0.Src.Components.Preview.PreviewTopBarWrapper);
local v21 = require(l_Parent_0.Src.Actions.SelectPreviewTab);
local v22 = require(l_Parent_0.Src.Actions.SetCategoryFilter);
local v23 = require(l_Parent_0.Src.Actions.SetSliderPlayhead);
local v24 = require(l_Parent_0.Src.Actions.SetIsPlaying);
local v25 = require(l_Parent_0.Src.Actions.SetPlayhead);
local v26 = require(l_Parent_0.Src.Actions.SetTrackLength);
local l_PreviewingInfo_0 = l_AccessoryAndBodyToolShared_0.PreviewingInfo;
local v28 = v1.PureComponent:extend("PreviewFrame");
l_Typecheck_0.wrap(v28, script);
v28.init = function(v29)
    v29.state = {
        gridHeightOffset = 0, 
        gridWidthOffset = 0
    };
    v29.previewFrameRef = v1.createRef();
    v29.onCategoryChanged = function(v30, v31)
        v31 = v31 or "";
        v29.props.SetSelectedTab(v30 or "");
        v29.props.SetCategoryFilter(v31);
    end;
    v29.onAbsoluteSizeChanged = function(v32)
        local l_props_0 = v29.props;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local l_SelectedTab_0 = l_props_0.SelectedTab;
        local l_Y_0 = v32.PreviewTopBar.AbsoluteSize.Y;
        local l_X_0 = v32.GridContainer.CategoryList.AbsoluteSize.X;
        local v38 = 0;
        local v39 = 1;
        if l_PreviewConstantsInterface_0.shouldTabShowPlaybackSlider(l_SelectedTab_0) then
            v38 = l_Stylizer_0.SliderHeight;
            v39 = v39 + 1;
        end;
        v29:setState({
            gridHeightOffset = (l_Y_0 + v39 * 6) + v38, 
            gridWidthOffset = l_X_0 + 6
        });
    end;
end;
v28.render = function(v40)
    local l_props_1 = v40.props;
    local l_state_0 = v40.state;
    local l_Size_0 = l_props_1.Size;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_UserAddedAssets_0 = l_props_1.UserAddedAssets;
    local l_SelectedTab_1 = l_props_1.SelectedTab;
    local l_IsPlaying_0 = l_props_1.IsPlaying;
    local l_Playhead_0 = l_props_1.Playhead;
    local l_TrackLength_0 = l_props_1.TrackLength;
    local l_SetIsPlaying_0 = l_props_1.SetIsPlaying;
    local l_SetSliderPlayhead_0 = l_props_1.SetSliderPlayhead;
    local l_gridHeightOffset_0 = l_state_0.gridHeightOffset;
    local l_gridWidthOffset_0 = l_state_0.gridWidthOffset;
    local v55 = l_LayoutOrderIterator_0.new();
    local v56 = 1;
    if v40.previewFrameRef.current then
        v56 = v40.previewFrameRef.current.GridContainer.Grid.ZIndex + 1;
    end;
    return v1.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_1.BackgroundColor, 
        BorderSizePixel = 0, 
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        [v1.Ref] = v40.previewFrameRef, 
        [v1.Change.AbsoluteSize] = v40.onAbsoluteSizeChanged
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_Stylizer_1.Padding)
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Stylizer_1.Padding)
        }), 
        PreviewTopBar = v1.createElement(v20, {
            LayoutOrder = v55:getNextOrder()
        }), 
        GridContainer = v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -l_gridHeightOffset_0), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            LayoutOrder = v55:getNextOrder(), 
            BackgroundColor = l_Stylizer_1.GridContainerBackgroundColor, 
            Spacing = l_Stylizer_1.GridContainerSpacing, 
            Padding = {
                Top = l_Stylizer_1.GridContainerPadding, 
                Bottom = l_Stylizer_1.GridContainerPadding
            }
        }, {
            CategoryList = v1.createElement(l_PreviewCategoryList_0, {
                LayoutOrder = v55:getNextOrder(), 
                OnCategoryChanged = v40.onCategoryChanged, 
                OnArrowClick = function()
                    v40.onAbsoluteSizeChanged(v40.previewFrameRef.current);
                end
            }), 
            Grid = v1.createElement(v19, {
                Size = UDim2.new(1, -l_gridWidthOffset_0, 1, 0), 
                layoutOrder = v55:getNextOrder(), 
                UpdateUserAddedAssets = l_props_1.UpdateUserAddedAssets, 
                UserAddedAssets = l_UserAddedAssets_0
            })
        }), 
        AnimPlaybackSliderContainer = l_PreviewConstantsInterface_0.shouldTabShowPlaybackSlider(l_SelectedTab_1) and v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, -l_Stylizer_1.MainPadding, 0, l_Stylizer_1.SliderHeight), 
            LayoutOrder = v55:getNextOrder()
        }, {
            AnimPlaybackSlider = v1.createElement(l_AnimationPlaybackSlider_0, {
                IsPlaying = l_IsPlaying_0, 
                Playhead = l_Playhead_0, 
                OnSliderPlayheadChanged = l_SetSliderPlayhead_0, 
                OnPlayPauseClicked = l_SetIsPlaying_0, 
                Size = UDim2.new(1, 0, 0, l_Stylizer_1.SliderHeight), 
                TrackLength = l_TrackLength_0
            })
        })
    });
end;
v28.didUpdate = function(v57, v58)
    if v57.props.SelectedTab ~= v58.SelectedTab then
        v57.onAbsoluteSizeChanged(v57.previewFrameRef.current);
    end;
end;
return v2.connect(function(v59, _)
    local l_previewStatus_0 = v59.previewStatus;
    local l_animation_0 = v59.animation;
    return {
        SelectedTab = l_previewStatus_0.selectedTab, 
        AnimationId = l_PreviewingInfo_0.getPreviewingAnimationId(v59), 
        IsPlaying = l_animation_0.IsPlaying, 
        Playhead = l_animation_0.Playhead, 
        TrackLength = l_animation_0.TrackLength, 
        SliderPlayhead = l_animation_0.SliderPlayhead
    };
end, function(v63)
    return {
        SetSelectedTab = function(v64)
            v63(v21(v64));
        end, 
        SetCategoryFilter = function(v65)
            v63(v22(v65));
        end, 
        SetIsPlaying = function(v66)
            v63(v24(v66));
        end, 
        SetSliderPlayhead = function(v67)
            v63(v23(v67));
        end, 
        SetPlayhead = function(v68)
            v63(v25(v68));
        end, 
        SetTrackLength = function(v69)
            v63(v26(v69));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v28)));
