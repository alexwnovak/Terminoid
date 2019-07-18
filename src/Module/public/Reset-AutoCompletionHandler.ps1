function Reset-AutoCompletionHandler {
    $script:AutoCompletionTable = [List[Hashtable]]::new()
}
