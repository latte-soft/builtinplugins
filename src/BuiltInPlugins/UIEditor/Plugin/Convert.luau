local v0 = require(script.Parent.Utility);
return {
    convertAbsoluteSizeToScaleOrOffset = function(_, v2, v3, v4, v5)
        local _ = v4;
        local l_UIPadding_0 = v5:FindFirstChildWhichIsA("UIPadding");
        local l_zero_0 = Vector2.zero;
        local l_zero_1 = Vector2.zero;
        if l_UIPadding_0 then
            l_zero_0 = v0:multUDimWithVector(UDim2.new(l_UIPadding_0.PaddingLeft, l_UIPadding_0.PaddingTop), v5.AbsoluteSize);
            l_zero_1 = v0:multUDimWithVector(UDim2.new(l_UIPadding_0.PaddingRight, l_UIPadding_0.PaddingBottom), v5.AbsoluteSize);
        end;
        local v10 = (v5.AbsoluteSize - l_zero_0) - l_zero_1;
        local v11 = 1;
        local v12 = 1;
        if v10.X ~= 0 then
            v11 = v10.X;
        end;
        if v10.Y ~= 0 then
            v12 = v10.Y;
        end;
        v10 = Vector2.new(v11, v12);
        if not v2 then
            local v13 = v3 - Vector2.new(v4.X.Scale, v4.Y.Scale) * v5.AbsoluteSize;
            return (UDim2.new(v4.X.Scale, v13.X, v4.Y.Scale, v13.Y));
        else
            local v14 = (v3 - Vector2.new(v4.X.Offset, v4.Y.Offset)) / v10;
            return (UDim2.new(v14.X, v4.X.Offset, v14.Y, v4.Y.Offset));
        end;
    end, 
    convertAbsolutePositionToScaleOrOffset = function(_, v16, v17, v18, v19, v20, v21)
        local _ = v19;
        local l_UIPadding_1 = v20:FindFirstChildWhichIsA("UIPadding");
        local l_zero_2 = Vector2.zero;
        local l_zero_3 = Vector2.zero;
        if l_UIPadding_1 then
            l_zero_2 = v0:multUDimWithVector(UDim2.new(l_UIPadding_1.PaddingLeft, l_UIPadding_1.PaddingTop), v20.AbsoluteSize);
            l_zero_3 = v0:multUDimWithVector(UDim2.new(l_UIPadding_1.PaddingRight, l_UIPadding_1.PaddingBottom), v20.AbsoluteSize);
        end;
        local v26 = v18 / 2;
        local v27 = (v17 + v26) - v0:rotate(v26, Vector2.zero, v20.AbsoluteRotation);
        local v28 = v20.AbsoluteSize / 2;
        local v29 = v0:rotate((v27 - ((v20.AbsolutePosition + v28) - v0:rotate(v28, Vector2.zero, v20.AbsoluteRotation))) + v0:rotate(v21 * v18, Vector2.zero, v20.AbsoluteRotation), Vector2.zero, -v20.AbsoluteRotation);
        local v30 = (v20.AbsoluteSize - l_zero_2) - l_zero_3;
        local v31 = 1;
        local v32 = 1;
        if v30.X ~= 0 then
            v31 = v30.X;
        end;
        if v30.Y ~= 0 then
            v32 = v30.Y;
        end;
        v30 = Vector2.new(v31, v32);
        if not v16 then
            local v33 = (v29 - l_zero_2) - Vector2.new(v19.X.Scale, v19.Y.Scale) * v20.AbsoluteSize;
            return (UDim2.new(v19.X.Scale, v33.X, v19.Y.Scale, v33.Y));
        else
            local v34 = ((v29 - l_zero_2) - Vector2.new(v19.X.Offset, v19.Y.Offset)) / v30;
            return (UDim2.new(v34.X, v19.X.Offset, v34.Y, v19.Y.Offset));
        end;
    end, 
    convertAbsoluteToScaleOrOffset = function(v35, v36, v37, v38, v39, v40, v41, v42, v43)
        return v35:convertAbsolutePositionToScaleOrOffset(v36, v38, v39, v40, v42, v43), (v35:convertAbsoluteSizeToScaleOrOffset(v37, v39, v41, v42));
    end
};
