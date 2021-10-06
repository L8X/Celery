celery = {};

celery.settings = {
  ["update"] = "d0e0f9747ed3455c"
};

celery.check_version = function()
  version = get_app_path();
  version = version:sub(version:find("version-") + 8, string.len(version));

  if (version ~= celery.settings.update) then
    return false;
  end
  
  return true;
end

if not celery.check_version() then
  alert("Wrong ROBLOX version detected. Please wait for Celery to update...");
  exit(0);
end

if not whitelisted() then
  alert("Unauthorized. Please send a new key to jayyy#8941 to start using Celery");
  exit(0);
end

-- continue..
