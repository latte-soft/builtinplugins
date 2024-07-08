local _ = script.Parent.Parent.Parent;
return function(v1, v2)
    if not (v2 ~= nil) or not v2:IsA("GuiBase2d") then
        return UDim2.new();
    else
        local l_AbsoluteSize_0 = v2.AbsoluteSize;
        return UDim2.fromScale(if l_AbsoluteSize_0.X ~= 0 then v1.X / l_AbsoluteSize_0.X else 0, if l_AbsoluteSize_0.Y ~= 0 then v1.Y / l_AbsoluteSize_0.Y else 0);
    end;
end;
