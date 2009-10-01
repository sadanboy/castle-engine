{ Compile Kambi VRML game engine by fpmake.

  This is an alternative (to Makefile) way to compile (and install if you want)
  all engine units. Simple instructions:

  export FPCDIR=..../lib/fpc/2.2.4/ # not needed if FPC installed in std location on Unix
  fpc fpmake.pp
  ./fpmake compile # with -v to get more info
  ./fpmake install # with -v to get more info
}

program fpmake;

uses fpmkunit;

var
  P: TPackage;
begin
  with Installer do
  begin
    P := AddPackage('kambi-vrml-game-engine');

    { Actually, may work on at least
        P.OSes := AllUnixOSes + [win32, win64];
      OSes below are actually tested. }
    P.OSes := [darwin, linux, freebsd, win32];

    P.Options := '@kambi.cfg';

    { Add dependencies on FPC packages.
      These aren't really needed, as your default fpc.cfg should
      point to them anyway. They are needed only when compiling with --nofpccfg.
      Anyway, maybe this is a good place to document my dependencies
      on FPC packages --- so let's do this. }
    P.Dependencies.Add('opengl');
    P.Dependencies.Add('fcl-base');
    P.Dependencies.Add('pasjpeg');
    P.Dependencies.Add('fcl-xml');
    if Defaults.OS in AllUnixOSes then
    begin
      P.Dependencies.Add('x11');
      P.Dependencies.Add('gtk2');
    end else
    if Defaults.OS in AllWindowsOSes then
    begin
    end;

    { Some general variables, visible only (as far as I can see) when
      using "./fpmake manifest". }
    P.Author := 'Michalis Kamburelis';
    P.License := 'GNU GPL >= 2 (or LGPL >= 2, if compiled with KAMBI_VRMLENGINE_LGPL)';
    {$ifdef VER2_2_2}
    P.ExternalURL
    {$else}
    P.HomepageURL
    {$endif} := 'http://vrmlengine.sourceforge.net/';
    P.Email := 'michalis.kambi' + '@gmail.com'; { at least protect sources from spammers }
    P.Version := '1.7.0';

    P.SourcePath.Add('3dgraph');
    P.Targets.AddUnit('backgroundbase.pas');
    P.Targets.AddUnit('boxes3d.pas');
    P.Targets.AddUnit('convexhullunit.pas');
    P.Targets.AddUnit('cubemap.pas');
    P.Targets.AddUnit('frustum.pas');
    P.Targets.AddUnit('keys.pas');
    P.Targets.AddUnit('navigation.pas');
    P.Targets.AddUnit('polynomials.pas');
    P.Targets.AddUnit('quaternions.pas');
    P.Targets.AddUnit('rayswindow.pas');
    P.Targets.AddUnit('spacefillingcurves.pas');
    P.Targets.AddUnit('spheresampling.pas');
    P.Targets.AddUnit('sphericalharmonics.pas');

    P.SourcePath.Add('3dmodels');
    P.Targets.AddUnit('colladatovrml.pas');
    P.Targets.AddUnit('illummodels.pas');
    P.Targets.AddUnit('kambioctree.pas');
    P.Targets.AddUnit('normalscalculator.pas');
    P.Targets.AddUnit('object3dasvrml.pas');
    P.Targets.AddUnit('object3dgeo.pas');
    P.Targets.AddUnit('object3dmd3.pas');
    P.Targets.AddUnit('object3dobj.pas');
    P.Targets.AddUnit('object3ds.pas');
    P.Targets.AddUnit('object3dschunks.pas');
    P.Targets.AddUnit('object3dsmaterial.pas');
    P.Targets.AddUnit('triangulator.pas');
    P.Targets.AddUnit('vrmlanimation.pas');
    P.Targets.AddUnit('vrmlcamerautils.pas');
    P.Targets.AddUnit('vrmlerrors.pas');
    P.Targets.AddUnit('vrmlfields.pas');
    P.Targets.AddUnit('vrmlgeometry.pas');
    P.Targets.AddUnit('vrmllexer.pas');
    P.Targets.AddUnit('vrmllightmap.pas');
    P.Targets.AddUnit('vrmllightset.pas');
    P.Targets.AddUnit('vrmlnodes.pas');
    P.Targets.AddUnit('vrmlnodesdetailoptions.pas');
    P.Targets.AddUnit('vrmlraytracer.pas');
    P.Targets.AddUnit('vrmlrendereroptimization.pas');
    P.Targets.AddUnit('vrmlscene.pas');
    P.Targets.AddUnit('vrmlscenewaypoints.pas');
    P.Targets.AddUnit('vrmlshape.pas');
    P.Targets.AddUnit('vrmlshapeoctree.pas');
    P.Targets.AddUnit('vrmltime.pas');
    P.Targets.AddUnit('vrmltriangle.pas');
    P.Targets.AddUnit('vrmltriangleoctree.pas');
    P.Targets.AddUnit('x3dxmltovrml.pas');

    P.SourcePath.Add('3dmodels.gl');
    P.Targets.AddUnit('backgroundgl.pas');
    P.Targets.AddUnit('glwindowvrmlbrowser.pas');
    P.Targets.AddUnit('object3dopengl.pas');
    P.Targets.AddUnit('vrmlglanimation.pas');
    P.Targets.AddUnit('vrmlglheadlight.pas');
    P.Targets.AddUnit('vrmlglscene.pas');
    P.Targets.AddUnit('vrmllightsetgl.pas');
    P.Targets.AddUnit('vrmlopenglrenderer.pas');

    P.SourcePath.Add('audio');
    P.Targets.AddUnit('alsourceallocator.pas');
    P.Targets.AddUnit('alutils.pas');
    P.Targets.AddUnit('gamesoundengine.pas');
    P.Targets.AddUnit('kambiogg.pas');
    P.Targets.AddUnit('kambiopenal.pas');
    P.Targets.AddUnit('soundfile.pas');
    P.Targets.AddUnit('vorbiscodec.pas');
    P.Targets.AddUnit('vorbisdecoder.pas');
    P.Targets.AddUnit('vorbisfile.pas');

    P.SourcePath.Add('base');
    P.Targets.AddUnit('areas.pas');
    P.Targets.AddUnit('dataerrors.pas');
    P.Targets.AddUnit('enumeratefiles.pas');
    P.Targets.AddUnit('filefilters.pas');
    P.Targets.AddUnit('intrects.pas');
    P.Targets.AddUnit('kambiclassutils.pas');
    P.Targets.AddUnit('kambidynlib.pas');
    P.Targets.AddUnit('kambifilesutils.pas');
    P.Targets.AddUnit('kambiinterfaces.pas');
    P.Targets.AddUnit('kambilog.pas');
    P.Targets.AddUnit('kambistringutils.pas');
    P.Targets.AddUnit('kambitimeutils.pas');
    P.Targets.AddUnit('kambiutils.pas');
    P.Targets.AddUnit('kambixmlcfg.pas');
    P.Targets.AddUnit('kambixmlutils.pas');
    P.Targets.AddUnit('kambizlib.pas');
    P.Targets.AddUnit('kambizstream.pas');
    P.Targets.AddUnit('parseparametersunit.pas');
    P.Targets.AddUnit('progressconsole.pas');
    P.Targets.AddUnit('progressunit.pas');
    P.Targets.AddUnit('rects.pas');
    P.Targets.AddUnit('vectormath.pas');

    P.SourcePath.Add('fonts');
    P.Targets.AddUnit('bfnt_bitstreamverasans_m10_unit.pas');
    P.Targets.AddUnit('bfnt_bitstreamverasans_unit.pas');
    P.Targets.AddUnit('bfnt_bitstreamverasansmono_bold_m15_unit.pas');
    P.Targets.AddUnit('bfnt_bitstreamverasansmono_m18_unit.pas');
    P.Targets.AddUnit('bmpfontstypes.pas');
    P.Targets.AddUnit('font2pascalunit.pas');
    P.Targets.AddUnit('ttf_bitstreamverasans_bold_italic_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamverasans_bold_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamverasans_italic_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamverasans_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamverasansmono_bold_italic_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamverasansmono_bold_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamverasansmono_italic_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamverasansmono_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamveraserif_bold_italic_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamveraserif_bold_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamveraserif_italic_unit.pas');
    P.Targets.AddUnit('ttf_bitstreamveraserif_unit.pas');
    P.Targets.AddUnit('ttfontstypes.pas');
    if Defaults.OS in AllWindowsOSes then
    begin
      P.SourcePath.Add('fonts\windows');
      P.Targets.AddUnit('windowsfonts.pas');
      P.Targets.AddUnit('winfontconvert.pas');
    end;

    P.SourcePath.Add('images');
    P.Targets.AddUnit('images.pas');
    P.Targets.AddUnit('imagescache.pas');
    P.Targets.AddUnit('kambipasjpeg.pas');
    P.Targets.AddUnit('kambipasjpeg_error_mgrs.pas');
    P.Targets.AddUnit('kambipasjpeg_stream_mgrs.pas');
    P.Targets.AddUnit('kambipng.pas');
    P.Targets.AddUnit('kambipngutils.pas');
    P.Targets.AddUnit('videos.pas');
    P.Targets.AddUnit('videoscache.pas');

    P.SourcePath.Add('kambiscript');
    P.Targets.AddUnit('kambiscript.pas');
    P.Targets.AddUnit('kambiscriptarrays.pas');
    P.Targets.AddUnit('kambiscriptcorefunctions.pas');
    P.Targets.AddUnit('kambiscriptimages.pas');
    P.Targets.AddUnit('kambiscriptlexer.pas');
    P.Targets.AddUnit('kambiscriptparser.pas');
    P.Targets.AddUnit('kambiscriptvectors.pas');
    P.Targets.AddUnit('vrmlkambiscript.pas');

    P.SourcePath.Add('net');
    P.Targets.AddUnit('kambiurlutils.pas');

    P.SourcePath.Add('opengl');
    P.Targets.AddUnit('beziercurve.pas');
    P.Targets.AddUnit('curve.pas');
    P.Targets.AddUnit('glantialiasing.pas');
    P.Targets.AddUnit('glcubemap.pas');
    P.Targets.AddUnit('glimages.pas');
    P.Targets.AddUnit('glmenu.pas');
    P.Targets.AddUnit('glshaders.pas');
    P.Targets.AddUnit('glsoundmenu.pas');
    P.Targets.AddUnit('glversionunit.pas');
    P.Targets.AddUnit('glw_demo.pas');
    P.Targets.AddUnit('glw_navigated.pas');
    P.Targets.AddUnit('glw_win.pas');
    P.Targets.AddUnit('glwindow.pas');
    P.Targets.AddUnit('glwindowrecentmenu.pas');
    P.Targets.AddUnit('glwininputs.pas');
    P.Targets.AddUnit('glwinmessages.pas');
    P.Targets.AddUnit('glwinmodes.pas');
    P.Targets.AddUnit('kambiglut.pas');
    P.Targets.AddUnit('kambiglutils.pas');
    P.Targets.AddUnit('normalizationcubemap.pas');
    P.Targets.AddUnit('openglbmpfonts.pas');
    P.Targets.AddUnit('openglfonts.pas');
    P.Targets.AddUnit('openglttfonts.pas');
    P.Targets.AddUnit('progressgl.pas');
    P.Targets.AddUnit('shadowvolumes.pas');
    P.Targets.AddUnit('timemessages.pas');
    if Defaults.OS in AllUnixOSes then
    begin
      P.SourcePath.Add('opengl/unix');
      P.Targets.AddUnit('kambiglx.pas');
      P.Targets.AddUnit('kambixf86vmode.pas');
      P.Targets.AddUnit('xlibutils.pas');
    end;
    if Defaults.OS in AllWindowsOSes then
    begin
      P.SourcePath.Add('opengl\windows');
      P.Targets.AddUnit('glwindowwinapimenu.pas');
      P.Targets.AddUnit('openglwindowsfonts.pas');
    end;

    Run;
  end;
end.
