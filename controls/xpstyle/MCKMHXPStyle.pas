unit MCKMHXPStyle;
//  MHXPStyle ��������� (MHXPStyle Component)
//  ����� (Author): ����� ������� (Zharov Dmitry) aka �������� (Gandalf)
//  ���� �������� (Create date): 20-���(jul)-2003
//  ���� ��������� (Last correction Date): 10-���(jul)-2003
//  ������ (Version): 0.7
//  EMail: Gandalf@kol.mastak.ru
//  WWW: http://kol.mastak.ru
//  ������������� (Thanks):
//    MTsv DN
//  ����� � (New in):
//  V0.7
//  [+] ������ (Made it) [KOLnMCK]
//
//  ������ ��� (To-Do list):
//  1. ��������� (Asm)
//  2. �������������� (Optimize)
//  3. ���������� (Clear Stuff)
//  4. ������ (Errors)
//  5. ����
//  6. ������ + XP
//  7. ���� ���������
//  8. ����� ������

interface

uses
  Windows, Controls, Classes, KOLMHXPStyle, mirror, mckCtrls, KOL, Graphics;

type

  TKOLMHXPEditBox = class(TKOLEditBox)
  protected
    function AdditionalUnits: string; override;
    procedure SetupConstruct(SL: TStringList; const AName, AParent, Prefix: string); override;
  end;

  TKOLMHXPButton = class(TKOLButton)
  protected
    function AdditionalUnits: string; override;
    procedure SetupConstruct(SL: TStringList; const AName, AParent, Prefix: string); override;
  end;

  TKOLMHXPCheckBox = class(TKOLCheckBox)
  protected
    function AdditionalUnits: string; override;
    procedure SetupConstruct(SL: TStringList; const AName, AParent, Prefix: string); override;
  end;

  TKOLMHXPRadioBox = class(TKOLRadioBox)
  protected
    function AdditionalUnits: string; override;
    procedure SetupConstruct(SL: TStringList; const AName, AParent, Prefix: string); override;
  end;

  TKOLMHXPComboBox = class(TKOLComboBox)
  protected
    function AdditionalUnits: string; override;
    procedure SetupConstruct(SL: TStringList; const AName, AParent, Prefix: string); override;
  end;

  TKOLMHXPRichEdit = class(TKOLRichEdit)
  protected
    function AdditionalUnits: string; override;
    procedure SetupConstruct(SL: TStringList; const AName, AParent, Prefix: string); override;
  end;

  TKOLMHXPMemo = class(TKOLMemo)
  protected
    function AdditionalUnits: string; override;
    procedure SetupConstruct(SL: TStringList; const AName, AParent, Prefix: string); override;
  end;

  TKOLMHXPPanel = class(TKOLPanel)
  protected
    function AdditionalUnits: string; override;
    procedure SetupConstruct(SL: TStringList; const AName, AParent, Prefix: string); override;
  end;

procedure Register;

implementation

procedure TKOLMHXPEditBox.SetupConstruct(SL: TStringList; const AName,
  AParent, Prefix: string);
var
  S: string;
begin
  S := GenerateTransparentInits;
  SL.Add(Prefix + AName + ' := PMHXPControl( New' + TypeName + '( '
    + SetupParams(AName, AParent) + ' )' + S + ');');
end;

function TKOLMHXPEditBox.AdditionalUnits;
begin
  Result := ', KOLMHXPStyle';
end;

procedure TKOLMHXPButton.SetupConstruct(SL: TStringList; const AName,
  AParent, Prefix: string);
var
  S: string;
begin
  S := GenerateTransparentInits;
  SL.Add(Prefix + AName + ' := PMHXPControl( New' + TypeName + '( '
    + SetupParams(AName, AParent) + ' )' + S + ');');
end;

function TKOLMHXPButton.AdditionalUnits;
begin
  Result := ', KOLMHXPStyle';
end;

procedure TKOLMHXPCheckBox.SetupConstruct(SL: TStringList; const AName,
  AParent, Prefix: string);
var
  S: string;
begin
  S := GenerateTransparentInits;
  SL.Add(Prefix + AName + ' := PMHXPControl( New' + TypeName + '( '
    + SetupParams(AName, AParent) + ' )' + S + ');');
end;

function TKOLMHXPCheckBox.AdditionalUnits;
begin
  Result := ', KOLMHXPStyle';
end;

procedure TKOLMHXPRadioBox.SetupConstruct(SL: TStringList; const AName,
  AParent, Prefix: string);
var
  S: string;
begin
  S := GenerateTransparentInits;
  SL.Add(Prefix + AName + ' := PMHXPControl( New' + TypeName + '( '
    + SetupParams(AName, AParent) + ' )' + S + ');');
end;

function TKOLMHXPRadioBox.AdditionalUnits;
begin
  Result := ', KOLMHXPStyle';
end;

procedure TKOLMHXPComboBox.SetupConstruct(SL: TStringList; const AName,
  AParent, Prefix: string);
var
  S: string;
begin
  S := GenerateTransparentInits;
  SL.Add(Prefix + AName + ' := PMHXPControl( New' + TypeName + '( '
    + SetupParams(AName, AParent) + ' )' + S + ');');
end;

function TKOLMHXPComboBox.AdditionalUnits;
begin
  Result := ', KOLMHXPStyle';
end;

procedure TKOLMHXPRichEdit.SetupConstruct(SL: TStringList; const AName,
  AParent, Prefix: string);
var
  S: string;
begin
  S := GenerateTransparentInits;
  SL.Add(Prefix + AName + ' := PMHXPControl( New' + TypeName + '( '
    + SetupParams(AName, AParent) + ' )' + S + ');');
end;

function TKOLMHXPRichEdit.AdditionalUnits;
begin
  Result := ', KOLMHXPStyle';
end;

procedure TKOLMHXPMemo.SetupConstruct(SL: TStringList; const AName,
  AParent, Prefix: string);
var
  S: string;
begin
  S := GenerateTransparentInits;
  SL.Add(Prefix + AName + ' := PMHXPControl( New' + TypeName + '( '
    + SetupParams(AName, AParent) + ' )' + S + ');');
end;

function TKOLMHXPMemo.AdditionalUnits;
begin
  Result := ', KOLMHXPStyle';
end;

procedure TKOLMHXPPanel.SetupConstruct(SL: TStringList; const AName,
  AParent, Prefix: string);
var
  S: string;
begin
  S := GenerateTransparentInits;
  SL.Add(Prefix + AName + ' := PMHXPControl( New' + TypeName + '( '
    + SetupParams(AName, AParent) + ' )' + S + ');');
end;

function TKOLMHXPPanel.AdditionalUnits;
begin
  Result := ', KOLMHXPStyle';
end;

procedure Register;
begin
  RegisterComponents('KOL XPStyle', [TKOLMHXPEditBox]);
  RegisterComponents('KOL XPStyle', [TKOLMHXPButton]);
  RegisterComponents('KOL XPStyle', [TKOLMHXPCheckBox]);
  RegisterComponents('KOL XPStyle', [TKOLMHXPRadioBox]);
  RegisterComponents('KOL XPStyle', [TKOLMHXPComboBox]);
  RegisterComponents('KOL XPStyle', [TKOLMHXPRichEdit]);
  RegisterComponents('KOL XPStyle', [TKOLMHXPMemo]);
  RegisterComponents('KOL XPStyle', [TKOLMHXPPanel]);
end;

end.

