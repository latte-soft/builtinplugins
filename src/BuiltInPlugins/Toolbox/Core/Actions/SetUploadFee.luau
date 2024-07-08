return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0, v1, v2)
    assert(type(v0) == "boolean", "isUploadFeeEnabled must be a boolean");
    local v3 = true;
    if v1 ~= nil then
        v3 = type(v1) == "number";
    end;
    assert(v3, "uploadFee must be a number or nil");
    v3 = true;
    if v2 ~= nil then
        v3 = type(v2) == "boolean";
    end;
    assert(v3, "canAffordUploadFee must be a boolean or nil");
    return {
        isUploadFeeEnabled = v0, 
        uploadFee = v1, 
        canAffordUploadFee = v2
    };
end);
