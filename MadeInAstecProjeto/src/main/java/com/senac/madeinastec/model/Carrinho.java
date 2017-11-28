/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.model;
import com.senac.madeinastec.model.Cliente;
import java.sql.Timestamp;
import java.util.Date;
/**
 *
 * @author Magno
 */
public class Carrinho {
     private Integer codigo;
     private Integer codigoCliente;
     private String data;
     private Double valorTotal;
     private Integer codigoempresa;
     
    public Integer getCodigoempresa() {
        return codigoempresa;
    }

    public void setCodigoempresa(Integer codigoempresa) {
        this.codigoempresa = codigoempresa;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public Integer getCodigoCliente() {
        return codigoCliente;
    }

    public void setCliente(int codigoCliente) {
        this.codigoCliente = codigoCliente;
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
