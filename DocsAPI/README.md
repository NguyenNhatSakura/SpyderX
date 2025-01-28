# KhuongDua API
- sử dụng api thông qua xeno.dll và api này chỉ hỗ trợ dành cho ae dễ sử dụng api xeno

# Attach To Roblox
```
KhuongDuaAPI.Api.Inject();
```

# Kiểm Tra Roblox Đã Được Bậy hay Chưa
```
KhuongDuaAPI.Api.IsRobloxOpen();
```

# Execute Script
```
KhuongDuaAPI.Api.ExecuteScript("print(""Hello World"")')
```

# Kiểm Tra Đã Attach Chưa
```
KhuongDuaAPI.Api.IsInjected();
```

# Tự Động Attach Roblox
```
KhuongDuaAPI.Api.SetAutoInject(true);
```
```sử dụng true để bật và false để tắt```

# Kill Client Roblox
```
KhuongDuaAPI.Api.KillRoblox();
```
