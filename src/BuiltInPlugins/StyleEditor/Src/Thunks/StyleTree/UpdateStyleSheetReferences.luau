local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local v3 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.Window.DeselectItem);
local v6 = require(l_Actions_0.Window.SetDesignSheet);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
local function v16(v9)
    local v10 = false;
    local l_l_ReplicatedStorage_0_0 = l_ReplicatedStorage_0;
    local v12 = v9.Parent == nil;
    local v13 = "Derive from " .. v9.Name;
    for _, v15 in l_l_ReplicatedStorage_0_0:GetDescendants() do
        if not ((not v15:IsA("StyleDerive") or not v15.Parent) or not v2.isPartOfDesignSystem(v15.Parent)) and v15.StyleSheet == v9 then
            if not v12 then
                v15.Name = v13;
            else
                v15.Parent = nil;
            end;
            v10 = true;
        end;
    end;
    return v10;
end;
return function(v17)
    return function(v18, v19)
        local v20 = v18:getState();
        if v17.Parent == nil then
            v18:dispatch(v5((v3.createItemId(v17))));
            if v20.Window.DesignSheet == v17 then
                v18:dispatch(v6(nil));
            end;
        end;
        v19.recordChange({
            Name = "StyleEditor/UpdateStyleSheetReferences", 
            DisplayName = "StyleEditor - Update StyleSheet References", 
            DoChange = function()
                if not v16(v17) then
                    return Enum.FinishRecordingOperation.Cancel;
                else
                    return Enum.FinishRecordingOperation.Append;
                end;
            end
        });
    end;
end;
