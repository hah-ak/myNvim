local utils = require("utils")
local map = utils.map
local javaLspConfigPath = '/Users/gim-yongcheol/.config/nvim/java-lsp-plugin'
local javaLspFilePath = "/Users/gim-yongcheol/.local/share/nvim/mason/packages/jdtls"

local capabilities = vim.lsp.protocol.make_client_capabilities()
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/Users/gim-yongcheol/.workspace/' .. project_name

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    return
end
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)


local bundles = {}

vim.list_extend(bundles, vim.split(vim.fn.glob(javaLspConfigPath..'/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar'), '\n'))
vim.list_extend(bundles, vim.split(vim.fn.glob(javaLspConfigPath..'/vscode-java-test/server/*.jar'), '\n'))
local config = {  
    cmd = {
        '/Users/gim-yongcheol/.jenv/versions/temurin64-18.0.2.1/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        "-javaagent:"..javaLspFilePath.."/lombok.jar",
        "-Xbootclasspath/a:"..javaLspFilePath.."/lombok.jar",
        '-jar', javaLspFilePath..'/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration',
        javaLspFilePath..'/config_mac',
        '-data', workspace_dir
        
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    settings = {
        java = {
            configuration = {
                -- runtimes = {
                    {
                        name="JavaSE_11",
                        path='/Users/gim-yongcheol/.jenv/versions/temurin64-11.0.16.1/'
                    },
                    {
                        name="JavaSE_17",
                        path='/Users/gim-yongcheol/.jenv/versions/temurin64-17.0.4.1/'
                    }
                -- }
             }
         }
    }, 
    init_options = {
        bundles = bundles,
    },
    on_attach = function(client, bufnr)
        require('jdtls').setup_dap({hotcodereplace = 'auto'})
        require('jdtls.dap').setup_dap_main_class_configs()
        map('n','<A-o>', '<Cmd>lua require(\'jdtls\').organize_imports()<CR>',{silent=true})
        map('n','crv', '<Cmd>lua require(\'jdtls\').extract_variable()<CR>',{silent=true})
        map('v','crv', '<Esc><Cmd>lua require(\'jdtls\').extract_variable(true)<CR>',{silent=true})
        map('n','crc', '<Cmd>lua require(\'jdtls\').extract_constant()<CR>',{silent=true})
        map('v','crc', '<Esc><Cmd>lua require(\'jdtls\').extract_constant(true)<CR>',{silent=true})
        map('v','crm', '<Esc><Cmd>lua require(\'jdtls\').extract_method(true)<CR>',{silent=true})
        map('n','<leader>dn','<Cmd>lua require(\'jdtls\').test_nearest_method()<CR>',{silent=true})
        map('n','<leader>df','<Cmd>lua require(\'jdtls\').test_class()<CR>',{silent = true})
    end,
    capabilities=capabilities,
}
require('jdtls').start_or_attach(config)
