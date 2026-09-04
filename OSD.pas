unit OSD;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
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

uses AppStates, DateUtils;

var
  lastNumLockState, lastCapsLockState, lastScrollLockState: boolean;
  isFirstTime: boolean;
  disappearTick: double;

{$R *.lfm}

{ TForm2 }

procedure TForm2.StatePollTimerTimer(Sender:TObject);
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

    StateLabel.Caption := format(
      'Num Lock: %s', [StateBoolStr(lastNumLockState)]);

    ShowBriefly
  end;

  if lastCapsLockState <> capsLockState then begin
    lastCapsLockState := capsLockState;

    StateLabel.Caption := format(
      'Caps Lock: %s', [StateBoolStr(lastCapsLockState)]);

    ShowBriefly
  end;

    if lastScrollLockState <> scrollLockState then begin
    lastScrollLockState := scrollLockState;

    StateLabel.Caption := format(
      'Scroll Lock: %s', [StateBoolStr(lastScrollLockState)]);

    ShowBriefly
  end;
end;

procedure TForm2.ShowBriefly;
var
  mon: TMonitor;
begin
  Visible := true;
  disappearTick := IncSecond(now, 1);

  mon := Screen.MonitorFromWindow(self.handle, mdNearest);
  left := mon.Left + (mon.width - self.width) div 2;
  top := mon.Top + (mon.Height * 2 div 3);
end;

function TForm2.StateBoolStr(const value: boolean): string;
begin
  if value then
    result := 'ON'
  else
    result := 'OFF';
end;

procedure TForm2.FormCreate(Sender:TObject);
begin
  isFirstTime := true;
end;

procedure TForm2.FormShow(Sender:TObject);
begin
  StatePollTimer.Enabled := true;
end;

end.

