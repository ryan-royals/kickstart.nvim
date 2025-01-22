return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    local mc = require 'multicursor-nvim'

    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({ 'n', 'v' }, '<up>', function()
      mc.lineAddCursor(-1)
    end, { desc = 'Add Multi Cursor Up' })
    set({ 'n', 'v' }, '<down>', function()
      mc.lineAddCursor(1)
    end, { desc = 'Add Multi Cursor Down' })
    set({ 'n', 'v' }, '<leader>m<up>', function()
      mc.lineSkipCursor(-1)
    end, { desc = 'Add [M]ulti Cursor Up skipping a line' })
    set({ 'n', 'v' }, '<leader>m<down>', function()
      mc.lineSkipCursor(1)
    end, { desc = 'Add [M]ulti Cursor Down skipping a line' })

    -- Add or skip adding a new cursor by matching word/selection
    -- set({ 'n', 'v' }, '<leader>mn', function()
    -- mc.matchAddCursor(1)
    -- end)
    -- set({ 'n', 'v' }, '<leader>ms', function()
    -- mc.matchSkipCursor(1)
    -- end)
    -- set({ 'n', 'v' }, '<leader>mN', function()
    -- mc.matchAddCursor(-1)
    -- end)
    -- set({ 'n', 'v' }, '<leader>mS', function()
    -- mc.matchSkipCursor(-1)
    -- end)

    -- Add all matches in the document
    -- set({ 'n', 'v' }, '<leader>mA', mc.matchAllAddCursors)

    -- You can also add cursors with any motion you prefer:
    -- set("n", "<right>", function()
    --     mc.addCursor("w")
    -- end)
    -- set("n", "<leader><right>", function()
    --     mc.skipCursor("w")
    -- end)

    -- Rotate the main cursor.
    set({ 'n', 'v' }, '<left>', mc.nextCursor, { desc = 'Next Cursor' })
    set({ 'n', 'v' }, '<right>', mc.prevCursor, { desc = 'Previous Cursor' })

    -- Delete the main cursor.
    -- set({ 'n', 'v' }, '<leader>mx', mc.deleteCursor, {desc = 'Remove Main Cursor'})

    -- Add and remove cursors with control + left click.
    set('n', '<c-leftmouse>', mc.handleMouse)

    -- Easy way to add and remove cursors using the main cursor.
    set({ 'n', 'v' }, '<leader>mm', mc.toggleCursor, { desc = 'Add [M]ulti cursor under cursor' })

    -- Clone every cursor and disable the originals.
    -- set({ 'n', 'v' }, '<leader><c-q>', mc.duplicateCursors)

    set('n', '<esc>', function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <esc> handler.
      end
    end)

    -- bring back cursors if you accidentally clear them
    set('n', '<leader>mr', mc.restoreCursors, { desc = '[M]ulti cursor [R]estore' })

    -- Align cursor columns.
    set('n', '<leader>ma', mc.alignCursors, { desc = '[M]ulti cursor [A]lign' })

    -- Split visual selections by regex.
    set('v', 'S', mc.splitCursors)

    -- Append/insert for each line of visual selections.
    set('v', 'I', mc.insertVisual)
    set('v', 'A', mc.appendVisual)

    -- match new cursors within visual selections by regex.
    set('v', 'M', mc.matchCursors)

    -- Rotate visual selection contents.
    -- set('v', '<leader>t', function()
    -- mc.transposeCursors(1)
    -- end)
    -- set('v', '<leader>T', function()
    -- mc.transposeCursors(-1)
    -- end)

    -- Jumplist support
    set({ 'v', 'n' }, '<c-i>', mc.jumpForward)
    set({ 'v', 'n' }, '<c-o>', mc.jumpBackward)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, 'MultiCursorCursor', { link = 'Cursor' })
    hl(0, 'MultiCursorVisual', { link = 'Visual' })
    hl(0, 'MultiCursorSign', { link = 'SignColumn' })
    hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  end,
}
