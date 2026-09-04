program project;

{$Mode ObjFPC}
{$H+}

uses
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='ThreeLocksOSD';
  Application.Scaled:=True;
  {$PUSH}{$WARN 5044 OFF}
  Application.MainFormOnTaskbar:=True;
  {$POP}
  Application.Initialize;
  Application.CreateForm(TForm1,Form1);
  Application.Run;
end.

