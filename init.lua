celery = {};

celery.settings = {
  ["update"] = "acbc8cfc2b354d72" 
};

celery.check_version = function()
  local version = get_app_path();
  version = version:sub(version:find("version-") + 8, version:find("\\RobloxPlayerBeta") - 1);
  
  if (version ~= celery.settings.update) then
    return false;
  end
  
  return true;
end

if not celery.check_version() then
  alert("Wrong ROBLOX version detected. Please wait for Celery to update...");
  exit();
end

if forcewhitelist then
  forcewhitelist();
end

if not whitelisted() then
  alert("Unauthorized. Please send an updated key to jayyy#8941 to be authorized");
  exit();
end
