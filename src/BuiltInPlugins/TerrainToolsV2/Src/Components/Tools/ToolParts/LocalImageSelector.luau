local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Components.LoadingImage);
local v7 = require(script.Parent.PromptSelectorWithPreview);
local l_StudioService_0 = game:GetService("StudioService");
local v9 = v2.PureComponent:extend(script.Name);
v9.init = function(v10)
    v10.promptSelection = function()
        local v11 = {
            "png", 
            "jpg", 
            "jpeg"
        };
        local v12 = nil;
        local l_status_0, l_result_0 = pcall(function()
            v12 = l_StudioService_0:PromptImportFile(v11);
        end);
        if not l_status_0 then
            v10.props.SelectFile(nil, l_result_0);
        elseif v12 then
            v10.props.SelectFile(v12);
        end;
    end;
    v10.renderPreview = function()
        local l_CurrentFile_0 = v10.props.CurrentFile;
        if l_CurrentFile_0 and l_CurrentFile_0.file then
            return v2.createElement(v6, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Image = v10.props.CurrentFile.preview, 
                ScaleType = Enum.ScaleType.Fit
            });
        else
            return nil;
        end;
    end;
    v10.getMetadata = function()
        local l_CurrentFile_1 = v10.props.CurrentFile;
        if l_CurrentFile_1 and l_CurrentFile_1.file then
            return {
                ("%ix%ipx"):format(l_CurrentFile_1.width, l_CurrentFile_1.height)
            };
        else
            return {};
        end;
    end;
end;
v9.render = function(v17)
    local v18 = false;
    local v19 = nil;
    if not v17.props.CurrentFile or not v17.props.CurrentFile.file then
        v19 = v17.props.Localization:getText("LocalImageSelector", "NoImageSelected");
    else
        v18 = true;
        v19 = v17.props.CurrentFile.file.Name;
    end;
    return v2.createElement(v7, (v3.Dictionary.join(v17.props, {
        CurrentFile = v3.None, 
        SelectFile = v3.None, 
        SelectionName = v19, 
        HasSelection = v18, 
        PreviewTitle = v17.props.PreviewTitle, 
        RenderPreview = v17.renderPreview, 
        GetMetadata = v17.getMetadata, 
        PromptSelection = v17.promptSelection, 
        ClearSelection = v17.props.ClearSelection
    })));
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v9));
