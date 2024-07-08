return function(_, _, v2)
    if not v2.SelectionNowContainsSelectable then
        return "DragSelecting";
    else
        return "Ready";
    end;
end;
