{ -*- buffer-read-only: t -*-

  Copyright 2015-2021 Michalis Kamburelis.

  This file is part of "Castle Game Engine".

  "Castle Game Engine" is free software; see the file COPYING.txt,
  included in this distribution, for details about the copyright.

  "Castle Game Engine" is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

  ----------------------------------------------------------------------------
}

{ Automatically generated node properties.

  Do not edit this file manually!
  To add new properties:
  - add them to the text files in tools/internal/x3d-nodes-to-pascal/nodes-specification/ ,
  - and regenerate include files by running x3d-nodes-to-pascal .

  The documentation for properties should go to x3dnodes_documentation.txt . }

{$ifdef read_interface}

  strict private
    function GetAnchorPoint: TVector3;
    procedure SetAnchorPoint(const Value: TVector3);
    function GetAxis: TVector3;
    procedure SetAxis(const Value: TVector3);
    function GetMaxAngle: Single;
    procedure SetMaxAngle(const Value: Single);
    function GetMinAngle: Single;
    procedure SetMinAngle(const Value: Single);
    function GetStopBounce: Single;
    procedure SetStopBounce(const Value: Single);
    function GetStopErrorCorrection: Single;
    procedure SetStopErrorCorrection(const Value: Single);
  public
    procedure CreateNode; override;
    class function ClassX3DType: string; override;

    strict private FFdAnchorPoint: TSFVec3f;
    { X3D field "anchorPoint". } { }
    public property FdAnchorPoint: TSFVec3f read FFdAnchorPoint;
    { X3D field "anchorPoint". } { }
    property AnchorPoint: TVector3 read GetAnchorPoint write SetAnchorPoint;

    strict private FFdAxis: TSFVec3f;
    { X3D field "axis". } { }
    public property FdAxis: TSFVec3f read FFdAxis;
    { X3D field "axis". } { }
    property Axis: TVector3 read GetAxis write SetAxis;

    strict private FFdMaxAngle: TSFFloat;
    { X3D field "maxAngle". } { }
    public property FdMaxAngle: TSFFloat read FFdMaxAngle;
    { X3D field "maxAngle". } { }
    property MaxAngle: Single read GetMaxAngle write SetMaxAngle;

    strict private FFdMinAngle: TSFFloat;
    { X3D field "minAngle". } { }
    public property FdMinAngle: TSFFloat read FFdMinAngle;
    { X3D field "minAngle". } { }
    property MinAngle: Single read GetMinAngle write SetMinAngle;

    strict private FFdStopBounce: TSFFloat;
    { X3D field "stopBounce". } { }
    public property FdStopBounce: TSFFloat read FFdStopBounce;
    { X3D field "stopBounce". } { }
    property StopBounce: Single read GetStopBounce write SetStopBounce;

    strict private FFdStopErrorCorrection: TSFFloat;
    { X3D field "stopErrorCorrection". } { }
    public property FdStopErrorCorrection: TSFFloat read FFdStopErrorCorrection;
    { X3D field "stopErrorCorrection". } { }
    property StopErrorCorrection: Single read GetStopErrorCorrection write SetStopErrorCorrection;

    strict private FEventAngle: TSFFloatEvent;
    { X3D out event "angle". } { }
    public property EventAngle: TSFFloatEvent read FEventAngle;

    strict private FEventAngleRate: TSFFloatEvent;
    { X3D out event "angleRate". } { }
    public property EventAngleRate: TSFFloatEvent read FEventAngleRate;

    strict private FEventBody1AnchorPoint: TSFVec3fEvent;
    { X3D out event "body1AnchorPoint". } { }
    public property EventBody1AnchorPoint: TSFVec3fEvent read FEventBody1AnchorPoint;

    strict private FEventBody2AnchorPoint: TSFVec3fEvent;
    { X3D out event "body2AnchorPoint". } { }
    public property EventBody2AnchorPoint: TSFVec3fEvent read FEventBody2AnchorPoint;

{$endif read_interface}

{$ifdef read_implementation}

{ TSingleAxisHingeJointNode ----------------------------------------------- }

function TSingleAxisHingeJointNode.GetAnchorPoint: TVector3;
begin
  Result := FdAnchorPoint.Value;
end;

procedure TSingleAxisHingeJointNode.SetAnchorPoint(const Value: TVector3);
begin
  FdAnchorPoint.Send(Value);
end;

function TSingleAxisHingeJointNode.GetAxis: TVector3;
begin
  Result := FdAxis.Value;
end;

procedure TSingleAxisHingeJointNode.SetAxis(const Value: TVector3);
begin
  FdAxis.Send(Value);
end;

function TSingleAxisHingeJointNode.GetMaxAngle: Single;
begin
  Result := FdMaxAngle.Value;
end;

procedure TSingleAxisHingeJointNode.SetMaxAngle(const Value: Single);
begin
  FdMaxAngle.Send(Value);
end;

function TSingleAxisHingeJointNode.GetMinAngle: Single;
begin
  Result := FdMinAngle.Value;
end;

procedure TSingleAxisHingeJointNode.SetMinAngle(const Value: Single);
begin
  FdMinAngle.Send(Value);
end;

function TSingleAxisHingeJointNode.GetStopBounce: Single;
begin
  Result := FdStopBounce.Value;
end;

procedure TSingleAxisHingeJointNode.SetStopBounce(const Value: Single);
begin
  FdStopBounce.Send(Value);
end;

function TSingleAxisHingeJointNode.GetStopErrorCorrection: Single;
begin
  Result := FdStopErrorCorrection.Value;
end;

procedure TSingleAxisHingeJointNode.SetStopErrorCorrection(const Value: Single);
begin
  FdStopErrorCorrection.Send(Value);
end;

class function TSingleAxisHingeJointNode.ClassX3DType: String;
begin
  Result := 'SingleAxisHingeJoint';
end;

procedure TSingleAxisHingeJointNode.CreateNode;
begin
  inherited;

  FFdAnchorPoint := TSFVec3f.Create(Self, True, 'anchorPoint', Vector3(0, 0, 0));
   FdAnchorPoint.ChangeAlways := chVisibleNonGeometry;
  AddField(FFdAnchorPoint);

  FFdAxis := TSFVec3f.Create(Self, True, 'axis', Vector3(0, 0, 0));
   FdAxis.ChangeAlways := chVisibleNonGeometry;
  AddField(FFdAxis);

  FFdMaxAngle := TSFFloat.Create(Self, True, 'maxAngle', Pi);
   FdMaxAngle.ChangeAlways := chVisibleNonGeometry;
  AddField(FFdMaxAngle);

  FFdMinAngle := TSFFloat.Create(Self, True, 'minAngle', -Pi);
   FdMinAngle.ChangeAlways := chVisibleNonGeometry;
  AddField(FFdMinAngle);

  FFdStopBounce := TSFFloat.Create(Self, True, 'stopBounce', 0);
   FdStopBounce.ChangeAlways := chVisibleNonGeometry;
  AddField(FFdStopBounce);
  { X3D specification comment: [0,1] }

  FFdStopErrorCorrection := TSFFloat.Create(Self, True, 'stopErrorCorrection', 0.8);
   FdStopErrorCorrection.ChangeAlways := chVisibleNonGeometry;
  AddField(FFdStopErrorCorrection);
  { X3D specification comment: [0,1] }

  FEventAngle := TSFFloatEvent.Create(Self, 'angle', false);
  AddEvent(FEventAngle);

  FEventAngleRate := TSFFloatEvent.Create(Self, 'angleRate', false);
  AddEvent(FEventAngleRate);

  FEventBody1AnchorPoint := TSFVec3fEvent.Create(Self, 'body1AnchorPoint', false);
  AddEvent(FEventBody1AnchorPoint);

  FEventBody2AnchorPoint := TSFVec3fEvent.Create(Self, 'body2AnchorPoint', false);
  AddEvent(FEventBody2AnchorPoint);
end;

{$endif read_implementation}
