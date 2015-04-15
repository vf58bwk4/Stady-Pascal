unit Semaphore;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SyncObjs;

type
TSemaphore = class
private
  FSemaphore: Pointer;
public
  constructor Create;
  destructor Destroy; override;

  procedure Release;
  procedure Wait;
end;


implementation

constructor TSemaphore.Create;
var
  TM: TThreadManager;
begin
  if GetThreadManager(TM) then
    FSemaphore := TM.SemaphoreInit;
end;

destructor TSemaphore.Destroy;
var
  TM: TThreadManager;
begin
  if GetThreadManager(TM) then
    TM.SemaphoreDestroy(FSemaphore);
end;

procedure TSemaphore.Release;
var
  TM: TThreadManager;
begin
  if GetThreadManager(TM) then
    TM.SemaphorePost(FSemaphore);
end;

procedure TSemaphore.Wait;
var
  TM: TThreadManager;
begin
  if GetThreadManager(TM) then
    TM.SemaphoreWait(FSemaphore);
end;

end.

