local v0 = require(script.Parent.Parent.Parent.Src.Util.sanitizeIconSearchInput);
return function(v1, v2)
    v1 = v1 or "";
    if not game:GetFastFlag("TagEditorIconPickerSearchReset") then
        if not (v2.type == "ToggleIconPicker") or v2.tag then
            if v2.type == "SetIconSearch" then
                assert(typeof(v2.text) == "string");
                return v2.text;
            end;
        else
            return "";
        end;
    elseif v2.type == "ToggleIconPicker" then
        return "";
    elseif v2.type == "SetIconSearch" then
        assert(typeof(v2.text) == "string");
        return v0(v2.text);
    end;
    return v1;
end;
