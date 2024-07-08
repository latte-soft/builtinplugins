local _ = script.Parent.Parent.Parent;
local l_PathEditorHierarchyValidCheckFixes_0 = game:GetFastFlag("PathEditorHierarchyValidCheckFixes");
local v2 = game:DefineFastFlag("PathEditorPathEditorHierarchyFolderValid", false);
return function(v3)
    if v3 == nil then
        return false;
    else
        local l_Parent_1 = v3.Parent;
        local v5 = true;
        while true do
            if (not (l_Parent_1 ~= nil) or l_Parent_1:IsA("ScreenGui")) or l_Parent_1:IsA("SurfaceGui") then
                if l_Parent_1 == nil then
                    return false;
                else
                    if not l_Parent_1:IsA("ScreenGui") then
                        if not (not (not (not l_PathEditorHierarchyValidCheckFixes_0 or not l_Parent_1:IsA("SurfaceGui")) and l_Parent_1.Adornee == nil) or l_Parent_1.Parent:IsA("BasePart")) then
                            return false;
                        end;
                    else
                        while l_Parent_1 ~= nil do
                            if l_Parent_1 == game.Workspace then
                                return false;
                            else
                                l_Parent_1 = l_Parent_1.Parent;
                            end;
                        end;
                    end;
                    return true;
                end;
            else
                if not v2 or v5 then
                    if not l_Parent_1:IsA("GuiBase2d") then
                        return false;
                    end;
                elseif not (l_Parent_1:IsA("GuiBase2d") or l_Parent_1:IsA("Folder")) then
                    return false;
                end;
                v5 = false;
                l_Parent_1 = l_Parent_1.Parent;
            end;
        end;
    end;
end;
