return function(_, _, v2)
    if v2.ClickedItem then
        return "Ready";
    else
        return "DragSelecting";
    end;
end;
