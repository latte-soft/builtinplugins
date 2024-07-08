local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.React);
local l_useEffect_0 = v3.useEffect;
local l_useLayoutEffect_0 = v3.useLayoutEffect;
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v7 = require(l_Parent_0.Src.Hooks.useDispatch);
local v8 = require(l_Parent_0.Src.Util.TreeListener);
local v9 = require(l_Parent_0.Src.Actions.Window.SetIsDirty);
local v10 = require(l_Parent_0.Src.Thunks.StyleTree.UpdateStyleSheetReferences);
local _ = require(l_Parent_0.Src.Types);
local v12 = {
    l_ReplicatedStorage_0
};
return v2.connect(function(v13)
    return {
        IsDirty = v13.Window.IsDirty
    };
end)(function(v14)
    local v15 = v7();
    local function v19(v16, v17, v18)
        if not (v17 ~= "Destroying") or v17 == "DescendantRemoving" then
            if not (not (v18.Parent == nil) or not v18:IsA("StyleSheet")) then
                v15(v10(v18));
            end;
        elseif not (not (v17 == "PropertyChanged" and v18 == "Name") or not v16:IsA("StyleSheet")) then
            v15(v10(v16));
        end;
        v15(v9(true));
    end;
    l_useLayoutEffect_0(function()
        if v14.IsDirty then
            v15(v9(false));
        end;
    end, {
        v14.IsDirty
    });
    l_useEffect_0(function()
        local v20 = v8.new(v12, v19, {
            "Name", 
            "Parent", 
            "Selector"
        }, {
            "StyleSheet", 
            "Folder", 
            "StyleRule"
        });
        return function()
            if v20 then
                v20:destroyListener();
            end;
            v20 = nil;
        end;
    end, {});
    return nil;
end);
