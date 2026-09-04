unit Unit1;

{$Mode ObjFPC}
{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  OSD;

type

  { TForm1 }

  TForm1 = class(TForm)
    CapsLockBox:TCheckBox;
    Label1:TLabel;
    Label2:TLabel;
    NumLockBox:TCheckBox;
    ScrollLockBox:TCheckBox;
    PollTimer:TTimer;

    formOSD: TOSDForm;
    TrayIcon1:TTrayIcon;

    procedure FormClose(Sender:TObject;var CloseAction:TCloseAction);
    procedure FormCreate(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure FormWindowStateChange(Sender:TObject);
    procedure PollTimerTimer(Sender:TObject);
    procedure TrayIcon1DblClick(Sender:TObject);
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

procedure TForm1.TrayIcon1DblClick(Sender:TObject);
begin
  self.show;
  WindowState := wsNormal;
end;

procedure TForm1.FormShow(Sender:TObject);
begin
  PollTimer.Enabled := true;

  TrayIcon1.Visible := true;
  TrayIcon1.Icon := Application.Icon;
  TrayIcon1.Hint := self.Caption;
end;

procedure TForm1.FormWindowStateChange(Sender:TObject);
begin
  if WindowState = wsMinimized then
    self.hide;
end;

procedure TForm1.FormClose(Sender:TObject;var CloseAction:TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  { ShowWindow(Application.Handle, SW_HIDE); }

  formOSD := TOSDForm.Create(self);
  formOSD.Show;
  formOSD.Visible := false;
end;

end.

