/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.servlets;

import com.senac.madeinastec.dao.ClienteDAO;
import com.senac.madeinastec.model.Carrinho;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.service.ServicoCarrinho;
import com.senac.madeinastec.service.ServicoCliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Debaza
 */
@WebServlet(name = "CadastrarClienteCarrinhoServlet", urlPatterns = {"/cadastrarclientecarrinho"})
public class CadastrarClienteCarrinhoServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Carrinho carrinho = new Carrinho();
        Cliente cliente = new Cliente();
        ServicoCarrinho sc = new ServicoCarrinho();
        ServicoCliente servicoCliente = new ServicoCliente();
                
        HttpSession sessao = request.getSession();
         
        String codigoCliente = request.getParameter("codigoCliente");
        
        
        
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String date = new SimpleDateFormat("dd/MM/yyyy").format(timestamp.getTime());
        String codigoempresa = (String) sessao.getAttribute("Empresa");
        
        
        
        carrinho.setCliente(Integer.parseInt(codigoCliente));
        carrinho.setData(date);
        carrinho.setCodigoempresa(Integer.parseInt(codigoempresa));
        carrinho.setValorTotal(0.0);
        
        int codigoCarrinho = 0;
        //Retorna Cliente Cadastrado e cadastra topo to carrinho
        try {
            //Retorna cliente cadastrado no carrinho
            cliente = servicoCliente.obterClientePorCodigo(Integer.parseInt(codigoCliente), Integer.parseInt(codigoempresa));
            
            //Cadastra o topo do carrinho sem seus itens e passa o código do carrinho cadastrado para tela de Venda
           codigoCarrinho = sc.cadastrarCarrinho(carrinho);
        } catch (Exception e) {
        }
        
        sessao.setAttribute("cliente", cliente);
        sessao.setAttribute("codigocarrinho", codigoCarrinho);
        
        
        response.sendRedirect(request.getContextPath() + "/venda.jsp");
        
    }
    
}
