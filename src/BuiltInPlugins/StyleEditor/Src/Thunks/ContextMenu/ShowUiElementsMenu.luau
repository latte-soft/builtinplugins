local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v2 = require(l_Parent_0.Src.Util.MenuHelpers);
local v3 = require(l_Parent_0.Src.Resources.ModernIcons);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v5 = require(l_Thunks_0.Change.CreateStyleRule);
local v6 = require(l_Thunks_0.Change.PasteInstanceInto);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v9)
    return function(v10, v11)
        local v12 = v10:getState();
        local l_Localization_0 = v11.Localization;
        local v16 = {
            Id = "DesignCategory_UiElements", 
            Children = {
                {
                    Id = "New", 
                    Text = l_Localization_0:getText("ContextMenu", "New"), 
                    Icon = v3.new(), 
                    Children = v2.getClassTypeActions(function(v14)
                        v10:dispatch(v5(v9, v14.Data.Selector, true));
                    end, l_Localization_0)
                }, 
                {
                    Id = "PasteInto", 
                    Text = l_Localization_0:getText("ContextMenu", "PasteInto"), 
                    Icon = v3.paste(), 
                    Enabled = v12.Clipboard.Instance ~= nil, 
                    OnItemClicked = function(_)
                        v10:dispatch(v6(v9));
                    end
                }
            }
        };
        v2.trackClicks(v16, v11.Telemetry);
        v2.showContextMenu(v11.Plugin, v16);
    end;
end;
