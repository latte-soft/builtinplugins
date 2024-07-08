local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Util.SliceRectUtil);
local _ = require(l_Parent_0.Src.Types);
local v5 = require(l_Parent_0.Src.Util.Orientation);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Promise_0 = v2.Util.Promise;
local v11 = require(l_Parent_0.Src.Components.AlertDialog);
local l_GuiService_0 = game:GetService("GuiService");
local l_Selection_0 = game:GetService("Selection");
local l_RunService_0 = game:GetService("RunService");
local l_9SliceEditorAllowUnloadedImages_0 = game:GetFastFlag("9SliceEditorAllowUnloadedImages");
local v16 = v1.PureComponent:extend("InstanceUnderEditManager");
local v17 = v5.Left.rawValue();
local v18 = v5.Right.rawValue();
local v19 = v5.Top.rawValue();
local v20 = v5.Bottom.rawValue();
v16.init = function(v21, v22)
    v21.state = {
        showingAlertTitleKey = nil, 
        showingAlertMessageKey = nil
    };
    v21.instanceUnderEdit = nil;
    v21.instanceWatchedForImageChange = nil;
    v21.lastSliceOffsets = nil;
    v21.uncroppedImageSize = Vector2.new();
    v21.showAlertDialog = function(v23, v24, v25)
        v21:setState({
            showingAlertTitleKey = v23, 
            showingAlertMessageKey = v24, 
            showingAlertMessageReplacements = v25
        });
    end;
    v21.closeAlertDialog = function()
        v21:setState({
            showingAlertTitleKey = v1.None, 
            showingAlertMessageKey = v1.None, 
            showingAlertMessageReplacements = v1.None
        });
    end;
    v21.imageUnderEditConnections = {};
    v21.clearCurrentImageUnderEdit = function()
        for _, v27 in ipairs(v21.imageUnderEditConnections) do
            if v27 then
                v27:Disconnect();
            end;
        end;
        v21.imageUnderEditConnections = {};
    end;
    v21.getOffsetsForResizedImage = function(v28, v29)
        local v30 = {
            [v17] = math.clamp(v28[v17], 0, v29.X)
        };
        v30[v18] = math.clamp(v28[v18], 0, (math.max(0, v29.X - v30[v17])));
        v30[v19] = math.clamp(v28[v19], 0, v29.Y);
        v30[v20] = math.clamp(v28[v20], 0, (math.max(0, v29.Y - v30[v19])));
        return v30;
    end;
    v21.getImageDimensionsForInstance = function(v31)
        if v31.ImageRectSize.X > 0 and v31.ImageRectSize.Y > 0 then
            return v31.ImageRectSize;
        elseif not l_9SliceEditorAllowUnloadedImages_0 then
            return v31.ContentImageSize;
        else
            return v21.uncroppedImageSize;
        end;
    end;
    v21.getImageUnderEdit = function()
        return v21.instanceUnderEdit;
    end;
    v21.onSliceCenterChanged = function()
        local v32 = v21.getImageUnderEdit();
        if v32 ~= nil then
            local v33 = v3.getSliceRectFromSliceCenter(v32.SliceCenter);
            v21.props.SliceRectChanged(v33);
            v21.lastSliceOffsets = v3.getOffsetsFromSliceRect(v33, (v21.getImageDimensionsForInstance(v32)));
        end;
    end;
    v21.getInstanceProperty = function(v34)
        local v35 = v21.getImageUnderEdit();
        return v35 and v35[v34];
    end;
    v21.onImageRectOffsetChanged = function()
        v21.props.InstancePropertyChanged("ImageRectOffset", v21.getInstanceProperty("ImageRectOffset"));
    end;
    v21.clampSliceCenterToDimensions = function(v36, v37)
        return Rect.new(math.clamp(v36.Min.X, 0, v37.X), math.clamp(v36.Min.Y, 0, v37.Y), math.clamp(v36.Max.X, 0, v37.X), (math.clamp(v36.Max.Y, 0, v37.Y)));
    end;
    v21.onImageRectSizeChanged = function()
        local v38 = v21.getImageUnderEdit();
        if v38 then
            local l_ImageRectSize_0 = v38.ImageRectSize;
            v21.props.InstancePropertyChanged("ImageRectSize", l_ImageRectSize_0);
            if l_ImageRectSize_0.X > 0 and l_ImageRectSize_0.Y > 0 then
                v38.SliceCenter = v21.clampSliceCenterToDimensions(v38.SliceCenter, l_ImageRectSize_0);
            end;
            return ;
        else
            return ;
        end;
    end;
    v21.onImageColor3Changed = function()
        v21.props.InstancePropertyChanged("ImageColor3", v21.getInstanceProperty("ImageColor3"));
    end;
    v21.onResampleModeChanged = function()
        v21.props.InstancePropertyChanged("ResampleMode", v21.getInstanceProperty("ResampleMode"));
    end;
    v21.openInstanceInEditor = function(v40, v41)
        v21.clearCurrentImageUnderEdit();
        local v42 = Vector2.new(0, 0);
        local v43 = {
            0, 
            0, 
            0, 
            0
        };
        local v44 = {
            0, 
            0, 
            0, 
            0
        };
        local v45 = v21.props.Localization:getText("Plugin", "Name");
        local v46 = {
            title = v45, 
            pixelDimensions = v42, 
            sliceRect = v43, 
            revertSliceRect = v44
        };
        if v40 ~= nil then
            if not l_9SliceEditorAllowUnloadedImages_0 then
                v42 = v40.ContentImageSize;
            else
                assert(v41);
                local v47 = true;
                if v41.X <= 0 then
                    v47 = v41.Y > 0;
                end;
                assert(v47);
                v21.uncroppedImageSize = v41;
                v42 = v41;
            end;
            local v48 = v21.getImageDimensionsForInstance(v40);
            if v40.SliceCenter == Rect.new(0, 0, 0, 0) then
                v40.SliceCenter = Rect.new(0, 0, v48.X, v48.Y);
            end;
            table.insert(v21.imageUnderEditConnections, v40:GetPropertyChangedSignal("SliceCenter"):Connect(v21.onSliceCenterChanged));
            table.insert(v21.imageUnderEditConnections, v40:GetPropertyChangedSignal("ImageRectOffset"):Connect(v21.onImageRectOffsetChanged));
            table.insert(v21.imageUnderEditConnections, v40:GetPropertyChangedSignal("ImageRectSize"):Connect(v21.onImageRectSizeChanged));
            table.insert(v21.imageUnderEditConnections, v40:GetPropertyChangedSignal("ImageColor3"):Connect(v21.onImageColor3Changed));
            table.insert(v21.imageUnderEditConnections, v40:GetPropertyChangedSignal("ResampleMode"):Connect(v21.onResampleModeChanged));
            v43 = v3.getSliceRectFromSliceCenter(v40.SliceCenter);
            v44 = v3.copySliceRect(v43);
            v45 = v45 .. ": " .. tostring(v40.Name);
            v21.lastSliceOffsets = v3.getOffsetsFromSliceRect(v43, v48);
            v46 = {
                title = v45, 
                pixelDimensions = v42, 
                sliceRect = v43, 
                revertSliceRect = v44, 
                imageRectOffset = v40.ImageRectOffset, 
                imageRectSize = v40.ImageRectSize, 
                imageColor3 = v40.ImageColor3, 
                resampleMode = v40.ResampleMode
            };
        end;
        v21.instanceUnderEdit = v40;
        v21.props.InstanceUnderEditChanged(v40, v46);
    end;
    v21.loadingToken = 0;
    v21.newLoadingToken = function()
        local l_v21_0 = v21;
        l_v21_0.loadingToken = l_v21_0.loadingToken + 1;
        return v21.loadingToken;
    end;
    if l_9SliceEditorAllowUnloadedImages_0 then
        v21.loadingImageRef = v1.createRef();
    end;
    v21.createPromiseForImageLoaded = function(v50, v51)
        v21.openInstanceInEditor(nil);
        local v52 = v21.newLoadingToken();
        return l_Promise_0.new(function(v53, v54)
            if v50 and (v50:IsA("ImageLabel") or v50:IsA("ImageButton")) then
                v21.connectImageChangedConnection(v50);
                local l_v50_0 = v50;
                if not l_9SliceEditorAllowUnloadedImages_0 then
                    if v50.IsLoaded then
                        v53(v50, v52);
                        return ;
                    end;
                elseif l_v50_0.IsLoaded then
                    v53(l_v50_0, v52);
                    return ;
                end;
                if not (not l_9SliceEditorAllowUnloadedImages_0 or not v51) then
                    v21.props.RequestToLoadImage(l_v50_0.Image);
                    v21.props.LoadingChanged(true);
                    l_RunService_0.RenderStepped:Wait();
                    l_RunService_0.RenderStepped:Wait();
                    l_RunService_0.RenderStepped:Wait();
                    if not v21._isMounted then
                        v54(false, v52);
                        return ;
                    end;
                end;
                v21.props.LoadingChanged(true);
                local v56 = tick();
                while true do
                    if tick() - v56 < 5 then
                        local v57 = false;
                        if not l_9SliceEditorAllowUnloadedImages_0 then
                            v57 = v50.IsLoaded and v50.ContentImageSize ~= Vector2.new(0, 0);
                        elseif v21._isMounted then
                            local v58 = v21.props.LoadingImageRef:getValue();
                            local l_v58_0 = v58;
                            if l_v58_0 then
                                l_v58_0 = v58.IsLoaded;
                                if l_v58_0 then
                                    l_v58_0 = false;
                                    if v58.ContentImageSize ~= Vector2.new(0, 0) then
                                        l_v58_0 = v58.Image == l_v50_0.Image;
                                    end;
                                end;
                            end;
                            v57 = l_v58_0;
                        else
                            v54(false, v52);
                            return ;
                        end;
                        if not v57 then
                            if not l_9SliceEditorAllowUnloadedImages_0 then
                                wait(1);
                            else
                                task.wait(0.2);
                            end;
                        elseif v52 == v21.loadingToken then
                            v53(v50);
                            return ;
                        else
                            v54(false, v52);
                            return ;
                        end;
                    else
                        v54(true, v52);
                        return ;
                    end;
                end;
            else
                v54(false, v52);
                return ;
            end;
        end);
    end;
    v21.createAndRunPromiseForImageLoaded = function(v60, v61)
        v21.disconnectImageChangedConnection();
        local v62 = nil;
        local v63 = false;
        if not l_9SliceEditorAllowUnloadedImages_0 then
            v62 = v21.createPromiseForImageLoaded(v60);
        else
            v63 = (v60 and (v60:IsA("ImageLabel") or v60:IsA("ImageButton"))) and not v60.IsLoaded;
            v62 = v21.createPromiseForImageLoaded(v60, v63);
        end;
        v62:andThen(function(v64)
            if v21._isMounted then
                if not l_9SliceEditorAllowUnloadedImages_0 then
                    assert(v64.IsLoaded);
                elseif not v63 then
                    assert(v64.IsLoaded);
                else
                    local v65 = v21.props.LoadingImageRef:getValue();
                    assert(v65 and v65.IsLoaded);
                end;
                if v61 then
                    if v21.lastSliceOffsets ~= nil then
                        local v66 = v21.getImageDimensionsForInstance(v64);
                        v64.SliceCenter = v3.getSliceCenterFromSliceRect((v3.getSliceRectFromOffsets(v21.getOffsetsForResizedImage(v21.lastSliceOffsets, v66), v66)));
                    else
                        v64.SliceCenter = Rect.new(0, 0, 0, 0);
                    end;
                end;
                if not l_9SliceEditorAllowUnloadedImages_0 then
                    v21.openInstanceInEditor(v64);
                else
                    local _ = nil;
                    v21.openInstanceInEditor(v64, if not v63 then v64.ContentImageSize else v21.props.LoadingImageRef:getValue().ContentImageSize);
                end;
                v21.props.LoadingChanged(false);
                return ;
            else
                return ;
            end;
        end, function(v68, v69)
            if v69 ~= v21.loadingToken then
                return ;
            elseif v21._isMounted then
                if v68 then
                    print(v21.props.Localization:getText("Plugin", "ImageLoadErrorMessage"));
                end;
                v21.props.LoadingChanged(false);
                return ;
            else
                return ;
            end;
        end);
    end;
    v21.onImageChanged = function()
        l_RunService_0.RenderStepped:Wait();
        l_RunService_0.RenderStepped:Wait();
        if v21._isMounted then
            local l_instanceWatchedForImageChange_0 = v21.instanceWatchedForImageChange;
            if l_instanceWatchedForImageChange_0 ~= nil then
                v21.createAndRunPromiseForImageLoaded(l_instanceWatchedForImageChange_0, true);
            end;
            return ;
        else
            return ;
        end;
    end;
    v21.onSelectionChanged = function()
        local v71 = l_Selection_0:Get();
        if #v71 > 1 then
            return ;
        elseif #v71 == 0 then
            v21.disconnectImageChangedConnection();
            v21.openInstanceInEditor(nil);
            return ;
        else
            local v72 = v71[1];
            assert(v72);
            if v72 == v21.instanceUnderEdit then
                return ;
            else
                v21.createAndRunPromiseForImageLoaded(v72, false);
                return ;
            end;
        end;
    end;
    v21.connectImageChangedConnection = function(v73)
        if not v21.imageChangedConnection then
            v21.instanceWatchedForImageChange = v73;
            v21.imageChangedConnection = v73:GetPropertyChangedSignal("Image"):Connect(v21.onImageChanged);
        end;
    end;
    v21.disconnectImageChangedConnection = function()
        if v21.imageChangedConnection then
            v21.imageChangedConnection:Disconnect();
            v21.imageChangedConnection = nil;
        end;
        v21.instanceWatchedForImageChange = nil;
    end;
    v21.startListeningToSelection = function()
        if not v21.selectionChangedConnection then
            v21.selectionChangedConnection = l_Selection_0.SelectionChanged:Connect(v21.onSelectionChanged);
        end;
    end;
    v21.stopListeningToSelection = function()
        if v21.selectionChangedConnection then
            v21.selectionChangedConnection:Disconnect();
            v21.selectionChangedConnection = nil;
        end;
    end;
    v21.onSliceCenterEditButtonClicked = function(v74)
        if v74:IsA("ImageLabel") or v74:IsA("ImageButton") then
            if not l_9SliceEditorAllowUnloadedImages_0 then
                if v74.IsLoaded then
                    local l_ContentImageSize_0 = v74.ContentImageSize;
                    if not l_ContentImageSize_0 or l_ContentImageSize_0 == Vector2.new(0, 0) then
                        v21.showAlertDialog("ErrorMessageTitle", "ImageContentDimensionsErrorMessage");
                        return ;
                    end;
                else
                    v21.showAlertDialog("ErrorMessageTitle", "ImageLoadedErrorMessage", {
                        contentId = v74.Image
                    });
                    return ;
                end;
            end;
            if not l_9SliceEditorAllowUnloadedImages_0 then
                v21.openInstanceInEditor(v74);
                v21.connectImageChangedConnection(v74);
                return ;
            else
                v21.createAndRunPromiseForImageLoaded(v74, false);
                return ;
            end;
        else
            v21.showAlertDialog("ErrorMessageTitle", "InvalidInstanceErrorMessage");
            return ;
        end;
    end;
    if v22.WidgetEnabled then
        v21.startListeningToSelection();
    end;
    v21.onOpen9SliceEditorConnection = l_GuiService_0.Open9SliceEditor:Connect(v21.onSliceCenterEditButtonClicked);
end;
v16.didMount = function(v76)
    v76._isMounted = true;
    if v76.props.InitialEditorInstanceRequest then
        task.defer(function()
            if v76._isMounted then
                v76.onSliceCenterEditButtonClicked(v76.props.InitialEditorInstanceRequest);
            end;
        end);
    end;
end;
v16.didUpdate = function(v77, v78, _)
    if not v77.props.WidgetEnabled or v78.WidgetEnabled then
        if not (v77.props.WidgetEnabled or not v78.WidgetEnabled) then
            v77.stopListeningToSelection();
            v77.clearCurrentImageUnderEdit();
            v77.disconnectImageChangedConnection();
        end;
        return ;
    else
        v77.startListeningToSelection();
        return ;
    end;
end;
v16.willUnmount = function(v80)
    v80._isMounted = false;
    v80.stopListeningToSelection();
    v80.clearCurrentImageUnderEdit();
    v80.disconnectImageChangedConnection();
    if v80.onOpen9SliceEditorConnection then
        v80.onOpen9SliceEditorConnection:Disconnect();
        v80.onOpen9SliceEditorConnection = nil;
    end;
end;
v16.render = function(v81)
    local l_state_0 = v81.state;
    if not l_state_0.showingAlertTitleKey then
        return nil;
    else
        return v1.createElement(v11, {
            Enabled = true, 
            TitleKey = l_state_0.showingAlertTitleKey, 
            MessageKey = l_state_0.showingAlertMessageKey, 
            MessageKeyFormatTable = l_state_0.showingAlertMessageReplacements, 
            OnClose = v81.closeAlertDialog
        });
    end;
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v16));
