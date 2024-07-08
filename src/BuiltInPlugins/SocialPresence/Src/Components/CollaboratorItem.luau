local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v8 = require(l_Parent_0.Src.Components.Thumbnails.CollaboratorActivityThumbnail);
local v9 = require(l_Parent_0.Src.Components.JumpToButton);
local v10 = require(l_Parent_0.Src.Components.CollaboratorStatus);
local l_StudioService_0 = game:GetService("StudioService");
local l_TweenService_0 = game:GetService("TweenService");
local l_ScriptRegistrationService_0 = game:GetService("ScriptRegistrationService");
local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
local function v18(v15, v16)
    local v17 = l_Localization_0.use();
    if not v15 then
        if v16 then
            return string.format(v17:getText("Collaborator", "Editing"), v16);
        else
            return v17:getText("Collaborator", "Workspace");
        end;
    else
        return v17:getText("Collaborator", "Idle");
    end;
end;
return function(v19)
    local v20, v21 = v1.useState(false);
    local v22, v23 = v1.useState(nil);
    local v24 = l_Stylizer_0:use();
    local v25 = l_Localization_0.use();
    local v26 = v1.useRef(nil);
    v1.useEffect(function()
        local v27 = nil;
        if not (v19.Status ~= v10.Scripting) or v19.Status == v10.PrivateScripting then
            local l_l_ScriptRegistrationService_0_SourceContainerByScriptGuid_0 = l_ScriptRegistrationService_0:GetSourceContainerByScriptGuid(v19.CurDocGUID);
            if not l_l_ScriptRegistrationService_0_SourceContainerByScriptGuid_0 then
                v23(v25:getText("Collaborator", "DeletedScript"));
            else
                v23(l_l_ScriptRegistrationService_0_SourceContainerByScriptGuid_0.Name);
                v27 = l_l_ScriptRegistrationService_0_SourceContainerByScriptGuid_0:GetPropertyChangedSignal("Name"):Connect(function()
                    v23(l_l_ScriptRegistrationService_0_SourceContainerByScriptGuid_0.Name);
                end);
            end;
        elseif not (v19.Status ~= v10.Editing3D) or v19.Status == v10.None then
            v23(nil);
        else
            error("Unsupported collaborator status: " .. v19.Status);
        end;
        return function()
            if v27 then
                v27:Disconnect();
            end;
        end;
    end, {
        v19.Status, 
        v19.CurDocGUID
    });
    local v29 = not v19.IsIdle;
    if v29 then
        if v19.Status ~= v10.Editing3D then
            v29 = false;
            if not (v19.Status == v10.Scripting) then
                goto label0;
            end;
        end;
        v29 = v19.CanJumpBack or v19.Id ~= l_l_StudioService_0_UserId_0;
    end;
    ::label0::;
    v1.useEffect(function()
        if not v29 then
            l_TweenService_0:Create(v26.current, TweenInfo.new(0.2, Enum.EasingStyle.Cubic), {
                Size = v24.collaboratorItem.size
            }):Play();
        end;
    end, {
        v29
    });
    local v30 = {
        Icon = v1.createElement(v8, {
            Size = v24.collaboratorItem.thumbnailSize, 
            Id = v19.Id, 
            RingColor = v19.Color, 
            IsIdle = v19.IsIdle
        }), 
        UsernameLabel = v1.createElement(l_TextLabel_0, {
            Text = v19.Username, 
            TextSize = 18, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Position = v24.collaboratorItem.usernamePosition
        }), 
        EditingLabel = v1.createElement(l_TextLabel_0, {
            RichText = true, 
            Style = "SubText", 
            Text = v18(v19.IsIdle, v22), 
            TextSize = 14, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Position = v24.collaboratorItem.subtitlePosition
        })
    };
    if not (not v20 or not v29) then
        v30.JumpTo = v1.createElement(v9, {
            Id = v19.Id, 
            OnJump = v19.OnJump
        });
    end;
    return v1.createElement(l_Pane_0, {
        Style = "RoundBox", 
        Size = v24.collaboratorItem.size, 
        Padding = 8, 
        BackgroundColor3 = not not v20 and v24.collaboratorItem.hoveredBackground or nil, 
        ForwardRef = v26, 
        [v1.Event.MouseEnter] = function()
            v21(true);
            if v29 then
                v26.current.ClipsDescendants = true;
                l_TweenService_0:Create(v26.current, TweenInfo.new(0.2), {
                    Size = v24.collaboratorItem.expandedSize
                }):Play();
            end;
        end, 
        [v1.Event.MouseLeave] = function()
            v21(false);
            l_TweenService_0:Create(v26.current, TweenInfo.new(0.2, Enum.EasingStyle.Cubic), {
                Size = v24.collaboratorItem.size
            }):Play();
        end
    }, v30);
end;
