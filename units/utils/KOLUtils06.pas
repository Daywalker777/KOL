unit KOLUtils06;

// ��� ��������� ������� �������������� XHelpGen
// For generation of the reference use XHelpGen
/////////////////////////////////////////////////////////////////////////////
{*
|<b>KOLUtilis 0.6</b>
|<p>
KOLUtilis - ������� ������� ��� KOL.
|<br>
���� �� ������ �������� ���� ��������� ��� ������� � ���� ������ ������ ��
|<A href="mailto:support@kol.mastak.ru"> support@kol.mastak.ru </a> <br>
��� ��� ����� �������� � ��������� ������ ���������.
|<br>
������� �������������
|<A href="mailto:mike.dld@tut.by"> Mike Semenyako</a> �� ������.
|<p>
KOLUtils - ultimate decisions for KOL.
|<br>
If you want to add your procedure or function to this module, write to
|<A href="mailto:support@kol.mastak.ru"> support@kol.mastak.ru </a><br>
Your code will be added with indication of your authorship.
|<br>
Express thanks
|<A href="mailto:mike.dld@tut.by"> Mike Semenyako</a>
for help.
|<p>
|<A href="http://xcl.cjb.net/">http://xcl.cjb.net/</a>
|<br>
|<A href="http://kol.mastak.ru/">http://kol.mastak.ru/</a>
}
/////////////////////////////////////////////////////////////////////////////


interface
 uses
  windows,messages,kol,winsock,shlobj,err,ShellApi;

procedure uGetSubPath(var List:PStrList;Dir:string);
{*
���������� � List ������ ������������ ���������� Dir
|<br>
Returns the list of subdirectories of the 'Dir' directory to 'List'}

procedure uGetDrives(var ListDrives:PStrList);
{*
���������� � ListDrives ������ ���� ����������
|<br>
Returns the list of the letters of drives to 'List'}

type
  TTypeDrives = (tdHDD, tdCD, tdFlopy, tdRemote, tdRamDisk);
{* ���� ���������
|<br>
Types of drives}

function uGetTypeDrives(CharDrives:Char):TTypeDrives;
{* ���������� ��� �������� ��� ������ CharDrives
|<br>
Returns the type of the drive with 'CharDrives' letter}

function uGetComputerName: string;
{* ��������� ����� ����������
|<br>
Returns the computer name}

function uGetUserName: string;
{* ��������� ����� ������������
|<br>
Returns the user name}

procedure uGetCaptionApp(var ListApp:PStrList;Handle:hWnd);
{���������� � ListApp ��������� ���� ���������� ���������� � Windows
 Handle - ����� ���� ������ ����������
|<br>
 Returns the captions of all currently running applications to 'ListApp'
 'Handle' - your application's window handle }

procedure uGetDisplayResolution(var x,y:integer);
{* ������� � X(�����������) � Y(���������) ������� ���������� ������
|<br>
Returns the current horizontal ('X') and vertical ('Y') screen dimensions }

procedure uSetDisplayResolution(x,y:integer);
{*�������� ���������� ������.
|<br>
Changes screen dimensions}

function uGetLoacalHostName:string ;
{*���������� �������� ��� �������� ����������
|<br>
Returns the host name of the current computer}

function uHost2IP(HostName:string): String;
{*����������� �������� ��� HostName � IP �����
|<br>
Convert 'HostName' into IP address}

function uIP2Host(IPAddr : String): String;
{*����������� IP ������ � �������� ���
|<br>
Converts 'IPAddr' into host name}

function uGetNetName(Handle:hWnd;Title:string):string;
{*������ ������ ���������� � ����. ���������� ��� ����������.
|<br>
Handle -  ����� ���� ������ ����������
|<br>
Title - ��������� � �������
|<br>
Net computer selecting dialog; returns the name of the selected computer
|<br>
'Handle' - your application's window handle
|<br>
'Title' - dialog message text}

Function uGetAllCompNet(dat: PNetResource;var list: pStrList):Word;
{* ���������� ������ ���� ����������� � ����
|<br>
Returns the list of all the net computers to 'List'
}

procedure uWriteEndFile(FileName:string;Data:PStream);
{* ����������� ����� ����� ��� ������ FileName ������ �� Data
|<br>
  Attaches data from 'Data' to the end of 'FileName' file
|<p>
Attached:= NewReadFileStream('E:\Attached.txt');
|<br>
uWriteEndFile('E:\Main.txt',Attached);
|<br>
Attached.Free;
}

procedure uReadEndFile(FileName:string;var Data:PStream);
{* ������ �� ����� ����� ��� ������ FileName ������ � Data.
������ ������ ���� �������� ���������� uWriteEndFile.
|<br>
Reads data from the end of 'FileName' file into 'Data'.
Data must be attached using uWriteEndFile procedure.}

procedure uDelEndFile(FileName:string);
{* ������� � ����� ����� ���������� ���������� uWriteEndFile.
|<br>
Deletes data from the end of 'FileName' file attached using uWriteEndFile.}

function uCheckNet:boolean;
{*�������� ��������� �� ��������� � ����. ���� ��������� ������������ true.
|<br>
Checks up whether the computer is connected to the network. If so, returns true.}

function uGetFileList(const dir,mask: string; var List:PStrList):boolean;
{*������� � List ����� ���� ������ � ���������� Dir ��������������� ����� Mask
|<br>
Returns to 'List' all filenames from 'Dir' directory according to 'Mask'.
}

procedure uSaveWindowsPos(Form:PControl;NameIniFile,Sec:string);
{* ��������� ������ �� ������� � ������� ���� Form � ini �����(NameIniFile) � ������ Sec
|<br>
Saves the data containing position and dimensions of 'Form' window to ini file ('NameIniFile') in 'Sec' section
|<br>
  Main := NewForm(Applet,'XXXX');
|<br>
  ...
|<br>
  uSavePosWindows(Main,'C:\DATA.INI','win_main');
}

procedure uLoadWindowsPos(Form:PControl;NameIniFile,Sec:string);
{* ��������������� ��������� ���� ����������� SavePosWindows.
|<br>
Restores window parameters saved using uSavePosWindows.
}

procedure uSlashAdd(var path:string);
{* ��������� � ����� path ������ '\' ���� ��� ��� ���.
  ��������������� ��� path - ���� ��������.
  ������ KOL ������� IncludeTrailingPathDelimiter
  �������:
|<br>
1. ����� :)
|<br>
2. ������ �������� ����������
|<br>
Adds '\' to the end of 'path' if it's not there assuming 'path' to be directory name.
KOL analogue of IncludeTrailingPathDelimiter function.
Difference:
|<br>
1. Length :)
|<br>
2. Result returning way
}

procedure uSlashDel(var path:string);
{* ������� c ����� path ������ '\' ���� ��� ��� ����.
  �������� �� ���������� ���� path ����������� ������� �.� �������� path='C:\'
  ������ KOL ������� ExcludeTrailingPathDelimiter
|<br>
Deletes '\' from the end of 'path' if it's there.
Deletion occures only if 'path' isn't a root directory, eg. path='C:\'.
KOL analogue of ExcludeTrailingPathDelimiter function.
}

function uGetParentPath(path:string):string;
{* ���������� ������������ ������� �������� path
|<br>
Returns 'path' parent directory

 s:=uGetParentPath('C:\p1\p2\'); // s = 'C:\p1\'
}

function uGetNameDrive(DriveChar: Char): string;
{*
 ������� ���������� ��� ����� ��� ������ DriveChar
|<br>
 Returns the name of the drive with 'DriveChar' letter
}

function uSetNameDrive(DriveChar: Char; Lab:string):boolean;
{*
��������� ������������� ����� Lab �� ���� ��� ������ DriveChar
|<br>
���� ��� ��������� ���������� true
|<br>
Sets 'Lab' name for the drive with 'DriveChar' letter
|<br>
If succeeds, the return value is true
}

procedure uGetFileListEx(Dir,mask:string;var List:PStrList);
{*
C������ ������ ������ List �a��������� � ������� Dir � � ��� ������������
|<br>
Returns the list of all files corresponding to 'Mask' from 'Dir' directory
and all its subdirectories to 'List'
}

procedure uGetDrivesEx(var ListDrives:PStrList;TypeDrives:TTypeDrives);
{*
������� � ListDrives ������ ������ ��������������� ���� TypeDrives.
|<br>
�������� ��� ���� ��� �� �������� ��� CD-ROM'�:
|<br>
uGetDrivesEx(List,tdCD);
|<br>
Returns to 'ListDrives' the list of the letters of drives corresponding to 'TypeDrives' type
|<br>
For example, to get all the CD-ROM drives letters: 
|<br>
uGetDrivesEx(List,tdCD);
}

procedure uRegisterServer(const Filename: String);
{*
����������� ActiveX � �������.
|<br>
Registers ActiveX server in the system.
}

// ��������������� ��������� ��� ������ � Shell
// Auxiliary procedure used in uShellXXX
procedure uShell(Parent: HWND;
                 ShellFun:cardinal;
                 ShellFlag:word ;
                 sFrom,sTo:string);

procedure uShellDelete(Parent: HWND;Path:string;Undo,consent:boolean);
{*
�������� �������� ��� ����� ���������� Windows.
|<br>
���� Undo = true ����� �������� ���������� � �������.
|<br>
���� Consent = true ����� ��������� ������������ ��������.
|<br>
Directory or file removal by Windows means.
|<br>
If Undo = true, deletes to the Recycle Bin.
|<br>
If Consent = true, requests deletion confirmation.
|<br>
uShellDelete(form.Handle,'C:\Temp\',false,true);
}

procedure uShellCopy(Parent: HWND;PathFrom,PathTo:string);
{*
����������� �������� ��� ����� ���������� Windows.
|<br>
Directory or file copying by Windows means.
}

procedure uShellMove(Parent: HWND;PathFrom,PathTo:string);
{*
������� �������� ��� ����� ���������� Windows.
|<br>
Directory or file moving by Windows means.
}

function uGetDXVersion :string;
{*
|by <A href="mailto:ogldelphi@mail.ru">ROkulov</a>
|<br>
���������� ������ DirectX.
|<br>
Returns DirectX version.
}

Function uAny2Ten(s:ShortString;sys:byte):LongInt;
{*
|by <A href="mailto:Holden@bk.ru">Rabotahoff Alexandr (RA)</a>
|<br>
������� �� ����� ������� ��������� � 10-�
|<br>
Sys-������� ��������� [sys=2 -��������]
|<br>
Length(s)<=255, ����� ���������
|<br>
2<=Sys<=26, ����� ���������� =2 ��� =26
|<br>
Returns Decimal representation of string in any other CS.
|<br>
'Sys' - calculation system [eg. Sys=2 means Binary].
|<br>
Length(s)<=255, otherwise is will be cutted down.
|<br>
2<=Sys<=26, otherwise if Sys<2 or Sys>26 then it will be 2 or 26 accordingly.
}

Function uTen2Any(a:LongInt;sys:byte):ShortString;
{*
|by <A href="mailto:Holden@bk.ru">Rabotahoff Alexandr (RA)</a>
|<br>
������� �� 10-� ������� ��������� � �����
|<br>
Sys-������� ��������� [sys=2 -��������]
|<br>
2<=Sys<=26, ����� ���������� =2 ��� =26
|<br>
Converts Decimal number to any other CS.
|<br>
'Sys' - calculation system [eg. Sys=2 means Binary].
|<br>
2<=Sys<=26, otherwise if Sys<2 or Sys>26 then it will be 2 or 26 accordingly.
}

Function uGetDPNE(DPNEComplette:AnsiString;DPNEDif:ShortString):AnsiString;
{*
|by <A href="mailto:Holden@bk.ru">Rabotahoff Alexandr (RA)</a>
|<br>

DPNE=DiskPathNameExt-���������������������
|<br>
���������:
|<br>
DPNEComplette-�������� ������ ���� � ����� (����, ����, ��� ����� � ����������)
|<br>
DPNEDif (�� �������� � ��������):
|<br>
'D' ��� 'Disk'; -������� ������ ��� ����� (��� ':' � �����) [C]
|<br>
'P' ��� 'Path'; -������� ������ ���� � ����� (��� ����� '\' � �����) [\windows\temp]
|<br>
'DP' ��� 'Disk_Path'; -������� ������ ��� ����� � ���� � ����� (��� ����� '\' � �����) [C:\windows\temp]
|<br>
'N' ��� 'Name'; -������� ������ ��� ����� (��� ����� � �����) [MyFile]
|<br>
'E' ��� 'Ext'; -������� ������ ���������� (��� ����� � ������) [exe]
|<br>
'PN' ��� 'Path_Name'; -������� ���� � ��� ����� (��� ���������� � ��� ����� � �����) [\windows\temp\MyFile]
|<br>
'DPN' ��� 'Disk_Path_Name'; -������� ��� �����, ���� � ��� ����� (��� ���������� � ��� ����� � �����) [C:\windows\temp\MyFile]
|<br>
'NE' ��� 'Name_Ext'; -������� ��� � ���������� [MyFile.exe]
|<br>
'PNE' ��� 'Puth_Name_Ext'; -������� ����, ��� � ���������� [\windows\temp\MyFile.exe]
|<br>
'DPNE' ��� 'Disk_Path_Name_Ext'; -������� ��� �����, ����, ��� � ���������� [C:\windows\temp\MyFile.exe]
|<p>
���� � DPNEComplette � ������ � � ����� ����� ���� " ["C:\Windows\MyFile.exe"],
|<br>
�� �������� ����������� � ���� [C:\Windows\MyFile.exe], �.�. ��� �������
|<br>

DPNE = DiskPathNameExtension
|<br>
Parameters:
|<br>
DPNEComplette - full path to file (drive, path, file name and extension)
|<br>
DPNEDif (case-insensitive):
|<br>
'D' or 'Disk'; - returns drive name (without terminating ':') [C]
|<br>
'P' or 'Puth'; - returns file path (without terminating '\') [\windows\temp]
|<br>
'DP' or 'Disk_Path'; - returns file drive and path (without terminating '\') [C:\windows\temp]
|<br>
'N' or 'Name'; - returns file name (without terminating dot) [MyFile]
|<br>
'E' or 'Ext'; - returns file extension (without starting dot) [exe]
|<br>
'PN' or 'Path_Name'; - returns file path and name (without extension and terminating dot) [\windows\temp\MyFile]
|<br>
'DPN' or 'Disk_Path_Name'; - returns file drive, path and name (without extension and terminating dot) [C:\windows\temp\MyFile]
|<br>
'NE' or 'Name_Ext'; - returns file name with extension [MyFile.exe]
|<br>
'PNE' or 'Puth_Name_Ext'; - returns file path, name and extension [\windows\temp\MyFile.exe]
|<br>
'DPNE' or 'Disk_Path_Name_Ext'; - returns file drive, path, name and extension [C:\windows\temp\MyFile.exe]
|<p>
IF 'DPNEComplette' has been quoted ["C:\Windows\MyFile.exe"],
|<br>
it becomes [C:\Windows\MyFile.exe], eg. without quotation marks
}

Function uAddExt(FileName,Ext:AnsiString):AnsiString;
{*
|by <A href="mailto:Holden@bk.ru">Rabotahoff Alexandr (RA)</a>
|<br>
������� ��������� � ����� ����� FileName ���������� Ext.
|<br>
���� � ����� ����� ��� ���������� ��� ����, �� ���������� ��� ��� �� �����������.
|<br>
���������� ����������� ���� ������ � ����� ����� ��������� ���������� ���.
|<br>
� EXT ����� ����������� ��������� ���������� ����� "/", ��� ������ �������� ('htm/html/gif')
|<br>
������ ���������� ����������� � ������� �������� ����������
|<br>
Adds 'Ext' extension to 'FileName' file.
|<br>
Does nothing if given extension is already presents.
|<br>
'Ext' may contain several extensions separated by "/", without spaces ('htm/html/gif')
|<br>
Note that first extension has highest priority and last - lowest.
}

Function uBool2STR(bool:Boolean):AnsiString;
{*
|by <A href="mailto:Holden@bk.ru">Rabotahoff Alexandr (RA)</a>
|<br>
�� Boolean � String
|<br>
Converts Boolean value to appropriate String representation
}

Function uStr2Bool(s:AnsiString):Boolean;
{*
|by <A href="mailto:Holden@bk.ru">Rabotahoff Alexandr (RA)</a>
|<br>
�� String � Boolean
|<br>
Converts String value to appropriate Boolean representation
}


implementation
///////////////////////////////////////////////////////////////////////////////
procedure uGetSubPath(var List:PStrList;Dir:string);
var
 ListDir:pDirList;
 TempList:PStrList;
 s:string;
 i:integer;
begin
 List.Clear;
 ListDir := NewDirList(Dir,'*.*',FILE_ATTRIBUTE_DIRECTORY);
 TempList := NewStrList;
 Dir := IncludeTrailingPathDelimiter(Dir);

 if ListDir.Count<>0 then
 for i:=0 to ListDir.Count-1 do
  begin
   s:=ListDir.Names[i];
   List.Add(Dir+s);
   uGetSubPath(TempList,Dir+s);
   if TempList.Count<>0 then
    List.Text := List.Text + TempList.Text;
  end;

 ListDir.free;
 TempList.free;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uGetDrives(var ListDrives:PStrList);
var
 DriveBits: set of 0..25;
 DriveNum:integer;
 DriveChar:char;
begin
 Integer(DriveBits) := GetLogicalDrives;

 for DriveNum := 0 to 25 do
  if DriveNum in DriveBits then
   begin
     DriveChar := Char(DriveNum + Ord('a'));
     ListDrives.Add(DriveChar);
   end;
end;
////////////////////////////////////////////////////////////////////////////////
function uGetTypeDrives(CharDrives:Char):TTypeDrives;
var
 k:integer;
begin
  k:=GetDriveType(PChar(CharDrives+ ':\'));
  case k of
   DRIVE_CDROM : result:=tdCD;
   DRIVE_REMOVABLE: result:=tdFlopy;
   DRIVE_FIXED: result:=tdHDD;
   DRIVE_REMOTE: result:=tdRemote;
   DRIVE_RAMDISK: result:=tdRamDisk;
  end;
end;
////////////////////////////////////////////////////////////////////////////////
function uGetComputerName: string;
var
 I: Cardinal;
 Buffer: array [0..255] of Char;
begin
 I:=SizeOf(Buffer);
 windows.GetComputerName(Buffer,I);
 Result:=Buffer;
end;
////////////////////////////////////////////////////////////////////////////////
function uGetUserName: string;
var
 I: Cardinal;
 Buffer: array [0..255] of Char;
begin
 I:=SizeOf(Buffer);
 windows.GetUserName(Buffer,I);
 Result:=Buffer;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uGetCaptionApp(var ListApp:PStrList;Handle:hWnd);
var
 Wnd : hWnd;
 buffer: array [0..255] of Char;
begin
 Wnd := GetWindow(Handle, gw_HWndFirst);
 While Wnd <> 0 do
  begin
   if IsWindowVisible(Wnd) and
     (GetWindow(Wnd, gw_Owner) = 0) and
     (GetWindowText(Wnd, buffer, sizeof(buffer)) <> 0) then
    begin
     GetWindowText(Wnd, buffer, sizeof(buffer));
     ListApp.Add(buffer);
    end;
   Wnd := GetWindow(Wnd, gw_hWndNext);
  end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uGetDisplayResolution(var x,y:integer);
begin
 x := GetSystemMetrics(SM_CXSCREEN);
 y := GetSystemMetrics(SM_CYSCREEN);
end;
////////////////////////////////////////////////////////////////////////////////
procedure uSetDisplayResolution(x,y:integer);
var
 dm : TDEVMODE;
begin
 ZeroMemory(@dm, sizeof(TDEVMODE));
 dm.dmSize := sizeof(TDEVMODE);
 dm.dmPelsWidth := x;
 dm.dmPelsHeight := y;
 dm.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
 ChangeDisplaySettings(dm, 0);
end;
////////////////////////////////////////////////////////////////////////////////
function uGetLoacalHostName:string ;
var
 Buffer: Array[0..63] of Char;
 GInitData: TWSAData;

begin
 WSAStartup($101, GInitData);
 Result := '';
 winsock.GetHostName(Buffer, SizeOf(Buffer));
 Result := Buffer;
 WSACleanup;
end;
////////////////////////////////////////////////////////////////////////////////
function uHost2IP(HostName:string): String;
type
 TaPInAddr = Array[0..10] of PInAddr;
 PaPInAddr = ^TaPInAddr;
var
 phe: PHostEnt;
 pptr: PaPInAddr;
 I: Integer;
 GInitData: TWSAData;
begin
 Result := '';
 WSAStartup($101, GInitData);
 phe := GetHostByName(@HostName[1]);
 if phe = nil then Exit;
 pPtr := PaPInAddr(phe^.h_addr_list);
 I := 0;
 while pPtr^[I] <> nil
 do
  begin
   Result := inet_ntoa(pPtr^[I]^);
   Inc(I);
  end;
 WSACleanup;
end;
////////////////////////////////////////////////////////////////////////////////
function uIP2Host(IPAddr : String): String;
var
  SockAddrIn: TSockAddrIn;
  HostEnt: PHostEnt;
  WSAData: TWSAData;
begin
  WSAStartup($101, WSAData);
  SockAddrIn.sin_addr.s_addr:= inet_addr(PChar(IPAddr));
  HostEnt:= gethostbyaddr(@SockAddrIn.sin_addr.S_addr, 4, AF_INET);
  if HostEnt<>nil then
  begin
    result:=Hostent^.h_name;
  end
  else
  begin
    result:='';
  end;
end;
////////////////////////////////////////////////////////////////////////////////
function uGetNetName(Handle:hWnd;Title:string):string;
var
 RootItemIDList:PItemIDList;
 BrowseInfo:TBrowseInfo;
 Buffer:PChar;
begin
 result := '';
 If not (SHGetSpecialFolderLocation(0,CSIDL_NETWORK,RootItemIDList)=NO_ERROR)
   then Exit;
 GetMem(Buffer,Max_Path);
 FillChar(BrowseInfo,SizeOf(BrowseInfo),0);
 With BrowseInfo do
  begin
   hwndOwner:=Handle;
   pidlRoot:=RootItemIDList;
   pszDisplayName:=Buffer;
   lpszTitle:=@Title[1];
   ulFlags:=BIF_BROWSEFORCOMPUTER;
  end;
 if  SHBrowseForFolder(BrowseInfo)=nil then
  begin
   FreeMem(Buffer);
   exit;
  end;

 result := Buffer;
 FreeMem(Buffer);
end;
////////////////////////////////////////////////////////////////////////////////
Function uGetAllCompNet(dat: PNetResource;var list: pStrList):Word;
Type
   PNRArr = ^TNRArr;
   TNRArr = array [0..59] of TNetResource;
Var
  x: PNRArr;
  tnr: TNetResource;
  I : integer;
  EntrReq,
  SizeReq,
  twx: cardinal;
  WSName: string;
begin
    Result := WNetOpenEnum(RESOURCE_GLOBALNET, RESOURCETYPE_ANY,
                               0, dat, twx);
    If Result = ERROR_NO_NETWORK Then Exit;
    if Result = NO_ERROR then
     begin
           New(x);
           EntrReq := 1;
           SizeReq := SizeOf(TNetResource)*59;
           while (twx <> 0) and
                 (WNetEnumResource(twx, EntrReq, x, SizeReq) <> ERROR_NO_MORE_ITEMS) do
           begin
                 For i := 0 To EntrReq - 1 do
                 begin
                  Move(x^[i], tnr, SizeOf(tnr));
                 case tnr.dwDisplayType of
                   RESOURCEDISPLAYTYPE_SERVER:
                   begin
                      if tnr.lpRemoteName <> '' then
                          WSName:= tnr.lpRemoteName
                          else WSName:= tnr.lpComment;
                      list.Add(Copy(WSName,3,Length(WSName)));
                      Applet.ProcessMessages;
                   end;
                   else uGetAllCompNet(@tnr, list);
                  end;
                 end;
           end;
           Dispose(x);
           WNetCloseEnum(twx);
    end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uWriteEndFile(FileName:string;Data:PStream);
var
 SFile:PStream;
 Position,Size:Longword;
begin
 if Data= nil then exit;
 SFile:= NewWriteFileStream(FileName);

 Position := SFile.Size;
 Size := Data.Size ;

 SFile.Position := Position;
 Stream2Stream(SFile,Data,Data.Size);

 SFile.Write(Position,SizeOf(Position));
 SFile.Write(Size,SizeOf(Size));

 SFile.Free;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uReadEndFile(FileName:string;var Data:PStream);
var
 SFile:PStream;
 Position,Size:Longword;
 Buffer: Pointer;
begin
 if Data= nil then exit;
 SFile:= NewReadFileStream(FileName);

 //---------- ������ ������ ����������� uWriteEndFile ------------------
 SFile.Position := SFile.Size - SizeOf(Position)-SizeOf(Size);
 SFile.Read(Position,SizeOf(Position));

 SFile.Position := SFile.Size - SizeOf(Size);
 SFile.Read(Size,SizeOf(Size));
 // -------------------------------------------------------------------

 SFile.Position := Position;
 GetMem(Buffer, Size );
 SFile.Read( Buffer^, Size );
 Data.Write( Buffer^, Size );
 FreeMem( Buffer );

 SFile.free;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uDelEndFile(FileName:string);
var
 SFile,Vacuum:PStream;
 Position:Longword;
begin
 Vacuum := NewMemoryStream;
 SFile:= NewReadFileStream(FileName);
 Position := 0;
 //---------- ������ ������ ����������� uWriteEndFile ------------------
 SFile.Position := SFile.Size - SizeOf(Position)-SizeOf(Size);
 SFile.Read(Position,SizeOf(Position));
 // -------------------------------------------------------------------
 SFile.free;
 if Position=0 then  exit;

 SFile:= NewWriteFileStream(FileName);
 SFile.Position := Position;
 Stream2Stream(SFile, Vacuum, Vacuum.Size);
 SFile.free;
end;
////////////////////////////////////////////////////////////////////////////////
function uCheckNet:boolean;
begin
 result := (GetSystemMetrics(SM_NETWORK) and $01) = $01;
end;
////////////////////////////////////////////////////////////////////////////////
function uGetFileList(const dir,mask: string; var List:PStrList):boolean;
var
   FindData : TWin32FindData;
   FindHandle : THandle;
   find: boolean;
   w_dir,w_mask,s:string;

begin
 result := false;

 w_mask := mask ;
 if w_mask='' then w_mask := '*.*';
 w_dir := IncludeTrailingPathDelimiter(dir);

 FindData.dwFileAttributes := FILE_ATTRIBUTE_NORMAL;
 FindHandle := FindFirstFile(PChar(w_dir+w_mask), FindData);
 if FindHandle <> INVALID_HANDLE_VALUE then
 begin
  result := true;
  find:=true;
  while find do
   begin
    s:=FindData.cFileName;
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY <> FILE_ATTRIBUTE_DIRECTORY) then
      List.Add(w_dir+s);
    find :=FindNextFile(FindHandle,FindData);
   end; {while}
 end;{if}

end;
////////////////////////////////////////////////////////////////////////////////
procedure uSaveWindowsPos(form:PControl;NameIniFile,Sec:string);
var
 ini:PiniFile;
begin
 if (form.Top<0) or (form.Top<0 ) then exit;
 ini := OpenIniFile(NameIniFile);
 ini.Mode := ifmWrite;
 ini.Section := Sec;
 ini.ValueBoolean('win_max',form.WindowState = wsMaximized);
 ini.ValueInteger('win_width',form.Width);
 ini.ValueInteger('win_height',form.Height);
 ini.ValueInteger('win_top',form.Top);
 ini.ValueInteger('win_left',form.Left);
 ini.free;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uLoadWindowsPos(Form:PControl;NameIniFile,Sec:string);
var
 ini:PiniFile;
 b:boolean;
 i:integer;
begin
 ini := OpenIniFile(NameIniFile);
 ini.Section := Sec;
 ini.Mode := ifmRead;

 b := ini.ValueBoolean('win_max',false);
 if b then form.WindowState := wsMaximized;

 i := ini.ValueInteger('win_width',0);
 if i<>0 then form.Width := i;

 i := ini.ValueInteger('win_height',0);
 if i<>0 then form.Height := i;

 i:=ini.ValueInteger('win_top',0);
 if i<>0 then form.Top := i;

 i:=ini.ValueInteger('win_left',0);
 if i<>0 then form.Left := i;

 ini.free;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uSlashAdd(var path:string);
begin
 if path='' then exit;
 if path[Length(path)]<>'\' then path:=path+'\';
end;
////////////////////////////////////////////////////////////////////////////////
procedure uSlashDel(var path:string);
var
 i:integer;
begin
 i := Length(path);
 if (i=0)or (path[i-1]=':') then exit;
 if path[i]='\' then
  path := Copy(path,0,i-1) ;
end;
////////////////////////////////////////////////////////////////////////////////
function uGetParentPath(path:string):string;
begin
 uSlashDel(path);
 result := ExtractFilePath(path);
end;
////////////////////////////////////////////////////////////////////////////////
function uGetNameDrive(DriveChar: Char): string;
var
  wLength, wFlags: DWORD;
  Buffer: array [0..255] of Char;
begin
  Buffer[0] := #$00;
  if GetVolumeInformation(PChar(DriveChar + ':\'), Buffer, DWORD(sizeof(Buffer)),
   nil, wLength, wFlags, nil, 0) then
     result := Buffer
 else
     Result := '';
end;
////////////////////////////////////////////////////////////////////////////////
function uSetNameDrive(DriveChar: Char; Lab:string):boolean;
begin
 result := SetVolumeLabel(PChar(DriveChar + ':\'), PChar(Lab));
end;
////////////////////////////////////////////////////////////////////////////////
procedure uGetFileListEx(Dir,mask:string;var List:PStrList);
var
 ListDir:pDirList;
 s:string;
 i:integer;
begin
 ListDir := NewDirList(Dir,'*.*',FILE_ATTRIBUTE_DIRECTORY);
 Dir := IncludeTrailingPathDelimiter(Dir);

 uGetFileList(Dir+s,mask,List);

 if ListDir.Count<>0 then
 for i:=0 to ListDir.Count-1 do
  begin
   s:=ListDir.Names[i];
   uGetFileListEx(Dir+s,mask,List);
  end;
 ListDir.free 
end;  
////////////////////////////////////////////////////////////////////////////////
procedure uGetDrivesEx(var ListDrives:PStrList;TypeDrives:TTypeDrives);
var
 TempList:PStrList;
 i:integer;
 ch:char;
begin
 TempList:=NewStrList;
 uGetDrives(TempList);
 for i:=0 to TempList.Count-1 do
  begin
   ch:= TempList.Items[i][1];
   if uGetTypeDrives(ch)=TypeDrives then
    ListDrives.Add(TempList.Items[i]);
  end;
 TempList.free;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uRegisterServer(const Filename: String);
var
  SaveCurrentDir,s_temp: String;
  LibHandle: THandle;
  RegisterServerProc: function: HRESULT; stdcall;
  Buffer: array[0..MAX_PATH - 1] of Char;
begin
  SetString(SaveCurrentDir, Buffer, GetCurrentDirectory(SizeOf(Buffer), Buffer));
  try
    s_temp := IncludeTrailingPathDelimiter(ExtractFilePath(Filename));
    SetCurrentDirectory(PChar(s_temp));
    LibHandle := LoadLibrary(PChar(Filename));
    if LibHandle <> 0 then
      try
        @RegisterServerProc := GetProcAddress(LibHandle, 'DllRegisterServer');
        if Assigned(@RegisterServerProc) then
          RegisterServerProc;
      finally
        FreeLibrary (LibHandle);
      end;
  finally
    SetCurrentDirectory(PChar(SaveCurrentDir));
  end;
end;
////////////////////////////////////////////////////////////////////////////////
procedure uShell(Parent: HWND;
                 ShellFun:cardinal;
                 ShellFlag:word ;
                 sFrom,sTo:string);
var
 FileOp: TSHFileOpStruct;
 s1,s2: string;
begin
  s1:=ExcludeTrailingPathDelimiter(sFrom);
  s1:= s1 + #0#0;
  s2:=ExcludeTrailingPathDelimiter(sTo);
  s2:= s2 + #0#0;

  FillChar(FileOp, SizeOf(FileOp), #0);
  with FileOp do
  begin
    Wnd := Parent;
    wFunc := ShellFun;
    pFrom := PChar(s1);
    pTo := PChar(s2);
    fFlags := fFlags or FOF_SIMPLEPROGRESS;
    if ShellFlag <> 0 then
     fFlags := fFlags or ShellFlag;
  end;

  SHFileOperation(FileOp);
end;
////////////////////////////////////////////////////////////////////////////////
procedure uShellDelete(Parent: HWND;Path:string;Undo,consent:boolean);
var
 f:word ;
begin
  f:=FOF_NOERRORUI; // ��������� ����� ��������� �� ������
  if not consent then f := f or FOF_NOCONFIRMATION;
  if Undo then  f := f and (not FOF_ALLOWUNDO);
  uShell(Parent,FO_DELETE,f,Path,'');
end;
////////////////////////////////////////////////////////////////////////////////
procedure uShellCopy(Parent: HWND;PathFrom,PathTo:string);
begin
 uShell(Parent,FO_Copy,0,PathFrom,PathTo);
end;
////////////////////////////////////////////////////////////////////////////////
procedure uShellMove(Parent: HWND;PathFrom,PathTo:string);
begin
 uShell(Parent,FO_MOVE,0,PathFrom,PathTo);
end;
////////////////////////////////////////////////////////////////////////////////
function uGetDXVersion:string;
var
 Key:HKey;
begin
 result := '';
 Key := RegKeyOpenRead(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\DirectX');
 result := RegKeyGetStrEx(Key,'Version');
 RegKeyClose(Key);
end;
////////////////////////////////////////////////////////////////////////////////
Function uAny2Ten(s:ShortString;sys:byte):LongInt;
var m,n,k,p,l,dl:LongInt;
begin
  k:=0;
try
  dl:=Length(s);
  if Sys<2 then sys:=2;
  if sys>26 then sys:=26;
  if dl>255 then SetLength(s,255);
  if dl=0 then s:='0';
  for n:=dl-1 downto 0 do
  begin
    p:=1;
    for m:=1 to n do p:=p*sys;
    if (ord(s[dl-n])>=97)and(ord(s[dl-n])<=122) then s[dl-n]:=chr(ord(s[dl-n])-32);
    if (ord(s[dl-n])>=65)and(ord(s[dl-n])<=90) then l:=Ord(s[dl-n])-55
      else l:=Str2Int(s[dl-n]);
    if l>sys-1 then sys:=l+1;
    k:=k+l*p;
  end;
finally
  Result:=k;
end;
end;
////////////////////////////////////////////////////////////////////////////////
function uTen2Any(a:LongInt;sys:byte):ShortString;
var s:ShortString;
    kol,n:LongInt;
    otv:array [1..255] of byte;
begin
  s:='';
try
  if Sys<2 then sys:=2;
  if sys>26 then sys:=26;
  kol:=1;
  while a<>0 do
  begin
    otv[kol]:=a mod sys;
    a:=a div sys;
    inc(kol);
  end;
  for n:=kol-1 downto 1 do
  begin
    if otv[n]>=10 then s:=s+chr(otv[n]+55)
    else s:=s+Int2Str(otv[n]);
  end;
finally
  if s='' then s:='0';
  Result:=s;
end;
end;
////////////////////////////////////////////////////////////////////////////////
Function uGetDPNE(DPNEComplette:AnsiString;DPNEDif:ShortString):AnsiString;
var dl,n:LongInt;
    Mas:array [0..3] of AnsiString;
      // 1-Path; 2-Name; 3-Ext
    uk,First:Byte;
    SExt:AnsiString;
    dif:AnsiString;
begin
try
  dl:=Length(DPNEComplette);
  for uk:=0 to 3 do mas[uk]:='';

  if (DPNEComplette[1]='"')and(DPNEComplette[dl]='"')
  then begin
    First:=2;
    dec(dl);
  end
  else First:=1;

  uk:=3;
  for n:=dl downto First do
  begin
    if uk=0 then mas[0]:=DPNEComplette[n]+mas[0];

    if uk=1
    then begin
      if DPNEComplette[n]<>':' then mas[1]:=DPNEComplette[n]+mas[1]
      else dec(Uk);
    end;

    if uk=2
    then begin
      if DPNEComplette[n]<>'\' then Mas[2]:=DPNEComplette[n]+mas[2]
      else dec(uk);
    end;

    if uk=3
    then begin
      if DPNEComplette[n]=':'
      then begin
        mas[1]:=mas[3];
        mas[3]:='';
        dec(uk);Dec(uk);Dec(Uk);
      end
      else if DPNEComplette[n]='\'
      then begin
        mas[2]:=mas[3];
        mas[3]:='';
        dec(uk);dec(uk);
      end
      else if DPNEComplette[n]<>'.' then Mas[3]:=DPNEComplette[n]+mas[3]
           else dec(uk);
    end;
  end;//n
  if mas[3]='' then SExt:=''
    else SExt:='.'+mas[3];

  dif:=AnsiLowerCase(DPNEDif);
  if (dif='d')or(Dif='disk') then Result:=mas[0]
  else if (dif='p')or(Dif='path') then Result:=mas[1]
  else if (dif='dp')or(Dif='disk_path') then Result:=mas[0]+':'+mas[1]
  else if (dif='n')or(Dif='name') then Result:=mas[2]
  else if (dif='e')or(Dif='ext') then Result:=mas[3]
  else if (dif='pn')or(Dif='path_name') then Result:=mas[1]+'\'+mas[2]
  else if (dif='dpn')or(Dif='disk_path_name') then Result:=mas[0]+':'+mas[1]+'\'+mas[2]
  else if (dif='ne')or(Dif='name_ext') then Result:=mas[2]+SExt
  else if (dif='pne')or(Dif='path_name_ext') then Result:=mas[1]+'\'+mas[2]+SExt
  else if (dif='dpne')or(Dif='disk_path_name_ext') then Result:=mas[0]+':'+mas[1]+'\'+mas[2]+SExt;
except
  Result:='';
end;
//  Result:=AnsiLowerCase(Result);
end;
////////////////////////////////////////////////////////////////////////////////
Function uAddExt(FileName,Ext:AnsiString):AnsiString;
var exts:array [1..255] of AnsiString;
    n,kol:integer;
    f:boolean;
begin
try
  kol:=1;
  exts[1]:='';
  for n:=1 to Length(ext) do
  begin
    if ext[n]<>'/' then exts[kol]:=exts[kol]+ext[n]
    else begin
      inc(kol);
      exts[kol]:='';
    end;
  end;
  if exts[1]='' then exts[1]:=ext;
  f:=False;
  for n:=1 to kol do
  begin
    if uGetDPNE(FileName,'Ext')=Exts[n] then f:=True;
  end;
  if not F then Result:=uGetDPNE(FileName,'Disk_Path_Name')+'.'+Exts[1]
  else Result:=FileName;
except
  Result:=FileName;
end;
end;
////////////////////////////////////////////////////////////////////////////////
Function uBool2STR(bool:Boolean):AnsiString;
begin
  if bool=true then result:='True'
  else Result:='False';
end;
////////////////////////////////////////////////////////////////////////////////
Function uStr2Bool(s:AnsiString):Boolean;
begin
  if AnsiLowerCase(s)='true' then Result:=True
  else Result:=False;
end;
////////////////////////////////////////////////////////////////////////////////
// to be continued...
////////////////////////////////////////////////////////////////////////////////
end.
