program project;

{$Mode ObjFPC}
{$H+}

uses
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, OSD;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='ThreeLocksOSD';
  Application.Scaled:=True;

  Application.ShowMainForm := true;
  Application.MainFormOnTaskbar := false;

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

