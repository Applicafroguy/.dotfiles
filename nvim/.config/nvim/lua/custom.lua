
P = function(x)
  print(vim.inspect(x))
  return(x)
end

RELOAD = function(...)
  return require'plenary.reload'.reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end


