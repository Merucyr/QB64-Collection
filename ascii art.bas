_Display
Dim arrX, arrY, artLen, iterations As Integer
arrX = 5: arrY = 5: artLen = 5: iterations = 0

Dim AsciiArt(arrX, arrY) As Integer 'I think this might be better as a String but it's like 3am and I'm doing weird conversions below let's just chill with it

Dim ArtStrings(artLen) As String 'These indicate how each thing will change on the screen, e.g. AsciiArt marked with a 1 iterates thru those 3 characters
ArtStrings(1) = "²³ª"
ArtStrings(2) = "­¯"
ArtStrings(3) = "m¹"
ArtStrings(4) = "T4¼"
ArtStrings(5) = "­G¤L"

'Pretend we want our end array to look like
' ª¹¼Lª
' ¹ª¯Lª
' ¼¹ªLª
' L¼¹ªª
' ¯L¼¹ª

Dim ArtRows(arrY) As String 'Each number here will get pumped into our AsciiArt 2d array
ArtRows(1) = "13451"
ArtRows(2) = "31251"
ArtRows(3) = "43151"
ArtRows(4) = "54311"
ArtRows(5) = "25431"

For i = 1 To arrY
    For j = 1 To arrX
        AsciiArt(i, j) = Val(Right$(Left$(ArtRows(i), j), 1)) 'actually pumps the asciiart array with the numeric indicator, e.g. asciiart(1,1) becomes 1 here
    Next
Next


'Check no. of iterations
For i = 1 To artLen
    If Len(ArtStrings(i)) > iterations Then iterations = Len(ArtStrings(i))
Next

For i = 1 To iterations
    _Limit 2
    Cls
    For x = 1 To arrX
        For y = 1 To arrY
            s$ = ArtStrings(AsciiArt(x, y)) 'One of the actual Strings which we iterate to know what to display
            If i > Len(s$) Then
                Print Right$(s$, 1); 'If we've iterated longer than the string we just grab the last value because it's finished iterating
            Else
                Print Right$(Left$(s$, i), 1); 'Haven't iterated longer than the string so print the latest string
            End If
        Next
        Print "" 'our new line after every y iteration
    Next
    _Display
Next


