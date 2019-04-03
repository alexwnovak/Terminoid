function Enable-Cursor {
    "$([char]0x1B)[?25h"
}
