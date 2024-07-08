local _ = function(_, _, v2)
    return {
        ClickedSelectable = v2.ClickedSelectable, 
        HandleId = "Part"
    };
end;
return function(_, v5, v6)
    if (not v5:doesAllowFreeformDrag() or not v6.SelectionNowContainsSelectable) or not v6.ClickedSelectable:IsA("PVInstance") then
        return "Ready";
    else
        return "FreeformSelectionDrag", {
            ClickedSelectable = v6.ClickedSelectable, 
            HandleId = "Part"
        };
    end;
end;
