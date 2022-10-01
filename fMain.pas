unit fMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, Spin, windows;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ProgressBar1: TProgressBar;
    SpinEdit1: TSpinEdit;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Label9Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Timer1.Interval := SpinEdit1.Value*1000;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  mem: TMEMORYSTATUS;
begin
  mem.dwLength := SizeOf(mem);
  GlobalMemoryStatus(mem);

  with mem do begin
    Label1.Caption := IntToStr(dwMemoryLoad) + '%';
    label2.Caption := IntToStr((dwTotalPhys) div 1024) + ' Кбайт';
    label3.Caption := IntToStr((dwAvailPhys) div 1024) + ' Кбайт';
    label4.Caption := IntToStr((dwTotalPageFile) div 1024) + ' Кбайт';
    label5.Caption := IntToStr((dwAvailPageFile) div 1024) + ' Кбайт';
    label6.Caption := IntToStr((dwTotalVirtual) div 1024) + ' Кбайт';
    label7.Caption := IntToStr((dwAvailVirtual) div 1024) + ' Кбайт';
    ProgressBar1.Max := dwTotalPhys;
    //ProgressBar1.Caption := dwTotalPhys - dwAvailPhys;
  end;
end;

end.

