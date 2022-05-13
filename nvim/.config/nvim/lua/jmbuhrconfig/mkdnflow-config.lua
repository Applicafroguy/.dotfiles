require("mkdnflow").setup({
    filetypes = {md = true, rmd = true, markdown = true},
    create_dirs = true,
    perspective = {
        priority = 'root',
        fallback = 'current',
        root_tell = ".git"
    },
    prefix = {
        evaluate = false,
        string = "./"
    },
    wrap = false,
    default_bib_path = '~/notes/references.bib',
    silent = true,
    use_mappings_table = true,
    mappings = {
        MkdnNextLink = {'n', '<tab>'},
        MkdnPrevLink = {'n', '<s-tab>'},
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
        MkdnNewListItem = {'i', '<CR>'}
    },
    links = {
        style = 'wiki',
        implicit_extension = nil,
        -- transform = false
        transform = function(input)
            if input:match('%d%d%d%d%-%d%d%-%d%d') then
                return('journals/'..input:gsub("-","_"))
            else
                return('pages/'..input)
            end
        end,
    },
    to_do = {
        symbols = {' ', '-', 'X'},
        update_parents = true,
        not_started = ' ',
        in_progress = '-',
        complete = 'X'
    }
})
