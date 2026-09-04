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
    Label1:TLabel;
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

uses Windows;

{ TForm1 }

function IsCapsLockOn: boolean;
begin
  Result := (GetKeyState(VK_CAPITAL) and 1) <> 0
end;

procedure TForm1.PollTimerTimer(Sender:TObject);
begin
  CapsLockBox.Checked := IsCapsLockOn;
end;

procedure TForm1.FormShow(Sender:TObject);
begin
  PollTimer.Enabled := true;
end;

end.

