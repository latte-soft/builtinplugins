local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_LuaMeshEditingModuleContext_0 = v3.Contexts.LuaMeshEditingModuleContext;
local l_PreviewContext_0 = v3.Contexts.PreviewContext;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_InputBlocker_0 = v3.Components.InputBlocker;
local v8 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v8.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_UI_0 = v8.UI;
local l_Pane_0 = l_UI_0.Pane;
local _ = l_UI_0.ScrollingFrame;
local l_ScrollingFrame_1 = l_UI_0.ScrollingFrame;
local v17 = require(l_Parent_0.Src.Components.Screens.GenerateScreen);
local v18 = require(l_Parent_0.Src.Components.EditorToolsManager);
local v19 = require(l_Parent_0.Src.Components.PreviewFrame);
local v20 = require(l_Parent_0.Src.Components.Preview.PreviewViewportFrameContainer);
local v21 = require(l_Parent_0.Src.Components.Preview.ExplorerPreviewInstances);
local v22 = require(l_Parent_0.Src.Components.AnimationPlayback.AnimationPlaybackWrapper);
local v23 = require(l_Parent_0.Src.Actions.SetToolMode);
local v24 = require(l_Parent_0.Src.Thunks.FinishSelectingFromExplorer);
local v25 = require(l_Parent_0.Src.Thunks.AddUserAddedAssetForPreview);
local v26 = require(l_Parent_0.Src.Util.Constants);
local v27 = require(l_Parent_0.Src.Actions.SetPreviewAssetsSelected);
local v28 = v1.PureComponent:extend("EditorScreen");
l_Util_0.Typecheck.wrap(v28, script);
v28.init = function(v29)
    v29.finishSelectingFromExplorer = function()
        local _ = v29.props;
        local l_LuaMeshEditingModuleContext_1 = v29.props.LuaMeshEditingModuleContext;
        local v32 = v29.props.EditingItemContext:getItem();
        if not (not l_LuaMeshEditingModuleContext_1 or not v32) then
            l_LuaMeshEditingModuleContext_1:enableEditing();
            l_LuaMeshEditingModuleContext_1:updateCageLocationsFromInstance(v32);
        end;
        v29.props.FinishSelectingFromExplorer();
    end;
    v29.onNext = function()
        v29.props.SetToolMode(v26.TOOL_MODE.None);
        v29.props.GoToNext();
    end;
    v29.onPrevious = function()
        v29.props.SetToolMode(v26.TOOL_MODE.None);
        v29.props.GoToPrevious();
    end;
end;
v28.render = function(v33)
    local l_props_1 = v33.props;
    local l_Docked_0 = l_props_1.Docked;
    local l_UserAddedAssets_0 = l_props_1.UserAddedAssets;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_AddUserAddedAssetForPreview_0 = l_props_1.AddUserAddedAssetForPreview;
    local v39 = l_LayoutOrderIterator_0.new();
    return l_ContextServices_0.provide({
        l_PreviewContext_0.new()
    }, {
        Container = v1.createElement(l_Pane_0, {
            BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }, {
            EditorToolsManager = v1.createElement(v18), 
            PreviewViewportFrameContainer = v1.createElement(v20, {
                LayoutOrder = v39:getNextOrder()
            }), 
            MainFrame = v1.createElement(l_ScrollingFrame_1, {
                Size = UDim2.new(1, 0, 1, -(not l_Docked_0 and 0 or l_Stylizer_0.PreviewViewportFrameHeight)), 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v39:getNextOrder()
            }, {
                PreviewFrame = v1.createElement(v19, {
                    Size = UDim2.new(1, 0, 1, -l_Stylizer_0.GenerateHeight), 
                    UserAddedAssets = l_UserAddedAssets_0, 
                    UpdateUserAddedAssets = l_AddUserAddedAssetForPreview_0, 
                    LayoutOrder = v39:getNextOrder()
                }), 
                GenerateContainer = v1.createElement(l_Pane_0, {
                    Size = UDim2.new(1, 0, 0, l_Stylizer_0.GenerateHeight), 
                    LayoutOrder = v39:getNextOrder()
                }, {
                    GenerateScreen = v1.createElement(v17, {
                        GoToNext = v33.onNext, 
                        GoToPrevious = v33.onPrevious
                    })
                })
            }), 
            ControlsPanelBlocker = l_props_1.IsControlsPanelBlockerActive and v1.createElement(l_InputBlocker_0, {
                OnFocused = v33.finishSelectingFromExplorer, 
                Text = l_props_1.ControlsPanelBlockerMessage
            }), 
            AnimationPlaybackWrapper = v1.createElement(v22), 
            ExplorerPreviewInstances = v1.createElement(v21, {
                UserAddedAssets = l_UserAddedAssets_0
            })
        })
    });
end;
v28.willUnmount = function(v40)
    v40.props.ClearPreviewAssetsSelected();
end;
return v2.connect(function(v41, _)
    local l_controlsPanelBlocker_0 = v41.controlsPanelBlocker;
    local l_previewStatus_0 = v41.previewStatus;
    local _ = v41.selectItem;
    return {
        IsControlsPanelBlockerActive = l_controlsPanelBlocker_0.isActive, 
        ControlsPanelBlockerMessage = l_controlsPanelBlocker_0.message, 
        UserAddedAssets = l_previewStatus_0.userAddedAssets, 
        Docked = l_previewStatus_0.docked
    };
end, function(v46)
    return {
        SetToolMode = function(v47)
            v46(v23(v47));
        end, 
        FinishSelectingFromExplorer = function()
            v46(v24());
        end, 
        ClearPreviewAssetsSelected = function()
            v46(v27({}));
        end, 
        AddUserAddedAssetForPreview = function(v48, v49)
            v46(v25(v48, v49));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    EditingItemContext = l_EditingItemContext_0, 
    LuaMeshEditingModuleContext = l_LuaMeshEditingModuleContext_0
})(v28)));
