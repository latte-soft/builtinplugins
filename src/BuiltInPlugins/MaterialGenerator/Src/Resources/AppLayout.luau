local v0 = require(script.Parent.Parent.Parent.Src.Util.Constants);
local l_EDITOR_WIDTH_0 = v0.EDITOR_WIDTH;
local l_EDITOR_HEIGHT_0 = v0.EDITOR_HEIGHT;
local l_PROMPT_HEIGHT_0 = v0.PROMPT_HEIGHT;
return {
    {
        value = {
            name = "Prompt, Browser, Editor (horizontal)", 
            fillDirection = Enum.FillDirection.Horizontal, 
            mainContentSize = UDim2.new(1, -l_EDITOR_WIDTH_0, 1, 0), 
            editorSize = UDim2.new(0, l_EDITOR_WIDTH_0, 1, 0)
        }
    }, 
    {
        maxWidth = 576, 
        value = {
            name = "Prompt, Browser, Editor (vertical)", 
            fillDirection = Enum.FillDirection.Vertical, 
            mainContentSize = UDim2.new(1, 0, 1, -l_EDITOR_HEIGHT_0), 
            editorSize = UDim2.new(1, 0, 0, l_EDITOR_HEIGHT_0)
        }
    }, 
    {
        maxWidth = 576, 
        maxHeight = (l_PROMPT_HEIGHT_0 + l_EDITOR_HEIGHT_0) + 50, 
        value = {
            name = "Prompt, Editor (vertical)", 
            fillDirection = Enum.FillDirection.Vertical, 
            mainContentSize = UDim2.new(1, 0, 0, l_PROMPT_HEIGHT_0), 
            editorSize = UDim2.new(1, 0, 1, -l_PROMPT_HEIGHT_0), 
            browserVisible = false
        }
    }, 
    {
        maxWidth = 576, 
        maxHeight = l_EDITOR_HEIGHT_0 + 50, 
        value = {
            name = "Editor only", 
            mainContentVisible = false, 
            editorSize = UDim2.fromScale(1, 1)
        }
    }
};
