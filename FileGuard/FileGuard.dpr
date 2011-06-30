{ KOL MCK } // Do not remove this line!
program FileGuard;
{|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   File Guard - (C) by Vladimir Kladov, 2004
   ������ ��������� ������������� ��� ��������������� ���������� ����
   ������ ������ �� ���������� ��������� (����������, �����) � ���������
   ��������� (����������� ���������� � ����, ��������� ���������� �� ������
   ����, � ������� - �� CD-ROM ��� � �� ��� � ���� MS Source Safe ��� CVS
   ��� �� ftp �������).
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||}

uses
KOL,
  MainUnit in 'MainUnit.pas' {fmMainGuard},
  EditFilterUnit in 'EditFilterUnit.pas' {fmEditFilter},
  MultiDirsChange in 'MultiDirsChange.pas',
  StorageUnit in 'StorageUnit.pas',
  UpdatesUnit in 'UpdatesUnit.pas',
  HistoryUnit in 'HistoryUnit.pas' {fmHistory},
  FileVersionUnit in 'FileVersionUnit.pas',
  RestoreUnit in 'RestoreUnit.pas' {fmRestore};

{$R *.res}

begin // PROGRAM START HERE -- Please do not remove this comment

{$IFDEF KOL_MCK} {$I FileGuard_0.inc} {$ELSE}

  Application.Initialize;
  Application.CreateForm(TfmMainGuard, fmMainGuard);
  Application.Run;

{$ENDIF}

end.

