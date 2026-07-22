-- Ipleak SDK error

local IpleakError = {}
IpleakError.__index = IpleakError


function IpleakError.new(code, msg, ctx)
  local self = setmetatable({}, IpleakError)
  self.is_sdk_error = true
  self.sdk = "Ipleak"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function IpleakError:error()
  return self.msg
end


function IpleakError:__tostring()
  return self.msg
end


return IpleakError
