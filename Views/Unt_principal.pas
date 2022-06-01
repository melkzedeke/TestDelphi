unit Unt_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Data.DbxSqlite,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Data.DBXMySQL, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    EdtCodPro: TEdit;
    Button2: TButton;
    EdtDescricao: TEdit;
    EdtValorUnitario: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtCodCli: TEdit;
    Label4: TLabel;
    EdtNomeCli: TEdit;
    Label5: TLabel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    EdtQuantidade: TEdit;
    Label6: TLabel;
    EdtValorTotalProduto: TEdit;
    Label7: TLabel;
    EdtLinha: TEdit;
    Panel1: TPanel;
    EdtValorUnitarioEdit: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    EdtQTDEdit: TEdit;
    Label10: TLabel;
    EdtValorTotalProdutoEdit: TEdit;
    EdtLinhaEdit: TEdit;
    EdtTotaGeral: TEdit;
    Label11: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodCliKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodProKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorUnitarioEditKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQTDEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var cont: integer;
codipro,qtdpro,vUnitario,vTotal,sql,xpedido:String;
begin
  sql:= 'INSERT INTO pedidos_dados_gerais (numeropedido,dataemissao,codigocliente,valortotal)values(:numeropedido,now(),:xcodicli,:xvalortotal) ';
  FDQuery1.SQL.Text := sql;
  FDQuery1.ParamByName('numeropedido').AsString :='0';
 // FDQuery1.ParamByName('xdata').AsString :='now()';
  FDQuery1.ParamByName('xcodicli').AsString :=EdtCodCli.Text;
  FDQuery1.ParamByName('xvalortotal').AsString :=EdtTotaGeral.Text;
  FDQuery1.ExecSQL;

  FDQuery1.SQL.Text := 'SELECT * FROM pedidos_dados_gerais order by numeropedido desc limit 1';
  FDQuery1.Open;
  xpedido := FDQuery1.FieldByName('numeropedido').Text;

  cont :=1;
  repeat
     codipro:= StringGrid1.Cells[0, cont];
     qtdpro:= StringGrid1.Cells[3, cont];
     vUnitario := StringGrid1.Cells[2, cont];
     vTotal := StringGrid1.Cells[4, cont];
     sql := 'INSERT INTO pedidos_produtos (id,numeropedido,codigoproduto,quantidade,valorunitario,valortotal)values(:idx,:npedido,:xcodpro,:xqtd,:xvunit,:xvtotal) ' ;
     FDQuery1.SQL.Text := sql;
     FDQuery1.ParamByName('idx').AsString :='0';
     FDQuery1.ParamByName('npedido').AsString :=xpedido;
     FDQuery1.ParamByName('xcodpro').AsString :=codipro;
     FDQuery1.ParamByName('xqtd').AsString :=qtdpro;
     FDQuery1.ParamByName('xvunit').AsString :=vUnitario;
     FDQuery1.ParamByName('xvtotal').AsString :=vTotal;
     FDQuery1.ExecSQL;
     cont:=cont+1;
  until (cont=StringGrid1.ColCount-1);
end;

procedure TForm1.Button2Click(Sender: TObject);
var Row,RowEdit:integer;V1,V2,V3, ValTemp:Real;
begin
  if(Panel1.Visible=false)then
    begin
    if (StringGrid1.RowCount>1) then
    begin
      Row := StringGrid1.RowCount-1;
    end
    else
    begin
      Row :=1;
    end;
    StringGrid1.RowCount := StringGrid1.RowCount +1;
    StringGrid1.Cells[0, Row] := EdtCodPro.Text;
    StringGrid1.Cells[1, Row] := EdtDescricao.Text;
    StringGrid1.Cells[2, Row] := EdtValorUnitario.Text;
    StringGrid1.Cells[3, Row] := EdtQuantidade.Text;
    StringGrid1.Cells[4, Row] := EdtValorTotalProduto.Text;
    V1 :=  StrToFloat(EdtValorTotalProduto.Text);
    V2 :=  StrToFloat(EdtTotaGeral.Text);
    V3 := V1+V2;
    EdtTotaGeral.Text := FloatToStr(V3);
    EdtCodPro.Clear;
    EdtDescricao.Clear;
    EdtValorUnitario.Clear;
    EdtQuantidade.Clear;
    EdtValorTotalProduto.Clear;
    end
    else
      begin
        if MessageDlg('Deseja Atualizar o Produto?',mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
           RowEdit := StrToInt(EdtLinhaEdit.Text);

           ValTemp := StrToFloat(StringGrid1.Cells[4, RowEdit]);
           V2 :=  StrToFloat(EdtTotaGeral.Text);

           StringGrid1.Cells[2, RowEdit] := EdtValorUnitarioEdit.Text;
           StringGrid1.Cells[3, RowEdit] := EdtQTDEdit.Text;
           StringGrid1.Cells[4, RowEdit] := EdtValorTotalProdutoEdit.Text;
           V1 :=  StrToFloat( EdtValorTotalProdutoEdit.Text);
           V3 := V2-ValTemp+V1;
           EdtTotaGeral.Text := FloatToStr(V3);

           EdtValorUnitarioEdit.Clear;
           EdtQTDEdit.Clear;
           EdtValorTotalProdutoEdit.Clear;
           Panel1.Visible := false;
        end;
      end;

end;

procedure TForm1.EdtCodProKeyPress(Sender: TObject; var Key: Char);
var sql:string;
begin
if Key =#13 then
  begin

    FDQuery1.SQL.Text := 'select * from produtos where Codigo = :Code';
    FDQuery1.ParamByName('code').AsString :=EdtCodPro.Text;
    FDQuery1.Open;
  if(FDQuery1.RowsAffected>0)then
    begin
      EdtCodPro.Text := FDQuery1.FieldByName('Codigo').Text;
      EdtDescricao.Text := FDQuery1.FieldByName('Descricao').Text;
      EdtValorUnitario.Text := FDQuery1.FieldByName('PrecodeVenda').Text;
      EdtQuantidade.SetFocus;
    end
  else
    begin
        MessageDlg('Produto não Encontrado',mtInformation,[mbOk],0);
        EdtCodPro.Clear;
        EdtCodPro.Clear;
        EdtCodPro.SetFocus;
    end;
    Key := #0;

  end
end;

procedure TForm1.EdtQTDEditKeyPress(Sender: TObject; var Key: Char);
var V1,V3:Real; V2:integer;
begin
if Key =#13 then
  begin
    V1 := StrToFloat(EdtValorUnitarioEdit.Text);
    if(EdtQTDEdit.Text='')then
    begin
      EdtQTDEdit.Text := '1';
    end;

    V2 := StrToInt(EdtQTDEdit.Text);
    V3 := V1 * V2;
    EdtValorTotalProdutoEdit.Text := FloatToStr(V3);
    Key := #0;
  end ;
end;

procedure TForm1.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
var V1,V3:Real; V2:integer;
begin
if Key =#13 then
  begin
    V1 := StrToFloat(EdtValorUnitario.Text);
    if(EdtQuantidade.Text='')then
    begin
      EdtQuantidade.Text := '1';
    end;

    V2 := StrToInt(EdtQuantidade.Text);
    V3 := V1 * V2;
    EdtValorTotalProduto.Text := FloatToStr(V3);
    Key := #0;
  end ;

end;

procedure TForm1.EdtValorUnitarioEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',',',#8]) then
  key :=#0;
end;

procedure TForm1.EdtCodCliKeyPress(Sender: TObject; var Key: Char);
var sql:string;
begin
if Key =#13 then
  begin

    FDQuery1.SQL.Text := 'select * from clientes where Codigo = :Code';
    FDQuery1.ParamByName('code').AsString :=EdtCodCli.Text;
    FDQuery1.Open;
  if(FDQuery1.RowsAffected>0)then
    begin
      EdtCodCli.Text := FDQuery1.FieldByName('Codigo').Text;
      EdtNomeCli.Text := FDQuery1.FieldByName('Nome').Text;
      EdtCodPro.SetFocus;
    end
  else
    begin
        MessageDlg('Cliente não Encontrado',mtInformation,[mbOk],0);
        EdtCodCli.Clear;
        EdtNomeCli.Clear;
        EdtCodCli.SetFocus;
    end;
    Key := #0;

  end


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.ColWidths[0] := 50;
  StringGrid1.Cells[0, 0] := 'Cód.Pro';

  StringGrid1.ColWidths[1] := 200;
  StringGrid1.Cells[1, 0] := 'Descrição';

  StringGrid1.ColWidths[2] := 100;
  StringGrid1.Cells[2, 0] := 'Val.Unitario';

  StringGrid1.ColWidths[3] := 70;
  StringGrid1.Cells[3, 0] := 'Qtd';

  StringGrid1.ColWidths[4] := 100;
  StringGrid1.Cells[4, 0] := 'Val.Total';

  FDQuery1.SQL.Clear;
end;

procedure TForm1.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nRow,RowEdit:integer;
  V1,V2,V3:Real;
begin
    RowEdit := StrToInt(EdtLinha.Text);
    if Key =VK_DELETE  then
      begin
        if MessageDlg('Deseja Deletar o Produto?',mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
            V1 := StrToFloat(StringGrid1.Cells[4, RowEdit]);
            V2 := StrToFloat(EdtTotaGeral.Text);
            V3 := V2-V1;
            EdtTotaGeral.Text := FloatToStr(V3);
            if(strtoint(EdtLinha.Text)>0)then
              begin
                with StringGrid1 do
                  begin
                    for nRow := strtoint(EdtLinha.Text) to RowCount - 2 do
                    Rows[nRow].Assign(Rows[nRow+1]);
                    Rows[RowCount-1].Clear;
                    if(RowCount >2)then
                      begin
                        RowCount := RowCount - 1
                      end;

                  end
            end


     end;

  end;
end;

procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
var row:integer;
begin
row := StrToInt(EdtLinha.Text);
if Key =#13 then
  begin
    Panel1.Visible := true;
    EdtValorUnitarioEdit.Text := StringGrid1.Cells[2,row];
    EdtLinhaEdit.Text := EdtLinha.Text;
  end;
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
EdtLinha.Text := IntToStr(ARow);
end;

end.
