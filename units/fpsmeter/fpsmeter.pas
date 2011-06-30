unit FPSMeter;
// --------------- (C) Miek 18/08/2003 -------------------


{* Target:
|<br><br>
Implements precise FPS (frames per second) measurement.
|<br><br>&#151;&nbsp;
The module uses the system performance timer functions so it's
possible that on older computers it will not work.
|<br>&#151;&nbsp;
No finalization is required, no memory allocation/deallocation
is necessary and none of the procedures can generate an
exception.
|<br><hr><br>
����������:
|<br><br>
��������� ����� ��������� �������� ������� ������ (FPS).
|<br><br>&#151;&nbsp;
������ ���������� ��������� ������������ ������, ������� �����
������������� �� ����� ������ �����������.
|<br>&#151;&nbsp;
������ �� ��������� � ���������/������������ ������, �� �������
��������������� � �� ���������� ������� ���������� �� ����� ������.
|<br><Br><Br><Br>&#0123;
$DEFINE HALT_IF_PERF_TIMER_UNAVAILABLE
|<br>
Delete this directive if you don't want the module halt
if the performance timer is not detected.
|<br><hr>
������� ��� ���������, ���� �� �� ������, ����� ���������
����������� ��������� ����� ��� ���������� ������������� �������.
|<br><br><br>
}

{$DEFINE HALT_IF_PERF_TIMER_UNAVAILABLE}


interface


function  GetMinFPSMeterResolution: double;
{* Returns the performance timer period (in seconds).
|<br><hr>
���������� ������ ���������� ������������� ������� (� ��������).
|<br><br><br>}

function  GetFPSMeterResolution: double;
{* Returns the current minimal interval
between sequental FPS measures (in seconds).
|<br><hr>
���������� ������� ��������� ����������� ��������
����� ����������������� ����������� FPS (� ��������).
|<br><br><br>}

procedure InitFPSMeter( MinInterval: double);
{* Sets up the timer and remembers the minimal interval
value (in seconds).
|<br>
If it's less than timer resoultion the function does nothing.
|<br><hr>
�������������� ������ � ������������� ����������� ��������
����� ����������������� ����������� FPS (� ��������).
���� ����� �������� �������, ��� ������ ������������� �������,
������� ������ �� ������.
|<br><br><br>}

procedure IncFrames( x: cardinal);
{* Increments the internal frames counter by X
which is a number of frames that have been displayed
since last FPS measurement.
|<br><hr>
����������� �� X ������� ������, ������� ���� �������� � �������
���������� ��������� FPS.
|<br><br><br>}

function  GetFPS: double;
{* Computes the FPS value and clears the internal frames counter.
If the function is called before the end of a selected time period,
the function simply retrieves the last measurement value.
|<br><hr>
��������� �������� FPS � �������� ������� ������. ���� � �������
���������� ������ ������� �� ������ ��� ��������� �����������
��������, �� ������� ������ ���������� ��������� ������ ���������.
|<br><br><br>}


implementation

uses
  windows;

var
  fCustomInterval: int64;
  fPeriod: int64;
  fOldFPS: double;
  fOldTime: int64;
  fFrames: cardinal;

function  GetMinFPSMeterResolution;
begin
  GetMinFPSMeterResolution:= 1/(fPeriod+1);
end;

function  GetFPSMeterResolution;
begin
  GetFPSMeterResolution:= 1/fCustomInterval;
end;

procedure InitFPSMeter( MinInterval: double);
var
  t: int64;
begin
  if MinInterval=0 then exit;
  t:= trunc( fPeriod*MinInterval);
  if t<fPeriod then exit;
  fCustomInterval:= t;
  fFrames:= 0;
  queryperformancecounter( fOldTime);
end;

procedure IncFrames;
begin
  inc( fFrames, x);
end;

function GetFPS: double;
var
  t: int64;
begin
  queryperformancecounter( t);
  if (t-fOldTime)<fCustomInterval then
    begin
      getfps:= fOldFPS;
      exit;
    end;
  fOldFPS:= fFrames*((fPeriod+1)/(t-fOldTime));
  fFrames:= 0;
  fOldTime:= t;
  getfps:= fOldFPS;
end;

begin
  queryperformancefrequency( fPeriod);
  {$IFDEF HALT_IF_PERF_TIMER_UNAVAILABLE}
  assert( fPeriod>0, 'Performance timer doesn''t function!');
  {$ENDIF}
  InitFPSMeter( GetMinFPSMeterResolution);
  fOldFPS:= 0;
  fFrames:= 0;
  queryperformancecounter( fOldTime);
end.

