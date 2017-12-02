/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author magno
 */
public class Venda {
    private Integer codigo;
    private Integer codigoCliente;
    private Date data;
    private Double valorTotal;
    private Integer codigoEmpresa; //crud >> insert getCodigo();
    private String nomecliente;
    private String nomeempresa;

    public String getNomeempresa() {
        return nomeempresa;
    }

    public void setNomeempresa(String nomeempresa) {
        this.nomeempresa = nomeempresa;
    }
    
    
    public String getNomecliente() {
        return nomecliente;
    }

    public void setNomecliente(String nomecliente) {
        this.nomecliente = nomecliente;
    }
    
    
    public int getEmpresa() {
        return codigoEmpresa;
    }

    public void setEmpresa(int empresa) {
        this.codigoEmpresa = empresa;
    }
    
    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public int getCliente() {
        return codigoCliente;
    }

    public void setCliente(int cliente) {
        this.codigoCliente = cliente;
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

    
}
