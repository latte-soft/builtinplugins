sanitizeIconSearchInput = function(v0)
    return (string.lower((string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(v0, "\226\128\147", "-"), "\226\128\148", "-"), "\226\128\144", "-"), "\226\128\145", "-"), "\226\136\146", "-"), "%-", "%%-"))));
end;
return sanitizeIconSearchInput;
