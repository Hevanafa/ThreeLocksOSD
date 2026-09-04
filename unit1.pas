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
    Label2:TLabel;
    NumLockBox:TCheckBox;
    ScrollLockBox:TCheckBox;
    PollTimer:TTimer;
    procedure FormClose(Sender:TObject;var CloseAction:TCloseAction);
    procedure FormShow(Sender:TObject);
    procedure PollTimerTimer(Sender:TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

uses Windows, AppStates;

{ TForm1 }

function IsNumLockOn: boolean;
begin
  Result := (GetKeyState(VK_NUMLOCK) and 1) <> 0
end;

function IsCapsLockOn: boolean;
begin
  Result := (GetKeyState(VK_CAPITAL) and 1) <> 0
end;

function IsScrollLockOn: boolean;
begin
  Result := (GetKeyState(VK_SCROLL) and 1) <> 0
end;

procedure TForm1.PollTimerTimer(Sender:TObject);
begin
  numLockState := IsNumLockOn;
  capsLockState := IsCapsLockOn;
  scrollLockState := IsScrollLockOn;

  NumLockBox.Checked := numLockState;
  CapsLockBox.Checked := capsLockState;
  ScrollLockBox.Checked := scrollLockState;
end;

procedure TForm1.FormShow(Sender:TObject);
begin
  PollTimer.Enabled := true;
end;

procedure TForm1.FormClose(Sender:TObject;var CloseAction:TCloseAction);
begin
  Application.Terminate;
end;

end.

