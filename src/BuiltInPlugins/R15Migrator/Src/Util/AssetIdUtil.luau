return {
    getUnknownAssetId = function()
        return 0;
    end, 
    isValidAssetId = function(v0)
        if v0 then
            return v0 ~= 0;
        else
            return false;
        end;
    end
};
