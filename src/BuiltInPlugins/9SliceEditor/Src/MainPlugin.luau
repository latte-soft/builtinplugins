local l_StudioFixPluginWidgetLocalizedIds_0 = game:GetFastFlag("StudioFixPluginWidgetLocalizedIds");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Types);
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v13 = require(l_Parent_0.Src.Components.SliceEditorMain);
local v14 = require(l_Parent_0.Src.Components.InstanceUnderEditManager);
local v15 = require(l_Parent_0.Src.Resources.AnalyticsHandlers);
local l_UI_0 = v4.UI;
local l_9SliceEditorAllowUnloadedImages_0 = game:GetFastFlag("9SliceEditorAllowUnloadedImages");
local l_DockWidget_0 = l_UI_0.DockWidget;
local v19 = v2.PureComponent:extend("MainPlugin");
v19.init = function(v20, _)
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "9SliceEditor"
    });
    v20.analytics = nil;
    v20.analytics = l_ContextServices_0.Analytics.new(v15);
    v20.state = {
        enabled = false, 
        pixelDimensions = Vector2.new(0, 0), 
        sliceRect = {
            0, 
            0, 
            0, 
            0
        }, 
        revertSliceRect = {
            0, 
            0, 
            0, 
            0
        }, 
        imageRectSize = Vector2.new(), 
        imageRectOffset = Vector2.new(), 
        imageColor3 = Color3.new(), 
        selectedInstance = nil, 
        title = v20.localization:getText("Plugin", "Name"), 
        loading = false
    };
    v20.timeOpened = nil;
    v20.reportOpen = function()
        v20.timeOpened = tick();
        v20.analytics:report("sliceEditorOpened");
    end;
    v20.reportClose = function()
        if v20.timeOpened then
            v20.analytics:report("sliceEditorOpenTime", tick() - v20.timeOpened);
        end;
    end;
    v20.onClose = function()
        if v20.state.enabled then
            v20.reportClose();
        end;
        v20:setState({
            enabled = false
        });
    end;
    v20.onInstanceUnderEditChanged = function(v22, v23)
        if not v20.state.enabled then
            v20.reportOpen();
        end;
        if v22 then
            v20.analytics:report("sliceEditorImageLoadedIntoEditor");
        end;
        v20:setState((v3.Dictionary.join({
            enabled = true, 
            selectedInstance = v22 or v2.None
        }, v23)));
    end;
    v20.onSliceRectChanged = function(v24)
        v20:setState({
            sliceRect = v24
        });
    end;
    v20.onLoadingChanged = function(v25)
        v20:setState({
            loading = v25
        });
    end;
    v20.onInstancePropertyChanged = function(v26, v27)
        if v26 == "ImageRectOffset" then
            v20:setState({
                imageRectOffset = v27
            });
            return ;
        elseif v26 == "ImageRectSize" then
            v20:setState({
                imageRectSize = v27
            });
            return ;
        elseif v26 == "ImageColor3" then
            v20:setState({
                imageColor3 = v27
            });
            return ;
        else
            if v26 == "ResampleMode" then
                v20:setState({
                    resampleMode = v27
                });
            end;
            return ;
        end;
    end;
    if l_9SliceEditorAllowUnloadedImages_0 then
        v20.loadingImageRef = v2.createRef();
    end;
    v20.onRequestToLoadImage = function(v28)
        v20:setState({
            contentIdToLoad = v28
        });
    end;
end;
v19.willUnmount = function(v29)
    if v29.state.enabled then
        v29.reportClose();
    end;
end;
v19.render = function(v30)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v10(), 
        v30.localization, 
        v30.analytics
    }, {
        InstanceUnderEditManager = v2.createElement(v14, {
            WidgetEnabled = l_enabled_0, 
            InstanceUnderEditChanged = v30.onInstanceUnderEditChanged, 
            InstancePropertyChanged = v30.onInstancePropertyChanged, 
            SliceRectChanged = v30.onSliceRectChanged, 
            LoadingChanged = v30.onLoadingChanged, 
            InitialEditorInstanceRequest = l_props_0.InitialEditorInstanceRequest, 
            RequestToLoadImage = v30.onRequestToLoadImage, 
            LoadingImageRef = v30.loadingImageRef
        }), 
        MainWidget = v2.createElement(l_DockWidget_0, {
            Id = if not l_StudioFixPluginWidgetLocalizedIds_0 then nil else "SliceEditor", 
            Enabled = l_enabled_0, 
            Title = l_state_0.title, 
            InitialDockState = Enum.InitialDockState.Float, 
            ZIndexBehavior = Enum.ZIndexBehavior.Global, 
            Size = v5.WIDGET_SIZE, 
            MinSize = v5.WIDGET_SIZE, 
            OnClose = v30.onClose, 
            ShouldRestore = false
        }, {
            SliceEditor = l_enabled_0 and v2.createElement(v13, {
                onClose = v30.onClose, 
                pixelDimensions = l_state_0.pixelDimensions, 
                selectedObject = l_state_0.selectedInstance, 
                sliceRect = l_state_0.sliceRect, 
                revertSliceRect = l_state_0.revertSliceRect, 
                loading = l_state_0.loading, 
                imageRectSize = l_state_0.imageRectSize, 
                imageRectOffset = l_state_0.imageRectOffset, 
                imageColor3 = l_state_0.imageColor3, 
                resampleMode = l_state_0.resampleMode, 
                contentIdToLoad = l_state_0.contentIdToLoad, 
                loadingImageRef = v30.loadingImageRef
            })
        })
    });
end;
return v19;
