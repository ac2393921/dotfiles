local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local configs = require('lspconfig/configs')

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- formating
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- TS
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

-- Golang
nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- C++
nvim_lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { 'golangci-lint-langserver' },
      root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
      init_options = {
        command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json",
          "--issues-exit-code=1" };
      }
    };
  }
end
nvim_lsp.golangci_lint_ls.setup {
  filetype = { 'go', 'gomod' }
}

nvim_lsp.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.phpactor.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}
