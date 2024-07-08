local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v3 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxRefactorAudioConstantsForItemRow);
local l_COLUMNS_0 = v1.AUDIO_ROW.COLUMNS;
local v5 = v1.AUDIO_ROW.ICON_SIZE + if not v3() then v1.AUDIO_ROW.LEFT_RIGHT_PADDING else v1.ITEM_ROW.LEFT_RIGHT_PADDING * 2;
return function(v6, _)
    local v8 = v6 == v2.SOUND_EFFECTS.name;
    if not (v6 == v2.MUSIC.name) then
        local _ = not v8;
    end;
    return {
        [l_COLUMNS_0.ICON] = UDim2.fromScale(0, 1) + UDim2.fromOffset(v5, 0), 
        [l_COLUMNS_0.TITLE] = UDim2.fromScale(0.5, 1) - UDim2.fromOffset(v5 + 50, 0), 
        [l_COLUMNS_0.CREATOR] = UDim2.fromScale(0.25, 1), 
        [l_COLUMNS_0.TAGS] = UDim2.fromScale(0.25, 1), 
        [l_COLUMNS_0.LENGTH] = UDim2.fromScale(0, 1) + UDim2.fromOffset(50, 0)
    };
end;
