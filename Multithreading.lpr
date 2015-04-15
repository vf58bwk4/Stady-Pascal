program Multithreading;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Classes, SysUtils, Forms, StdCtrls,
  Semaphore
  { you can add units after this };

{$R *.res}

type
  TT=class(TThread)
  public
    sem:TSemaphore;
  protected
    procedure Execute; override;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { private declarations }
  public
    thread:TT;
  end;


var
  Form1: TForm1;

begin

procedure TT.Execute;
var
  f:TextFile;
begin
  AssignFile(f,'log.iter');
  Rewrite(f);

  while not Terminated do begin
    if sem.Wait(500)<>wSignaled then continue;
    WriteLn(f,'iter');
    Flush(f);
  end;
  CloseFile(f);
end;

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  thread.Terminate;
  FreeAndNil(thread.sem);
  FreeAndNil(thread);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  thread.sem.Release(5);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  thread.sem.Release(3);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  thread:=TT.Create(True);
  thread.sem:=TSemaphore.Create;
  thread.Start;
end;

end.
