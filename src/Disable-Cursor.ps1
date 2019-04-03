
function Disable-Cursor {
    "$([char]0x1B)[?25l"
}
