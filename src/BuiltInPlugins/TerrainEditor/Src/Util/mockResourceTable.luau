return {
    GetTranslator = function()
        return {
            FormatByKey = function(_, v1, v2)
                local v3 = "";
                if v2 then
                    assert(typeof(v2) == "table", "Args must be a table");
                    for v4, v5 in v2, nil, nil do
                        v3 = ("%*,%*:%*"):format(v3, v4, v5);
                    end;
                    v3 = string.sub(v3, 2);
                end;
                return (("%*:[%*]"):format(v1, v3));
            end
        };
    end
};
