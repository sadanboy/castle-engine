{
  Copyright 2008-2010 Michalis Kamburelis.

  This file is part of "Kambi VRML game engine".

  "Kambi VRML game engine" is free software; see the file COPYING.txt,
  included in this distribution, for details about the copyright.

  "Kambi VRML game engine" is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

  ----------------------------------------------------------------------------
}

{ simplest_vrml_browser extended to render shadows.

  Besides setting ShadowVolumesPossible and ShadowVolumes to @true,
  we also initialize window by Window.OpenOptionalMultiSamplingAndStencil.
  The latter allows us to smoothly fallback to rendering without shadows
  on GPUs that don't support stencil buffer (really really old graphic cards). }

program simplest_vrml_browser_with_shadows;

{$apptype CONSOLE}

uses KambiUtils, GLWindow, GLWindowVRMLBrowser, ProgressUnit, ProgressConsole,
  VRMLScene, VRMLErrors;

var
  BrowserWindow: TGLWindowVRMLBrowser;

procedure StencilOff(Window: TGLWindow; const FailureMessage: string);
begin
  BrowserWindow.ShadowVolumesPossible := false;
  Writeln('Stencil buffer not available, shadows could not be initialized');
end;

begin
  Parameters.CheckHigh(1);

  VRMLWarning := @VRMLWarning_Write;
  Progress.UserInterface := ProgressConsoleInterface;

  BrowserWindow := TGLWindowVRMLBrowser.Create(Application);

  BrowserWindow.ShadowVolumesPossible := true;
  BrowserWindow.ShadowVolumes := true;

  BrowserWindow.Load(Parameters[1]);
  Writeln(BrowserWindow.Scene.Info(true, true, false));
  BrowserWindow.Scene.Spatial := [ssRendering, ssDynamicCollisions];
  BrowserWindow.Scene.ProcessEvents := true;

  BrowserWindow.OpenOptionalMultiSamplingAndStencil(nil, @StencilOff);
  Application.Run;
end.
