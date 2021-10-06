celery = {};

celery.settings = {
  ["update"] = "d0e0f9747ed3455c"
};

version = get_app_path();
version = version:sub(version:find("version-") + 8, string.len(version));

if (version ~= celery.settings.update) then
  alert("Wrong ROBLOX version detected. Please wait for Celery to update...");
  system("exit");
end




