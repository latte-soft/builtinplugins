local function _(v0, v1)
    if v1 ~= nil and v1[v0] ~= nil then
        return string.gsub(v0, "-", "_");
    else
        return v0;
    end;
end;
local function v10(v3)
    local v4 = {};
    for v5, v6 in ipairs(v3) do
        local v7 = v6.identifier.key or "";
        local v8 = v6.identifier.source or "";
        local v9 = v6.identifier.context or "";
        v4[v7] = v4[v7] or {};
        v4[v7][v8] = v4[v7][v8] or {};
        v4[v7][v8][v9] = v4[v7][v8][v9] or v5;
    end;
    return v4;
end;
local _ = function(v11)
    local v12 = {};
    for _, v14 in ipairs(v11.translations) do
        v12[v14.locale] = v14.translationText;
    end;
    return v12;
end;
local function v45(v16, v17, v18, v19, v20, v21, v22)
    local v23 = {};
    local v24 = {};
    local v25 = {};
    for _, v27 in ipairs(v17.translations) do
        v25[v27.locale] = v27.translationText;
    end;
    local l_v25_0 = v25;
    local v29 = {};
    for _, v31 in ipairs(v16.translations) do
        v29[v31.locale] = v31.translationText;
    end;
    v25 = v29;
    for _, v33 in ipairs(v16.translations) do
        v24[v33.locale] = true;
        if not (not (l_v25_0[v33.locale] == nil) or not v19) then
            local l_locale_0 = v33.locale;
            table.insert(v23, {
                locale = if v21 ~= nil and v21[l_locale_0] ~= nil then string.gsub(l_locale_0, "-", "_") else l_locale_0, 
                translationText = v33.translationText, 
                delete = true
            });
            v18.numRemovedTranslations = v18.numRemovedTranslations + 1;
            v24[v33.locale] = false;
        end;
    end;
    v29 = {};
    for _, v36 in ipairs(v17.translations) do
        local v37 = v25[v36.locale];
        if ((v37 == nil and v21 ~= nil) and v21[v36.locale] ~= nil) and v21[v36.locale] ~= v20 then
            table.insert(v29, v36);
        elseif v37 ~= v36.translationText then
            local v38 = {};
            local l_locale_1 = v36.locale;
            v38.locale = if v21 ~= nil and v21[l_locale_1] ~= nil then string.gsub(l_locale_1, "-", "_") else l_locale_1;
            v38.translationText = v36.translationText;
            v38.delete = false;
            table.insert(v23, v38);
            v24[v36.locale] = true;
            if v37 ~= nil then
                v18.numChangedTranslations = v18.numChangedTranslations + 1;
            else
                v18.numAddedTranslations = v18.numAddedTranslations + 1;
            end;
        end;
    end;
    for _, v41 in ipairs(v29) do
        local v42 = v21[v41.locale];
        if not v24[v42] then
            warn(v22:getText("UploadDialogContent", "ParentLangaugeTranslationMissing", {
                locale = "\"" .. v41.locale .. "\"", 
                language = "\"" .. v42 .. "\"", 
                key = "\"" .. v17.identifier.key .. "\"", 
                source = "\"" .. v17.identifier.source .. "\"", 
                context = "\"" .. v17.identifier.context .. "\""
            }));
        else
            local v43 = {};
            local l_locale_2 = v41.locale;
            v43.locale = if v21 ~= nil and v21[l_locale_2] ~= nil then string.gsub(l_locale_2, "-", "_") else l_locale_2;
            v43.translationText = v41.translationText;
            v43.delete = false;
            table.insert(v23, v43);
            v18.numAddedTranslations = v18.numAddedTranslations + 1;
        end;
    end;
    return {
        identifier = {
            key = v17.identifier.key, 
            source = v17.identifier.source, 
            context = v17.identifier.context
        }, 
        metadata = v17.metadata, 
        translations = v23, 
        delete = false
    };
end;
local function v63(v46, v47, v48, v49, v50)
    v47.numAddedEntries = v47.numAddedEntries + 1;
    local v51 = {};
    local v52 = {};
    local v53 = {};
    for _, v55 in ipairs(v46.translations) do
        if (v49 ~= nil and v49[v55.locale] ~= nil) and v49[v55.locale] ~= v48 then
            table.insert(v52, v55);
        else
            local v56 = {};
            local l_locale_3 = v55.locale;
            v56.locale = if v49 ~= nil and v49[l_locale_3] ~= nil then string.gsub(l_locale_3, "-", "_") else l_locale_3;
            v56.translationText = v55.translationText;
            v56.delete = false;
            table.insert(v51, v56);
            v47.numAddedTranslations = v47.numAddedTranslations + 1;
            v53[v55.locale] = true;
        end;
    end;
    for _, v59 in ipairs(v52) do
        local v60 = v49[v59.locale];
        if not v53[v60] then
            warn(v50:getText("UploadDialogContent", "ParentLangaugeTranslationMissing", {
                locale = "\"" .. v59.locale .. "\"", 
                language = "\"" .. v60 .. "\"", 
                key = "\"" .. v46.identifier.key .. "\"", 
                source = "\"" .. v46.identifier.source .. "\"", 
                context = "\"" .. v46.identifier.context .. "\""
            }));
        else
            local v61 = {};
            local l_locale_4 = v59.locale;
            v61.locale = if v49 ~= nil and v49[l_locale_4] ~= nil then string.gsub(l_locale_4, "-", "_") else l_locale_4;
            v61.translationText = v59.translationText;
            v61.delete = false;
            table.insert(v51, v61);
            v47.numAddedTranslations = v47.numAddedTranslations + 1;
        end;
    end;
    return {
        identifier = {
            key = v46.identifier.key, 
            source = v46.identifier.source, 
            context = v46.identifier.context
        }, 
        metadata = v46.metadata, 
        translations = v51, 
        delete = false
    };
end;
local function v71(v64, v65, v66)
    v65.numRemovedEntries = v65.numRemovedEntries + 1;
    local v67 = {};
    for _, v69 in ipairs(v64.translations) do
        local l_locale_5 = v69.locale;
        table.insert(v67, {
            locale = if v66 ~= nil and v66[l_locale_5] ~= nil then string.gsub(l_locale_5, "-", "_") else l_locale_5, 
            translationText = v69.translationText, 
            delete = true
        });
        v65.numRemovedTranslations = v65.numRemovedTranslations + 1;
    end;
    return {
        identifier = {
            key = v64.identifier.key, 
            source = v64.identifier.source, 
            context = v64.identifier.context
        }, 
        metadata = v64.metadata, 
        translations = v67, 
        delete = true
    };
end;
local function v99(v72, v73, v74, v75, v76, v77, v78)
    local v79 = v10(v74);
    local v80 = v10(v73);
    local v81 = {};
    local v82 = {
        numAddedTranslations = 0, 
        numChangedTranslations = 0, 
        numRemovedTranslations = 0, 
        numAddedEntries = 0, 
        numRemovedEntries = 0, 
        makePatch = function()
            return {
                name = v72, 
                entries = v81
            };
        end
    };
    local function _(v83, v84, v85, v86)
        if (v83[v84] ~= nil and v83[v84][v85] ~= nil) and v83[v84][v85][v86] ~= nil then
            return v83[v84][v85][v86];
        else
            return 0;
        end;
    end;
    for _, v89 in pairs(v73) do
        local l_key_0 = v89.identifier.key;
        local l_source_0 = v89.identifier.source;
        local l_context_0 = v89.identifier.context;
        local v93 = if (v79[l_key_0] ~= nil and v79[l_key_0][l_source_0] ~= nil) and v79[l_key_0][l_source_0][l_context_0] ~= nil then v79[l_key_0][l_source_0][l_context_0] else 0;
        if v93 == 0 then
            if v75 then
                table.insert(v81, (v71(v89, v82, v77)));
            end;
        else
            l_key_0 = nil;
            l_key_0 = v45(v89, v74[v93], v82, v75, v76, v77, v78);
            if not (next(l_key_0.translations) == nil) or l_key_0.metadata.example ~= v89.metadata.example then
                table.insert(v81, l_key_0);
            end;
        end;
    end;
    for _, v95 in pairs(v74) do
        local l_key_1 = v95.identifier.key;
        local l_source_1 = v95.identifier.source;
        local l_context_1 = v95.identifier.context;
        if if (v80[l_key_1] ~= nil and v80[l_key_1][l_source_1] ~= nil) and v80[l_key_1][l_source_1][l_context_1] ~= nil then v80[l_key_1][l_source_1][l_context_1] else 0 == 0 then
            table.insert(v81, (v63(v95, v82, v76, v77, v78)));
        end;
    end;
    return v82;
end;
local function v101(v100)
    return {
        identifier = {
            key = v100.identifier.key, 
            source = v100.identifier.source, 
            context = v100.identifier.context
        }, 
        metadata = {
            example = v100.metadata and v100.metadata.example
        }, 
        translations = {}, 
        delete = v100.delete
    };
end;
return {
    MakePatchEntryToChangeRow = v45, 
    DiffTables = v99, 
    SplitByLimits = function(v102, v103, v104)
        local v105 = {};
        local v106 = nil;
        local v107 = nil;
        local v108 = nil;
        local v109 = nil;
        local function _()
            v106 = nil;
            v107 = nil;
        end;
        local function _()
            v107 = nil;
            v109 = v109 + 1;
            if v103 <= v109 then
                v106 = nil;
            end;
        end;
        local function v113(v112)
            if not v106 then
                v106 = {
                    name = v102.name, 
                    entries = {}
                };
                v108 = 0;
                v109 = 0;
                table.insert(v105, v106);
            end;
            if not v107 then
                v107 = v101(v112);
                table.insert(v106.entries, v107);
            end;
        end;
        for _, v115 in ipairs(v102.entries) do
            if v115.translations then
                v113(v115);
                for _, v117 in ipairs(v115.translations) do
                    v113(v115);
                    table.insert(v107.translations, v117);
                    v108 = v108 + 1;
                    if v104 <= v108 then
                        v106 = nil;
                        v107 = nil;
                    end;
                end;
                v107 = nil;
                v109 = v109 + 1;
                if v103 <= v109 then
                    v106 = nil;
                end;
            end;
        end;
        return v105;
    end
};
