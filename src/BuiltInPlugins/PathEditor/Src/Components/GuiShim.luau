local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
return v3.connect(function(v5, _)
    return {
        SelectedObjectGui = v5.PathReducer.SelectedObjectGui
    };
end)(function(v7)
    if v7.SelectedObjectGui == nil then
        return nil;
    else
        local v8 = nil;
        if not v7.SelectedObjectGui:IsA("ScreenGui") then
            if v7.SelectedObjectGui:IsA("SurfaceGui") then
                v8 = v2.createElement("SurfaceGui", {
                    ZIndexBehavior = v7.ZIndexBehavior, 
                    ZOffset = if not l_PathEditorRotation_0 then v7.SelectedObjectGui.ZOffset + (not v7.DisplayOrder and 0 or v7.DisplayOrder) else nil, 
                    AlwaysOnTop = true, 
                    Face = v7.SelectedObjectGui.Face, 
                    SizingMode = if not l_PathEditorRotation_0 then nil else v7.SelectedObjectGui.SizingMode, 
                    PixelsPerStud = if not l_PathEditorRotation_0 then nil else v7.SelectedObjectGui.PixelsPerStud, 
                    CanvasSize = if not l_PathEditorRotation_0 then nil else v7.SelectedObjectGui.CanvasSize, 
                    Adornee = if not v7.SelectedObjectGui.Adornee then v7.SelectedObjectGui.Parent else v7.SelectedObjectGui.Adornee
                }, v7.children);
            end;
            return v8;
        else
            return (v2.createElement("ScreenGui", {
                ZIndexBehavior = v7.ZIndexBehavior, 
                DisplayOrder = v7.DisplayOrder
            }, v7.children));
        end;
    end;
end);
