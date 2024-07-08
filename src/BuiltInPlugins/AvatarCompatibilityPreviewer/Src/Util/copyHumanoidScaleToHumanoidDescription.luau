return function(v0, v1)
    local function _(v2, v3)
        local l_v1_FirstChild_0 = v1:FindFirstChild(v2);
        if l_v1_FirstChild_0 ~= nil and l_v1_FirstChild_0:IsA("NumberValue") then
            v0[v3] = l_v1_FirstChild_0.Value;
            return ;
        else
            return ;
        end;
    end;
    local l_BodyDepthScale_0 = v1:FindFirstChild("BodyDepthScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.DepthScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("BodyHeightScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.HeightScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("BodyProportionScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.ProportionScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("BodyWidthScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.WidthScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("BodyTypeScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.BodyTypeScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("HeadScale");
    if l_BodyDepthScale_0 ~= nil then
        if l_BodyDepthScale_0:IsA("NumberValue") then
            v0.HeadScale = l_BodyDepthScale_0.Value;
        else
            return ;
        end;
    end;
end;
