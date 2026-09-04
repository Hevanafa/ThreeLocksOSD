unit Unit1;

{$Mode ObjFPC}
{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,StdCtrls,ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    CapsLockBox:TCheckBox;
    NumLockBox:TCheckBox;
    ScrollLockBox:TCheckBox;
    PollTimer:TTimer;
    procedure FormShow(Sender:TObject);
    procedure PollTimerTimer(Sender:TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.PollTimerTimer(Sender:TObject);
begin

end;

procedure TForm1.FormShow(Sender:TObject);
begin
  PollTimer.Enabled := true;
end;

end.

