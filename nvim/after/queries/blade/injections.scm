((text) @injection.content
    (#set! injection.language "php")
    (#set! injection.combined))
((text) @injection.content
    (#not-has-ancestor? @injection.content "envoy")
    (#set! injection.combined)
    (#set! injection.language php))
((php_only) @injection.content
    (#set! injection.combined)
    (#set! injection.language php_only))

; directive parameters
((parameter) @injection.content
    (#set! injection.language php_only))
