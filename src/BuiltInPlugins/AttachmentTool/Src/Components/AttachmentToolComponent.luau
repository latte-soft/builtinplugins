local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttachmentTool");
local l_MouseService_0 = game:GetService("MouseService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_HttpService_0 = game:GetService("HttpService");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v6 = require(l_script_FirstAncestor_0.Packages.Roact);
local v7 = require(l_script_FirstAncestor_0.Src.AttachmentToolModel);
local v8 = require(l_DraggerFramework_0.Utility.ViewChangeDetector);
local v9 = v6.PureComponent:extend("AttachmentToolComponent");
v9.init = function(v10)
    v10:setup(v10.props);
end;
v9.didMount = function(_)
end;
v9.willUnmount = function(v12)
    v12:teardown();
end;
v9.willUpdate = function(v13, v14, _)
    if not (v14.DraggerContext == v13.props.DraggerContext and v14.DraggerSchema == v13.props.DraggerSchema) or v14.DraggerSettings ~= v13.props.DraggerSettings then
        v13:teardown();
        v13:setup(v14);
    end;
end;
v9.render = function(v16)
    return v16._attachmentToolModel:render();
end;
v9.setup = function(v17, v18)
    assert(v18.DraggerContext);
    assert(v18.DraggerSchema);
    assert(v18.DraggerSettings);
    assert(v18.ClosePluginCallback);
    v17._selectionBoundsAreDirty = false;
    v17._viewBoundsAreDirty = false;
    v17._bindName = "AttachmentToolViewUpdate";
    v17._bindName = v17._bindName .. l_HttpService_0:GenerateGUID(false);
    v17._attachmentToolModel = v7.new(v18.DraggerContext, v18.DraggerSchema, v18.DraggerSettings, v18.ClosePluginCallback, function()
        if v17._isMounted then
            if not v17.forceUpdate then
                v17:setState({});
            else
                v17:forceUpdate();
                return ;
            end;
        end;
    end, function()
        v17._viewBoundsAreDirty = true;
    end, function()
        v17._selectionBoundsAreDirty = true;
    end);
    v17._attachmentToolModel:_processSelected();
    local l_Mouse_0 = v18.Mouse;
    v17._inputBeganConnection = l_UserInputService_0.InputBegan:Connect(function(v20, v21)
        if not v21 then
            local l_UserInputType_0 = v20.UserInputType;
            if l_UserInputType_0 == Enum.UserInputType.Keyboard then
                v17._attachmentToolModel:_processKeyDown(v20.KeyCode);
                return ;
            else
                if not (l_UserInputType_0 ~= Enum.UserInputType.MouseButton1) or l_UserInputType_0 == Enum.UserInputType.Touch then
                    v17._attachmentToolModel:_processMouseDown();
                end;
                return ;
            end;
        else
            return ;
        end;
    end);
    v17._inputEndedConnection = l_UserInputService_0.InputEnded:Connect(function(v23, v24)
        if not v24 then
            local l_UserInputType_1 = v23.UserInputType;
            if l_UserInputType_1 == Enum.UserInputType.Keyboard then
                v17._attachmentToolModel:_processKeyUp(v23.KeyCode);
                return ;
            else
                if not (l_UserInputType_1 ~= Enum.UserInputType.MouseButton1) or l_UserInputType_1 == Enum.UserInputType.Touch then
                    v17._attachmentToolModel:_processMouseUp();
                end;
                return ;
            end;
        else
            return ;
        end;
    end);
    v17._mouseEnterConnection = l_MouseService_0.MouseEnterStudioViewport:Connect(function()
        v17._attachmentToolModel:_processMouseEnter();
    end);
    v17._mouseLeaveConnection = l_MouseService_0.MouseLeaveStudioViewport:Connect(function()
        v17._attachmentToolModel:_processMouseLeave();
    end);
    local v26 = v8.new(l_Mouse_0);
    local v27 = v18.DraggerContext:shouldUseLocalSpace();
    l_RunService_0:BindToRenderStep(v17._bindName, Enum.RenderPriority.First.Value, function()
        if v17._isMounted then
            v17._attachmentToolModel:update();
            local v28 = false;
            local v29 = false;
            if v26:poll() then
                v28 = true;
            end;
            if v17._selectionBoundsAreDirty then
                v17._selectionBoundsAreDirty = false;
                v29 = true;
            end;
            if v17._viewBoundsAreDirty then
                v17._viewBoundsAreDirty = false;
                v28 = true;
            end;
            local v30 = v18.DraggerContext:shouldUseLocalSpace();
            if v30 ~= v27 then
                v29 = true;
            end;
            if v29 then
                v17._attachmentToolModel:_processSelectionChanged();
            end;
            if v28 then
                v17._attachmentToolModel:_processViewChanged();
            end;
            v27 = v30;
            return ;
        else
            return ;
        end;
    end);
    v17._isMounted = true;
end;
v9.teardown = function(v31)
    v31._isMounted = false;
    v31._inputBeganConnection:Disconnect();
    v31._inputBeganConnection = nil;
    v31._inputEndedConnection:Disconnect();
    v31._inputEndedConnection = nil;
    v31._mouseEnterConnection:Disconnect();
    v31._mouseEnterConnection = nil;
    v31._mouseLeaveConnection:Disconnect();
    v31._mouseLeaveConnection = nil;
    l_RunService_0:UnbindFromRenderStep(v31._bindName);
    v31._attachmentToolModel:_processDeselected();
end;
return v9;
