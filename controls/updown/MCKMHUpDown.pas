unit MCKMHUpDown;
//  MHUpDown ��������� (MHUpDown Component)
//  ����� (Author): ����� ������� (Zharov Dmitry) aka �������� (Gandalf)
//  ���� �������� (Create date): 26-���(apr)-2002
//  ���� ��������� (Last correction Date): 5-���(aug)-2003
//  ������ (Version): 1.31
//  EMail: Gandalf@kol.mastak.ru
//  WWW: http://kol.mastak.ru
//  ������������� (Thanks):
//    Alexander Pravdin
//    Bogus�aw Brandys
//    dominiko-m
//  ����� � (New in):
//
//  V1.31
//  [!] ���������� "���������" Buddy (Buddy "eating" FIX) <Great Thanks to dominiko-m> [MCK]
//
//  V1.3
//  [*] ��������� KOLWrapper ������������ (KOLWrapper visualition support) [MCK]
//
//  V1.22
//  [!] ������������� � ������� (ToolTips compatability) [KOL]
//
//  V1.21
//  [!] ��������� D7 (D7 Support) [KOLnMCK]
//
//  V1.2
//  [!] ���������� ������ BuddySize (Fix BuddySize) [MCK]
//
//  V1.1
//  [!] ����������� Buddy (Fixed Buddy) <Great Thanks to Alexander Pravdin> [MCK]
//  [!] ���������� ������ Increment=0 (Increment=0 bug fixed) <Great Thanks to Alexander Pravdin> [MCK]
//  [-] ������� ������ BuddySize (Bug BuddySize found) [MCK]
//
//  V1.0
//  [+~] ������� OnChangingEx (OnChangingEx event) <Thanks to Bogus�aw Brandys> [KOLnMCK]
//  [+~] �������� Increment (Increment property) <Thanks to Bogus�aw Brandys> [KOLnMCK]
//  [*] ������ �������������� 32��� �������� Position (32bit position support now) [KOLnMCK]
//
//  V0.9
//  [+] ��������� D6 (D6 Support) <Thanks to Alexander Pravdin> [KOLnMCK]
//  [+++] ����� ����� (Very much) [KOLnMCK]
//
//  V0.4
//  +Add Recreate
//  +Optimize Visible (may usefull for all KOL)
//  +Fix Double (KOL)
//  +Add HotTrack
//  +Add BuddyInteger
//  +Add ButtonAlign
//  +Add AutoBuddy
//  +Add Wrap Better
//  +Add Thousands Better
//  +Add ArrowKeys
//  +Add Orient Better
//  -Some Bug Buddy (Buddy Object Become smaller, and YourSelf can't be Buddy)
//  V0.21
//  +Add Updata Paint (for KOLnMCK 1.30)
//  +Add Improve Paint
//  V0.20
//  +Add Enabled
//  +Add EraseBgr
//  +Add Tag
//  V0.19
//  +Add HexBase
//  +Add OnMove
//  +Add OnFileDrop
//  +Add OnPaint
//  V0.18
//  +Add OnMouseMove
//  +Add OnMouseUp
//  +Add OnMouseDown
//  +Add OnMouseLeave
//  +Add OnMouseEnter
//  +Add OnResize
//  +Add OnHide
//  +Add OnShow
//  V0.17
//  +Add Buddy
//  +Add Default Values
//  V0.15
//  +Add Better Paint
//  V0.1
//  +Add OnScroll
//  +Add so-so Paint (MCK)
//  +Add Min/Max/Position/Wrap/Orientation/Thousands
//  +Add Cursor
//  +Add Visible
//
//  ������ ��� (To-Do list):
//  1. ��������� (Asm)
//  2. �������������� (Optimize)
//  3. ������ (Errors)
//  4. ������� (Events)
//  5. ������� (Help)

interface

uses
  Windows, Controls, Classes, KOLMHUpDown, mirror, KOL, Graphics, MCKCtrls;

type
  TKOLMHUpDown = class(TKOLControl)
  private
    FMax: Integer;
    FMin: Integer;
    FPosition: Integer;
    FIncrement: Integer;
    FArrowKeys: Boolean;
    FHotTrack: Boolean;
    FAutoBuddy: Boolean; // ���������� ��������
    FThousands: Boolean;
    FWrap: Boolean;
    FHexBase: Boolean;
    FAlignButton: TUpDownAlignButton; // ���������� ��������
    FOrientation: TUpDownOrientation; // ���������� ��������
    FBuddy: TKOLControl; // ���������� ��������
    FOnChangingEx: TOnChangingEx;

    // ��������� ��������
    FNotAvailable: Boolean;

    procedure SetHotTrack(const Value: Boolean);
    procedure SetMax(const Value: Integer);
    procedure SetMin(const Value: Integer);
    procedure SetPosition(const Value: Integer);
    procedure SetArrowKeys(const Value: Boolean);
    procedure SetWrap(const Value: Boolean);
    procedure SetThousands(const Value: Boolean);
    procedure SetOrientation(const Value: TUpDownOrientation);
    procedure SetAlignButton(const Value: TUpDownAlignButton);
    procedure SetAutoBuddy(const Value: Boolean);
    procedure SetBuddy(const Value: TKOLControl);
    procedure SetHexBase(const Value: Boolean);
    procedure SetOnChanging(const Value: TOnChangingEx);
    procedure SetIncrement(const Value: Integer);
  protected
    function AdditionalUnits: string; override;
    procedure SetupConstruct(SL: TStringList; const AName, AParent, Prefix: string); override;
    procedure AssignEvents(SL: TStringList; const AName: string); override;
    procedure SetupFirst(SL: TStringList; const AName, AParent, Prefix: string); override;
    function SetupParams(const AName, AParent: string): string; override;
    procedure SetupLast(SL: TStringList; const AName, AParent, Prefix: string); override;
    procedure CreateKOLControl(Recreating: Boolean); override;
    procedure KOLControlRecreated; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Min: Integer read FMin write SetMin;
    property Max: Integer read FMax write SetMax;
    property Position: Integer read FPosition write SetPosition;
    property ArrowKeys: Boolean read FArrowKeys write SetArrowKeys;
    property Orientation: TUpDownOrientation read FOrientation write SetOrientation;
    property AlignButton: TUpDownAlignButton read FAlignButton write SetAlignButton;
    property Increment: Integer read FIncrement write SetIncrement;
    property Thousands: Boolean read FThousands write SetThousands;
    property Wrap: Boolean read FWrap write SetWrap;
    property AutoBuddy: Boolean read FAutoBuddy write SetAutoBuddy;
    property Buddy: TKOLControl read FBuddy write SetBuddy;
    property HexBase: Boolean read FHexBase write SetHexBase;
    property HotTrack: boolean read FHotTrack write SetHotTrack;

    property OnChangingEx: TOnChangingEx read FOnChangingEx write SetOnChanging;
    property OnScroll;
    property Caption: Boolean read FNotAvailable;
    property Color: Boolean read FNotAvailable;
    property Font: Boolean read FNotAvailable;

    property OnClick: Boolean read FNotAvailable;
    property OnMouseDblClk: Boolean read FNotAvailable;
    property OnMouseWheel: Boolean read FNotAvailable;
  end;

procedure Register;

implementation

constructor TKOLMHUpDown.Create(AOwner: TComponent);
begin
  inherited;
  FMax := 100;
  FMin := 0;
  FPosition := 0;
  FOrientation := udVertical;
  FAlignButton := udRight;
  Width := 22;
end;

function TKOLMHUpDown.AdditionalUnits;
begin
  Result := ', KOLMHUpDown';
end;

procedure TKOLMHUpDown.AssignEvents(SL: TStringList; const AName: string);
begin
  inherited;
  DoAssignEvents(SL, AName, ['OnChangingEx'], [@OnChangingEx]);
end;

procedure TKOLMHUpDown.SetupConstruct(SL: TStringList; const AName,
  AParent, Prefix: string);
var
  S: string;
begin
  S := GenerateTransparentInits;
  if FBuddy <> nil then
    SL.Add(Prefix + AName + ' := PMHUpDown( New' + TypeName + '( '
      + SetupParams(AName, AParent) + ' )' + ');')
  else
    SL.Add(Prefix + AName + ' := PMHUpDown( New' + TypeName + '( '
      + SetupParams(AName, AParent) + ' )' + S + ');');
end;

procedure TKOLMHUpDown.SetupFirst(SL: TStringList; const AName,
  AParent, Prefix: string);
const
  Boolean2Str: array[Boolean] of string = ('False', 'True');
  Orientation2Str: array[TUpDownOrientation] of string = ('udHorizontal',
    'udVertical');
  AlignButton2Str: array[TUpDownAlignButton] of string = ('udLeft', 'udRight');
begin
  inherited;
  if Max <> 0 then
    SL.Add(Prefix + AName + '.Max:=' + Int2Str(Max) + ';');
  if Min <> 100 then
    SL.Add(Prefix + AName + '.Min:=' + Int2Str(Min) + ';');
  if HexBase then
    SL.Add(Prefix + AName + '.HexBase:=True;');
  if Position <> 0 then
    SL.Add(Prefix + AName + '.Position:=' + Int2Str(Position) + ';');
  if Increment <> 0 then
    SL.Add(Prefix + AName + '.Increment:=' + Int2Str(Increment) + ';');
end;

function TKOLMHUpDown.SetupParams(const AName, AParent: string): string;
const
  Boolean2Str: array[Boolean] of string = ('False', 'True');
  Orientation2Str: array[TUpDownOrientation] of string = ('udHorizontal',
    'udVertical');
  AlignButton2Str: array[TUpDownAlignButton] of string = ('udLeft', 'udRight');
begin
  Result := AParent + ', ' + Orientation2Str[FOrientation] + ', ' +
    Boolean2Str[Wrap] + ', ' + Boolean2Str[Thousands] + ', ' +
    Boolean2Str[ArrowKeys] + ', ' + Boolean2Str[AutoBuddy] + ', ' +
    Boolean2Str[HotTrack] + ',True,' + AlignButton2Str[AlignButton];
end;

procedure TKOLMHUpDown.SetupLast(SL: TStringList; const AName,
  AParent, Prefix: string);
begin
  inherited;
  if FBuddy <> nil then
  begin
    SL.Add(Prefix + AName + '.Buddy:=Result.' + FBuddy.Name +
      '.GetWindowHandle;');
    SL.Add(Prefix + AName + '.SetPosition( ' + int2str(Left) + ', '
      + int2str(Top) + ' );');
    SL.Add(Prefix + AName + '.Height := ' + int2str(Height) + ';');
    SL.Add(Prefix + 'Result.' + FBuddy.Name + '.Width := ' +
      int2str(FBuddy.Width) + ';');

  end;
  SL.Add(Prefix + AName + '.Width := ' + int2str(Width) + ';');
end;

procedure TKOLMHUpDown.SetMax(const Value: Integer);
begin
  FMax := Value;
  Change;
end;

procedure TKOLMHUpDown.SetMin(const Value: Integer);
begin
  FMin := Value;
  Change;
end;

procedure TKOLMHUpDown.SetPosition(const Value: Integer);
begin
  FPosition := Value;
  Change;
end;

procedure TKOLMHUpDown.SetArrowKeys(const Value: Boolean);
begin
  FArrowKeys := Value;
  Change;
end;

procedure TKOLMHUpDown.SetWrap(const Value: Boolean);
begin
  FWrap := Value;
  Change;
end;

procedure TKOLMHUpDown.SetThousands(const Value: Boolean);
begin
  FThousands := Value;
  Change;
end;

procedure TKOLMHUpDown.SetOrientation(const Value: TUpDownOrientation);
begin
  FOrientation := Value;
  RecreateWnd;
  Change;
  Invalidate;
end;

procedure TKOLMHUpDown.SetAlignButton(const Value: TUpDownAlignButton);
begin
  if Value <> FAlignButton then
  begin
    FAlignButton := Value;
    if Assigned(FBuddy) then
    begin
      Top := FBuddy.Top;
      Height := FBuddy.Height;
      if Value = udRight then
        Left := FBuddy.Left + FBuddy.Width
      else
        Left := FBuddy.Left - Width;
    end;
    RecreateWnd;
    Change;
    Invalidate;
  end;
end;

procedure TKOLMHUpDown.SetAutoBuddy(const Value: Boolean);
begin
  FAutoBuddy := Value;
  if Value then
  begin
    FBuddy := nil;
    PMHUpDown(FKOLCtrl).Buddy := 0;
  end;
  Change;
end;

procedure TKOLMHUpDown.SetBuddy(const Value: TKOLControl);
begin
  if Value <> nil then
  begin
    FAutoBuddy := False;
    Top := Value.Top;
    Height := Value.Height;
    if FAlignButton = udRight then
      Left := Value.Left + Value.Width
    else
      Left := Value.Left - Width;
      if (FBuddy <> Value) and not (csLoading in ComponentState) then PMHUpDown(FKOLCtrl).Buddy
:= Value.Handle;
  end
  else
  begin
    PMHUpDown(FKOLCtrl).Buddy := 0;
  end;
  FBuddy := Value;
  Change;
  Invalidate;
end;

procedure TKOLMHUpDown.SetIncrement(const Value: Integer);
begin
  FIncrement := Value;
  Change;
end;

procedure TKOLMHUpDown.SetHexBase(const Value: Boolean);
begin
  if FHexBase <> Value then
  begin
    FHexBase := Value;
    Change;
  end;
end;

procedure TKOLMHUpDown.SetHotTrack(const Value: Boolean);
begin
  if FHotTrack <> Value then
  begin
    FHotTrack := Value;
    Change;
  end;
end;

procedure TKOLMHUpDown.SetOnChanging(const Value: TOnChangingEx);
begin
  FOnChangingEx := Value;
  Change;
end;

procedure TKOLMHUpDown.CreateKOLControl(Recreating: Boolean);
begin
  FKOLCtrl := PControl(NewMHUpDown(KOLParentCtrl, Orientation, Wrap, Thousands,
    ArrowKeys, AutoBuddy, HotTrack, True, AlignButton));
end;

procedure TKOLMHUpDown.KOLControlRecreated;
begin
  inherited;
  PMHUpDown(FKOLCtrl).Width := Width;
end;

procedure Register;
begin
  RegisterComponents('KOL Win32', [TKOLMHUpDown]);
end;

end.

