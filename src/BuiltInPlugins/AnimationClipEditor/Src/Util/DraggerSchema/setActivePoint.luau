return function(v0, v1)
    if not v1:isEmpty() then
        local v2, v3 = v1:getBoundingBox();
        v0:setInsertPoint(v2 * v3);
    end;
end;
