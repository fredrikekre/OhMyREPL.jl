module TestSyntaxHighlighter


using Base.Test

using OhMyREPL
import OhMyREPL.ANSICodes: ANSIToken, ANSIValue
import  OhMyREPL.Passes.SyntaxHighlighter.SYNTAX_HIGHLIGHTER_SETTINGS

using Tokenize

b = IOBuffer()
str = "function :foobar, foobar # foobar"
OhMyREPL.test_pass(b, SYNTAX_HIGHLIGHTER_SETTINGS, str)


println("Original string: ", str)
println("Highlighted string: ", takebuf_string(b))

println()

str = "(function :foobar, foobar )# foobar"
OhMyREPL.test_passes(b, OhMyREPL.PASS_HANDLER, str, 3)

println("Original string: ", str)
println("Highlighted string: ", takebuf_string(b))
println()

end
