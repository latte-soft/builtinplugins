local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local l_Clipboard_0 = l_Parent_0.Src.Actions.Clipboard;
return v1.createReducer({
    Instance = nil, 
    Attribute = nil, 
    Property = nil
}, {
    [require(l_Clipboard_0.CopyInstanceToClipboard).name] = function(v4, v5)
        return l_join_0(v4, {
            Instance = v5.instance
        });
    end, 
    [require(l_Clipboard_0.CopyAttributeToClipboard).name] = function(v6, v7)
        return l_join_0(v6, {
            Attribute = {
                Name = v7.attributeName, 
                Value = v7.attributeValue
            }
        });
    end, 
    [require(l_Clipboard_0.CopyPropertyToClipboard).name] = function(v8, v9)
        return l_join_0(v8, {
            Property = {
                Name = v9.propertyName, 
                Value = v9.propertyValue
            }
        });
    end
});
