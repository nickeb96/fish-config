complete -c rustfmt -k -a '(__fish_complete_suffix rs)'
complete -c rustfmt -l check -d 'Run in\'check\' mode'
complete -c rustfmt -l emit -d 'What data to emit and how' -ra \
    'files\t"Overwrite files"
     stdout\t"Write output to stdout"
     coverage\t"Display how much input was processed"
     checkstyle\t"Emit checkstyle format"
     json\t"Emit diffs in JSON format"'
complete -c rustfmt -l backup -d 'Backup any modified files'
complete -c rustfmt -l config-path -d 'Path for the config file'
complete -c rustfmt -l edition -d 'Rust edition to use' -ra '2015 2018 2021'
complete -c rustfmt -l color -d 'Use colord output' -ra 'always never auto'
complete -c rustfmt -l print-config -d 'Dump config to path' -rfa 'default minimal current'
complete -c rustfmt -l files-with-diff -s l -d 'Print names of mismatched files'
complete -c rustfmt -l config -r -d 'Set config options'
complete -c rustfmt -l unstable-features -d 'Enable unstable features'
complete -c rustfmt -l file-lines -r -d 'Format specified line ranges'
complete -c rustfmt -l error-on-unformatted -d 'Error if unable to fit within max width'
complete -c rustfmt -l skip-children -d 'Don\'t reformat child modules'
complete -c rustfmt -l verbose -s v -d 'Print verbose output'
complete -c rustfmt -l quiet -s q -d 'Print less output'
complete -c rustfmt -l version -s V -d 'Show version information'
complete -c rustfmt -l help -s h -d 'Show help' -fa 'config file-lines'
