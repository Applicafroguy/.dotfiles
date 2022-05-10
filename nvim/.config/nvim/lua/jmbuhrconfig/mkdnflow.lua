
require('mkdnflow').setup({
    filetypes = {md = true, rmd = true, markdown = true},
    create_dirs = true,
    perspective = {
        priority = 'current',
        fallback = 'first',
        root_tell = false
    },
    prefix = {
        evaluate = true,
        string = [[os.date('%Y-%m-%d_')]]
    },
    wrap = false,
    default_bib_path = '~/notes/references.bib',
    silent = false,
    use_mappings_table = true,
    mappings = {
        MkdnNextLink = {'n', '<Tab>'},
        MkdnPrevLink = {'n', '<S-Tab>'},
        MkdnNextHeading = {'n', '<leader>]'},
        MkdnPrevHeading = {'n', '<leader>['},
        MkdnGoBack = {'n', '<BS>'},
        MkdnGoForward = {'n', '<Del>'},
        MkdnFollowLink = {{'n'}, '<CR>'},
        MkdnDestroyLink = {'n', '<M-CR>'},
        -- MkdnYankAnchorLink = {'n', 'ya'},
        -- MkdnYankFileAnchorLink = {'n', 'yfa'},
        -- MkdnIncreaseHeading = {'n', '+'},
        -- MkdnDecreaseHeading = {'n', '-'},
        -- MkdnToggleToDo = {'n', '<C-Space>'},
        MkdnNewListItem = {'i', '<c-cr>'}
    },
    link_style = 'wiki',
    to_do = {
        symbols = {' ', '-', 'X'},
        update_parents = true,
        not_started = ' ',
        in_progress = '-',
        complete = 'X'
    }
})
