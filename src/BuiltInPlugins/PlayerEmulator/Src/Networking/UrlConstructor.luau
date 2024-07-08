local v0 = game:GetService("ContentProvider").BaseUrl:lower();
if not v0:find("https://www.") then
    if v0:find("http://www.") then
        v0 = v0:sub(12);
    end;
else
    v0 = v0:sub(13);
end;
return {
    BuildUrl = function(v1, v2, ...)
        return string.format("https://%s.%s%s", v1, v0, string.format(v2, ...) or "");
    end
};
