local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_DEPRECATED_TextInput_0 = require(l_Parent_0.Packages.Framework).UI.DEPRECATED_TextInput;
local v4 = require(l_Parent_0.Src.Actions);
local v5 = require(l_Parent_0.Src.TagManager);
local v6 = v1.Component:extend("TagRenameTextInput");
v6.init = function(v7)
    v7.textBoxRef = v1.createRef();
    v7.enteredText = "";
    v7.onTextChanged = function(v8)
        v7.enteredText = v8;
    end;
    v7.onFocusLost = function(v9)
        local l_props_0 = v7.props;
        local l_tagMenu_0 = l_props_0.tagMenu;
        local l_groupMenu_0 = l_props_0.groupMenu;
        local v13 = false;
        if l_groupMenu_0 ~= nil then
            v13 = l_groupMenu_0 ~= "";
        end;
        local l_enteredText_0 = v7.enteredText;
        string.gsub(l_enteredText_0, "^%s+", "");
        if not v13 then
            if v9 and l_enteredText_0 ~= "" then
                v5.Get():Rename(l_tagMenu_0, l_enteredText_0);
                l_props_0.openTagMenu(l_enteredText_0);
            end;
            l_props_0.setRenaming(l_tagMenu_0, false);
            return ;
        else
            if v9 and l_enteredText_0 ~= "" then
                v5.Get():RenameGroup(l_groupMenu_0, l_enteredText_0);
                l_props_0.openGroupMenu(l_enteredText_0);
            end;
            l_props_0.setRenamingGroup(l_groupMenu_0, false);
            return ;
        end;
    end;
end;
v6.render = function(v15)
    local l_props_1 = v15.props;
    local l_tagMenu_1 = l_props_1.tagMenu;
    local l_groupMenu_1 = l_props_1.groupMenu;
    local v19 = false;
    if l_groupMenu_1 ~= nil then
        v19 = l_groupMenu_1 ~= "";
    end;
    return v1.createElement(l_DEPRECATED_TextInput_0, {
        Size = l_props_1.Size, 
        Style = "FilledRoundedBorder", 
        LayoutOrder = l_props_1.LayoutOrder, 
        ShouldFocus = true, 
        ForwardRef = v15.textBoxRef, 
        PlaceholderText = if not v19 then l_tagMenu_1 else l_groupMenu_1, 
        OnTextChanged = v15.onTextChanged, 
        OnFocusLost = v15.onFocusLost
    });
end;
v6.didMount = function(v20)
    v20.textBoxRef.current:CaptureFocus();
end;
return v2.connect(function(v21, _)
    return {
        tagMenu = v21.TagMenu, 
        groupMenu = v21.GroupMenu
    };
end, function(v23)
    return {
        openTagMenu = function(v24)
            v23(v4.OpenTagMenu(v24));
        end, 
        openGroupMenu = function(v25)
            v23(v4.OpenGroupMenu(v25));
        end, 
        setRenaming = function(v26, v27)
            v23(v4.SetRenaming(v26, v27));
        end, 
        setRenamingGroup = function(v28, v29)
            v23(v4.SetRenaming(v28, v29));
        end
    };
end)(v6);
