unit signature;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    bReset: TButton;
    bOK: TButton;
    Layout1: TLayout;
    RoundRect1: TRoundRect;
    Path1: TPath;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    procedure RoundRect1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure RoundRect1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure bOKClick(Sender: TObject);
    procedure bResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.bOKClick(Sender: TObject);
  var B:TBrushBitmap;
begin
  B:=TbrushBitmap.Create;
  B.Bitmap.Assign(Path1.MakeScreenshot);
  B.Bitmap.Resize(Trunc(path1.Width),Trunc(Path1.Height));
  Rectangle1.Fill.Kind:=TbrushKind.Bitmap;
  Rectangle1.Fill.Bitmap.Assign(B);
  Path1.Data.Clear;
end;

procedure TForm1.bResetClick(Sender: TObject);
begin
  Rectangle1.Fill.Kind:=TbrushKind.None;
  Path1.Data.Clear;
  Layout1.Repaint;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RoundRect1.AutoCapture:=True;
end;

procedure TForm1.RoundRect1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  if ssLeft in shift then path1.Data.MoveTo(TpointF.Create(X,Y));
end;

procedure TForm1.RoundRect1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
  if ssLeft in shift then
    begin
      Path1.Data.LineTo(TpointF.Create(X,Y));
      RoundRect1.Repaint;
    end;
end;

end.
