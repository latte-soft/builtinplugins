local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_PreviewConstants_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared.PreviewConstants;
local v3 = require(l_Parent_0.Src.Actions.SetAccessoryTypeInfo);
local v4 = require(l_Parent_0.Src.Actions.SetAttachmentPoint);
local v5 = require(l_Parent_0.Src.Actions.SelectPreviewTab);
local v6 = require(l_Parent_0.Src.Actions.SetToolMode);
local v7 = require(l_Parent_0.Src.Actions.SetEditingCage);
local v8 = require(l_Parent_0.Src.Util.Constants);
local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
return function()
    return function(v11)
        v11:dispatch(v3(v1.None));
        v11:dispatch(v4({
            ItemCFrame = CFrame.new(), 
            AttachmentCFrame = CFrame.new()
        }));
        l_Selection_0:Set({});
        v11:dispatch(v7(v1.None));
        v11:dispatch(v5(l_PreviewConstants_0.TABS_KEYS.None));
        v11:dispatch(v6(v8.TOOL_MODE.None));
        l_ChangeHistoryService_0:SetEnabled(true);
    end;
end;
