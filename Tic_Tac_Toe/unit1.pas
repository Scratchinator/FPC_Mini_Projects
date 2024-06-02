Unit Unit1;

{$MODE objfpc}{$H+}

Interface

Uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

Type

  { TForm1 }

  TForm1 = Class(TForm)
    Button1: TButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Procedure Button1Click(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure Shape1Click(Sender: TObject);
  private
    gesperrt, Auswahl: Boolean;
    Procedure Check_for_Winner;
  public

  End;

Var
  Form1: TForm1;

Implementation

{$R *.lfm}

{ TForm1 }

Procedure TForm1.Shape1Click(Sender: TObject);
Begin
  If gesperrt Then exit;
  If TShape(Sender).shape = stRectangle Then Begin
    If Auswahl Then Begin
      TShape(Sender).Shape := stCircle;
    End
    Else Begin
      TShape(Sender).Shape := stStar;
    End;
    Auswahl := Not Auswahl;
    Check_for_Winner;
  End;
End;

Procedure TForm1.FormCreate(Sender: TObject);
Begin
  Auswahl := false;
  gesperrt := false;
  caption := 'Tic Tac To';
End;

Procedure TForm1.Button1Click(Sender: TObject);
Begin
  Shape1.Shape := stRectangle;
  Shape2.Shape := stRectangle;
  Shape3.Shape := stRectangle;
  Shape4.Shape := stRectangle;
  Shape5.Shape := stRectangle;
  Shape6.Shape := stRectangle;
  Shape7.Shape := stRectangle;
  Shape8.Shape := stRectangle;
  Shape9.Shape := stRectangle;
  Auswahl := false;
  gesperrt := false;
End;

Procedure TForm1.Check_for_Winner;
Begin
  If ((Shape1.Shape = Shape2.Shape) And (Shape2.Shape = Shape3.Shape) And (Shape3.Shape <> stRectangle)) Or // 1. Zeile alle Gleich ?
  ((Shape4.Shape = Shape5.Shape) And (Shape5.Shape = Shape6.Shape) And (Shape6.Shape <> stRectangle)) Or // 2. Zeile alle Gleich ?
  ((Shape7.Shape = Shape8.Shape) And (Shape8.Shape = Shape9.Shape) And (Shape9.Shape <> stRectangle)) Or // 3. Zeile alle Gleich ?
  ((Shape1.Shape = Shape4.Shape) And (Shape4.Shape = Shape7.Shape) And (Shape7.Shape <> stRectangle)) Or // 1. Senkrechte alle Gleich ?
  ((Shape2.Shape = Shape5.Shape) And (Shape5.Shape = Shape8.Shape) And (Shape8.Shape <> stRectangle)) Or // 2. Senkrechte alle Gleich ?
  ((Shape3.Shape = Shape6.Shape) And (Shape6.Shape = Shape9.Shape) And (Shape9.Shape <> stRectangle)) Or // 3. Senkrechte alle Gleich ?
  ((Shape1.Shape = Shape5.Shape) And (Shape5.Shape = Shape9.Shape) And (Shape9.Shape <> stRectangle)) Or // 1. Diagonale alle Gleich ?
  ((Shape3.Shape = Shape5.Shape) And (Shape5.Shape = Shape7.Shape) And (Shape7.Shape <> stRectangle)) // 2. Diagonale alle Gleich ?
  Then Begin
    ShowMessage('Spiel zu ende.');
    gesperrt := true;
  End;
End;

End.

