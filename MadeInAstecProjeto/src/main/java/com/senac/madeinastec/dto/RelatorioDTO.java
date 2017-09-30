/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.dto;

import java.util.Date;

/**
 *
 * @author uriel.oliveira
 */
public class RelatorioDTO {
    private Date data;
    private Double valorTotal;
    private String nome;
    private String cpf;
    private int CodigoVenda;
    private String titulo;
    private Double preco;
    private int CodigoProduto;
    private int quantidade;

    @Override
    public String toString() {
        return "RelatorioDTO{" + "data=" + data + ", valorTotal=" + valorTotal + ", nome=" + nome + ", cpf=" + cpf + ", CodigoVenda=" + CodigoVenda + ", titulo=" + titulo + ", preco=" + preco + ", CodigoProduto=" + CodigoProduto + '}';
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getCodigoVenda() {
        return CodigoVenda;
    }

    public void setCodigoVenda(int CodigoVenda) {
        this.CodigoVenda = CodigoVenda;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public int getCodigoProduto() {
        return CodigoProduto;
    }

    public void setCodigoProduto(int CodigoProduto) {
        this.CodigoProduto = CodigoProduto;
    }

    
}
