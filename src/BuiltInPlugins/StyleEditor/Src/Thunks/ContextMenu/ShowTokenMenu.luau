local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Util.TokenHelpers);
local v4 = require(l_Parent_0.Src.Resources.ModernIcons);
local v5 = require(l_Parent_0.Src.Actions.Clipboard.CopyAttributeToClipboard);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v7 = require(l_Thunks_0.Change.DuplicateAttribute);
local v8 = require(l_Thunks_0.Change.PasteStyleInstanceAttribute);
local v9 = require(l_Thunks_0.Change.SetStyleSheetTokenType);
local v10 = require(l_Thunks_0.Change.SetStyleInstanceAttribute);
local v11 = require(l_Thunks_0.Change.UnlinkStyleSheetAttributeTokenReference);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
local function _(v14, v15)
    return v3.parseAttributeName((v14:GetAttribute(v15))) ~= nil;
end;
return function(v17, v18)
    return function(v19, v20)
        local v21 = v19:getState();
        local l_Localization_0 = v20.Localization;
        local l_v17_Attribute_0 = v17:GetAttribute(v18);
        local v32 = {
            Id = "Token", 
            Children = {
                {
                    Id = "ChangeType", 
                    Text = l_Localization_0:getText("ContextMenu", "ChangeType"), 
                    Children = v2.getAttributeTypeActions(v2.AttributeTypes, function(v24)
                        local v25 = if not v24.Data then nil else v24.Data.Type;
                        if v25 then
                            v19:dispatch(v9(v17, v18, v25));
                            return ;
                        else
                            warn("Cannot change to nil type");
                            return ;
                        end;
                    end)
                }, 
                if not (v3.parseAttributeName((v17:GetAttribute(v18))) ~= nil) then {
                    Id = "LinkToken", 
                    Text = l_Localization_0:getText("ContextMenu", "LinkToken"), 
                    Icon = v4.Standard.TokenSheet(), 
                    OnItemClicked = function(_)
                        v19:dispatch(v9(v17, v18, "TokenReference"));
                    end
                } else {
                    Id = "UnlinkToken", 
                    Text = l_Localization_0:getText("ContextMenu", "UnlinkToken"), 
                    Icon = v4.Standard.TokenSheet(), 
                    OnItemClicked = function(_)
                        v19:dispatch(v11(v17, v18));
                    end
                }, 
                {
                    Id = "Copy", 
                    Text = l_Localization_0:getText("ContextMenu", "Copy"), 
                    Icon = v4.copy(), 
                    OnItemClicked = function(_)
                        v19:dispatch(v5(v18, l_v17_Attribute_0));
                    end
                }, 
                {
                    Id = "Paste", 
                    Text = l_Localization_0:getText("ContextMenu", "Paste"), 
                    Enabled = v21.Clipboard.Attribute ~= nil, 
                    Icon = v4.paste(), 
                    OnItemClicked = function(_)
                        v19:dispatch(v8(v17));
                    end
                }, 
                {
                    Id = "Duplicate", 
                    Text = l_Localization_0:getText("ContextMenu", "Duplicate"), 
                    Icon = v4.duplicate(), 
                    OnItemClicked = function(_)
                        v19:dispatch(v7(v17, v18));
                    end
                }, 
                {
                    Id = "Delete", 
                    Text = l_Localization_0:getText("ContextMenu", "Delete"), 
                    Icon = v4.delete(), 
                    OnItemClicked = function(_)
                        v19:dispatch(v10(v17, v18, nil));
                    end
                }
            }
        };
        v2.trackClicks(v32, v20.Telemetry);
        v2.showContextMenu(v20.Plugin, v32);
    end;
end;
