unit Unit1;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sChart, Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    ChartSet: tChartSet;
    Chart: tChart;
    Candles: TList<tCandle>;
    Extendeds: TList<Extended>;
    ExtendedLines: array of TList<Extended>;
    procedure CandleGenerate;
    procedure ChartSetPrint;
    procedure LineGenerate;
    procedure LinesGenerate;
    procedure ChartPaint;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CandleGenerate;
var
  _Candle: tCandle; // in sChart
  _Seed: Integer;
  i: Integer;
begin
  if Candles.Count > 0 then
  begin
    for i := 0 to Candles.Count - 1 do
    begin
      Candles.List[i].Free;
    end;
  end;

  Candles.Clear;

  _Seed := 0;

  for i := 0 to 199 do
  begin
    _Candle := tCandle.Create;

    _Candle.Open := _Seed + Random(11) - 5;
    _Candle.Close := _Candle.Open + Random(11) - 5;

    if _Candle.Open > _Candle.Close then
    begin
      _Candle.High := _Candle.Open + Random(5);
      _Candle.Low := _Candle.Close - Random(5);
    end
    else
    begin
      _Candle.High := _Candle.Close + Random(5);
      _Candle.Low := _Candle.Open - Random(5);
    end;

    _Seed := Round(_Candle.Close);

    Candles.Add(_Candle);
  end;
end;

procedure TForm1.ChartPaint;
begin
  Timer1.Enabled := False;

  PaintBox1.Repaint;

  ChartSetPrint;
end;

procedure TForm1.ChartSetPrint;
begin
  CheckBox1.Checked := ChartSet.Box;
  CheckBox2.Checked := ChartSet.CandleColor;
  Edit1.Text := IntToStr(ChartSet.Decimal);
  Edit2.Text := FloatToStr(ChartSet.Gradation);
  CheckBox5.Checked := ChartSet.GradationExtend;
  CheckBox6.Checked := ChartSet.HorizontalLine;
  Edit3.Text := FloatToStr(ChartSet.HorizontalLineY);
  Edit4.Text := IntToStr(ChartSet.LabelWidth);
  Edit5.Text := IntToStr(ChartSet.LineColor);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  ChartSet.Box := CheckBox1.Checked;

  PaintBox1.Repaint;

  ChartSetPrint;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  ChartSet.CandleColor := CheckBox2.Checked;

  PaintBox1.Repaint;

  ChartSetPrint;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  ChartSet.GradationExtend := CheckBox5.Checked;

  PaintBox1.Repaint;

  ChartSetPrint;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
  ChartSet.HorizontalLine := CheckBox6.Checked;

  PaintBox1.Repaint;

  ChartSetPrint;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ChartSet.Decimal := StrToInt(Edit1.Text);

    PaintBox1.Repaint;

    ChartSetPrint;
  end;
end;

procedure TForm1.Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ChartSet.Gradation := StrToFloat(Edit2.Text);

    PaintBox1.Repaint;

    ChartSetPrint;
  end;
end;

procedure TForm1.Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ChartSet.HorizontalLineY := StrToFloat(Edit3.Text);

    PaintBox1.Repaint;

    ChartSetPrint;
  end;
end;

procedure TForm1.Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ChartSet.LabelWidth := StrToInt(Edit4.Text);

    PaintBox1.Repaint;

    ChartSetPrint;
  end;
end;

procedure TForm1.Edit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ChartSet.LineColor := StrToInt(Edit5.Text);

    PaintBox1.Repaint;

    ChartSetPrint;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  ChartSet := tChartSet.Create;

  ChartSet.CandleColor := True;
  ChartSet.Decimal := 2;
  ChartSet.Gradation := 10;
  ChartSet.GradationExtend := True;
  ChartSet.LabelWidth := 50;
  ChartSet.LineColor := clRed;
  ChartSet.PaintBox := PaintBox1;

  Chart := tChart.Create(ChartSet);

  Candles := TList<tCandle>.Create;
  Extendeds := TList<Extended>.Create;

  SetLength(ExtendedLines, 3); // more lists available of course

  for i := 0 to High(ExtendedLines) do
  begin
    ExtendedLines[i] := TList<Extended>.Create;
  end;
end;

procedure TForm1.LineGenerate;
var
  _Seed: Extended;
  i: Integer;
begin
  Extendeds.Clear;

  _Seed := 0;

  for i := 0 to 999 do
  begin
    Extendeds.Add(_Seed + Random(11) - 5);

    _Seed := Extendeds.List[i];
  end;
end;

procedure TForm1.LinesGenerate;
var
  _Seed: Extended;
  i, j: Integer;
begin
  for i := 0 to High(ExtendedLines) do
  begin
    ExtendedLines[i].Clear;

    _Seed := 0;

    for j := 0 to 999 do
    begin
      ExtendedLines[i].Add(_Seed + Random(11) - 5);

      _Seed := ExtendedLines[i].List[j];
    end;
  end;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0..1:
    begin
      Chart.CandleDraw(Candles);
    end;

    2:
    begin
      Chart.LineDraw(Extendeds);
    end;

    3:
    begin
      Chart.LinesDraw(ExtendedLines);
    end;

    4:
    begin
      Chart.CandleLinesDraw(Candles, ExtendedLines);
    end;
  end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0:
    begin
      CandleGenerate;

      ChartPaint;
    end;

    1:
    begin
      Timer1.Enabled := True;

      ChartSetPrint;
    end;

    2:
    begin
      LineGenerate;

      ChartPaint;
    end;

    3:
    begin
      LinesGenerate;

      ChartPaint;
    end;

    4:
    begin
      LineGenerate;

      ChartPaint;
    end;

    5:
    begin
      CandleGenerate;
      LineGenerate;

      ChartPaint;
    end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  CandleGenerate;

  PaintBox1.Repaint;
end;

end.
