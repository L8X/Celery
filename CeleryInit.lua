celery = {};

celery.settings = {
  ["update"] = "d0e0f9747ed3455c"
};

celery.check_version = function()
  local version = get_app_path();
  local version_start = version:find("version-") + 8;
  version = version:sub(version_start, version_start + string.len(celery.settings.update));
  
  if (version ~= celery.settings.update) then
    return false;
  end
  
  return true;
end

if not celery.check_version() then
  alert("Wrong ROBLOX version detected. Please wait for Celery to update...");
end
