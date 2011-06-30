unit MCKMHAboutDialog;
//  MHAboutDialog ��������� (MHAboutDialog Component)
//  ����� (Author): ����� ������� (Zharov Dmitry) aka �������� (Gandalf)
//  ���� �������� (Create date): 21-���(oct)-2001
//  ���� ��������� (Last correction Date): 15-���(feb)-2003
//  ������ (Version): 1.14
//  EMail: Gandalf@kol.mastak.ru
//  WWW: http://kol.mastak.ru
//  ������������� (Thanks):
//    Michael Beschetov
//    Alexander Pravdin
//  ����� � (New in):
//  V1.14
//  [+] ��������� D7 (D7 Support) [KOLnMCK]
//
//  V1.13
//  [+] ��������� D6 (D6 Support) <Thanks to Alexander Pravdin> [KOLnMCK]
//
//  V1.12 2002-����-10
//  Opti-z (KOL)
//
//  V1.11 2002-����-20
//  PChar Bug Fix (Thanks to Michael Beschetov)
//
//  ������ ��� (To-Do list):
//  1. ��������� (Asm)
//  2. �������������� (Optimize)


interface

uses
  KOL, KOLMHAboutDialog, Mirror, MCKObjs, Classes, Graphics;

type

  TKOLMHAboutDialog = class(TKOLObj)
  private
     FTitle:String;
     FCopyRight:String;
     FText:String;
     FIcon:TIcon;
     FIconType:TIconType;
     procedure SetTitle(const Value:String);
     procedure SetCopyRight(const Value:String);
     procedure SetText(const Value:String);
     procedure SetIcon(const Value: TIcon);
     procedure SetIconType(const Value:TIconType);
  protected
    function  AdditionalUnits: string; override;
    procedure SetupFirst(SL: TStringList; const AName,AParent, Prefix: String); override;
    function SetupParams(const AName, AParent: String): String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Title:String read FTitle write SetTitle;
    property CopyRight:String read FCopyRight write SetCopyRight;
    property Text:String read FText write SetText;
    property Icon:TIcon read FIcon write SetIcon;
    property IconType:TIconType read FIconType write SetIconType;
  end;

  procedure Register;

implementation

constructor TKOLMHAboutDialog.Create(AOwner: TComponent);
begin
  inherited;
  // �������� �� ���������
  FTitle:='� ��������� "���������"';
  FCopyRight:='CopyRight 1984-2001 ���� �����';
  FText:='���������';
  FIcon := TIcon.Create;
  FIconType:=itApplication;
end;

destructor TKOLMHAboutDialog.Destroy;
begin
  FIcon.Free;
  inherited;
end;

function TKOLMHAboutDialog.AdditionalUnits;
begin
   Result := ', KOLMHAboutDialog';
end;


procedure TKOLMHAboutDialog.SetupFirst(SL: TStringList; const AName, AParent, Prefix: String);
const
  IconType2Str:array [TIconType] of String=('itShell','itApplication','itCustom');
var
  RsrcName,RsrcFile:String;
begin
  inherited;
  SL.Add(Prefix+AName+'.Title:='+String2PascalStrExpr(Title)+';');
  SL.Add(Prefix+AName+'.CopyRight:='+String2PascalStrExpr(CopyRight)+';');
  SL.Add(Prefix+AName+'.Text:='+String2PascalStrExpr(Text)+';');
  if Icon.Empty then
    SL.Add(Prefix+AName+'.Icon:=0;')
  else
  begin
    RsrcName:=UpperCase(ParentKOLForm.FormName+'_'+Name);
    RsrcFile:=ParentKOLForm.FormName+'_'+Name;
    SL.Add(Prefix+AName + '.Icon:=LoadIcon(hInstance,'+String2PascalStrExpr(RsrcName)+')'+';');
    SL.Add(Prefix+'  {$R ' + RsrcFile + '.RES}');
    GenerateIconResource(Icon,RsrcName,RsrcFile,fUpdated );
  end;
  SL.Add(Prefix+AName+'.IconType:='+IconType2Str[IconType]+';');
end;

function TKOLMHAboutDialog.SetupParams(const AName, AParent: String): String;
begin
  Result:='';
end;

procedure TKOLMHAboutDialog.SetTitle(const Value:String);
begin
  FTitle:=Value;
  Change;
end;

procedure TKOLMHAboutDialog.SetCopyRight(const Value:String);
begin
  FCopyRight:=Value;
  Change;
end;

procedure TKOLMHAboutDialog.SetText(const Value:String);
begin
  FText:=Value;
  Change;
end;

procedure TKOLMHAboutDialog.SetIcon(const Value:TIcon);
begin
  FIcon.Assign(Value);
  Change;
end;

procedure TKOLMHAboutDialog.SetIconType(const Value:TIconType);
begin
  FIconType:=Value;
  Change;
end;

procedure Register;
begin
  RegisterComponents('KOL Dialogs', [TKOLMHAboutDialog]);
end;

end.

