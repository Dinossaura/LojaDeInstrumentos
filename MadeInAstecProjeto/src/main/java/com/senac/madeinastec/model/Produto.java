package com.senac.madeinastec.model;

public class Produto {
    
    private Integer codigo;
    private Integer codigoempresa; //crud >> insert getCodigo();
    private String nome;
    private String descricao;
    private Integer categoria; 
    private Integer fornecedor;
    private Double precocompra;
    private Double precovenda;
    private Integer estoque;

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Integer getCodigoempresa() {
        return codigoempresa;
    }

    public void setCodigoempresa(Integer codigoempresa) {
        this.codigoempresa = codigoempresa;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Integer getCategoria() {
        return categoria;
    }

    public void setCategoria(Integer categoria) {
        this.categoria = categoria;
    }

    public Integer getCodigoFornecedor() {
        return fornecedor;
    }

    public void setCodigoFornecedor(Integer fornecedor) {
        this.fornecedor = fornecedor;
    }

    public Double getPrecocompra() {
        return precocompra;
    }

    public void setPrecocompra(Double precocompra) {
        this.precocompra = precocompra;
    }

    public Double getPrecovenda() {
        return precovenda;
    }

    public void setPrecovenda(Double precovenda) {
        this.precovenda = precovenda;
    }

    public Integer getEstoque() {
        return estoque;
    }

    public void setEstoque(Integer estoque) {
        this.estoque = estoque;
    }
    
    
}
