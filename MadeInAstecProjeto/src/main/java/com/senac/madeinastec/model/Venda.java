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
    private String data;
    private Double valorTotal;
    private Integer codigoEmpresa; //crud >> insert getCodigo();

    
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

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(Double valorTotal) {
        this.valorTotal = valorTotal;
    }

    
}
