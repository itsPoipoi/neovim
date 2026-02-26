return {
  "nvim-mini/mini.ai",
  opts = {
    custom_textobjects = {
      e = function(ai_type, id, opts) -- original word textobject
        if ai_type == "a" then
          return {
            {
              "%f[%w_][%w_]+%s?",
              "%f[%p][^%w%s_]+%s?",
            },
          }
        end
        if ai_type == "i" then
          local reg = MiniAi.find_textobject("a", id, opts)
          if reg then
            local line = vim.fn.getline(reg.from.line)
            local _, s = line:find("^%s*.", reg.from.col)
            local e = line:sub(1, reg.to.col):find(".%s?$")
            return vim.tbl_deep_extend("force", reg, { from = { col = s }, to = { col = e } })
          end
        end
      end,

      w = function(ai_type, id, opts) -- spider-like word textobject
        if ai_type == "a" then
          return {
            {
              -- pattern, [^_]pattern_?
              "%f[%d_%-%.%,%s]%d+[_%-%.%,%s]?",
              "%f[%a_%-%.%,%s]%l+[_%-%.%,%s]?",
              "%f[%u_%-%.%,%s]%u%f[%A][_%-%.%,%s]?",
              "%f[%u_%-%.%,%s]%u%l+[_%-%.%,%s]?",
              "%f[%u_%-%.%,%s]%u%u+[_%-%.%,%s]?",
              "%f[%p_%-%.%,%s][^%w%s]+[_%-%.%,%s]?",
              -- __pattern
              "%f[_%-%.%,%s][_%-%.%,%s]+%d+",
              "%f[_%-%.%,%s][_%-%.%,%s]+%l+",
              "%f[_%-%.%,%s][_%-%.%,%s]+%u%f[%A]",
              "%f[_%-%.%,%s][_%-%.%,%s]+%u%l+",
              "%f[_%-%.%,%s][_%-%.%,%s]+%u%u+",
              "%f[_%-%.%,%s][_%-%.%,%s]+[^%w%s]+",
            },
          }
        end
        if ai_type == "i" then
          local reg = MiniAi.find_textobject("a", id, opts)
          if reg then
            local line = vim.fn.getline(reg.from.line)
            local _, s = line:find("^[_%-%.%,%s]*.", reg.from.col)
            local e = line:sub(1, reg.to.col):find(".[_%-%.%,%s]?$")
            return vim.tbl_deep_extend("force", reg, { from = { col = s }, to = { col = e } })
          end
        end
      end,
    },
  },
}
