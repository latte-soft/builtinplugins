local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_VIEW_ID_0 = require(l_Parent_0.Src.Util.Constants).VIEW_ID;
local l_Actions_0 = l_Parent_0.Src.Actions;
return v1.createReducer({
    ActiveView = l_VIEW_ID_0.RBXEvent, 
    Parameters = {
        Namespace = "UpdateNotificationBadge", 
        Detail = "{\"badgeString\": \"1\"}", 
        DetailType = "NotificationIcon"
    }, 
    ThemeName = "dark", 
    MemStoragePair = {
        Key = "ThemeUpdate", 
        Value = "dark"
    }, 
    CurrentEventName = l_VIEW_ID_0.RBXEvent
}, {
    [require(l_Actions_0.SetView).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            ActiveView = v6.view
        });
    end, 
    [require(l_Actions_0.SetRBXParameters).name] = function(v7, v8)
        return v2.Dictionary.join(v7, {
            Parameters = v8.parameters
        });
    end, 
    [require(l_Actions_0.SetTheme).name] = function(v9, v10)
        return v2.Dictionary.join(v9, {
            ThemeName = v10.themeName
        });
    end, 
    [require(l_Actions_0.SetMemStoragePair).name] = function(v11, v12)
        return v2.Dictionary.join(v11, {
            MemStoragePair = {
                Key = v12.pair.Key or v11.MemStoragePair.Key, 
                Value = v12.pair.Value or v11.MemStoragePair.Value
            }
        });
    end, 
    [require(l_Actions_0.ClearMemStoragePair).name] = function(v13, _)
        return v2.Dictionary.join(v13, {
            MemStoragePair = {
                Key = "", 
                Value = ""
            }
        });
    end, 
    [require(l_Actions_0.ClearRBXParameters).name] = function(v15, _)
        return v2.Dictionary.join(v15, {
            Parameters = {
                Detail = "", 
                Namespace = "", 
                DetailType = ""
            }
        });
    end, 
    [require(l_Actions_0.ChangeCurrentEventName).name] = function(v17, v18)
        return v2.Dictionary.join(v17, {
            CurrentEventName = v18.name
        });
    end
});
