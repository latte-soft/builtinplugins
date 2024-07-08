local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local v4 = require(l_Parent_0.Src.Thunks.Change.PasteStyleInstanceAttribute);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v7)
    return function(v8, v9)
        local v11 = {
            Id = "Token_Empty", 
            Children = {
                {
                    Id = "Paste", 
                    Text = v9.Localization:getText("ContextMenu", "Paste"), 
                    Enabled = v8:getState().Clipboard.Attribute ~= nil, 
                    Icon = v3.paste(), 
                    OnItemClicked = function(_)
                        v8:dispatch(v4(v7));
                    end
                }
            }
        };
        v2.trackClicks(v11, v9.Telemetry);
        v2.showContextMenu(v9.Plugin, v11);
    end;
end;
