function callExit {
    "calling exit from callExit"
    exit
}

callExit
"Done"          # <-- This should not print
