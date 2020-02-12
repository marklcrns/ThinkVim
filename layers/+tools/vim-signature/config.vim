
let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:SignatureIncludeMarkers = repeat('⚐', 10)
let g:SignatureMap = {
    \ 'Leader':            'm',
    \ 'ListBufferMarks':   'm/',
    \ 'ListBufferMarkers': 'm?',
    \ 'PlaceNextMark':     'm,',
    \ 'ToggleMarkAtLine':  'mm',
    \ 'PurgeMarksAtLine':  'm-',
    \ 'DeleteMark':        'dm',
    \ 'PurgeMarks':        'm<Space>',
    \ 'PurgeMarkers':      'm<BS>',
    \ 'GotoNextLineAlpha': "']",
    \ 'GotoPrevLineAlpha': "'[",
    \ 'GotoNextSpotAlpha': '`]',
    \ 'GotoPrevSpotAlpha': '`[',
    \ 'GotoNextLineByPos': "]'",
    \ 'GotoPrevLineByPos': "['",
    \ 'GotoNextSpotByPos': 'mn',
    \ 'GotoPrevSpotByPos': 'mp',
    \ 'GotoNextMarker':    ']-',
    \ 'GotoPrevMarker':    '[-',
    \ 'GotoNextMarkerAny': ']=',
    \ 'GotoPrevMarkerAny': '[=',
    \ }

autocmd User GitGutter call signature#sign#Refresh()
