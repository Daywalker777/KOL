unit MCKMHFindReplaceDialog;
//  MHFindReplaceDialog ��������� (MHFindReplaceDialog Component)
//  ����� (Author): ����� ������� (Zharov Dmitry) aka �������� (Gandalf)
//  ���� �������� (Create date): 1-���(dec)-2001
//  ���� ��������� (Last correction Date): 25-���(mar)-2003
//  ������ (Version): 0.81
//  EMail: Gandalf@kol.mastak.ru
//  ������������� (Thanks):
//  ����� � (New in):
//  V0.81
//  [+] ��������� D7 (D7 Support) [KOLnMCK]
//
//  V0.8
//  [N] ���� ������ (Test version) [KOLnMCK]
//
//  ������ ��� (To-Do list):
//  1. ��������� (Asm)
//  2. �������������� (Optimize)
//  3. ���������� (Clear Stuff)
//  4. ������� (Events)
//  5. ��� API (All API's)
//  6. ��������� �������� (Multi dialog)

interface

uses
  KOL, KOLMHFindReplaceDialog, mirror, mckObjs, Classes, Graphics;

type

  TKOLMHFindReplaceDialog = class(TKOLObj)
  private
    FDialogType:TFindReplaceDialogType;
    FReplaceText:String;
    FFindText:String;
    FOptions:TFindReplaceDialogOptions;
    procedure SetDialogType(const Value:TFindReplaceDialogType);
    procedure SetReplaceText(const Value:String);
    procedure SetFindText(const Value:String);
    procedure SetOptions(const Value:TFindReplaceDialogOptions);
  protected
    function  AdditionalUnits: string; override;
    procedure SetupFirst(SL: TStringList; const AName,AParent, Prefix: String); override;
    procedure SetupLast( SL: TStringList; const AName, AParent, Prefix: String ); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property DialogType:TFindReplaceDialogType read FDialogType write SetDialogType;
    property ReplaceText:String read FReplaceText write SetReplaceText;
    property FindText:String read FFindText write SetFindText;
    property Options:TFindReplaceDialogOptions read FOptions write SetOptions;
  end;

  procedure Register;

implementation

constructor TKOLMHFindReplaceDialog.Create(AOwner: TComponent);
begin
  inherited;
//  FCaption:='� ��������� ''''';
//  FCopyRight:='CopyRight 1984-2001';
//  FText:='� ��������� ''''';
//  FIcon := TIcon.Create;
end;

destructor TKOLMHFindReplaceDialog.Destroy;
begin
//  FIcon.Free;
  inherited;
end;

function TKOLMHFindReplaceDialog.AdditionalUnits;
begin
   Result := ', KOLMHFindReplaceDialog';
end;

procedure TKOLMHFindReplaceDialog.SetupFirst(SL: TStringList; const AName,
  AParent, Prefix: String);
var
  S: String;
begin
  SL.Add(''); // Add space for more code readability
  inherited;
  S := '';
  if doDown in Options then
    S := 'doDown';
  if doWholeWord in Options then
    S := S + ', doWholeWord';
  if doMatchCase in Options then
    S := S + ', doMatchCase';
  if doFindNext in Options then
    S := S + ', doFindNext';
  if doReplace in Options then
    S := S + ', doReplace';
  if doReplaceAll in Options then
    S := S + ', doReplaceAll';
  if doDialogTerm in Options then
    S := S + ', doDialogTerm';
  if doShowHelp in Options then
    S := S + ', doShowHelp';
  if doNoUpDown in Options then
    S := S + ', doNoUpDown';
  if doNoMatchCase in Options then
    S := S + ', doNoMatchCase';
  if doNoWholeWord in Options then
    S := S + ', doNoWholeWord';
  if doHideUpDown in Options then
    S := S + ', doHideUpDown';
  if doHideMatchCase in Options then
    S := S + ', doHideMatchCase';
  if doHideWholeWord in Options then
    S := S + ', doHideWholeWord';

  if S <> '' then
    if S[ 1 ] = ',' then
      S := Trim(Copy( S, 2, MaxInt ));

  if S<>'' then
    SL.Add( Prefix + '  ' + AName + '.Options:='+S+';');
  if FindText<>'' then
    SL.Add( Prefix + '  ' + AName + '.FindText:='''+FindText+''';');
  if ReplaceText<>'' then
    SL.Add( Prefix + '  ' + AName + '.ReplaceText:='''+ReplaceText+''';');
  if DialogType<>dtFind then
    SL.Add( Prefix + '  ' + AName + '.DialogType:=dtReplace;');
end;

procedure TKOLMHFindReplaceDialog.SetupLast(SL: TStringList; const AName,
  AParent, Prefix: String);
begin
  SL.Add( Prefix + '  ' + AName + '.WndOwner:=Result.Form.GetWindowHandle;' );
end;


procedure TKOLMHFindReplaceDialog.SetDialogType(const Value:TFindReplaceDialogType);
begin
  FDialogType:=Value;
  Change;
end;

procedure TKOLMHFindReplaceDialog.SetReplaceText(const Value:String);
begin
  FReplaceText:=Value;
  Change;
end;

procedure TKOLMHFindReplaceDialog.SetFindText(const Value:String);
begin
  FFindText:=Value;
  Change;
end;

procedure TKOLMHFindReplaceDialog.SetOptions(const Value:TFindReplaceDialogOptions);
begin
  FOptions:=Value;
  Change;
end;

procedure Register;
begin
  RegisterComponents('KOL Dialogs', [TKOLMHFindReplaceDialog]);
end;

end.

