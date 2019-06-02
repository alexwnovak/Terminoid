function Read-Key {
    $Host.UI.RawUI.ReadKey( 'NoEcho,IncludeKeyDown' ).VirtualKeyCode
}
