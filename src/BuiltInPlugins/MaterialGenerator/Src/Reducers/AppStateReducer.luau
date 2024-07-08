local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v4 = require(l_Actions_0.DoneGeneratingImages);
local v5 = require(l_Actions_0.MergeFilteredTextPrompt);
local v6 = require(l_Actions_0.SetGeneratingImages);
local v7 = require(l_Actions_0.SetGenerationError);
local v8 = require(l_Actions_0.SetIsSavingMaterial);
local v9 = require(l_Actions_0.SetTextPrompt);
local v10 = require(l_Parent_0.Src.Util.tryReplaceFirstText);
local v11 = require(l_Parent_0.Src.Enum.GenerationErrorType);
local l_join_0 = v1.join;
return (v2.createReducer({
    isGeneratingImages = false, 
    generatingImages = 0, 
    isSavingMaterial = false, 
    textPrompt = "", 
    generationError = {
        generationErrorType = v11.None, 
        message = nil
    }
}, {
    [v6.name] = function(v13, v14)
        return l_join_0(v13, {
            generatingImages = v14.amount
        });
    end, 
    [v4.name] = function(v15, _)
        return l_join_0(v15, {
            generatingImages = 0
        });
    end, 
    [v7.name] = function(v17, v18)
        return l_join_0(v17, {
            generationError = {
                generationErrorType = v18.generationErrorType, 
                message = v18.message or v1.None
            }
        });
    end, 
    [v8.name] = function(v19, v20)
        return l_join_0(v19, {
            isSavingMaterial = v20.isSavingMaterial
        });
    end, 
    [v9.name] = function(v21, v22)
        return l_join_0(v21, {
            textPrompt = v22.textPrompt
        });
    end, 
    [v5.name] = function(v23, v24)
        if v24.original == v24.filteredText then
            return v23;
        else
            local v25 = v10(v23.textPrompt, v24.original, v24.filteredText);
            if not v25 then
                return v23;
            else
                return l_join_0(v23, {
                    textPrompt = v25
                });
            end;
        end;
    end
}));
