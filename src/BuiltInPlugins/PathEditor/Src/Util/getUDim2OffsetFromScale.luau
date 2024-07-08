return function(v0, v1)
    if not (v1 ~= nil) or not v1:IsA("GuiBase2d") then
        return UDim2.new();
    else
        return UDim2.fromOffset(v0.X.Offset + v0.X.Scale * v1.AbsoluteSize.X, v0.Y.Offset + v0.Y.Scale * v1.AbsoluteSize.Y);
    end;
end;
