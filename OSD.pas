unit OSD;

{$Mode ObjFPC}
{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, LCLType;

type

  { TOSDForm }

  TOSDForm = class(TForm)
    Image1:TImage;
    ImageList1:TImageList;
    StateLabel: TLabel;
    StatePollTimer: TTimer;

    procedure FormCreate(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure StatePollTimerTimer(Sender:TObject);

  private
    procedure ShowBriefly;
    function StateBoolStr(const value: boolean): string;

  public

  end;

implementation

uses AppStates, DateUtils, Windows;

var
  lastNumLockState, lastCapsLockState, lastScrollLockState: boolean;
  isFirstTime: boolean;
  disappearTick: double;

  colourOn, colourOff: TColor;

{$R *.lfm}

{ TOSDForm }

procedure TOSDForm.StatePollTimerTimer(Sender:TObject);
begin
  if isFirstTime then begin
    { Don't show any notifications yet }
    lastNumLockState := numLockState;
    lastCapsLockState := capsLockState;
    lastScrollLockState := scrollLockState;

    isFirstTime := false;
  end;

  if visible and (now >= disappearTick) then
    visible := false;

  if lastNumLockState <> numLockState then begin
    lastNumLockState := numLockState;

    if lastNumLockState then
      StateLabel.Font.Color := colourOn
    else
      StateLabel.Font.Color := colourOff;

    StateLabel.Caption := format(
      'Num Lock: %s', [StateBoolStr(lastNumLockState)]);

    ShowBriefly
  end;


  if lastCapsLockState <> capsLockState then begin
    lastCapsLockState := capsLockState;

    if lastCapsLockState then
      StateLabel.Font.Color := colourOn
    else
      StateLabel.Font.Color := colourOff;

    StateLabel.Caption := format(
      'Caps Lock: %s', [StateBoolStr(lastCapsLockState)]);

    ShowBriefly
  end;

  if lastScrollLockState <> scrollLockState then begin
    lastScrollLockState := scrollLockState;

    if lastScrollLockState then
      StateLabel.Font.Color := colourOn
    else
      StateLabel.Font.Color := colourOff;

    StateLabel.Caption := format(
      'Scroll Lock: %s', [StateBoolStr(lastScrollLockState)]);

    ShowBriefly
  end;
end;

procedure TOSDForm.ShowBriefly;
var
  mon: TMonitor;
  ExStyle: PtrInt;
begin
  self.visible := true;

  { Handle always on top }
  SetWindowPos(
    self.Handle,
    HWND_TOPMOST,
    0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);

  { Handle positioning }
  { mon := Screen.MonitorFromWindow(self.handle, mdNearest); }
  mon := Screen.MonitorFromPoint(Mouse.CursorPos);
  left := mon.Left + (mon.width - self.width) div 2;
  top := mon.Top + (mon.Height * 2 div 3);

  { Handle click-through & semitransparency }
  ExStyle := GetWindowLongPtr(self.handle, GWL_EXSTYLE);

  SetWindowLongPtr(self.handle, GWL_EXSTYLE,
    ExStyle or WS_EX_LAYERED or WS_EX_TRANSPARENT);

  SetLayeredWindowAttributes(self.Handle, 0, trunc(0.7 * 255), LWA_ALPHA);

  disappearTick := IncSecond(now, 1);
end;

function TOSDForm.StateBoolStr(const value: boolean): string;
begin
  if value then
    result := 'ON'
  else
    result := 'OFF';
end;

procedure TOSDForm.FormCreate(Sender:TObject);
begin
  isFirstTime := true;
end;

procedure TOSDForm.FormShow(Sender:TObject);
begin
  self.Color := RGBToColor($20, $20, $20);
  { StateLabel.Font.Color := RGBToColor($FF, $FF, $FF); }

  StatePollTimer.Enabled := true;

  colourOn := RGBToColor($55, $ff, $55);
  colourOff := RGBToColor($aa, $aa, $aa);
end;

end.

