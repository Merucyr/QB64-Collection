Dim ImageHandle&
Dim RGB&
Dim ImageWidth%: ImageWidth% = 1280
Dim ImageHeight%: ImageHeight% = 720
Dim CurrentX%: CurrentX% = 0
Dim CurrentY%: CurrentY% = 0
Dim PointSelect%
Dim R, G, B As Integer

Input "Input R, G, B starting values: (0,255 there is no error checking) ", R, G, B
Randomize Timer

Cls
ImageHandle& = _NewImage(ImageWidth%, ImageHeight%, 32)
Screen ImageHandle&

RGB& = _RGB32(R, G, B) 'set color to input data
PSet (CurrentX%, CurrentY%), RGB& 'Place the initial point, kind of cheating
For CurrentX% = 1 To ImageWidth% 'sets the entire first row, apart from start point
    RGB& = RGBChangeOne(RGB&)
    PSet (CurrentX%, 0), RGB&
Next

RGB& = _RGB32(R, G, B) 'reset the color here  to input data
For CurrentY% = 1 To ImageHeight% 'sets the entire first column, apart from start point
    RGB& = RGBChangeOne(RGB&)
    PSet (8, CurrentY%), RGB& 'you can add in a dark slash to the generated image by setting the 0 to something higher, setting this makes it left-based, setting the X to skip makes it right based
Next

For CurrentX% = 1 To ImageWidth% 'do the rest of the stuff, e.g. (1,1280) and (1,720) although that's not quite the right no.
    For CurrentY% = 1 To ImageHeight%
        PointSelect% = Int(Rnd * 11)
        If PointSelect% < 5 Then
            RGB& = Point(CurrentX% - 1, CurrentY%)
        ElseIf PointSelect% < 10 Then
            RGB& = Point(CurrentX%, CurrentY% - 1)
        Else
            RGB& = Point(CurrentX% - 1, CurrentY% - 1)
        End If
        RGB& = RGBChangeOne(RGB&)
        PSet (CurrentX%, CurrentY%), RGB&
    Next
Next

End

Function RGBChangeOne& (rgb&)
    'Randomize Timer 'you can comment this in and out and it'll do neat stuff
    Red = _Red32(rgb&)
    Grn = _Green32(rgb&)
    Blu = _Blue32(rgb&)
    SelectRGB = Int(Rnd * 3) 'selects r/g/b on 0/1/2
    IncDecRGB = Int(Rnd * 2) 'inc or dec based on 0/1, can't go past 0 or 255
    If IncDecRGB = 0 Then IncDecRGB = -1
    If SelectRGB = 0 Then
        If IncDecRGB = -1 And Red <> 0 Then Red = Red + IncDecRGB
        If IncDecRGB = 1 And Red <> 255 Then Red = Red + IncDecRGB
    ElseIf SelectRGB = 1 Then
        If IncDecRGB = -1 And Grn <> 0 Then Grn = Grn + IncDecRGB
        If IncDecRGB = 1 And Grn <> 255 Then Grn = Grn + IncDecRGB
    Else
        If IncDecRGB = -1 And Blu <> 0 Then Blu = Blu + IncDecRGB
        If IncDecRGB = 1 And Blu <> 255 Then Blu = Blu + IncDecRGB
    End If
    RGBChangeOne& = _RGB32(Red, Grn, Blu)
End Function
